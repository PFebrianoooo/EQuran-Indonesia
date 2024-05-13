//
//  DetailSurahDataService.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 04/05/24.
//

import Foundation
import Combine

class DetailSurahDataService {
    
    @Published var detailSurah: DetailSurahModel? = nil
    var detailSurahCancelable: AnyCancellable?
    private let surah: SurahModel
    
    init(surah: SurahModel) {
        self.surah = surah
        getDetailSurah()
    }
    
    func getDetailSurah() {
        guard let url = URL(string: "https://equran.id/api/v2/surat/\(surah.number)") else { return }
        
        detailSurahCancelable = NetworkingManager.downloadData(url: url)
            .decode(type: AllDetailSurahModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: NetworkingManager.receiveErrorCompletion,
                receiveValue: { [weak self] returnedDetailSurah in
                    self?.detailSurah = returnedDetailSurah.data
                    self?.detailSurahCancelable?.cancel()
                })
    }
}
