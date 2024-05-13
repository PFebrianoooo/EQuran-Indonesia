//
//  PrayScheduleDataService.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 05/05/24.
//

import Foundation
import Combine

class PrayScheduleDataService {
        
    @Published var location: String? = nil
    @Published var praySchedule: [ScheduleModel] = []
    
    private var date = Date().toString()
    var calcelable: Cancellable?
    
    init() {
        getSchedule()
    }
    
    func getSchedule() {
        
        // api requst based on date location with format YYYY-MM-DD in indonesia Tahun-Bulan-Tanggal
        guard let url = URL(string: "https://api.myquran.com/v2/sholat/jadwal/1301/\(self.date)") else { return }
        
        calcelable = NetworkingManager.downloadData(url: url)
            .decode(type: PrayScheduleRequestModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: NetworkingManager.receiveErrorCompletion,
                receiveValue: { [weak self] returnedRequestSchedule in
                    
                    guard let self = self else { return }
                    
                    self.location = returnedRequestSchedule.data.location
                    
                    let dataSchedule = sinkDataToArrayScheduleModel(returnedRequestSchedule: returnedRequestSchedule)
                    self.praySchedule = dataSchedule
                    
                    self.calcelable?.cancel()
                })
    }
    
    private func sinkDataToArrayScheduleModel(returnedRequestSchedule: PrayScheduleRequestModel) -> [ScheduleModel] {
        
        let subuh = returnedRequestSchedule.data.schedule.subuh
        let subuhPraySchedule = ScheduleModel(prayName: "Subuh", time: subuh)
        
        let terbit = returnedRequestSchedule.data.schedule.terbit
        let terbitPraySchedule = ScheduleModel(prayName: "Terbit", time: terbit)
        
        let dhuha = returnedRequestSchedule.data.schedule.dhuha
        let dhuhaPraySchedule = ScheduleModel(prayName: "Dhuha", time: dhuha)
        
        let dzuhur = returnedRequestSchedule.data.schedule.dzuhur
        let dzuhurPraySchedule = ScheduleModel(prayName: "Dzuhur", time: dzuhur)
        
        let ashar = returnedRequestSchedule.data.schedule.ashar
        let asharPraySchedule = ScheduleModel(prayName: "Ashar", time: ashar)
        
        let maghrib = returnedRequestSchedule.data.schedule.maghrib
        let maghribPraySchdule = ScheduleModel(prayName: "Maghrib", time: maghrib)
        
        let isya = returnedRequestSchedule.data.schedule.isya
        let isyaPraySchedule = ScheduleModel(prayName: "Isya", time: isya)
        
        let dataPraySchedule: [ScheduleModel] = [subuhPraySchedule, terbitPraySchedule, dhuhaPraySchedule, dzuhurPraySchedule, asharPraySchedule,maghribPraySchdule, isyaPraySchedule]
        
        return dataPraySchedule
    }
}
