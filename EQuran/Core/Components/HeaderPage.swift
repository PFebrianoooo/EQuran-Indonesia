//
//  HeaderPage.swift
//  E-Quran
//
//  Created by Putra Pebriano Nurba on 03/05/24.
//

import SwiftUI

struct HeaderPage: View {
    
    let title: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            ZStack(alignment: .trailing) {
                    Image.elementBg
                        .resizable()
                        .scaledToFill()
                    
                    Image.stickerQuran
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                }
            .frame(height: 150)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(spacing: 0) {
                Image.stickerAssalamualaikum
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(Color.white)
                    .frame(width: 170 ,height: 35)
                
                HStack(spacing: -4) {
                    ForEach(0..<13, id: \.self) { _ in
                        Text("―")
                    }
                    .foregroundStyle(Color.white)
                }
                
                Text(title.capitalized)
                    .font(.headline)
                    .foregroundStyle(Color.white)
            }
            .padding(.leading, 15)
        }
        .padding(.horizontal)
        .clipped()
    }
}

#Preview {
    HeaderPage(title: "Mari Membaca Doa-Doa")
}
#Preview {
    HeaderPage(title: "Mari Membaca Al-Quran")
        .preferredColorScheme(.dark)
}
