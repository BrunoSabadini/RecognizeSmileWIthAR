//
//  ARModel.swift
//  RecognizeSmileWIthAR
//
//  Created by Bruno Sabadini on 09/12/22.
//

import Foundation
import RealityKit
import ARKit


struct ARModel {
    private(set) var arView : ARView
    
    var smileRight: Float = 0
    var smileLeft: Float = 0
    
    init() {
        arView = ARView(frame: .zero)
        arView.session.run(ARFaceTrackingConfiguration())
    }
    
    mutating func update(faceAnchor: ARFaceAnchor){
        smileRight = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthSmileRight})?.value ?? 0)
        smileLeft = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthSmileLeft})?.value ?? 0)
    }
}
