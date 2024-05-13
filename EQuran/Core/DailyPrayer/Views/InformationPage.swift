//
//  InformationPage.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 10/05/24.
//

import SwiftUI

struct InformationPage: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(spacing: 15) {
                    
                    title
                    
                    informationsAboutListDailyPrayer
                    
                    informationsAboutTestPray
                    
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    DismissButton(imagename: "chevron.left")
                }
            }
        }
    }
}

extension InformationPage {
    
    private var title: some View {
        Text("Informasi Halaman")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(Color.theme.secondary)

    }
    
    private var informationsAboutListDailyPrayer: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("> Daftar Doa-Doa Harian")
                .font(.headline)
                
            Text("Berisi doa-doa penunjang ibadah harian.\nHidup yang dimana setiap langkahnya merupakan ibadah dan pada saat beribadah tersebut terdapat doa-doa sebelum dan sesudah menjalankan ibadah tersebut. ")
                .font(.subheadline)
            
            VStack(alignment: .leading, spacing: 25) {
                Text("Sesuai dengan Al-Quran surah Adz-Dzariyat : 56")
                    .font(.subheadline)
                
                Text("وَمَا خَلَقْتُ الْجِنَّ وَالْاِنْسَ اِلَّا لِيَعْبُدُوْنِ ")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("Artinya :\nDan aku tidak menciptakan jin dan manusia melainkan agar mereka mengabdi ( beribadah kepada-Ku)")
                    .font(.subheadline)
            }
            
            Text("Daftar doa-doa harian ditunjukkan untuk menunjang setiap aktivitas ummat agar menjadi lebih tenang dan semakin dekat kepada Allah SWT dan khususnya kepada anak-anak agar hafal doa-doa harian agar menjadi dasar kehidupan.")
                .font(.subheadline)
        }
        .fontWeight(.medium)
        .multilineTextAlignment(.leading)
        .foregroundStyle(Color.theme.secondary)
    }
    
    private var informationsAboutTestPray: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("> Hafalan Doa-Doa")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Hafalan doa-doa berisi selayaknya ujian dalam menghafal.\n\nFitur yang terdapat pada hafalan doa-doa akan mengenerate doa-doa random yang akan dibacakan oleh peserta pengujian, diharapkan dilakukannya secara berpasang-pasangan agar lebih mudah.")
                .font(.subheadline)
            
            Text("Jazakumullahu Khairan Katsiro")
                .font(.headline)
        }
        .fontWeight(.medium)
        .multilineTextAlignment(.leading)
        .foregroundStyle(Color.theme.secondary)
    }
    
}

#Preview {
    NavigationStack {
        InformationPage()
            .preferredColorScheme(.light)
    }
}

#Preview {
    NavigationStack {
        InformationPage()
            .preferredColorScheme(.dark)        
    }
}
