//
//  ViewController.swift
//  DragonballColor
//
//  Created by Ethan Hung on 2024/3/22.
//

import UIKit

class ViewController: UIViewController {
    // 使用 IBOutlet 連結介面元件。
    // UIImageView 用於顯示圖片。
    @IBOutlet weak var picView: UIImageView!
    // UILabels 用於顯示文字。
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var cornerLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var opacityLabel: UILabel!
    // UISliders 用於讓使用者調整值。
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var opacitySlider: UISlider!
    @IBOutlet weak var cornerRadiusSlider: UISlider!
    // UIViews 用於顯示顏色區塊。
    @IBOutlet weak var rView: UIView!
    @IBOutlet weak var gView: UIView!
    @IBOutlet weak var bView: UIView!
    @IBOutlet weak var oView: UIView!
    // 更多 UIViews 用於顯示邊角區塊。
    @IBOutlet weak var cornerView: UIView!
    @IBOutlet weak var cornerTitleView: UIView!
    // UIButtons 用於接受使用者點擊操作。
    @IBOutlet weak var randomButtonView: UIButton!
    @IBOutlet weak var resetButtonView: UIButton!
    // 儲存當前顏色和邊角是否被啟用的布林值。
    var isHairColorEnable:Bool = false
    var isCornerRadiusEnable:Bool = false
    
    // 當視圖加載完成後，設定初始狀態。
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewAlpha(to: 0) // 設定透明度為 0 來隱藏顏色選擇器。
        cornerView.alpha = 0 // 隱藏邊角選擇器。
        // 設定各元件的初始位置。
        cornerTitleView.frame.origin = CGPoint(x: 30, y: 380)
        randomButtonView.frame.origin = CGPoint(x: 30, y: 450)
        resetButtonView.frame.origin = CGPoint(x: 220, y: 450)
        resetRGBSliderValue() // 重設滑桿的值。
        cornerLabel.text = "30" // 設定邊角標籤的文字。
        picView.layer.cornerRadius = 30 // 設定圖片的邊角半徑。
    }

    // 重設 RGB 滑塊的值為最大值 1（顏色滑塊的最大值）。
    func resetRGBSliderValue() {
        redSlider.value = 1
        greenSlider.value = 1
        blueSlider.value = 1
        opacitySlider.value = 1
    }
    //重設圓角值到初始值
    func resetCornerValue() {
        cornerRadiusSlider.setValue(30, animated: true)
        updateCornerLabel()
    }
    // 將給定的視圖的透明度設定為給定的值。
    func setViewAlpha(to alpha:CGFloat) {
        // 設定所有顏色顯示視圖的透明度。
        rView.alpha = alpha
        gView.alpha = alpha
        bView.alpha = alpha
        oView.alpha = alpha
    }
