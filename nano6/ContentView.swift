//
//  ContentView.swift
//  nano6
//
//  Created by marcelo frost marchesan on 23/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var engineSize: Double = 100.0
    @State private var horsepower: Double = 150.0
    @State private var cityMPG: Double = 35.0
    @State private var highwayMPG: Double = 35.0
    @State private var fuelType = ""
    @State private var aspiration = ""
    @State private var doors = 2
    @State private var bodyStyle = ""
    @State private var driveWheels = ""
    @State private var engineLocation = ""
    @State private var engineType = ""
    @State private var cylinders = 2
    @State private var fuelSystem = ""
    
    @State private var rangeOfFuelType = ["Diesel": 0.0, "Gas": 0.0]
    @State private var rangeOfAspiration = ["Std": 0.0, "Turbo": 0.0]
    @State private var rangeOfDoors = [2: 0.0, 4: 0.0]
    @State private var rangeOfBodyStyle = ["Hardtop": 0.0, "Wagon": 0.0, "Sedan": 0.0, "Hatchback": 0.0, "Convertible": 0.0]
    @State private var rangeOfDriveWheels = ["4wd": 0.0, "Rwd": 0.0, "Fwd": 0.0]
    @State private var rangeOfEngineLocation = ["Front": 0.0, "Rear": 0.0]
    @State private var rangeOfEngineType = ["Dohc": 0.0, "Dohcv": 0.0, "L": 0.0, "Ohc": 0.0, "Ohcv": 0.0, "Ohcf": 0.0, "Rotor": 0.0]
    @State private var rangeOfCylinders = [2: 0.0, 3: 0.0, 4: 0.0, 5: 0.0, 6: 0.0, 8: 0.0, 12: 0.0]
    @State private var rangeOfFuelSystem = ["1bbl": 0.0, "2bbl": 0.0, "4bbl": 0.0, "Idi": 0.0, "Mfi": 0.0, "Mpfi": 0.0, "Spdi": 0.0, "Spfi": 0.0]
    
    @State private var showPrice = ""
    
    @State private var engineSizeFieldText : String = ""
    @State private var horsePowerFieldText : String = ""
    @State private var cityMPGieldText : String = ""
    @State private var highwayMPGieldText : String = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        
                        HStack {
                            Text("Engine Size (CC)")
                            Spacer()
                            TextField("0.0", text: $engineSizeFieldText)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: false)
                                .frame(width: 95, height: 30, alignment: .center)
                                .background(Color.gray.opacity(0.15)).cornerRadius(10)
                                .keyboardType(.decimalPad)
                        }
                        
                        HStack {
                            Text("Horse Power (HP)")
                            Spacer()
                            TextField("0.0", text: $horsePowerFieldText)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: false)
                                .frame(width: 95, height: 30, alignment: .center)
                                .background(Color.gray.opacity(0.15)).cornerRadius(10)
                                .keyboardType(.decimalPad)
                        }
                        
                        HStack {
                            Text("City MPG (Miles per Gallon)")
                            Spacer()
                            TextField("0.0", text: $cityMPGieldText)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: false)
                                .frame(width: 95, height: 30, alignment: .center)
                                .background(Color.gray.opacity(0.15)).cornerRadius(10)
                                .keyboardType(.decimalPad)
                        }
                        
                        HStack {
                            Text("Road MPG (Miles per Gallon)")
                            Spacer()
                            TextField("0.0", text: $highwayMPGieldText)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: false)
                                .frame(width: 95, height: 30, alignment: .trailing)
                                .background(Color.gray.opacity(0.15)).cornerRadius(10)
                                .keyboardType(.decimalPad)
                        }
                        
