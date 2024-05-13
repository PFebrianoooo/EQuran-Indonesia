//
//  PrayScheduleView.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 05/05/24.
//

import SwiftUI

struct PrayScheduleView: View {
    
    @EnvironmentObject var vm: PrayScheduleViewModel
    
    var body: some View {
        VStack {
            
            informationTimeAndDate
            
            informationPraySceduleList
            
        }
    }
}

extension PrayScheduleView {
    
    private var informationTimeAndDate: some View {
        ZStack {
            // background layer
            Image.prayScheduleBg
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(height: 270)
            
            // content layer
            VStack {
                Text("Jadwal Sholat")
                    .font(.title)
                    .fontDesign(.serif)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                
                Text(vm.date.timeIn24HourFormat())
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                
                HStack(spacing: -4) {
                    ForEach(0..<21, id: \.self) { _ in
                        Text("―")
                    }
                }
                .foregroundStyle(Color.white)
                
                Text(vm.date.timeInLocalVersion())
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                
                Text((vm.location?.capitalized ?? "DKJ Jakarta") + " dan sekitarnya".capitalized)
                    .fontDesign(.serif)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.all, 20)
                
            }
            
        }
    }
    
    private var informationPraySceduleList: some View {
        List {
            ForEach(vm.praySchedule, id: \.self.prayName) { praySchedule in
                PrayScheduleRow(praySchedule: praySchedule)
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)

    }
}

#Preview {
    PrayScheduleView()
        .environmentObject(DeveloperPreview.prayScheduleVm)
        .preferredColorScheme(.light)
}

#Preview {
    PrayScheduleView()
        .environmentObject(DeveloperPreview.prayScheduleVm)
        .preferredColorScheme(.dark)
}
