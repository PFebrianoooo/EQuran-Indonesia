//
//  DeveloperPreview.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 03/05/24.
//

import Foundation

class DeveloperPreview {
    
    static let alQuranVm = HomeViewModel()
    
    static let prayScheduleVm = PrayScheduleViewModel()
    
    static let dailyPrayerVm = DailyPrayerViewModel()
    
    static let dailyPrayerTestVm = DailyPrayerTestViewModel()
    
    static let audioVM = AudioPlayerViewModel()
    
    static let praySchedule1 = ScheduleModel(prayName: "Subuh", time: "17:00")
    
    static let praySchedule2 = ScheduleModel(prayName: "Ashar", time: "15:00")
    
    static let dailyPrayer = 
    DailyPrayerModel(
        id: "1",
        namePrayer: "Doa Bangun Tidur",
        ayahs:"اَلْحَمْدُ ِللهِ الَّذِىْ اَحْيَانَا بَعْدَمَآ اَمَاتَنَا وَاِلَيْهِ النُّشُوْرُ",
        latinaName:"Alhamdu lillahil ladzii ahyaanaa ba’da maa amaa tanaa wa ilahin nusyuuru",
        meaningAyahs:"Segala puji bagi Allah yang telah menghidupkan kami sesudah kami mati (membangunkan dari tidur) dan hanya kepada-Nya kami dikembalikan"
    )
    
    static let surah =
    SurahModel(
        number: 1,
        name: "الفاتحة",
        latinaName: "Al-Fatihah",
        ayahsCount: 7,
        placeBirth: "Mekah",
        meaningSurah: "Pembukaan"
    )
    
    static let detailSurah =
    DetailSurahModel(
        number: 110,
        latinaName: "An-Nasr",
        ayahsCount: 3,
        placeBirth: "Madinah",
        meaningAyahs: "Pertolongan",
        audioFull: ["05":"audiofull"],
        detailAyahs: [
            AyahsDetail(
                ayahsNumber: 1,
                arabiaText: "اِذَا جَاۤءَ نَصْرُ اللّٰهِ وَالْفَتْحُۙ",
                latinaText: "iżā jā'a naṣrullāhi wal-fatḥ(u).",
                meaningAyahs: "Apabila telah datang pertolongan Allah dan kemenangan,"
            ),
            AyahsDetail(
                ayahsNumber: 2,
                arabiaText: "وَرَاَيْتَ النَّاسَ يَدْخُلُوْنَ فِيْ دِيْنِ اللّٰهِ اَفْوَاجًاۙ",
                latinaText: "wa ra'aitan-nāsa yadkhulūna fī dīnillāhi afwājā(n).",
                meaningAyahs: "dan engkau melihat manusia berbondong-bondong masuk agama Allah,"
            ),
            AyahsDetail(
                ayahsNumber: 3,
                arabiaText: "فَسَبِّحْ بِحَمْدِ رَبِّكَ وَاسْتَغْفِرْهُۗ اِنَّهٗ كَانَ تَوَّابًا ࣖ",
                latinaText: "fasabbiḥ biḥamdi rabbika wastagfirh(u), innahū kāna tawwābā(n).",
                meaningAyahs: "maka bertasbihlah dalam dengan Tuhanmu dan mohonlah ampunan kepada-Nya. Sungguh, Dia Maha Penerima tobat."
            )
        ]
    )
    
    static let detailAyahsSingle =
    AyahsDetail(
        ayahsNumber: 1,
        arabiaText: "اِذَا جَاۤءَ نَصْرُ اللّٰهِ وَالْفَتْحُۙ",
        latinaText: "iżā jā'a naṣrullāhi wal-fatḥ(u).",
        meaningAyahs: "Apabila telah datang pertolongan Allah dan kemenangan,"
    )
    
    static let prayTimeSingle = "Subuh"
    
    static let prayTimeSingle2 = "17:00"
}