//    未完成要來優化updateViewsOnCurrentState()
//    func setPositionOfView() {
//        let yPositionOfTitle:CGFloat = self.isHairColorEnable ? 645 : 380
//        let yPositionOfRandomButton:CGFloat = self.isHairColorEnable ? 695 : 520
//    }
    
    // 根據使用者開關的狀態更新界面元素。
    func updateViewsOnCurrentState() {
        UIView.animate(withDuration: 0.5) {
    
            if self.isHairColorEnable && !self.isCornerRadiusEnable {
                self.setViewAlpha(to: 1)
                self.cornerView.alpha = 0
                self.cornerTitleView.frame = CGRect(x: 30, y: 645, width: self.cornerTitleView.frame.width, height: self.cornerTitleView.frame.height)
                self.randomButtonView.frame = CGRect(x: 30, y: 695, width: self.randomButtonView.frame.width, height: self.randomButtonView.frame.height)
                self.resetButtonView.frame = CGRect(x: 220, y: 695, width: self.resetButtonView.frame.width, height: self.resetButtonView.frame.height)
                self.updateRGBSliders()
            }  else if !self.isHairColorEnable && self.isCornerRadiusEnable {
                self.setViewAlpha(to: 0)
                self.cornerView.alpha = 1
                self.cornerTitleView.frame = CGRect(x: 30, y: 380, width: self.cornerTitleView.frame.width, height: self.cornerTitleView.frame.height)
                self.cornerView.frame = CGRect(x: 30, y: 450, width: self.cornerTitleView.frame.width, height: self.cornerTitleView.frame.height)
                self.randomButtonView.frame = CGRect(x: 30, y: 520, width: self.randomButtonView.frame.width, height: self.randomButtonView.frame.height)
                self.resetButtonView.frame = CGRect(x: 220, y: 520, width: self.resetButtonView.frame.width, height: self.resetButtonView.frame.height)
                
            } else if self.isHairColorEnable && self.isCornerRadiusEnable {
                self.setViewAlpha(to: 1)
                self.cornerView.alpha = 1
                self.cornerTitleView.frame = CGRect(x: 30, y: 645, width: self.cornerTitleView.frame.width, height: self.cornerTitleView.frame.height)
                self.cornerView.frame = CGRect(x: 30, y: 695, width: self.cornerView.frame.width, height: self.cornerView.frame.height)
                self.randomButtonView.frame = CGRect(x: 30, y: 765, width: self.randomButtonView.frame.width, height: self.randomButtonView.frame.height)
                self.resetButtonView.frame = CGRect(x: 220, y: 765, width: self.resetButtonView.frame.width, height: self.resetButtonView.frame.height)
                self.updateRGBSliders()
            } else {
                self.setViewAlpha(to: 0)
                self.cornerView.alpha = 0
                self.cornerTitleView.frame = CGRect(x: 30, y: 380, width: self.cornerTitleView.frame.width, height: self.cornerTitleView.frame.height)
                self.randomButtonView.frame = CGRect(x: 30, y: 450, width: self.randomButtonView.frame.width, height: self.randomButtonView.frame.height)
                self.resetButtonView.frame = CGRect(x: 220, y: 450, width: self.resetButtonView.frame.width, height: self.resetButtonView.frame.height)
            }
            
        }
    }
    
    //開啟或關閉switch會做...
    @IBAction func hairColorOnOrOff(_ sender: UISwitch) {
        self.isHairColorEnable = sender.isOn
        updateRGBLabelValue()
        updateViewsOnCurrentState()
    }
    //開啟或關閉switch會做...
    @IBAction func cornerOnOrOff(_ sender: UISwitch) {
        self.isCornerRadiusEnable = sender.isOn
        updateViewsOnCurrentState()
    }
    //更新RGB的Sliders
    func updateRGBSliders() {
        let color = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(opacitySlider.value))
        
        picView.backgroundColor = color
    }
    //更新RGB的值
    func updateRGBLabelValue() {
        redLabel.text = String(format: "%.0f", redSlider.value * 255)
        greenLabel.text = String(format: "%.0f", greenSlider.value * 255)
        blueLabel.text = String(format: "%.0f", blueSlider.value * 255)
        opacityLabel.text = String(format: "%.0f", opacitySlider.value)
    }
    //當使用者操作 RGB 滑塊時調用，更新顯示圖片的背景顏色和標籤值
    @IBAction func changeRGBColor(_ sender: Any) {
        updateRGBSliders()
        updateRGBLabelValue()
    }
    //更新圓角的Slider
    func updateCornerSlider() {
        picView.layer.cornerRadius = CGFloat(cornerRadiusSlider.value)
    }
    //更新圓角的值
    func updateCornerLabel() {
        cornerLabel.text = String(format: "%.0f", cornerRadiusSlider.value)
    }
    //當使用者操作圓角滑塊時調用，更新顯示圖片的圓角和標籤值
    @IBAction func changeCornerRadius(_ sender: Any) {
        updateCornerLabel()
        updateCornerSlider()
    }
    
    // 當使用者點擊隨機按鈕時調用，設定一個隨機顏色給圖片背景，並更新滑塊和標籤值。
    @IBAction func tapToRandom(_ sender: Any) {
        let randomColor = UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: CGFloat.random(in: 0...1)
        )
        picView.backgroundColor = randomColor
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        randomColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let randomCornerRadius = Float.random(in: 0...128)
        
        if self.isHairColorEnable && !self.isCornerRadiusEnable {

            redSlider.setValue(Float(red), animated: true)
            greenSlider.setValue(Float(green), animated: true)
            blueSlider.setValue(Float(blue), animated: true)
            opacitySlider.setValue(Float(alpha), animated: true)
            updateRGBLabelValue()
        } else if !self.isHairColorEnable && self.isCornerRadiusEnable {
            
            cornerRadiusSlider.setValue(randomCornerRadius, animated: true)
            changeCornerRadius(randomCornerRadius)
        } else {
            redSlider.setValue(Float(red), animated: true)
            greenSlider.setValue(Float(green), animated: true)
            blueSlider.setValue(Float(blue), animated: true)
            opacitySlider.setValue(Float(alpha), animated: true)
            updateRGBLabelValue()
            
            cornerRadiusSlider.setValue(randomCornerRadius, animated: true)
            changeCornerRadius(randomCornerRadius)
        }
    }
    
    // 當使用者點擊重設按鈕時調用，將滑塊值重設為預設值。
    @IBAction func tapToReset(_ sender: Any) {
        if self.isHairColorEnable {
            resetRGBSliderValue()
            updateRGBSliders()
        }
        if self.isCornerRadiusEnable {
            resetCornerValue()
            updateCornerSlider()
        }
    }
}

#Preview {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: "ViewController")
}
