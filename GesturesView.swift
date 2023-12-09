//
// Created By: Mobile Apps Academy
// Subscribe : https://www.youtube.com/@MobileAppsAcademy?sub_confirmation=1
// Medium Blob : https://medium.com/@mobileappsacademy
// LinkedIn : https://www.linkedin.com/company/mobile-apps-academy
// Twitter : https://twitter.com/MobileAppsAcdmy
// Lisence : https://github.com/Mobile-Apps-Academy/MobileAppsAcademyLicense/blob/main/LICENSE.txt
//

import SwiftUI

struct GesturesView: View {
    var body: some View {
        ZStack{
            Color("MAA_Yellow")
            VStack {
                RotationGestureView()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

struct TapGestureView: View {
   
    @State private var changeColor = Color("MAA_Grey")
    
    var body: some View {
        
        VStack {
            
            let tapGesture = TapGesture()
                .onEnded { _ in
                    
                    if self.changeColor == Color("MAA_Grey") {
                        withAnimation {
                            self.changeColor = .white
                        }
                    } else if self.changeColor == .white {
                        withAnimation {
                            self.changeColor = Color("MAA_Grey")
                        }
                    }
                    
                }
            
            Text("Tap Gesture")
                .font(.title)
                .bold()
            
            Circle()
                .foregroundColor(changeColor)
                .shadow(radius: 10)
                .gesture(tapGesture)
                .frame(width: 100, height: 100, alignment: .center)
            
        }
    }
}

struct LongPressGestureView: View {
    
    @State private var didLongPress: Bool = false
    @State private var scale: CGFloat = 1
    @State private var color = Color("MAA_Grey")
    
    var body: some View {
        
        VStack {
            
            Text("Long Tap Gesture")
                .font(.title)
                .bold()
            
            Circle()
                .scaleEffect(scale)
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(color)
                .shadow(radius: 10)
                .gesture(
                    LongPressGesture()
                        .onEnded({ _ in
                            
                            if self.didLongPress == false {
                                withAnimation {
                                    self.scale = 1.2
                                    self.color = .white
                                }
                                
                            } else if self.didLongPress == true {
                                withAnimation {
                                    self.scale = 1
                                    self.color = Color("MAA_Grey")
                                }
                                
                            }
                           
                            self.didLongPress.toggle()
                            
                        }))
        }
        
        
    }
}

struct DragGestureView: View {
    
    @State private var drag: CGSize = .zero
    @State private var color = Color.blue
    
    var body: some View {
        VStack {
            Text("Drag Gesture")
                .font(.title)
                .bold()
            
            Circle()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(.white)
                .shadow(radius: 10)
                .offset(drag)
                .gesture(
                    
                    DragGesture()
                        .onChanged { value in
                            withAnimation {
                                self.drag = value.translation
                            }
                            
                        }
                        .onEnded({ _ in
                            withAnimation {
                                self.drag = .zero
                            }
                           
                        })
                    
                )
            
        }
    }
}

struct RotationGestureView: View {
    
    @State var rotation: Angle = .zero
    @State var color = Color("MAA_Grey")
    
    var body: some View {
        
        VStack(spacing: 30) {
            let rotationGesture = RotationGesture()
                .onChanged { value in
                    withAnimation {
                        self.rotation = value
                    }
                    
                }
            
            Text("Rotation Gesture")
                .font(.title)
                .bold()
            
            
            Rectangle()
                .foregroundColor(color)
                .cornerRadius(10)
                .shadow(radius: 10)
                .rotationEffect(rotation)
                .frame(width: 200, height: 200, alignment: .center)
                .gesture(rotationGesture)
            
        }
    }
}
