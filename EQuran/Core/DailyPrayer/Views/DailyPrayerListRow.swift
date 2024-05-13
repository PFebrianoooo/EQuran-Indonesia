//
//  DailyPrayerListRow.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 09/05/24.
//

import SwiftUI

struct DailyPrayerListRow: View {
    
    let dailyPrayer: DailyPrayerModel
    
    var body: some View {
        HStack {
            ZStack {
                Image.ornamentNumber
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(Color.theme.accent)
                    .frame(width: 30, height: 30)
                
                Text(dailyPrayer.id)
                    .font(.caption)
                    .foregroundStyle(Color.theme.secondary)
            }
            
            Text(dailyPrayer.namePrayer.capitalized)
                .font(.headline)
                .fontWeight(.medium)
                .foregroundStyle(Color.theme.accent)
                .lineLimit(1)
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    DailyPrayerListRow(dailyPrayer: DeveloperPreview.dailyPrayer)
        .preferredColorScheme(.light)
}
#Preview {
    DailyPrayerListRow(dailyPrayer: DeveloperPreview.dailyPrayer)
        .preferredColorScheme(.dark)
}
