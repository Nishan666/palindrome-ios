//
//  ContentView.swift
//  test-app
//
//  Created by Nishan Kumar on 29/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText: String = ""
    @State private var resultText: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Hello, Nick!")
                .font(.title2)
                .fontWeight(.semibold)
            
            // Input field
            TextField("Enter text", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            // Button with icons
            Button(action: checkPalindrome) {
                HStack {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    Text("Check Palindrome")
                    Image(systemName: "checkmark.circle.fill")
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
            }
            
            // Result text
            if !resultText.isEmpty {
                Text(resultText)
                    .font(.headline)
                    .foregroundColor(resultText.contains("is a palindrome") ? .green : .red)
                    .padding()
            }
            
            Spacer()
        }
        .padding()
    }
    
    // Function to check if text is palindrome
    func checkPalindrome() {
        let cleaned = inputText.lowercased().filter { $0.isLetter || $0.isNumber }
        if cleaned == String(cleaned.reversed()) && !cleaned.isEmpty {
            resultText = "\"\(inputText)\" is a palindrome ✅"
        } else {
            resultText = "\"\(inputText)\" is not a palindrome ❌"
        }
    }
}

#Preview {
    ContentView()
}
