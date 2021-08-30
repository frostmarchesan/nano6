import Foundation
import CreateML

let dataFile = URL(fileURLWithPath: "/Users/gustavoyamauchi/Downloads/norm_test_data_Maker_Col.csv")
let data = try MLDataTable(contentsOf: dataFile)


let dataFileTrain = URL(fileURLWithPath: "/Users/gustavoyamauchi/Downloads/norm_train_data_Maker_Col.csv")
let dataTrain = try MLDataTable(contentsOf: dataFileTrain)

//let (trainData, testData) = data.randomSplit(by: 0.8, seed: 0)


let model = try MLLinearRegressor(trainingData: dataTrain, targetColumn: "price",featureColumns: ["engine-size","horsepower","city-mpg","highway-mpg","price","Fdiesel","Fgas","Astd","Aturbo","Dfour","Dtwo","hardtop","wagon","sedan","hatchback","convertible","4wd","fwd","rwd","Efront","Erear","Tdohc","Tdohcv","Tl","Tohc","Tohcf","Tohcv","Trotor","Ceight","Cfive","Cfour","Csix","Cthree","Ctwelve","Ctwo","S1bbl","S2bbl","S4bbl","Sidi","Smfi","Smpfi","Sspdi","Sspfi"], parameters: .init(validationData: data,maxIterations: 100000, l1Penalty: 1, l2Penalty: 0.1, stepSize: 0.00001, convergenceThreshold: 0.001, featureRescaling: false))


print("Pred", try model.predictions(from: data))
print("Training", model.trainingMetrics)
print("Validation", model.validationMetrics)

let savedModel = MLModelMetadata(author: "yamauchi", shortDescription: "", license: "Personal Use", version: "1.0")
try model.write(to: URL(fileURLWithPath: "/Users/gustavoyamauchi/Documents/Apps/Auto.mlmodel"), metadata: savedModel)


