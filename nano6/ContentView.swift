//
//  ContentView.swift
//  nano6
//
//  Created by marcelo frost marchesan on 23/08/21.
//
import UIKit
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
                    }
                    Section {
                        
                        Picker("Fuel type", selection: $fuelType) {
                            ForEach(Array(rangeOfFuelType.keys), id: \.self) {
                                Text("\($0)")
                            }.onTapGesture {
                                hideKeyboard()
                             }
                        }
                        
                        Picker("Aspiration", selection: $aspiration) {
                            ForEach(Array(rangeOfAspiration.keys), id: \.self) {
                                Text("\($0)")
                            }.onTapGesture {
                                hideKeyboard()
                             }
                        }
                        
                        Picker("Doors", selection: $doors) {
                            ForEach(Array(rangeOfDoors.keys), id: \.self) {
                                if $0 != 3 {
                                    Text("\($0)")
                                }
                            }.onTapGesture {
                                hideKeyboard()
                             }
                        }
                        
                        Picker("Body style", selection: $bodyStyle) {
                            ForEach(Array(rangeOfBodyStyle.keys), id: \.self) {
                                Text("\($0)")
                            }.onTapGesture {
                                hideKeyboard()
                             }
                        }
                        
                        Picker("Drive wheels", selection: $driveWheels) {
                            ForEach(Array(rangeOfDriveWheels.keys), id: \.self) {
                                Text("\($0)")
                            }.onTapGesture {
                                hideKeyboard()
                             }
                        }
                    } // Section
                    
                    Section {
                        Picker("Engine location", selection: $engineLocation) {
                            ForEach(Array(rangeOfEngineLocation.keys), id: \.self) {
                                Text("\($0)")
                            }.onTapGesture {
                                hideKeyboard()
                             }
                        }
                        
                        Picker("Engine type", selection: $engineType) {
                            ForEach(Array(rangeOfEngineType.keys), id: \.self) {
                                Text("\($0)")
                            }.onTapGesture {
                                hideKeyboard()
                             }
                        }
                        
                        Picker("Cylinders", selection: $cylinders) {
                            ForEach(Array(rangeOfCylinders.keys), id: \.self) {
                                Text("\($0)")
                            }.onTapGesture {
                                hideKeyboard()
                             }
                        }
                        
                        Picker("Fuel system", selection: $fuelSystem) {
                            ForEach(Array(rangeOfFuelSystem.keys), id: \.self) {
                                Text("\($0)")
                            }.onTapGesture {
                                hideKeyboard()
                             }
                        }
                    } // Section
                } // Form
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
                
            } // VStack
        } // NavigationView
    } // View
    
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
        let arq = readArq()
        let prect = try? model.prediction(engine_size: normalize(x: engineSize, mean: arq.mean.engineSize, std: arq.std.engineSize),
                                          horsepower: normalize(x: horsepower, mean: arq.mean.horsepower, std: arq.std.horsepower),
                                          city_mpg: normalize(x: cityMPG, mean: arq.mean.cityMpg, std: arq.std.cityMpg),
                                          highway_mpg: normalize(x: highwayMPG, mean: arq.mean.highwayMpg, std: arq.std.highwayMpg),
                                          Fdiesel: normalize(x:rangeOfFuelType["Diesel"] ?? 0.0 , mean: arq.mean.Fdiesel, std: arq.std.Fdiesel) ,
                                          Fgas: normalize(x:rangeOfFuelType["Gas"] ?? 0.0 , mean: arq.mean.Fgas, std: arq.std.Fgas) ,
                                          Astd: normalize(x:rangeOfAspiration["Std"] ?? 0.0 , mean: arq.mean.Astd, std: arq.std.Astd) ,
                                          Aturbo: normalize(x:rangeOfAspiration["Turbo"] ?? 0.0 , mean: arq.mean.Aturbo, std: arq.std.Aturbo) ,
                                          Dfour: normalize(x:rangeOfDoors[4] ?? 0.0 , mean: arq.mean.Dfour, std: arq.std.Dfour) ,
                                          Dtwo: normalize(x:rangeOfDoors[2] ?? 0.0 , mean: arq.mean.Dtwo, std: arq.std.Dtwo) ,
                                          hardtop: normalize(x:rangeOfBodyStyle["Hardtop"] ?? 0.0 , mean: arq.mean.hardtop, std: arq.std.hardtop) ,
                                          wagon: normalize(x:rangeOfBodyStyle["Wagon"] ?? 0.0 , mean: arq.mean.wagon, std: arq.std.wagon) ,
                                          sedan: normalize(x:rangeOfBodyStyle["Sedan"] ?? 0.0 , mean: arq.mean.sedan, std: arq.std.sedan) ,
                                          hatchback: normalize(x:rangeOfBodyStyle["Hatchback"] ?? 0.0 , mean: arq.mean.hatchback, std: arq.std.hatchback) ,
                                          convertible: normalize(x:rangeOfBodyStyle["Convertible"] ?? 0.0 , mean: arq.mean.convertible, std: arq.std.convertible) ,
                                          _4wd: normalize(x:rangeOfDriveWheels["4wd"] ?? 0.0 , mean: arq.mean._4wd, std: arq.std._4wd) ,
                                          fwd: normalize(x:rangeOfDriveWheels["Fwd"] ?? 0.0 , mean: arq.mean.fwd, std: arq.std.fwd) ,
                                          rwd: normalize(x:rangeOfDriveWheels["Rwd"] ?? 0.0 , mean: arq.mean.rwd, std: arq.std.rwd) ,
                                          Efront: normalize(x:rangeOfEngineLocation["Front"] ?? 0.0 , mean: arq.mean.Efront, std: arq.std.Efront) ,
                                          Erear: normalize(x:rangeOfEngineLocation["Rear"] ?? 0.0 , mean: arq.mean.Erear, std: arq.std.Erear) ,
                                          Tdohc: normalize(x:rangeOfEngineType["Doch"] ?? 0.0 , mean: arq.mean.Tdohc, std: arq.std.Tdohc) ,
                                          Tdohcv: normalize(x:rangeOfEngineType["Dohcv"] ?? 0.0 , mean: arq.mean.Tdohcv, std: arq.std.Tdohcv) ,
                                          Tl: normalize(x:rangeOfEngineType["L"] ?? 0.0 , mean: arq.mean.Tl, std: arq.std.Tl) ,
                                          Tohc: normalize(x:rangeOfEngineType["Ohc"] ?? 0.0 , mean: arq.mean.Tohc, std: arq.std.Tohc) ,
                                          Tohcf: normalize(x:rangeOfEngineType["Ohcf"] ?? 0.0 , mean: arq.mean.Tohcf, std: arq.std.Tohcf) ,
                                          Tohcv: normalize(x:rangeOfEngineType["Ohcv"] ?? 0.0 , mean: arq.mean.Tohcv, std: arq.std.Tohcv) ,
                                          Trotor: normalize(x:rangeOfEngineType["Rotor"] ?? 0.0 , mean: arq.mean.Trotor, std: arq.std.Trotor) ,
                                          Ceight: normalize(x:rangeOfCylinders[8] ?? 0.0 , mean: arq.mean.Ceight, std: arq.std.Ceight) ,
                                          Cfive: normalize(x:rangeOfCylinders[5] ?? 0.0 , mean: arq.mean.Cfive, std: arq.std.Cfive) ,
                                          Cfour: normalize(x:rangeOfCylinders[4] ?? 0.0 , mean: arq.mean.Cfour, std: arq.std.Cfour) ,
                                          Csix: normalize(x:rangeOfCylinders[6] ?? 0.0 , mean: arq.mean.Csix, std: arq.std.Csix) ,
                                          Cthree: normalize(x:rangeOfCylinders[3] ?? 0.0 , mean: arq.mean.Cthree, std: arq.std.Cthree) ,
                                          Ctwelve: normalize(x:rangeOfCylinders[12] ?? 0.0 , mean: arq.mean.Ctwelve, std: arq.std.Ctwelve) ,
                                          Ctwo: normalize(x:rangeOfCylinders[2] ?? 0.0 , mean: arq.mean.Ctwo, std: arq.std.Ctwo) ,
                                          S1bbl: normalize(x:rangeOfFuelType["1bbl"] ?? 0.0 , mean: arq.mean.S1bbl, std: arq.std.S1bbl) ,
                                          S2bbl: normalize(x:rangeOfFuelType["2bbl"] ?? 0.0 , mean: arq.mean.S2bbl, std: arq.std.S2bbl) ,
                                          S4bbl: normalize(x:rangeOfFuelType["4bbl"] ?? 0.0 , mean: arq.mean.S4bbl, std: arq.std.S4bbl) ,
                                          Sidi: normalize(x:rangeOfFuelType["idi"] ?? 0.0 , mean: arq.mean.Sidi, std: arq.std.Sidi) ,
                                          Smfi: normalize(x:rangeOfFuelType["mfi"] ?? 0.0 , mean: arq.mean.Smfi, std: arq.std.Smfi) ,
                                          Smpfi: normalize(x:rangeOfFuelType["mpfi"] ?? 0.0 , mean: arq.mean.Smpfi, std: arq.std.Smpfi) ,
                                          Sspdi: normalize(x:rangeOfFuelType["spdi"] ?? 0.0 , mean: arq.mean.Sspdi, std: arq.std.Sspdi) ,
                                          Sspfi: normalize(x:rangeOfFuelType["spfi"] ?? 0.0 , mean: arq.mean.Sspfi, std: arq.std.Sspfi) )
        
        let price = (prect!.price * arq.std.price) + arq.mean.price
        showPrice = String(format: "%.2f", price)
    }
    
    func readArq() -> Arq {
        let url = Bundle.main.url(forResource: "mean_Maker", withExtension: "json")
        let data = try? Data(contentsOf: url!)
        let json = try? JSONDecoder().decode(Arq.self, from: data!)
        
        return json!
    }
    func normalize(x: Double, mean: Double, std: Double) -> Double{
        let calc = (x - mean) / std
        //print("Range:", x, " Media:", mean, " Std:", std, " Result:", (calc.isNaN || calc.isInfinite) ? x : calc)
        return (calc.isNaN || calc.isInfinite) ? x : calc
    }
}

struct Arq: Codable {
    var mean: Values
    var std: Values
}

struct Values: Codable {
    var engineSize: Double
    var horsepower: Double
    var cityMpg: Double
    var highwayMpg: Double
    var price: Double
    var Fdiesel: Double
    var Fgas: Double
    var Astd: Double
    var Aturbo: Double
    var Dfour: Double
    var Dtwo: Double
    var hardtop: Double
    var wagon: Double
    var sedan: Double
    var hatchback: Double
    var convertible: Double
    var _4wd: Double
    var fwd: Double
    var rwd: Double
    var Efront: Double
    var Erear: Double
    var Tdohc: Double
    var Tdohcv: Double
    var Tl: Double
    var Tohc: Double
    var Tohcf: Double
    var Tohcv: Double
    var Trotor: Double
    var Ceight: Double
    var Cfive: Double
    var Cfour: Double
    var Csix: Double
    var Cthree: Double
    var Ctwelve: Double
    var Ctwo: Double
    var S1bbl: Double
    var S2bbl: Double
    var S4bbl: Double
    var Sidi: Double
    var Smfi: Double
    var Smpfi: Double
    var Sspdi: Double
    var Sspfi: Double
}

extension View {
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
