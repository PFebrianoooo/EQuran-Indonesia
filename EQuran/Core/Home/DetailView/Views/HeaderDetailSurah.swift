//
//  HeaderDetailSurah.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 04/05/24.
//

import SwiftUI

struct HeaderDetailSurah: View {
    
    let surah: DetailSurahModel?
    @StateObject var audioVM = AudioPlayerViewModel()
    
    var body: some View {
        if let surahDetail = surah {
            ZStack(alignment: .center) {
                Image.elementBg
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(spacing: 25) {
                    VStack {
                        Text(surahDetail.latinaName)
                            .font(.title3)
                            .fontDesign(.serif)
                        
                        Text(surahDetail.meaningAyahs)
                            .font(.headline)
                        
                        HStack(spacing: -4) {
                            ForEach(0..<13, id: \.self) { _ in
                                Text("―")
                            }
                        }
                        
                        VStack(spacing: 8) {
                            HStack {
                                Text(surahDetail.placeBirth)
                                
                                Spacer()
                                
                                Text("• \(surahDetail.ayahsCount) ayat")
                            }
                            .font(.subheadline)
                            .frame(maxWidth: 150, alignment: .leading)
                            
                            Button {
                                guard let murrotal = surahDetail.audioFull["05"] else { return }
                                audioVM.isPlaying ? audioVM.pause() : audioVM.play(urls: murrotal)
                                
                            } label: {
                                HStack {
                                    Image(systemName: audioVM.isPlaying ? "pause.fill" : "play.fill")
                                    
                                    Text(audioVM.isPlaying ? "Pause Murrotal" : "Play Murrotal")
                                }
                            }
                            .font(.subheadline)
                            .frame(maxWidth: 150, alignment: .center)
                            .padding(.vertical,2)
                            .background(Color.theme.accent)
                            
                        }
                    }
                    
                    Image.stickerBismillah
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(Color.white)
                        .frame(width: 225 ,height: 70)
                    
                }
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
            }
            .padding(.horizontal)
            .transition(AnyTransition.opacity.animation(.easeIn(duration: 0.25)))
        }
    }
}

#Preview {
    HeaderDetailSurah(surah: DeveloperPreview.detailSurah)
        .frame(maxWidth: UIScreen.main.bounds.width)
        .frame(height: 200)
}

#Preview {
    HeaderDetailSurah(surah: DeveloperPreview.detailSurah)
        .frame(maxWidth: UIScreen.main.bounds.width)
        .frame(height: 200)
        .preferredColorScheme(.dark)
}
