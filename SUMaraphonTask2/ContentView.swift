//
//  ContentView.swift
//  SUMaraphonTask2
//
//  Created by A.J. on 04.12.2024.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: States
    @State var containerWidth: CGFloat = 200 // Initial Value, Произвольно
    
    //MARK: Constants
    let containerBorderColor: Color = .red // ТЗ
    let containerWidthMin: CGFloat = 100 // ТЗ
    let containerWidthMax: CGFloat = 300 // ТЗ
    let containerHeight: CGFloat = 200 // Произвольно
   
    //MARK: Text Styles
    let style1 = AttributeContainer.foregroundColor(.secondary).font(.body)
    let style2 = AttributeContainer.foregroundColor(.primary).font(.body)
    let style3 = AttributeContainer.foregroundColor(.blue).font(.title.bold())
    
    //MARK: Attributed Text
    var containerText: AttributedString {

        // Поставил \n, чтобы «Отцовский пинок» всегда был на следующей строке от первой фразы, аналогично в видео по ТЗ).  \u{00A0} (nsbp) проставлено для функционала "Переносит слова и буквы, если не хватает места." из ТЗ.
        var text = AttributedString("Марафон\u{00A0}по SwiftUI\u{00A0}\n«Отцовский пинок»")
  
        // Ищем range по слову, если нашли применяем стиль

        if let range = text.range(of: "Марафон") {
            text[range].mergeAttributes(style1)
        }
        
        if let range = text.range(of: "по SwiftUI") {
            text[range].mergeAttributes(style2)
        }
        
        if let range = text.range(of: "«Отцовский пинок»") {
            text[range].mergeAttributes(style3)
        }

        return text
        
    }
    

    var body: some View {
       
        VStack {
            
            Text(containerText)
                .frame(width: containerWidth)
                .frame(height: containerHeight)
                .border(containerBorderColor)
            
            Slider(value: $containerWidth, in: containerWidthMin...containerWidthMax)
       
        }//: VStack
        .padding(.horizontal)
        
    }
    
}

#Preview {
    
    ContentView()
    
}
