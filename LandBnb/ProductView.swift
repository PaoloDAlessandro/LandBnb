//
//  ProductView.swift
//  LandBnb
//
//  Created by user228390 on 10/4/22.
//

import SwiftUI
import MapKit

struct ProductView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    var body: some View {
        List {
            ListTitle(title: "Accomodation Name")
                .padding(.top)
            
            Text("Milan, Lombardy, Italy")
                .listRowSeparator(.hidden)
                .foregroundColor(.gray)
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown.")
                .listRowSeparator(.hidden)
                .frame(maxHeight: 100)
            
            ListTitle(title: "Where")
            
            Map(coordinateRegion: $region)
                .listRowSeparator(.hidden)
                .frame(width:350, height:300)
                .cornerRadius(40)
            
            ListButton(title: "Guests")
        }
        .listRowSeparator(.hidden)
        .cornerRadius(40)
        
        Spacer()
    }
}

struct ListButton: View {
    private var title: String
    @State var open: Bool = false
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        Button(action: {open.toggle()}) {
            ListTitle(title: title)
            open ? ListContent() : ListContent()
            
        }
    }
}


struct ListTitle: View {
    private var title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .font(.title)
            .foregroundColor(.black)
            .listRowSeparator(.hidden)
    }
}

struct ListContent: View {
    @State private var adultsNumber: Int = 0
    
    var body: some View {
        VStack {
            Stepper("Adults", value: $adultsNumber, in: 0...20)
            Stepper("Children", value: $adultsNumber, in: 0...20)
            Stepper("Babies", value: $adultsNumber, in: 0...20)
            Stepper("Pets", value: $adultsNumber, in: 0...20)
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
