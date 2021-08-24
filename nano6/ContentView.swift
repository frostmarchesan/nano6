//
//  ContentView.swift
//  nano6
//
//  Created by marcelo frost marchesan on 23/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var engineSize: Float = 100.0
    @State private var horsepower: Float = 150.0
    @State private var cityMPG: Float = 35.0
    @State private var highwayMPG: Float = 35.0
    @State private var fuelType = ""
    @State private var aspiration = ""
    @State private var doors = 2
    @State private var bodyStyle = ""
    @State private var driveWheels = ""
    @State private var engineLocation = ""
    @State private var engineType = ""
    @State private var cylinders = 2
    @State private var fuelSystem = ""
    
    private var rangeOfFuelType = ["Diesel", "Gas"]
    private let rangeOfAspiration = ["Std", "Turbo"]
    private let rangeOfDoors = 2...4
    private let rangeOfBodyStyle = ["Hardtop", "Wagon", "Sedan", "Hatchback", "Convertible"]
    private let rangeOfDriveWheels = ["4wd", "Rwd", "Fwd"]
    private let rangeOfEngineLocation = ["Front", "Rear"]
    private let rangeOfEngineType = ["Dohc", "Dohcv", "L", "Ohc", "Ohcv", "Ohcf", "Rotor"]
    private let rangeOfCylinders = 2...12
    private let rangeOfFuelSystem = ["1bbl", "2bbl", "4bbl", "Idi", "Mfi", "Mpfi", "Spdi", "Spfi"]
        
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Stepper(value: $engineSize, in: 0...400, step: 0.5) {
                            Text("Engine-size (CC) \(engineSize, specifier: "%g")")
                        }
                        
                        Stepper(value: $horsepower, in: 0...300, step: 0.5) {
                            Text("Horsepower (HP) \(horsepower, specifier: "%g")")
                        }
                        
                        Stepper(value: $cityMPG, in: 0...70, step: 0.5) {
                            Text("City MPG(Miles per gallon) \(cityMPG, specifier: "%g")")
                        }
                        
                        Stepper(value: $highwayMPG, in: 0...70, step: 0.5) {
                            Text("Highway MPG(Miles per gallon) \(highwayMPG, specifier: "%g")")
                        }
                        
                        Picker("Fuel type", selection: $fuelType) {
                            ForEach(rangeOfFuelType, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        
                        Picker("Aspiration", selection: $aspiration) {
                            ForEach(rangeOfAspiration, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        
                        Picker("Doors", selection: $doors) {
                            ForEach(rangeOfDoors, id: \.self) {
                                if $0 != 3 {
                                    Text("\($0)")
                                }
                            }
                        }
                        
                        Picker("Body style", selection: $bodyStyle) {
                            ForEach(rangeOfBodyStyle, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        
                        Picker("Drive wheels", selection: $driveWheels) {
                            ForEach(rangeOfDriveWheels, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    }
                    
                    Section {
                        Picker("Engine location", selection: $engineLocation) {
                            ForEach(rangeOfEngineLocation, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        
                        Picker("Engine type", selection: $engineType) {
                            ForEach(rangeOfEngineType, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        
                        Picker("Cylinders", selection: $cylinders) {
                            ForEach(rangeOfCylinders, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        
                        Picker("Fuel system", selection: $fuelSystem) {
                            ForEach(rangeOfFuelSystem, id: \.self) {
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
            }
        }
    }
    
    func setValues(dic: [String : Double]) {
        
        let zeroFloat: Float = 0.0
        
        // Fuel Type
        var fuelTypeDic = ["Diesel": zeroFloat,
                           "Gas": zeroFloat]
        fuelTypeDic.updateValue(1.0, forKey: fuelType)
        
        // Aspiration
        var aspirationDic = ["Std": zeroFloat,
                             "Turbo": zeroFloat]
        aspirationDic.updateValue(1.0, forKey: aspiration)
        
        // Doors
        var doorsDic = [2: zeroFloat,
                        4: zeroFloat]
        doorsDic.updateValue(1.0, forKey: doors)
        
        // Body Style
        var bodyStyleDic = ["Hardtop": zeroFloat,
                           "Wagon": zeroFloat,
                           "Sedan": zeroFloat,
                           "Hatchback": zeroFloat,
                           "Convertible": zeroFloat]
        bodyStyleDic.updateValue(1.0, forKey: bodyStyle)
        
        // Drive Wheels
        var driveWheelsDic = ["4wd": zeroFloat,
                              "Rwd": zeroFloat,
                              "Fwd": zeroFloat]
        driveWheelsDic.updateValue(1.0, forKey: driveWheels)
        
        // Engine Location
        var engineLocationDic = ["Front": zeroFloat,
                                "Rear": zeroFloat]
        engineLocationDic.updateValue(1.0, forKey: engineLocation)
        
        // Engine Type
        var engineTypeDic = ["Dohc": zeroFloat,
                          "Dohcv": zeroFloat,
                          "L": zeroFloat,
                          "Ohc": zeroFloat,
                          "Ohcv": zeroFloat,
                          "Ohcf": zeroFloat,
                          "Rotor": zeroFloat]
        engineTypeDic.updateValue(1.0, forKey: engineType)
        
        // Cylinders
        var cylindersDic = [2: zeroFloat,
                         3: zeroFloat,
                         4: zeroFloat,
                         5: zeroFloat,
                         6: zeroFloat,
                         8: zeroFloat,
                         12: zeroFloat]
        cylindersDic.updateValue(1.0, forKey: cylinders)
        
        // Fuel System
        var fuelSystemDic = ["1bbl": zeroFloat,
                             "2bbl": zeroFloat,
                             "4bbl": zeroFloat,
                             "Idi": zeroFloat,
                             "Mfi": zeroFloat,
                             "Mpfi": zeroFloat,
                             "Spdi": zeroFloat,
                             "Spfi": zeroFloat]
        fuelSystemDic.updateValue(1.0, forKey: fuelSystem)
    }
    
    func calculate() {
        print("só salvinho")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
