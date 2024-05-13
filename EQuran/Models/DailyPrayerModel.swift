//
//  DailyPrayerModel.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 07/05/24.
//

import Foundation

/*
 URL: https://doa-doa-api-ahmadramadhan.fly.dev/api
 
 JSON Response:
 [
 {  "id":"1",
    "doa":"Doa sebelum tidur",
    "ayat":"بِسْمِكَ االلّٰهُمَّ اَحْيَا وَبِاسْمِكَ اَمُوْتُ",
    "latin":"Bismikallaahumma ahyaa wa ammuut",
    "artinya":"Dengan menyebut nama Allah, aku hidup dan aku mati"
 },{
    "id":"2",
    "doa":"Doa bangun tidur",
    "ayat":"اَلْحَمْدُ ِللهِ الَّذِىْ اَحْيَانَا بَعْدَمَآ اَمَاتَنَا وَاِلَيْهِ النُّشُوْرُ",
    "latin":"Alhamdu lillahil ladzii ahyaanaa ba’da maa amaa tanaa wa ilahin nusyuuru",
    "artinya":"Segala puji bagi Allah yang telah menghidupkan kami sesudah kami mati (membangunkan dari tidur) dan hanya kepada-Nya kami dikembalikan"
 }
 ]
 
 */
struct DailyPrayerModel: Identifiable, Codable {
    let id: String
    let namePrayer: String
    let ayahs: String
    let latinaName: String
    let meaningAyahs: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case namePrayer = "doa"
        case ayahs = "ayat"
        case latinaName = "latin"
        case meaningAyahs = "artinya"
    }
}
