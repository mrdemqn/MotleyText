//
//  ContentView.swift
//  MotleyText
//
//  Created by Димон on 3.10.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var containerWidth: CGFloat = 300
    
    private var attributedString: AttributedString {
        var string = AttributedString()
        let newTaskContainer = AttributeContainer()
            .foregroundColor(.black)
            .font(.systemFont(ofSize: 17, weight: .black))
        let nameTaskContainer = AttributeContainer()
            .foregroundColor(.cyan)
            .font(.systemFont(ofSize: 26, weight: .heavy))
        let dateTaskContainer = AttributeContainer()
            .foregroundColor(.indigo)
            .font(.systemFont(ofSize: 18, weight: .bold))
        
        let task = AttributedString("Новое задание ", attributes: newTaskContainer)
        let name = AttributedString("«Разношёрстный Текст». ", attributes: nameTaskContainer)
        let date = AttributedString("Сдать до 4 Октября 21:00.", attributes: dateTaskContainer)
        
        string.append(task)
        string.append(name)
        string.append(date)
        
        return string
    }
    
    var body: some View {
        VStack {
            Text(attributedString)
                .padding(.vertical, 50)
                .frame(width: containerWidth)
                .border(.red, width: 1)
            Slider(
                value: $containerWidth,
                in: 100...300,
                onEditingChanged: { changed in
                    print("ContainerWidth: \($containerWidth.wrappedValue)")
                }
            ).padding()
        }
    }
}

#Preview {
    ContentView()
}
