//
//  LandBnbUI.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 13/07/1401 AP.
//

import SwiftUI


struct LandBnbUI: View {
    var tabs = ["magnifyingglass", "heart", "safari", "message", "person"]
    
    @State var selectedTab = "Esplora"
    
    init() {
        UITabBar.appearance().backgroundColor = nil
    }
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView(selection: $selectedTab){
                ContentView()
                    .tag("magnifyingglass")
                
                ProductView()
                    .tag("safari")
                    .background(.white)
                
                MessagesView()
                    .tag("message")
                
                LogInView()
                    .tag("person")
            }
                HStack(spacing: 0) {
                    ForEach(tabs, id: \.self) { image in
                        Button(action: { selectedTab = image}, label: {
                            Image(systemName: image)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 22, height: 22)
                                .foregroundColor(selectedTab == image ? .redIcon : Color("iconOut"))
                            
                        })
                        .frame(width: 25, height: 30)
                        if image != tabs.last { Spacer() }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.vertical)
                .background(Color("navbar"))
                .cornerRadius(40)
                .shadow(radius: 2)
                .padding(.horizontal)
                .padding(.bottom, 20)
            
            }
            .ignoresSafeArea(.all, edges: .all)
    }
}

struct LandBnbUI_Previews: PreviewProvider {
    static var previews: some View {
        LandBnbUI()
    }
}
