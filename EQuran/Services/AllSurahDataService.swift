//
//  AllSurahDataService.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 03/05/24.
//

import Foundation
import Combine

class AllSurahDataService {
    
    @Published var allSurah: [SurahModel] = []
    var cancelable: Cancellable?
    
    init() {
        getSurah()
    }
    
    func getSurah() {
        
        guard let url = URL(string: "https://equran.id/api/v2/surat") else { return }
        
        cancelable = NetworkingManager.downloadData(url: url)
            .decode(type: AllSurahModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: NetworkingManager.receiveErrorCompletion,
                receiveValue: { [weak self] returnedAllSurah in
                    self?.allSurah = returnedAllSurah.data
                    self?.cancelable?.cancel()
                })
    }
}
