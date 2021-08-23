//
//  ContentView.swift
//  nano6
//
//  Created by marcelo frost marchesan on 23/08/21.
//

import SwiftUI

var carStats = [
    CarOptions(id: 1, name: "Maker"),
    CarOptions(id: 2, name: "Year"),
    CarOptions(id: 3, name: "Engine"),
    CarOptions(id: 4, name: "Doors"),
    CarOptions(id: 5, name: "Horse Power"),
    CarOptions(id: 6, name: "Insurance Risk")
]

struct ContentView: View {
    var carConfigs : [CarOptions]
    var body: some View {
        GeometryReader { geometry in
            let frameHeigth = geometry.size.height
            let frameWidth = geometry.size.width
            VStack {
                IntroText()
                    .padding(10)
                List(carStats){
                        stats in ListRow(eachStat: stats)
                }
                    .frame(width: frameWidth - 20, height: 250, alignment: .center)
                    .padding(20)
                Button(action: {}, label: {
                    Text("Calculate")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                })
                    .padding(20)
                Text("$$$$$$")
                    .frame(width: 200, height: 50, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.red, lineWidth: 5))
            }
            .padding(35)
            .position(x: 200, y: 300)
        }
    }
}

struct IntroText: View {
    var body: some View {
        Text("Car $$ Calculator")
            .font(.system(size: 25, weight: .bold, design: .rounded))
            .multilineTextAlignment(.center)
        Text("Select the car configuration from the following options:")
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .multilineTextAlignment(.center)
    }
    
}


struct ListRow: View {
    var eachStat: CarOptions
    var body: some View {
        HStack {
            Text(eachStat.name)
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "chevron.forward")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(carConfigs: carStats)
    }
}

