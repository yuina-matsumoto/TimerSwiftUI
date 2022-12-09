//
//  ContentView.swift
//  TimerSwiftUI
//
//  Created by matsumotoyuina on 2022/12/05.
//

import SwiftUI

struct ContentView: View {
    
    @State var timer: Timer?
    let oneSecond: TimeInterval = 1
    
    @State var minute = 0
    @State var second = 0    
    @State var timeText = "00:00"
    
    @State var isStartBtnDisable = false
    @State var isPauseBtnDisable = true
    @State var isResetBtnDisable = true
    
    var body: some View {
        VStack {
            Text(timeText)
                .font(.system(size: 100, weight: .bold))
                .foregroundColor(.green)
                .padding(.top, 100)
            Spacer()
            Button("Start") {
                
                timer = Timer.scheduledTimer(withTimeInterval: oneSecond, repeats: true) { _ in
                    runTime()
                }
                isStartBtnDisable = true
                isPauseBtnDisable = false
                isResetBtnDisable = false
            }
            .frame(width: 200, height: 50)
            .foregroundColor(.black)
            .background(.gray)
            .padding(.bottom, 30)
            .disabled(isStartBtnDisable)
            Button("Pause") {
                timer!.invalidate()
                isStartBtnDisable = false
                isPauseBtnDisable = true
            }
            .frame(width: 200, height: 50)
            .foregroundColor(.black)
            .background(.gray)
            .padding(.bottom, 30)
            .disabled(isPauseBtnDisable)
            Button("Reset") {
                timer!.invalidate()
                minute = 0
                second = 0
                timeText = "00:00"
                isStartBtnDisable = false
                isPauseBtnDisable = true
                isResetBtnDisable = true
            }
            .frame(width: 200, height: 50)
            .foregroundColor(.black)
            .background(.gray)
            .padding(.bottom, 30)
            .disabled(isResetBtnDisable)
        }
        .padding()
    }
    
    private func runTime() {
        
        second += 1
        
        if second == 60 {
            minute += 1
            second = 0
        }
        var tmpM = ""
        var tmpS = ""
        if second < 10 {
            tmpS = "0\(second)"
        } else if second >= 10 {
            tmpS = "\(second)"
        }
        if minute < 10 {
            tmpM = "0\(minute)"
        } else if minute >= 10 {
            tmpM = "\(minute)"
        }
        timeText = "\(tmpM):\(tmpS)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
