//
//  DetailView.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 04/05/24.
//

import SwiftUI

struct SurahDetailLoadingView: View {
    
    @Binding var surahDetail: SurahModel?
    
    var body: some View {
        ZStack {
            if let surah = surahDetail {
                SurahDetailView(surah: surah)
            }
        }
    }
}

struct SurahDetailView: View {
    
    @StateObject private var vm: DetailViewModel
    
    init(surah: SurahModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(surah: surah))
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack (spacing: 15){
                
                HeaderDetailSurah(surah: vm.detailSurah)
                
                listAyahs
                
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                DismissButton(imagename: "chevron.left")
            }
        }
        .scrollIndicators(.hidden)
    }
}


extension SurahDetailView {
    private var listAyahs: some View {
        VStack(spacing: 0) {
            ForEach(vm.detailAyahs, id: \.self.ayahsNumber) { ayahs in
                AyahsSurahRow(ayahs: ayahs)
            }
        }
    }
}

#Preview {
    NavigationStack {
        SurahDetailView(surah: DeveloperPreview.surah)
    }
}

#Preview {
    NavigationStack {
        SurahDetailView(surah: DeveloperPreview.surah)
            .preferredColorScheme(.dark)
    }
}
