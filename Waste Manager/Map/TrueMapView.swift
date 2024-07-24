//  ContentView.swift
//  Map
//
//  Created by iOS Lab on 27/02/24.
//

import SwiftUI
import MapKit

struct TrueMapView: View {
    //Declare coordinates of point of interests
    @State private var position : MapCameraPosition = .userLocation(fallback: .automatic)
    
    @State private var results = [MKMapItem]()
    @State private var POISelection : MKMapItem?
    @State private var details = false
    @State private var getDirections = false
    

    

    //RECYCLABLE 
    let coordinates: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2D(latitude: 19.06914, longitude: -98.31088),
        CLLocationCoordinate2D(latitude: 19.051341, longitude: -98.283982),
        CLLocationCoordinate2D(latitude: 42.34603, longitude: -71.057087),
        CLLocationCoordinate2D(latitude: 42.320390, longitude: -71.059550)

        CLLocationCoordinate2D(latitude: 19.01115109863209, longitude:-98.18754892843351),
        CLLocationCoordinate2D(latitude: 19.035641545374293,longitude: -98.21224139999998),
        CLLocationCoordinate2D(latitude: 18.99286311923262, longitude:-98.20041600330062
),        CLLocationCoordinate2D(latitude: 19.06681840644406, longitude:-98.12504439165767
),        CLLocationCoordinate2D(latitude: 18.987429068297832,longitude: -98.24695686282384),
        CLLocationCoordinate2D(latitude: 19.05182560528112, longitude:-98.18903949165804
),        CLLocationCoordinate2D(latitude: 19.030613893245114,longitude: -98.21107557049673),
        CLLocationCoordinate2D(latitude: 19.014906789910572,longitude: -98.17644249536156),
        CLLocationCoordinate2D(latitude: 19.014916933314737,longitude: -98.17642103768976),
        CLLocationCoordinate2D(latitude: 19.052080816467587,longitude: -98.15016863398621),
        CLLocationCoordinate2D(latitude: 18.97781038700953, longitude:-98.23575096097282
),        CLLocationCoordinate2D(latitude: 18.988261267638023,longitude: -98.19715349165973),
        CLLocationCoordinate2D(latitude: 19.032006602396322,longitude: -98.23279706282268),
        CLLocationCoordinate2D(latitude: 19.079808171026784,longitude: -98.2273860339855
),        CLLocationCoordinate2D(latitude: 19.056999741844077,longitude: -98.1880723816652
),        CLLocationCoordinate2D(latitude: 19.06233311138567, longitude:-98.2231667032988
 ),       CLLocationCoordinate2D(latitude: 18.98250736229002, longitude:-98.2172197763163
 ),       CLLocationCoordinate2D(latitude: 19.037814948471958,longitude: -98.20306226282251),
        CLLocationCoordinate2D(latitude: 19.029651338366676,longitude: -98.18573010807397),
        CLLocationCoordinate2D(latitude: 19.065845226909733,longitude: -98.1779758718115
),        CLLocationCoordinate2D(latitude: 19.03935992707193, longitude:-98.24108607631479
),        CLLocationCoordinate2D(latitude: 19.066308605635744,longitude: -98.21154754932945),
        CLLocationCoordinate2D(latitude: 19.065993144724835,longitude: -98.21076623583711),
        CLLocationCoordinate2D(latitude: 19.03417382256528, longitude:-98.2230534646739
 ),       CLLocationCoordinate2D(latitude: 18.981658954530026,longitude: -98.21642780515218),
        CLLocationCoordinate2D(latitude: 19.062403613887607,longitude: -98.12948090515006),
        CLLocationCoordinate2D(latitude: 19.000636012106245,longitude: -98.23045636282349),
        CLLocationCoordinate2D(latitude: 19.04331457400806, longitude:-98.16374220515061
),        CLLocationCoordinate2D(latitude: 18.987402442879652,longitude: -98.24042894748023),
        CLLocationCoordinate2D(latitude: 19.057915389960783,longitude: -98.2238719339861
),        CLLocationCoordinate2D(latitude: 19.019917073618583,longitude: -98.19846697816655),
        CLLocationCoordinate2D(latitude: 18.98588495808701, longitude:-98.21874045461875
),        CLLocationCoordinate2D(latitude: 18.966531438497135,longitude: -98.26216039404488),
        CLLocationCoordinate2D(latitude: 18.992886790826617,longitude: -98.24201913452112),
        CLLocationCoordinate2D(latitude: 19.099429854470394,longitude: -98.16289963708613),
        CLLocationCoordinate2D(latitude: 19.08085333343691, longitude:-98.24440000514959
),        CLLocationCoordinate2D(latitude: 18.963784576776508,longitude: -98.215860980286
 ),       CLLocationCoordinate2D(latitude: 19.016878671538482,longitude: -98.2197242591205
),        CLLocationCoordinate2D(latitude: 19.024968339539555,longitude: -98.20802311561667),
        CLLocationCoordinate2D(latitude: 19.01175385146601, longitude:-98.20095635808484
),        CLLocationCoordinate2D(latitude: 19.058560637791953,longitude: -98.17651601864246),
        CLLocationCoordinate2D(latitude: 19.03461386854083, longitude:-98.2012763186431
 ),       CLLocationCoordinate2D(latitude: 19.02742226966195, longitude:-98.20701399959714
),        CLLocationCoordinate2D(latitude: 19.05117081768058, longitude:-98.20599600515034
),        CLLocationCoordinate2D(latitude: 19.07772647569358, longitude:-98.23647333398554
),        CLLocationCoordinate2D(latitude: 19.008929595019914,longitude: -98.23407954747972),
        CLLocationCoordinate2D(latitude: 18.98894493707942, longitude:-98.2705415339879
 ),       CLLocationCoordinate2D(latitude: 18.98939128694762, longitude:-98.23586610015266
),        CLLocationCoordinate2D(latitude: 19.053746672218807,longitude: -98.22396934064042),
        CLLocationCoordinate2D(latitude: 19.01188065974656, longitude:-98.22768720393124
),        CLLocationCoordinate2D(latitude: 19.067811505349763,longitude: -98.12143983398583),
        CLLocationCoordinate2D(latitude: 19.022457854599427,longitude: -98.22487709404342),
        CLLocationCoordinate2D(latitude: 19.011990535995007,longitude: -98.20438913028471),








    ]
    
    var body: some View {
        
        Map(position: $position , selection: $POISelection){
            UserAnnotation()
            // Convert coordinates to annotations
            ForEach(results, id: \.self) { mapItem in
                Marker("Loc1", coordinate: mapItem.placemark.coordinate)
            }
            
        }
        .mapControls{
            MapUserLocationButton()
            MapPitchToggle()
        }
        .onAppear {
            CLLocationManager().requestWhenInUseAuthorization()
            convertCoordinates()
        }
        
        .onChange(of: POISelection, {oldValue , newValue in
            details = newValue != nil
        })
        .sheet(isPresented: $details, content: {POIdetails(mapSelection: $POISelection, showDetail: $details, getDirections: $getDirections)
                .presentationDetents([.height(340)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(340)))
                .presentationCornerRadius(20)
        })

    }
    
    
    func convertCoordinates() {
        
        results = coordinates.map { coordinate in
            
            let placemark = MKPlacemark(coordinate: coordinate)
            let mapItem = MKMapItem(placemark: placemark)
            
            return mapItem
            
        }
        
    }
}
