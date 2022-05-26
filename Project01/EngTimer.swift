//
//  EngTimer.swift
//  Project01
//
//  Created by 언형 on 2022/05/24.
//

import UIKit

class EngTimer: UIViewController {
    var isPlaying = false
        var timeNum = 0
        var interval = 1.0
        var timer = Timer()
        
        @IBOutlet var lblLeftTime: UILabel!
        @IBOutlet var btnStartName: UIButton!
        @IBOutlet var btnResetName: UIButton!
       
        override func viewDidLoad() {
            super.viewDidLoad()
            lblLeftTime.text = "70분"
            isPlaying = false
            timeNum = 4200
            btnStartName.setTitle("시작하기", for: .normal)
            btnResetName.setTitle("리셋", for: .normal)
        }
        
        @IBAction func btnStartPause(_ sender: UIButton) {
            if !isPlaying {
                playTimer()
            } else {
                stopTimer()
            }
        }
        
        func playTimer() {
            if !isPlaying {
                btnStartName.setTitle("일시정지", for: .normal)
                timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(timerOn), userInfo: nil, repeats: true)
                isPlaying = true
            }
        }
        
        func stopTimer() {
            if isPlaying {
                timer.invalidate()
                btnStartName.setTitle("계속하기", for: .normal)
                isPlaying = false
            }
        }
        
        @objc func timerOn() {
            func secToMin(timeNum: Int) {
                let minute = timeNum / 60
                let second = timeNum % 60
                if second < 10 {
                    lblLeftTime.text = String(minute) + " 분 " + "0" + String(second) + " 초" + " 남았습니다"
                } else {
                    lblLeftTime.text = String(minute) + " 분 " + String(second) + " 초" + " 남았습니다"
                }
            }
            secToMin(timeNum: timeNum)
            timeNum = timeNum - 1
            if timeNum < 0 {
                timer.invalidate()
                lblLeftTime.text = "시험 끝!!"
                btnStartName.setTitle("시작하기", for: .normal)
                isPlaying = false
                timeNum = 4200
            }
        }
        
        
        @IBAction func btnReset(_ sender: UIButton) {
            timer.invalidate()
            timeNum = 4200
            btnStartName.setTitle("시작하기", for: .normal)
            lblLeftTime.text = "70분"
            isPlaying = false
        }
    }
