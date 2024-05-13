//
//  DailyPrayerDetailDataService.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 10/05/24.
//

import Foundation
import Combine

class DailyPrayerDetailDataService {
    
    @Published var dailyPrayer: [DailyPrayerModel] = []
    var detailDailyPrayerCancelable: AnyCancellable?
    private let prayer: DailyPrayerModel
    
    init(prayer: DailyPrayerModel) {
        self.prayer = prayer
        fetchDailyPrayerDetail()
    }
    
    func fetchDailyPrayerDetail() {
        guard let url = URL(string: "https://doa-doa-api-ahmadramadhan.fly.dev/api/\(self.prayer.id.description)") else { return }
        
        detailDailyPrayerCancelable = NetworkingManager.downloadData(url: url)
            .decode(type: [DailyPrayerModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: NetworkingManager.receiveErrorCompletion,
                receiveValue: { [weak self] returnedDailyPrayer in
                    self?.dailyPrayer = returnedDailyPrayer
                    self?.detailDailyPrayerCancelable?.cancel()
                })
    }
    
}
