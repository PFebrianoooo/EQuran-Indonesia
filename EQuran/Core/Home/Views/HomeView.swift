//
//  Home View.swift
//  E-Quran
//
//  Created by Putra Pebriano Nurba on 03/05/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showDetailSurah: Bool = false
    @State private var selectedSurah: SurahModel? = nil
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                // background Layer
                Color.theme.background
                
                // content layer
                VStack(spacing: 15) {
                    
                    HeaderPage(title: "Mari Membaca Al-Quran")
                    
                    SearchBar(searchInput: $vm.searchInput, prompt: "Cari surah pada al-quran")
                    
                    listSurahAlquran
                    
                }
            }
            .navigationTitle("")
            .navigationDestination(
                isPresented: $showDetailSurah) {
                    SurahDetailLoadingView(surahDetail: $selectedSurah)
                        .navigationBarBackButtonHidden(true)
                }
        }
    }
}

extension HomeView {
    
    private var listSurahAlquran: some View {
        List {
            ForEach(vm.allSurah, id: \.self.number) { surah in
                SurahListRow(surah: surah)
                    .onTapGesture {
                        segue(surah: surah)
                    }
            }
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
    }
    
    private func segue(surah: SurahModel) {
        selectedSurah = surah
        showDetailSurah.toggle()
    }
}

#Preview {
    NavigationStack  {
        HomeView()
            .environmentObject(DeveloperPreview.alQuranVm)
            .preferredColorScheme(.light)
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .environmentObject(DeveloperPreview.alQuranVm)
            .preferredColorScheme(.dark)
    }
}
