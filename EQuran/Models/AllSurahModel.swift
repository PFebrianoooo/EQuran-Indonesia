//
//  AllSurahModel.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 03/05/24.
//

import Foundation

/*
 URl: https://equran.id/api/v2/surat
 
 Json Response :
 {
     "code": 200,
     "message": "Data retrieved successfully",
     "data": [
         {
             "nomor": 1,
             "nama": "الفاتحة",
             "namaLatin": "Al-Fatihah",
             "jumlahAyat": 7,
             "tempatTurun": "Mekah",
             "arti": "Pembukaan",
             "deskripsi": "Surat <i>Al Faatihah</i> (Pembukaan) yang diturunkan di Mekah dan terdiri dari 7 ayat adalah surat yang pertama-tama diturunkan dengan lengkap  diantara surat-surat yang ada dalam Al Quran dan termasuk golongan surat Makkiyyah. Surat ini disebut <i>Al Faatihah</i> (Pembukaan), karena dengan surat inilah dibuka dan dimulainya Al Quran. Dinamakan <i>Ummul Quran</i> (induk Al Quran) atau <i>Ummul Kitaab</i> (induk Al Kitaab) karena dia merupakan induk dari semua isi Al Quran, dan karena itu diwajibkan membacanya pada tiap-tiap sembahyang.<br> Dinamakan pula <i>As Sab'ul matsaany</i> (tujuh yang berulang-ulang) karena ayatnya tujuh dan dibaca berulang-ulang dalam sholat.",
             "audioFull": {
                 "01": "https://equran.nos.wjv-1.neo.id/audio-full/Abdullah-Al-Juhany/001.mp3",
                 "02": "https://equran.nos.wjv-1.neo.id/audio-full/Abdul-Muhsin-Al-Qasim/001.mp3",
                 "03": "https://equran.nos.wjv-1.neo.id/audio-full/Abdurrahman-as-Sudais/001.mp3",
                 "04": "https://equran.nos.wjv-1.neo.id/audio-full/Ibrahim-Al-Dossari/001.mp3",
                 "05": "https://equran.nos.wjv-1.neo.id/audio-full/Misyari-Rasyid-Al-Afasi/001.mp3"
             }
         },
     ]
 }
 */

struct AllSurahModel: Codable {
    let data: [SurahModel]
}

struct SurahModel: Codable {
    let number: Int
    let name: String
    let latinaName: String
    let ayahsCount: Int
    let placeBirth: String
    let meaningSurah: String
    
    enum CodingKeys: String, CodingKey {
        case number = "nomor"
        case name = "nama"
        case latinaName = "namaLatin"
        case ayahsCount = "jumlahAyat"
        case placeBirth = "tempatTurun"
        case meaningSurah = "arti"
    }
}

