//
//  DailyPrayerView.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 07/05/24.
//

import SwiftUI

struct DailyPrayerView: View {

    @State private var showListDailyPray: Bool = false
    @State private var showInformationPage: Bool = false
    @State private var showPraytest: Bool = false
    
    var body: some View {
        ZStack {
            // background Layer
            background
            
            // content Layer
            VStack {
                
                listDailyPray
                
                prayTest
                
            }
        }
        .overlay(alignment: .topTrailing) {
            informationPage
        }
        .fullScreenCover(isPresented: $showListDailyPray, content: {
            ListDailyPrayerView()
        })
        .fullScreenCover(isPresented: $showInformationPage, content: {
            InformationPage()
        })
        .fullScreenCover(isPresented: $showPraytest, content: {
            DailyPrayTest()
        })
    }
}

extension DailyPrayerView {
    
    private var background: some View {
        Image.dailyPrayBg
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
    
    private var listDailyPray: some View {
        Button{
            withAnimation(.easeIn) {
                showListDailyPray.toggle()
            }
        }label: {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                
                HStack {
                    Image.prayingKids
                        .resizable()
                        .scaledToFit()
                        .padding(.all)
                    
                    Spacer()
                    
                    Text("Daftar\nDoa-Doa Harian")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundStyle(Color.black)
                    
                    Spacer()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.1 , height: 120)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var prayTest: some View {
        Button {
            withAnimation(.easeIn) {
                showPraytest.toggle()
            }
        } label: {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                
                HStack {
                    Spacer()
                    
                    Text("Tes Hafalan\nDoa-Doa Harian")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundStyle(Color.black)
                    
                    Spacer()
                    
                    Image.teachingKids
                        .resizable()
                        .scaledToFit()
                        .padding(.all)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.1 , height: 120)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var informationPage: some View {
        Button {
            withAnimation(.easeIn) {
                showInformationPage.toggle()
            }
        } label: {
            Image(systemName: "questionmark.circle")
                .imageScale(.large)
                .foregroundStyle(Color.theme.accent)
        }
        .padding(.trailing, UIScreen.main.bounds.width/2)

    }
    
}


#Preview {
    DailyPrayerView()
        .preferredColorScheme(.light)
}

#Preview {
    DailyPrayerView()
        .preferredColorScheme(.dark)
}
