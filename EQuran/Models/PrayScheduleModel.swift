//
//  PrayScheduleModel.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 05/05/24.
//

import Foundation
    
/*
 Urls: https://api.myquran.com/v2/sholat/jadwal/1301/2024-06-24
 
 JSON Response:
 {
 "status":true,
    "request":{
        "path":"/sholat/jadwal/1301/2024-06-24",
        "year":"2024",
        "month":"06",
        "date":"24"
    },
    "data":{
            "id":1301,
            "lokasi":"KOTA JAKARTA",
            "daerah":"DKI JAKARTA",
    "jadwal":{
            "tanggal":"Senin,24/06/2024",
            "imsak":"04:31",
            "subuh":"04:41",
            "terbit":"05:59",
            "dhuha":"06:28",
            "dzuhur":"11:59",
            "ashar":"15:20",
            "maghrib":"17:51",
            "isya":"19:06",
            "date":"2024-06-24"
            }
        }
 }
 */
    
struct PrayScheduleRequestModel: Codable {
    let status: Bool
    let data: LocationScheduleModel
}

struct LocationScheduleModel: Codable {
    let id: Int
    let location: String
    let schedule: SchedulePrayModel
    
    enum CodingKeys: String, CodingKey {
        case id
        case location = "daerah"
        case schedule = "jadwal"
    }
}

struct SchedulePrayModel: Codable {
    let subuh: String
    let terbit: String
    let dhuha: String
    let dzuhur: String
    let ashar: String
    let maghrib: String
    let isya: String
}

struct ScheduleModel {
    let prayName: String
    let time: String
}
