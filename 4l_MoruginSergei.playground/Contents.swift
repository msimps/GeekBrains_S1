
import UIKit

enum WindowsState{
    case open, close
}

enum EngineState{
    case on, off
}

enum CarAction{
    case Windows(_ action: WindowsState)
    case Engine(_ action: EngineState)
    case Load(volume: Float)
    case Unload(volume: Float)
    case NitroBoost(_ state: Bool)
}


class Car{
    let brand: String
    let releaseYear: Int
    var engineState: EngineState = .off
    var windowsState: WindowsState = .close
    
    func perform(_ carAction: CarAction){
        print("I am a abstract class, don't touch me!")
    }
    
    init(brand: String, releaseYear: Int){
        self.brand = brand
        self.releaseYear = releaseYear
    }
}


class SportCar: Car{
    var nitroBoosting: Bool = false;
    
    override func perform(_ carAction: CarAction) {
        switch carAction {
        case .Windows(let action):
            windowsState = action
        case .Engine(let action):
            engineState = action
        case .NitroBoost(let state):
            if (engineState == .on){
                nitroBoosting = state
            }else{
                print("Hey, you can't activate or deactivate the NitroBoost option on a stopped engine!")
            }
        default:
            print("This action is not available for the car")
        }
    }
    
    func description(){
        print("Car \(brand), released  \(releaseYear), engine \(engineState), windows \(windowsState), NitroBosting \(nitroBoosting)")
    }
}

let sportCar = SportCar(brand: "Ferrari Enzo", releaseYear: 2002)
sportCar.description()
sportCar.perform(.Windows(.open))
sportCar.perform(.NitroBoost(true))
sportCar.perform(.Load(volume: 10))
sportCar.perform(.Engine(.on))
sportCar.perform(.NitroBoost(true))
sportCar.description()

class Truck: Car{
    let truckBodyVolume: Float;
    private var usedTruckBodyVolume: Float = 0.0
    
    override func perform(_ carAction: CarAction) {
        switch carAction {
        case .Windows(let action):
            windowsState = action
        case .Engine(let action):
            engineState = action
        case .Load(let value) where usedTruckBodyVolume + value <= truckBodyVolume :
            usedTruckBodyVolume += value
        case .Unload(let value) where usedTruckBodyVolume - value >= 0:
            usedTruckBodyVolume -= value
        default:
            print("This action is not available for the car")
        }
    }
    
    init(brand: String, releaseYear: Int, truckBodyVolume: Float){
        self.truckBodyVolume = truckBodyVolume
        super.init(brand: brand, releaseYear: releaseYear)
    }
    
    func description(){
        print("Car \(brand), released \(releaseYear), engine \(engineState), windows \(windowsState), \(usedTruckBodyVolume)/\(truckBodyVolume) loaded")
    }
}

let truck = Truck(brand: "КАМАЗ-43118", releaseYear: 2019, truckBodyVolume: 9486000.0)
truck.description()
truck.perform(.Windows(.open))
truck.perform(.NitroBoost(true))
truck.perform(.Load(volume: 5000000))
truck.perform(.Engine(.on))
truck.description()
truck.perform(.Load(volume: 5000000))



