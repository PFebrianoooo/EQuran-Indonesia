//
//  DailyPrayerDataService.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 09/05/24.
//

import Foundation
import Combine

class DailyPrayerDataService {
    
    @Published var dailyPrayer: [DailyPrayerModel] = []
    var cancelable: AnyCancellable?
    
    init() {
        fetchDailyPrayer()
    }
    
    func fetchDailyPrayer() {
        
        guard let url = URL(string: "https://doa-doa-api-ahmadramadhan.fly.dev/api") else { return }
        
        cancelable = NetworkingManager.downloadData(url: url)
            .decode(type: [DailyPrayerModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: NetworkingManager.receiveErrorCompletion,
                receiveValue: { [weak self] returnedDailyPrayer in
                    self?.dailyPrayer = returnedDailyPrayer
                    self?.cancelable?.cancel()
                })
        
        
    }
}

