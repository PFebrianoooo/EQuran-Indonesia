//
//  DailyPrayerDetail.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 09/05/24.
//

import SwiftUI

struct DailyPrayerDetailViewLoading: View {
    
    @Binding var prayer: DailyPrayerModel?
    
    var body: some View {
        ZStack {
            if let dailyPrayer = prayer {
                DailyPrayerDetailView(prayer: dailyPrayer)
                    .transition(.opacity)
            }
        }
    }
}

struct DailyPrayerDetailView: View {
    
    @StateObject private var vm: DetailDailyPrayerViewModel
    
    init(prayer: DailyPrayerModel) {
        _vm = StateObject(wrappedValue: DetailDailyPrayerViewModel(prayer: prayer))
    }
    
    var body: some View {
        ScrollView(.vertical) {
            ForEach(vm.dailyPrayer) { dailyPrayer in
                VStack(spacing: 40) {
                    Text(dailyPrayer.namePrayer)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(Color.theme.secondary)
                    
                    Text(dailyPrayer.ayahs)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.trailing)
                        .baselineOffset(10)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundStyle(Color.theme.accent)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(dailyPrayer.latinaName.capitalized)
                            .foregroundStyle(Color.theme.secondary)
                        
                        Text(dailyPrayer.meaningAyahs)
                            .foregroundStyle(Color.theme.accent)
                            
                    }
                    .font(.headline)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                }
                .padding(.all)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                DismissButton(imagename: "chevron.left")
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    NavigationStack {
        DailyPrayerDetailView(prayer: DeveloperPreview.dailyPrayer)
            .preferredColorScheme(.light)
    }
}

#Preview {
    NavigationStack {
        DailyPrayerDetailView(prayer: DeveloperPreview.dailyPrayer)
            .preferredColorScheme(.dark)
    }
}
