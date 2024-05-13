//
//  DailyPrayTest.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 10/05/24.
//

import SwiftUI

struct DailyPrayTest: View {
    
    @StateObject private var vm = DailyPrayerTestViewModel()
    @State private var showAnswerKey: Bool = false
    @State private var showAnimateTimer: Bool = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.secondary)]
    }
    
    var body: some View {
        NavigationStack {
            ZStack{
                background
                
                VStack(alignment: .leading) {
                    
                    title
                    
                    Spacer()
                    VStack {
                        dailyPrayerCard
                        answerKeyAndRefresh
                    }
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    DismissButton(imagename: "chevron.left")
                }
            }
        }
    }
}

extension DailyPrayTest {
    
    private var background: some View {
        Image.dailyPrayBg
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
    
    private var title: some View {
        Text("Tes hafalan\nDoa-Doa Harian")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(Color.black)
            .padding(.leading)
    }
    
    private var dailyPrayerCard: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
            
            HStack {
                Image.parentTeachingKid
                    .resizable()
                    .scaledToFit()
                    .padding(.all)
                
                Spacer()
                
                ForEach(vm.dailyPrayerTest) { prayerTest in
                    Text("Coba Bacakan\n\(prayerTest.namePrayer)")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundStyle(Color.black)
                        .multilineTextAlignment(.leading)
                        .transition(
                            AnyTransition.opacity
                                .animation(.easeInOut)
                        )
                        .sheet(isPresented: $showAnswerKey, content: {
                            ShowAnswerKeyView(prayerTest: prayerTest)
                                    .presentationDetents([.medium, .large])
                                    .presentationDragIndicator(.visible)
                        })
                }
                
                Spacer()
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.1 , height: 120)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var answerKeyAndRefresh: some View {
        HStack {
            
            Button {
                withAnimation(.easeIn) {
                    showAnswerKey.toggle()
                }
            } label: {
                ZStack {
                    Image.elementBg
                        .resizable()
                        .opacity(0.90)
                        .scaledToFill()
                        .frame(height: 45)
                    
                    Text("Lihat Jawaban")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundStyle(Color.white)
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width / 2)
            .frame(height: 45)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 2.5)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
            
            Button {
                withAnimation(.easeIn) {
                    vm.refreshDailyPrayer()
                }
            } label: {
                ZStack {
                    Image.elementBg
                        .resizable()
                        .opacity(0.90)
                        .scaledToFill()
                        .frame(height: 45)
                    
                    Text("Perbarui")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundStyle(Color.white)
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width / 2)
            .frame(height: 45)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 2.5)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
        .frame(width: UIScreen.main.bounds.width / 1.1, height: 45)
        .frame(maxWidth: UIScreen.main.bounds.width)
    }
    
}

#Preview {
    NavigationStack {
        DailyPrayTest()
            .environmentObject(DeveloperPreview.dailyPrayerTestVm)
            .preferredColorScheme(.light)
    }
}

#Preview {
    NavigationStack {
        DailyPrayTest()
            .environmentObject(DeveloperPreview.dailyPrayerTestVm)
            .preferredColorScheme(.dark)
    }
}
