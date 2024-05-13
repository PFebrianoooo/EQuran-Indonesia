//
//  SurahListRow.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 03/05/24.
//

import SwiftUI

struct SurahListRow: View {
    
    let surah: SurahModel
    
    var body: some View {
        HStack {
            HStack(spacing: 15) {
                ZStack {
                    Image.ornamentNumber
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(Color.theme.accent)
                        .frame(width: 30, height: 30)
                    
                    Text("\(surah.number)")
                        .font(.caption)
                        .foregroundStyle(Color.theme.secondary)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(surah.latinaName)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        .foregroundStyle(Color.theme.secondary)
                    
                    HStack {
                        Text(surah.placeBirth)
                        
                        Spacer()
                        
                        Text("• \(surah.ayahsCount) Ayat")
                    }
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundStyle(Color.theme.secondary)
                    .frame(maxWidth: 120, alignment: .leading)
                }
            }
            
            Spacer()
            
            Text(surah.name)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(Color.theme.accent)
                .frame(alignment: .trailing)
        }
        .padding(.vertical, 5)
        .contentShape(Rectangle())
    }
}

#Preview {
    SurahListRow(surah: DeveloperPreview.surah)
        .padding(.horizontal)
        .preferredColorScheme(.light)
}

#Preview {
    SurahListRow(surah: DeveloperPreview.surah)
        .padding(.horizontal)
        .preferredColorScheme(.dark)
}
