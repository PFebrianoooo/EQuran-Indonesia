//
//  MenuBarView.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 05/05/24.
//

import SwiftUI

struct MenuBarView: View {
    
    @StateObject private var alQuranvm = HomeViewModel()
    @StateObject private var prayScheduleVm = PrayScheduleViewModel()
    @State private var selection: Int = 1
    
    var body: some View {
        TabView(selection: $selection) {
            Group {
                PrayScheduleView()
                    .environmentObject(prayScheduleVm)
                    .tabItem {
                        Image(systemName: "clock")
                        Text("Jadwal Sholat")
                    }
                    .tag(0)
                
                HomeView()
                    .environmentObject(alQuranvm)
                    .tabItem {
                        Image(systemName: "character.book.closed.fill.ar")
                        Text("Al-Quran")
                    }
                    .tag(1)
                
                DailyPrayerView()
                    .tabItem {
                        Image(systemName: "books.vertical.fill")
                        Text("Doa Pilihan")
                    }
                    .tag(2)
            }
            .toolbarBackground(Color.theme.background, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .tint(Color.theme.accent)
    }
}

#Preview {
    MenuBarView()
        .preferredColorScheme(.light)
}

#Preview {
    MenuBarView()
        .preferredColorScheme(.dark)
}
