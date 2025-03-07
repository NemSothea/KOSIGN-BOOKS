//
//  ContentView.swift
//  ToolTip
//
//  Created by NEMSOTHEA on 3/5/25.
//

import SwiftUI


struct ContentView: View {
    
    
    @State private var showTip = false
    
    
    var body: some View {
        Button {
            
            
            
            showTip.toggle()
            
        } label: {
            Image(systemName: "info.circle")
                .font(.title)
        }
        .padding()
        
        .popover(isPresented: $showTip) {
            PreviewContent()
        }
        
    }
}
struct PreviewContent : View {
    
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Text("Hello")
                    .font(.headline)
                Spacer()
                Button("dismiss") {
                    dismiss()
                }
                
            }
            .padding()
            
            GeometryReader { geometry in
                ScrollView {
                    Text("TipKit prioritizes contextual, rule-based guidance over manual triggers. If your use case requires on-demand tips, consider a custom implementation or provide feedback to Apple about the need for manual control in TipKit.TipKit prioritizes contextual, rule-based guidance over manual triggers. If your use case requires on-demand tips, consider a custom implementation or provide feedback to Apple about the need for manual control in TipKit.TipKit prioritizes contextual, rule-based guidance over manual triggers. If your use case requires on-demand tips, consider a custom implementation or provide feedback to Apple about the need for manual control in TipKit.TipKit prioritizes contextual, rule-based guidance over manual triggers. If your use case requires on-demand tips, consider a custom implementation or provide feedback to Apple about the need for manual control in TipKit.TipKit prioritizes contextual, rule-based guidance over manual triggers. If your use case requires on-demand tips, consider a custom implementation or provide feedback to Apple about the need for manual control in TipKit.ContentViewContentViewContentViewContentViewContentViewContentViewContentViewContentViewContentView")
                    
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
                }
                
                .background(Color.blue.opacity(0.1))
                .cornerRadius(20)
            }
        }
       
        Spacer()
    }
}


#Preview {
    ContentView()
}
