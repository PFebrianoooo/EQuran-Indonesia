//
//  DetailSurahModel.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 04/05/24.
//

import Foundation

/*
 URL : https://equran.id/api/v2/surat/1
 
 Json Response:
 {
     "code": 200,
     "message": "Data retrieved successfully",
     "data": {
         "nomor": 110,
         "nama": "النصر",
         "namaLatin": "An-Nasr",
         "jumlahAyat": 3,
         "tempatTurun": "Madinah",
         "arti": "Pertolongan",
         "deskripsi": "Surat An Nashr terdiri atas 3 ayat, termasuk golongan surat-surat  Madaniyyah yang diturunkan di Mekah sesudah surat At Taubah.  Dinamai <i>An Nashr</i> (pertolongan) diambil dari perkataan <i>Nashr</i> yang  terdapat pada ayat pertama surat ini.",
         "audioFull": {
                "01": "https://equran.nos.wjv-1.neo.id/audio-full/Abdullah-Al-Juhany/110.mp3",
                "02": "https://equran.nos.wjv-1.neo.id/audio-full/Abdul-Muhsin-Al-Qasim/110.mp3",
                "03": "https://equran.nos.wjv-1.neo.id/audio-full/Abdurrahman-as-Sudais/110.mp3",
                "04": "https://equran.nos.wjv-1.neo.id/audio-full/Ibrahim-Al-Dossari/110.mp3",
                "05": "https://equran.nos.wjv-1.neo.id/audio-full/Misyari-Rasyid-Al-Afasi/110.mp3"
        },
 
         "ayat": [
             {
                 "nomorAyat": 1,
                 "teksArab": "اِذَا جَاۤءَ نَصْرُ اللّٰهِ وَالْفَتْحُۙ",
                 "teksLatin": "iżā jā'a naṣrullāhi wal-fatḥ(u).",
                 "teksIndonesia": "Apabila telah datang pertolongan Allah dan kemenangan,",
                 "audio": {
                     "01": "https://equran.nos.wjv-1.neo.id/audio-partial/Abdullah-Al-Juhany/110001.mp3",
                     "02": "https://equran.nos.wjv-1.neo.id/audio-partial/Abdul-Muhsin-Al-Qasim/110001.mp3",
                     "03": "https://equran.nos.wjv-1.neo.id/audio-partial/Abdurrahman-as-Sudais/110001.mp3",
                     "04": "https://equran.nos.wjv-1.neo.id/audio-partial/Ibrahim-Al-Dossari/110001.mp3",
                     "05": "https://equran.nos.wjv-1.neo.id/audio-partial/Misyari-Rasyid-Al-Afasi/110001.mp3"
                 }
             },
             {
                 "nomorAyat": 2,
                 "teksArab": "وَرَاَيْتَ النَّاسَ يَدْخُلُوْنَ فِيْ دِيْنِ اللّٰهِ اَفْوَاجًاۙ",
                 "teksLatin": "wa ra'aitan-nāsa yadkhulūna fī dīnillāhi afwājā(n).",
                 "teksIndonesia": "dan engkau melihat manusia berbondong-bondong masuk agama Allah,",
                 "audio": {
                     "01": "https://equran.nos.wjv-1.neo.id/audio-partial/Abdullah-Al-Juhany/110002.mp3",
                     "02": "https://equran.nos.wjv-1.neo.id/audio-partial/Abdul-Muhsin-Al-Qasim/110002.mp3",
                     "03": "https://equran.nos.wjv-1.neo.id/audio-partial/Abdurrahman-as-Sudais/110002.mp3",
                     "04": "https://equran.nos.wjv-1.neo.id/audio-partial/Ibrahim-Al-Dossari/110002.mp3",
                     "05": "https://equran.nos.wjv-1.neo.id/audio-partial/Misyari-Rasyid-Al-Afasi/110002.mp3"
                 }
             },
             {
                 "nomorAyat": 3,
                 "teksArab": "فَسَبِّحْ بِحَمْدِ رَبِّكَ وَاسْتَغْفِرْهُۗ اِنَّهٗ كَانَ تَوَّابًا ࣖ",
                 "teksLatin": "fasabbiḥ biḥamdi rabbika wastagfirh(u), innahū kāna tawwābā(n).",
                 "teksIndonesia": "maka bertasbihlah dalam dengan Tuhanmu dan mohonlah ampunan kepada-Nya. Sungguh, Dia Maha Penerima tobat.",
                 "audio": {
                     "01": "https://equran.nos.wjv-1.neo.id/audio-partial/Abdullah-Al-Juhany/110003.mp3",
                     "02": "https://equran.nos.wjv-1.neo.id/audio-partial/Abdul-Muhsin-Al-Qasim/110003.mp3",
                     "03": "https://equran.nos.wjv-1.neo.id/audio-partial/Abdurrahman-as-Sudais/110003.mp3",
                     "04": "https://equran.nos.wjv-1.neo.id/audio-partial/Ibrahim-Al-Dossari/110003.mp3",
                     "05": "https://equran.nos.wjv-1.neo.id/audio-partial/Misyari-Rasyid-Al-Afasi/110003.mp3"
                 }
             }
         ],
         "suratSelanjutnya": {
             "nomor": 111,
             "nama": "اللهب",
             "namaLatin": "Al-Lahab",
             "jumlahAyat": 5
         },
         "suratSebelumnya": {
             "nomor": 109,
             "nama": "الكٰفرون",
             "namaLatin": "Al-Kafirun",
             "jumlahAyat": 6
         }
     }
 }
 */

struct AllDetailSurahModel: Codable {
    let data: DetailSurahModel
}
struct DetailSurahModel: Codable {
    let number: Int
    let latinaName: String
    let ayahsCount: Int
    let placeBirth: String
    let meaningAyahs: String
    let audioFull: [String:String]
    let detailAyahs: [AyahsDetail]
    
    enum CodingKeys: String, CodingKey {
        case number = "nomor"
        case latinaName = "namaLatin"
        case ayahsCount = "jumlahAyat"
        case placeBirth = "tempatTurun"
        case meaningAyahs = "arti"
        case detailAyahs = "ayat"
        case audioFull
    }
}

struct AyahsDetail: Codable {
    let ayahsNumber: Int
    let arabiaText: String
    let latinaText: String
    let meaningAyahs: String
    
    enum CodingKeys: String, CodingKey {
        case ayahsNumber = "nomorAyat"
        case arabiaText = "teksArab"
        case latinaText = "teksLatin"
        case meaningAyahs = "teksIndonesia"
    }
}

