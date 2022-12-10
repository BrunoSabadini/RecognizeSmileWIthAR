//
//  ContentView.swift
//  RecognizeSmileWIthAR
//
//  Created by Bruno Sabadini on 09/12/22.
//


import SwiftUI
import RealityKit

struct ContentView : View {
    @ObservedObject var arViewModel : ARViewModel = ARViewModel()
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel).frame(width:  arViewModel.isSmiling ? 0 : 0, height: 0)
            Color.red.ignoresSafeArea()
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    var arViewModel: ARViewModel
    func makeUIView(context: Context) -> ARView {
        arViewModel.startSessionDelegate()
        return arViewModel.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
