//
//  ProductView.swift
//  LandBnb
//
//  Created by user228390 on 10/4/22.
//

import SwiftUI
import MapKit

struct ProductView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                //ForEach
                ProductImage(imageName: "product-example")
            }
                
            List {
                ListTitle(title: "Accomodation Name")

                Text("Milan, Lombardy, Italy")
                    .listRowSeparator(.hidden)
                    .foregroundColor(.gray)
                    .padding(.top, -20)
                        
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown.")
                        .listRowSeparator(.hidden)
                        .frame(maxHeight: 100)
                        .padding(.top, -20)
                        
                ListTitle(title: "Where")
                        
                ListMap(placeLatitude: 45.4654219, placeLongitude: 9.1859243)
                        
                ListButton(title: "Guests",
                           contentOpened: AnyView(GuestsContent()),
                           contentClosed: AnyView(GuestsContent().showGuests() ))
                        
                ListButton(title: "Dates",
                           contentOpened: AnyView(DatesContent() ),
                           contentClosed: AnyView(DatesContent().showDates() ))
            }
        }
    }
}

struct ProductImage: View {
    private var imageName: String
    
    init(imageName: String) {
        self.imageName = imageName
    }
    
    var body: some View{
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(20)
            .padding()
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

struct TextLeft: View {
    private var text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        HStack {
            Text(text)
                .underline()
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

struct ListMap: View {
    private var placeLatitude: Double
    private var placeLongitude: Double
    
    @State private var region: MKCoordinateRegion
    
    init(placeLatitude: Double, placeLongitude: Double) {
        self.placeLatitude = placeLatitude
        self.placeLongitude = placeLongitude
        
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: placeLatitude,
                longitude: placeLongitude),
            span: MKCoordinateSpan(
                latitudeDelta: 0.1,
                longitudeDelta: 0.1)
        )
    }
    
    var body: some View {
        Map(coordinateRegion: $region,
            showsUserLocation: true,
            userTrackingMode: .constant(.follow) )
            .listRowSeparator(.hidden)
            .frame(width:350, height:300)
            .cornerRadius(40)
    }
}

struct ListButton: View {
    private var title: String
    private var contentOpened: AnyView
    private var contentClosed: AnyView

    @State var open: Bool = false
    
    init(title: String, contentOpened: AnyView, contentClosed: AnyView) {
        self.title = title
        self.contentOpened = contentOpened
        self.contentClosed = contentClosed
    }
    
    var body: some View {
        Button(action: {open.toggle() }) {
            HStack {
                ListTitle(title: title)
                Spacer()
            }
            
            open ? contentOpened : contentClosed
            
        }
        .listRowSeparator(.hidden)
    }
}

struct GuestsContent: View {
    @State private var adultsNumber: Int = 0
    @State private var childrenNumber: Int = 0
    @State private var babiesNumber: Int = 0
    @State private var petsNumber: Int = 0

    var body: some View {
        VStack {
            Stepper("Adults: \(adultsNumber)", value: $adultsNumber, in: 0...50)
            Stepper("Children: \(childrenNumber)", value: $childrenNumber, in: 0...50)
            Stepper("Babies: \(babiesNumber)", value: $babiesNumber, in: 0...50)
            Stepper("Pets: \(petsNumber)", value: $petsNumber, in: 0...50)
            //ListStepper(title: "Adults", number: adultsNumber)
        }
    }
    
    func showGuests() -> some View {
        if(adultsNumber != 0) {
            return TextLeft(text: "Adults: \(adultsNumber)")
        } else {
            return TextLeft(text: "Add guests")
        }
    }
}

/*
struct ListStepper: View {
    private var title: String
    @Binding private var number: Int
    
    init(title: String, number: Int) {
        self.title = title
        self.number = number
    }
    
    var body: some View {
        Stepper(title, value: $number, in: 0...20)
    }
    
    func increment(@State _ int: Int) {
        return int += 1
    }
    
    func decrement(@State _ int: Int) {
        return int -= 1
    }
}
*/

struct DatesContent: View {
    @State private var checkInDate = Date()
    @State private var checkOutDate = Date()
    
    var body: some View {
        DatePicker("Check In",
                   selection: $checkInDate,
                   displayedComponents: [.date])
        DatePicker("Check Out",
                   selection: $checkOutDate,
                   displayedComponents: [.date])
    }
    
    func showDates() -> some View {
        return HStack {
            Text("\(checkInDate, style: .date) - \(checkOutDate, style: .date)")
                .underline()
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
