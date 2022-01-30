//
//  CalibrationView.swift
//  InterAACtionPad
//
//  Created by Julien Fieschi on 30/01/2022.
//

import SwiftUI
import EyeTrackKit

struct DotCalibration: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        
        ZStack{
            Image(systemName: "dpad")
                .scaleEffect(self.isAnimating ? 0.5 : 2)
                .position(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
                .onAppear(perform: {
                    isAnimating = true
                })
                .animation(Animation.linear(duration: 1).repeatForever())
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CalibrationView: View {

    @ObservedObject var eyeTrackController: EyeTrackController = EyeTrackController(device: Device(type: .iPadLandscape), smoothingRange: 10, blinkThreshold: .infinity, isHidden: true)

    var body: some View {

        ZStack(alignment: .topLeading)
        {
            DotCalibration()
            eyeTrackController.view
            Circle()
                 .fill(Color.blue.opacity(0.5))
                 .frame(width: 25, height: 25)
                 .position(x: eyeTrackController.eyeTrack.lookAtPoint.x, y: eyeTrackController.eyeTrack.lookAtPoint.y)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CalibrationView_Previews: PreviewProvider {
    static var previews: some View {
        CalibrationView()
    }
}
