//
//  DailyPrayerTestViewModel.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 10/05/24.
//

import Foundation
import Combine

class DailyPrayerTestViewModel: ObservableObject {
    
    @Published var dailyPrayerTest: [DailyPrayerModel] = []
    
    private var dailyPrayTestDataService = DailyPrayTestDataService()
    private var cancelables = Set<AnyCancellable>()
    
    init() {
        getDailyPrayerTest()
    }
    
    func getDailyPrayerTest() {
        dailyPrayTestDataService.$dailyPrayerTest
            .sink { [weak self] returnedDailyPrayTest in
                self?.dailyPrayerTest = returnedDailyPrayTest
            }
            .store(in: &cancelables)
    }
    
    func refreshDailyPrayer() {
        dailyPrayTestDataService.fetchRandomizeDailyPray()
    }
}
