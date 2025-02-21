//
//  PopupVC.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/21.
//

import SwiftUI

struct PopupView : View {
    
    @State private var isAnimating = false // Use @State for view-specific state
    @Binding var isPresented: Bool  // Use @Binding to control presentation from parent
    var detail0                          = "Sample Detail"
    var detail1                          = "Sample Detail"
    
    let fontSize = Share.shared.setFontSize()
    
    var body: some View {
           VStack {
               HStack {
                   Button("내용") {
                      //Do something
                   }
                   
                   Spacer()
                   Button("확인") {
                       withAnimation {  // Add animation to the dismissal
                           isPresented = false
                       }
                   }
                   .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                   .buttonStyle(.borderedProminent) // Use a standard button style
                   .padding(.top, 8)
                   
               }
               .padding()
               
               
               .font(.custom("1HoonDdukbokki Regular", size: fontSize))
               .buttonStyle(.plain) // Remove default button styling if you want.
               .padding(.bottom, 8)
               
               
               ScrollView {   // Use ScrollView instead of UITableView
                   PopupCellView(detail0 :detail0, detail1 :detail1)
                       .opacity(isAnimating ? 1 : 0)
                       .offset(y: isAnimating ? 0 : 20) // Simple slide-in animation
                       .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0), value: isAnimating)  // Animation modifier
               }
               .frame(maxWidth: .infinity) // Allow it to take full width
               
               
              
           }
           .padding()  // Add padding around the entire content
           .background(Color(.systemBackground)) // Use a system background color
           .cornerRadius(12)  // Rounded corners for the popup
           .shadow(radius: 5) // Add a subtle shadow
           .onAppear {
//               withAnimation {
//                   isAnimating = true
//               }
           }
           .frame(maxWidth: UIDevice.current.userInterfaceIdiom == .pad ? 500 : 300) // Limit width for iPad, smaller for iPhone
           
       }

}

// MARK: - Custom View (Cell)

struct PopupCellView: View { //  Create a SwiftUI View for the cell.
    
    var detail0                          = "Sample Detail"
    var detail1                          = "Sample Detail"
    
    let fontSize = Share.shared.setFontSize()
    
    var body: some View {
        Text("\(detail0) \(detail1)")
            .font(.custom("1HoonDdukbokki Regular", size: self.fontSize))
            .lineSpacing(3)
            .lineLimit(nil) // Allow multiple lines
            .multilineTextAlignment(.leading) // Important for proper multi-line display
             // .fixedSize(horizontal: false, vertical: true)  // Allow the Text to expand vertically.
            .padding(.vertical, 8) // Add some padding for readability
            .frame(maxWidth: .infinity, alignment: .leading)  // Ensure text uses available width

    }
}

// MARK: - Preview
struct PopupView_Previews: PreviewProvider {
    
//    let sampleData = PopupData(detail0: "Sample Detail 0\n", detail1: "Sample Detail 1 with more text to demonstrate multiline capabilities and wrapping behavior.", fontSize: 18)
    
    static var previews: some View {
        ZStack { // Add a ZStack for showing the popup over a background.
                  Color.gray.opacity(0.3).ignoresSafeArea() // Dimmed background
            PopupView(isPresented: .constant(true),detail0: "wlwl",detail1: "o32o3o")
              }
        
       
    }
}
