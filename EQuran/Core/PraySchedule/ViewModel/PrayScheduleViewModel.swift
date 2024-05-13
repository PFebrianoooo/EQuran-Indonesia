//
//  PrayScheduleViewModel.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 05/05/24.
//

import Foundation
import Combine

class PrayScheduleViewModel: ObservableObject {
    
    @Published var praySchedule: [ScheduleModel] = []
    @Published var location: String? = nil
    @Published var date = Date()
    
    private var cancelables = Set<AnyCancellable>()
    private let prayScheduleDataService = PrayScheduleDataService()
    
    init() {
        fetchPrayScheduleData()
    }
    
    func fetchPrayScheduleData() {
        fetchPraySchedule()
        fetchLocation()
    }
    
    private func fetchPraySchedule() {
        prayScheduleDataService.$praySchedule
            .sink { [weak self] returnedSchedule in
                self?.praySchedule = returnedSchedule
            }
            .store(in: &cancelables)
    }
    
    private func fetchLocation() {
        prayScheduleDataService.$location
            .sink { [weak self] returnedLocation in
                self?.location = returnedLocation
            }
            .store(in: &cancelables)
    }
}