//                        Stepper(value: $engineSize, in: 0...400, step: 0.5) {
//                            Text("Engine-size (CC) \(engineSize, specifier: "%g")")
//                        }
//
//                        Stepper(value: $horsepower, in: 0...300, step: 0.5) {
//                            Text("Horsepower (HP) \(horsepower, specifier: "%g")")
//                        }
//
//                        Stepper(value: $cityMPG, in: 0...70, step: 0.5) {
//                            Text("City MPG(Miles per gallon) \(cityMPG, specifier: "%g")")
//                        }
//
//                        Stepper(value: $highwayMPG, in: 0...70, step: 0.5) {
//                            Text("Highway MPG(Miles per gallon) \(highwayMPG, specifier: "%g")")
//                        }
                        
                        Picker("Fuel type", selection: $fuelType) {
                            ForEach(Array(rangeOfFuelType.keys), id: \.self) {
                                Text("\($0)")
                            }
                        }
                        
                        Picker("Aspiration", selection: $aspiration) {
                            ForEach(Array(rangeOfAspiration.keys), id: \.self) {
                                Text("\($0)")
                            }
                        }
                        
                        Picker("Doors", selection: $doors) {
                            ForEach(Array(rangeOfDoors.keys), id: \.self) {
                                if $0 != 3 {
                                    Text("\($0)")
                                }
                            }
                        }
                        
                        Picker("Body style", selection: $bodyStyle) {
                            ForEach(Array(rangeOfBodyStyle.keys), id: \.self) {
                                Text("\($0)")
                            }
                        }
                        
                        Picker("Drive wheels", selection: $driveWheels) {
                            ForEach(Array(rangeOfDriveWheels.keys), id: \.self) {
                                Text("\($0)")
                            }
                        }
                    }
                    
                    Section {
                        Picker("Engine location", selection: $engineLocation) {
                            ForEach(Array(rangeOfEngineLocation.keys), id: \.self) {
                                Text("\($0)")
                            }
                        }
                        
                        Picker("Engine type", selection: $engineType) {
                            ForEach(Array(rangeOfEngineType.keys), id: \.self) {
                                Text("\($0)")
                            }
                        }
                        
                        Picker("Cylinders", selection: $cylinders) {
                            ForEach(Array(rangeOfCylinders.keys), id: \.self) {
                                Text("\($0)")
                            }
                        }
                        
                        Picker("Fuel system", selection: $fuelSystem) {
                            ForEach(Array(rangeOfFuelSystem.keys), id: \.self) {
                                Text("\($0)")
                            }
                        }
                    }
                    
                }
                .navigationBarTitle("CarCulator")
                
                Button(action: calculate, label: {
                    Text("Calculate")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                })
                .padding(10)
                
                Text("$$ " + showPrice)
                    .frame(width: 150, height: 30, alignment: .center)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.red, lineWidth: 3))
                
            }
        }
    }
    
    func setValues() {
        
        // Engine Size
        engineSize = Double(engineSizeFieldText) ?? 0.0
        
        // Horse Power
        horsepower = Double(horsePowerFieldText) ?? 0.0
        
        // City Miles per Gallon
        engineSize = Double(cityMPGieldText) ?? 0.0
        
        // Highway Miles per Gallon
        engineSize = Double(highwayMPGieldText) ?? 0.0
        
        // Fuel Type
        rangeOfFuelType = ["Diesel": 0.0,
                           "Gas": 0.0]
        rangeOfFuelType.updateValue(1.0, forKey: fuelType)
        
        // Aspiration
        rangeOfAspiration = ["Std": 0.0,
                             "Turbo": 0.0]
        rangeOfAspiration.updateValue(1.0, forKey: aspiration)
        
        // Doors
        rangeOfDoors = [2: 0.0,
                        4: 0.0]
        rangeOfDoors.updateValue(1.0, forKey: doors)
        
        // Body Style
        rangeOfBodyStyle = ["Hardtop": 0.0,
                           "Wagon": 0.0,
                           "Sedan": 0.0,
                           "Hatchback": 0.0,
                           "Convertible": 0.0]
        rangeOfBodyStyle.updateValue(1.0, forKey: bodyStyle)
        
        // Drive Wheels
        rangeOfDriveWheels = ["4wd": 0.0,
                              "Rwd": 0.0,
                              "Fwd": 0.0]
        rangeOfDriveWheels.updateValue(1.0, forKey: driveWheels)
        
        // Engine Location
        rangeOfEngineLocation = ["Front": 0.0,
                                "Rear": 0.0]
        rangeOfEngineLocation.updateValue(1.0, forKey: engineLocation)
        
        // Engine Type
        rangeOfEngineType = ["Dohc": 0.0,
                          "Dohcv": 0.0,
                          "L": 0.0,
                          "Ohc": 0.0,
                          "Ohcv": 0.0,
                          "Ohcf": 0.0,
                          "Rotor": 0.0]
        rangeOfEngineType.updateValue(1.0, forKey: engineType)
        
        // Cylinders
        rangeOfCylinders = [2: 0.0,
                         3: 0.0,
                         4: 0.0,
                         5: 0.0,
                         6: 0.0,
                         8: 0.0,
                         12: 0.0]
        rangeOfCylinders.updateValue(1.0, forKey: cylinders)
        
        // Fuel System
        rangeOfFuelSystem = ["1bbl": 0.0,
                             "2bbl": 0.0,
                             "4bbl": 0.0,
                             "Idi": 0.0,
                             "Mfi": 0.0,
                             "Mpfi": 0.0,
                             "Spdi": 0.0,
                             "Spfi": 0.0]
        rangeOfFuelSystem.updateValue(1.0, forKey: fuelSystem)
    }
    
    func calculate() {
        let model = Auto()
        setValues()
        do {
            let prect = try model.prediction(engine_size: engineSize, horsepower: horsepower, city_mpg: cityMPG, highway_mpg: highwayMPG, Fdiesel: rangeOfFuelType["Diesel"] ?? 0.0, Fgas: rangeOfFuelType["Gas"] ?? 0.0, Astd: rangeOfAspiration["Std"] ?? 0.0, Aturbo: rangeOfAspiration["Turbo"] ?? 0.0, Dfour: rangeOfDoors[4] ?? 0.0, Dtwo: rangeOfDoors[2] ?? 0.0, hardtop: rangeOfBodyStyle["Hardtop"] ?? 0.0, wagon: rangeOfBodyStyle["Wagon"] ?? 0.0, sedan: rangeOfBodyStyle["Sedan"] ?? 0.0, hatchback: rangeOfBodyStyle["Hatchback"] ?? 0.0, convertible: rangeOfBodyStyle["Convertible"] ?? 0.0, _4wd: rangeOfDriveWheels["4wd"] ?? 0.0, fwd: rangeOfDriveWheels["Fwd"] ?? 0.0, rwd: rangeOfDriveWheels["Rwd"] ?? 0.0, Efront: rangeOfEngineLocation["Front"] ?? 0.0, Erear: rangeOfEngineLocation["Rear"] ?? 0.0, Tdohc: rangeOfEngineType["Doch"] ?? 0.0, Tdohcv: rangeOfEngineType["Dohcv"] ?? 0.0, Tl: rangeOfEngineType["L"] ?? 0.0, Tohc: rangeOfEngineType["Ohc"] ?? 0.0, Tohcf: rangeOfEngineType["Ohcf"] ?? 0.0, Tohcv: rangeOfEngineType["Ohcv"] ?? 0.0, Trotor: rangeOfEngineType["Rotor"] ?? 0.0, Ceight: rangeOfCylinders[8] ?? 0.0, Cfive: rangeOfCylinders[5] ?? 0.0, Cfour: rangeOfCylinders[4] ?? 0.0, Csix: rangeOfCylinders[6] ?? 0.0, Cthree: rangeOfCylinders[3] ?? 0.0, Ctwelve: rangeOfCylinders[12] ?? 0.0, Ctwo: rangeOfCylinders[2] ?? 0.0, S1bbl: rangeOfFuelType["1bbl"] ?? 0.0, S2bbl: rangeOfFuelType["2bbl"] ?? 0.0, S4bbl: rangeOfFuelType["4bbl"] ?? 0.0, Sidi: rangeOfFuelType["idi"] ?? 0.0, Smfi: rangeOfFuelType["mfi"] ?? 0.0, Smpfi: rangeOfFuelType["mpfi"] ?? 0.0, Sspdi: rangeOfFuelType["spdi"] ?? 0.0, Sspfi: rangeOfFuelType["spfi"] ?? 0.0)
            
            let price = (prect.price * 5758.941567) + 11382.669291
            showPrice = String(format: "%.2f", price)
        }catch{
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
