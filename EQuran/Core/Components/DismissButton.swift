//
//  DismissButton.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 04/05/24.
//

import SwiftUI

struct DismissButton: View {
    
    @Environment(\.dismiss) private var dismiss
    let imagename: String
    
    var body: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: imagename)
                .imageScale(.medium)
        })
        .foregroundStyle(Color.theme.accent)
    }
}

#Preview {
    DismissButton(imagename: "chevron.left")
}

#Preview {
    DismissButton(imagename: "chevron.left")
        .preferredColorScheme(.dark)
}
