//
//  HomeViewModel.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 04/05/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allSurah: [SurahModel] = []
    @Published var searchInput: String = ""
    
    private var cancelables = Set<AnyCancellable>()
    private var allSurahDataService = AllSurahDataService()
    
    init() {
        fetchAllSurah()
    }
    
    func fetchAllSurah() {
        $searchInput
            .combineLatest(allSurahDataService.$allSurah)
            .debounce(for: .seconds(0.25), scheduler: DispatchQueue.main)
            .map(searchSurah)
            .sink { [weak self] retunedAllSurah in
                self?.allSurah = retunedAllSurah
            }
            .store(in: &cancelables)
    }
    
    private func searchSurah(text: String, surah: [SurahModel]) -> [SurahModel] {
        guard !text.isEmpty else { return surah }
        
        let lowercasedText = text.lowercased()
        
        let filteredSurah = surah.filter { surah -> Bool in
            let filtered = surah.latinaName.lowercased().contains(lowercasedText) || surah.placeBirth.lowercased().contains(lowercasedText)
            return filtered
        }
        return filteredSurah
    }
    
}
