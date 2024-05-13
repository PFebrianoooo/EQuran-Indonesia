//
//  ListDailyPrayView.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 09/05/24.
//

import SwiftUI

struct ListDailyPrayerView: View {
    
    @StateObject private var dailyPrayer = DailyPrayerViewModel()
    @State private var selectedDailyPrayer: DailyPrayerModel? = nil
    @State private var showDetailDailyPrayerView: Bool = false
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.secondary)]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                // background Layer
                Color.theme.background
                
                // content Layer
                VStack(spacing: 15) {
                    
                    SearchBar(searchInput: $dailyPrayer.searchInput, prompt: "Cari doa yang diinginkan")
                    
                    listDailyPrayer
                }
            }
            .navigationTitle("Doa-Doa Harian")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    DismissButton(imagename: "chevron.left")
                }
            }
            .navigationDestination(
                isPresented: $showDetailDailyPrayerView) {
                DailyPrayerDetailViewLoading(prayer: $selectedDailyPrayer)
            }
        }
    }
}

extension ListDailyPrayerView {
    
    private var listDailyPrayer: some View {
        List {
            ForEach(dailyPrayer.dailyPrayer) { dailyPrayer in
                DailyPrayerListRow(dailyPrayer: dailyPrayer)
                    .onTapGesture {
                        segue(prayer:  dailyPrayer)
                    }
            }
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
    }
    
    private func segue(prayer: DailyPrayerModel) {
        selectedDailyPrayer = prayer
        showDetailDailyPrayerView.toggle()
    }
    
}

#Preview {
    NavigationStack {
        ListDailyPrayerView()
            .environmentObject(DeveloperPreview.dailyPrayerVm)
            .preferredColorScheme(.light)
    }
}

#Preview {
    NavigationStack {
        ListDailyPrayerView()
            .environmentObject(DeveloperPreview.dailyPrayerVm)
            .preferredColorScheme(.dark)
    }
}
