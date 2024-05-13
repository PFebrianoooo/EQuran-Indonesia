//
//  DetailViewModel.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 04/05/24.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var detailSurah: DetailSurahModel? = nil
    @Published var detailAyahs: [AyahsDetail] = []
    
    @Published var surah: SurahModel
    private let detailSurahService: DetailSurahDataService
    private var calcelables = Set<AnyCancellable>()
    
    init(surah: SurahModel) {
        self.surah = surah
        self.detailSurahService = DetailSurahDataService(surah: surah)
        getDetailSurah()
    }
    
    
    func getDetailSurah() {
        detailSurahService.$detailSurah
            .sink { [weak self] returnedDetailSurah in
                guard
                    let detail = returnedDetailSurah,
                    let detailAyahs = returnedDetailSurah?.detailAyahs else { return }
                
                self?.detailSurah = detail
                self?.detailAyahs = detailAyahs
            }
            .store(in: &calcelables)
    }
    
}
