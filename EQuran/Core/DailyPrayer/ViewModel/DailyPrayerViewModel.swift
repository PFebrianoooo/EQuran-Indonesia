//
//  DailyPrayerViewModel.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 10/05/24.
//

import Foundation
import Combine

class DailyPrayerViewModel: ObservableObject {
    
    @Published var dailyPrayer: [DailyPrayerModel] = []
    @Published var searchInput: String = ""
    
    private var cancelables = Set<AnyCancellable>()
    private var dailyPrayerDataService = DailyPrayerDataService()
    
    init() {
        fetchDailyPrayer()
    }
    
    func fetchDailyPrayer() {
        $searchInput
            .combineLatest(dailyPrayerDataService.$dailyPrayer)
            .debounce(for: 0.25, scheduler: DispatchQueue.main)
            .map(searchDailyPray)
            .sink { [weak self] retunedDailyPrayer in
                self?.dailyPrayer = retunedDailyPrayer
            }
            .store(in: &cancelables)
    }
    
    private func searchDailyPray(text: String, dailyPray: [DailyPrayerModel]) -> [DailyPrayerModel] {
        guard !text.isEmpty else { return dailyPray }
        
        let lowercasedText = text.lowercased()
        
        let filteredDailyPray = dailyPray.filter { dailyPray -> Bool in
            let filtered = dailyPray.namePrayer.lowercased().contains(lowercasedText)
            return filtered
        }
        return filteredDailyPray
    }
    
}
