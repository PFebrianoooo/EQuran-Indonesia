//
//  SearchBar.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 03/05/24.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchInput: String
    let prompt: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.theme.secondary)
            
            TextField(prompt, text: $searchInput)
                .submitLabel(.search)
                .autocorrectionDisabled(true)
                .foregroundStyle(Color.theme.accent)
                .overlay(alignment: .trailing) {
                    if !searchInput.isEmpty {
                        Image(systemName: "xmark.circle")
                            .padding()
                            .offset(x: 15.0)
                            .foregroundStyle(Color.theme.secondary)
                            .onTapGesture {
                                UIApplication.shared.endEditingInput()
                                searchInput = ""
                            }
                    }
                }
        }
        .font(.headline)
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.background)
                .stroke(Color.theme.accent, lineWidth: 1.0)
        )
        .shadow(
            color: Color.theme.accent.opacity(0.50),
            radius: 10, x: 0, y: 0
        )
        .padding(.horizontal)
    }
}

#Preview {
    SearchBar(searchInput: .constant("Light Theme"), prompt: "Cari surah disini")
        .preferredColorScheme(.light)
}

#Preview {
    SearchBar(searchInput: .constant("Dark Theme"), prompt: "Cari doa-doa disini")
        .preferredColorScheme(.dark)
}
