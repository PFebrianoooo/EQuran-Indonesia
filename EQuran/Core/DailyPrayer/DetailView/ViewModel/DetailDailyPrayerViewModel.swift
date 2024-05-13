//
//  DetailDailyPrayerViewModel.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 10/05/24.
//

import Foundation
import Combine

class DetailDailyPrayerViewModel: ObservableObject {
    
    @Published var dailyPrayer: [DailyPrayerModel] = []
    @Published var prayer: DailyPrayerModel
    
    private let dailyPrayerDetailDataService: DailyPrayerDetailDataService
    private var cancelables = Set<AnyCancellable>()
    
    init(prayer: DailyPrayerModel){
        self.prayer = prayer
        self.dailyPrayerDetailDataService = DailyPrayerDetailDataService(prayer: prayer)
        getDetailDailyPrayer()
    }
    
    func getDetailDailyPrayer() {
        dailyPrayerDetailDataService.$dailyPrayer
            .sink { [weak self] returnedDetailDailyprayer in
                self?.dailyPrayer = returnedDetailDailyprayer
            }
            .store(in: &cancelables)
    }
}
