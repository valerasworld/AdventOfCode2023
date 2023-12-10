//
//  TrebuchetView.swift
//  AdventOfCode2023
//
//  Created by Валерий Зазулин on 10.12.2023.
//

import SwiftUI

struct TrebuchetView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.theme.regular)
        }
    }
}

#Preview {
    TrebuchetView()
}
