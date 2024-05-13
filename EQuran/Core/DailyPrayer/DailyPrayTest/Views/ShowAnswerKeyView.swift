//
//  ShowAnswerKeyView.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 10/05/24.
//

import SwiftUI

struct ShowAnswerKeyView: View {
    
    let prayerTest: DailyPrayerModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 40) {
                Text(prayerTest.namePrayer)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(Color.theme.secondary)
                
                Text(prayerTest.ayahs)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.trailing)
                    .baselineOffset(10)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundStyle(Color.theme.accent)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(prayerTest.latinaName.capitalized)
                        .foregroundStyle(Color.theme.secondary)
                    
                    Text(prayerTest.meaningAyahs)
                        .foregroundStyle(Color.theme.accent)
                    
                }
                .font(.headline)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                
            }
            .padding(.all)
        }
        .padding(.top, 50)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ShowAnswerKeyView(prayerTest: DeveloperPreview.dailyPrayer)
        .preferredColorScheme(.light)
}

#Preview {
    ShowAnswerKeyView(prayerTest: DeveloperPreview.dailyPrayer)
        .preferredColorScheme(.dark)
}
