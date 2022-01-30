//
//  CalibrationView.swift
//  InterAACtionPad
//
//  Created by Julien Fieschi on 30/01/2022.
//

import SwiftUI

struct DotCalibration: View {
    var body: some View {
        
        ZStack{
            Image(systemName: "dpad")
        }
        
    }
}



struct CalibrationView: View {
    var body: some View {
        DotCalibration()
    }
}

struct CalibrationView_Previews: PreviewProvider {
    static var previews: some View {
        CalibrationView()
    }
}
