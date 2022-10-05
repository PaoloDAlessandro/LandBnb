//
//  PaymentView.swift
//  LandBnb
//
//  Created by Paolo D'Alessandro on 13/07/1401 AP.
//

import SwiftUI

struct PaymentView: View {
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(width: .infinity, height: .infinity)
                    .opacity(0.001)
                    .layoutPriority(-1)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.lightgray)
            .cornerRadius(20)
            .padding([.bottom, .top], -10)
            .padding(.horizontal, 20)
            
            VStack {
                HStack {
                    Image("logo")
                        .padding()
                        .frame(maxHeight: 50)
                }
                .background(Color.gray.opacity(0.3))
                .cornerRadius(14)
                
                Spacer()
                    .frame(maxHeight: 130)
                Text("Payment methods")
                    .font(.title)
                    .foregroundColor(.darkblue)
                    .fontWeight(.bold)
                    .padding(.bottom, 24)
                Spacer()
            }
            .padding([.bottom, .top], 0)
            .padding(.horizontal, 20)
            .ignoresSafeArea(edges: .bottom)
            .shadow(radius: 2)

            VStack{
                HStack{
                    Image("master")
                    Text("**** **** **** 0000")
                        .bold()
                        .frame(alignment: .top)
                }
            }

        }.background(
            Image("surface")
                .blur(radius: 2)
        )
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
