//
//  PrayScheduleRow.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 05/05/24.
//

import SwiftUI

struct PrayScheduleRow: View {
    
    let praySchedule: ScheduleModel
    
    var body: some View {
        VStack {
            Divider()
                .background(Color.theme.accent)
            
            HStack {
                Text(praySchedule.prayName.capitalized)
                
                Spacer()
                
                Text(praySchedule.time)
            }
            .padding(.vertical)
            .padding(.horizontal)
            Divider()
                .background(Color.theme.accent)
        }
        .font(.title)
        .fontWeight(.semibold)
        .foregroundStyle(Color.theme.accent)
        .background(Color.theme.background)
    }
}

#Preview {
    PrayScheduleRow(praySchedule: DeveloperPreview.praySchedule1)
    .preferredColorScheme(.light)
}

#Preview {
    PrayScheduleRow(praySchedule: DeveloperPreview.praySchedule2)
    .preferredColorScheme(.dark)
}
