//
//  DailyPrayTestDataService.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 10/05/24.
//

import Foundation
import Combine

class DailyPrayTestDataService {
    
    @Published var dailyPrayerTest: [DailyPrayerModel] = []
    var dailyPrayTestCancelable: AnyCancellable?
    
    init() {
        fetchRandomizeDailyPray()
    }
    
    func fetchRandomizeDailyPray() {
        guard let url = URL(string: "https://doa-doa-api-ahmadramadhan.fly.dev/api/doa/v1/random") else { return }
        
        dailyPrayTestCancelable = NetworkingManager.downloadData(url: url)
            .decode(type: [DailyPrayerModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: NetworkingManager.receiveErrorCompletion,
                receiveValue: { [weak self] returnedRandomizeDailyPray in
                    self?.dailyPrayerTest = returnedRandomizeDailyPray
                    self?.dailyPrayTestCancelable?.cancel()
                })
    }
    
}
