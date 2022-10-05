//
//  LandBnbUI.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 13/07/1401 AP.
//

import SwiftUI

struct LandBnbUI: View {
    var tabs = ["Esplora", "Preferiti", "Viaggi", "Messaggi", "Profilo"]
    
    @State var selectedTab = "Esplora"
    
    init() {
    UITabBar.appearance().backgroundColor = UIColor.white
    }
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView(selection: $selectedTab) {}
                HStack(spacing: 0) {
                    ForEach(tabs, id: \.self) { image in
                        Button(action: { selectedTab = image}, label: {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 22, height: 22)
                                .foregroundColor(selectedTab == image ? .redIcon : .gray)
                            
                        })
                        .frame(width: 25, height: 30)
                        if image != tabs.last { Spacer() }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.vertical)
                .background(.white)
                .padding(.horizontal)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            }
            .ignoresSafeArea(.all, edges: .all)
    }
}

struct LandBnbUI_Previews: PreviewProvider {
    static var previews: some View {
        LandBnbUI()
    }
}
