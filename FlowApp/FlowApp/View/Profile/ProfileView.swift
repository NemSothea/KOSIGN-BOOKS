//
//  Profile.swift
//  FlowApp
//
//  Created by Bizplay on 2023/08/10.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        HStack {
            ScrollView {
                VStack {
                    // Top section
                    VStack {
                        Image("profileImage")
                            .resizable()
                            .frame(height: 150)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                            .padding(10)
                            .background(Color.white)
                            
                        Text("John Doe")
                            .font(.title)
                            .padding(.top, 8)
                        Text("Software Engineer")
                            .foregroundColor(.gray)
                            .padding(5)
                    }
//                    .padding()
                    .background(Color.white)
                    .cornerRadius(1)
                    .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                    .padding(.vertical, 10)
                    
                    // Middle section
                    VStack {
                        HStack {
                            VStack {
                                Image(systemName: "doc.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.green)
                                    Text("Files")
                                    .font(.caption)
                            }
                            VStack {
                                Image(systemName: "calendar")
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                                Text("Calendar")
                                .font(.caption)
                            }
                           
                            VStack {
                                Image(systemName: "note")
                                    .font(.largeTitle)
                                    .foregroundColor(.cyan)
                                Text("BookMark")
                                .font(.caption)
                            }
                           
                                
                            Spacer()
                            
                        }
                        Spacer()
                    }
                   
                    .frame(height: 150)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(1)
                    .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                    .padding(.vertical, 1)
                    
                    Spacer()
    //                // Bottom section
                    SlideView()
                        .frame(height: 150)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(1)
                        .shadow(color: Color.gray, radius: 1, x: 0, y:0)
                        .padding(.vertical, 1)
                }
            }
            .padding()
        }
      
    }
}

struct SlideView: View {
    let images = ["1144302950", "672781504"] // Replace with your image names
    @State private var currentIndex = 0
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        GeometryReader { geometry in
            TabView(selection: $currentIndex) {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: 150)
                        .clipped()
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .onReceive(timer) { _ in
                withAnimation {
                    currentIndex = (currentIndex + 1) % images.count
                }
            }
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


