//
//  AyahsSurahRow.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 04/05/24.
//

import SwiftUI

struct AyahsSurahRow: View {
    
    let ayahs: AyahsDetail
    
    var body: some View {
        VStack {
            Divider()
                .background(Color.theme.accent)
            
            VStack(spacing: 10) {
                Text("\(ayahs.ayahsNumber)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(
                        Circle()
                            .fill(Color.theme.accent)
                    )
                    .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                    
                    Text(ayahs.arabiaText)
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.trailing)
                        .baselineOffset(10)
                        .foregroundStyle(Color.theme.accent)
                        .frame(maxWidth: UIScreen.main.bounds.width, alignment: .trailing)
                        
                    
                
                Text("\(ayahs.latinaText)")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.secondary)
                    .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(ayahs.meaningAyahs)")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(Color.theme.accent)
                        .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                }
            }
            .padding(.horizontal)
            .padding(.vertical)
            
            Divider()
                .background(Color.theme.accent)
        }
        
    }
}

#Preview {
    AyahsSurahRow(ayahs: DeveloperPreview.detailAyahsSingle)
}

#Preview {
    AyahsSurahRow(ayahs: DeveloperPreview.detailAyahsSingle)
        .preferredColorScheme(.dark)
}
