//
//  ARViewContainer.swift
//  ARMenuApp
//
//  Created by Yemmanuru, Krishna Saimahith on 7/17/24.
//

import Foundation
import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var modelName: String
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        arView.session.run(config)
        
        // Set ARSession delegate
        arView.session.delegate = context.coordinator
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        // Remove all existing anchors to avoid multiple models stacking
        uiView.scene.anchors.removeAll()
        
        let anchorEntity = AnchorEntity()
        
        do {
            let modelEntity = try Entity.loadModel(named: modelName)
            anchorEntity.addChild(modelEntity)
            uiView.scene.addAnchor(anchorEntity)
        } catch {
            print("Failed to load model named \(modelName): \(error.localizedDescription)")
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        var parent: ARViewContainer
        
        init(_ parent: ARViewContainer) {
            self.parent = parent
        }
        
        func session(_ session: ARSession, didFailWithError error: Error) {
            print("AR session failed: \(error.localizedDescription)")
        }
        
        func sessionWasInterrupted(_ session: ARSession) {
            print("AR session was interrupted")
        }
        
        func sessionInterruptionEnded(_ session: ARSession) {
            print("AR session interruption ended")
        }
    }
}
