
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

protocol CarProtocol: class{
    var brand: String { get set}
    var releaseYear: Int { get set}
    var engineState: EngineState { get set }
    var windowsState: WindowsState { get set }
    
    func perform(_ action: CarAction)
}

extension CarProtocol{
    
    func windows(_ action: WindowsState) {
        windowsState = action
    }
    
    func engine(_ action: EngineState){
        engineState = action
    }
}


class SportCar: CarProtocol{
    var brand: String
    var releaseYear: Int
    var engineState: EngineState = .off
    var windowsState: WindowsState = .close
    var nitroBoosting: Bool = false;

    init(brand: String, releaseYear: Int){
        self.brand = brand
        self.releaseYear = releaseYear
    }
    
    func perform(_ action: CarAction) {
        switch action {
        case .Windows(let state):
            windows(state)
        case .Engine(let state):
            engine(state)
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
    
}

extension SportCar: CustomStringConvertible{
    var description: String {
        return "Car \(brand), released  \(releaseYear), engine \(engineState), windows \(windowsState), nitroBoosting \(nitroBoosting)"
    }
}



let sportCar = SportCar(brand: "Ferrari Enzo", releaseYear: 2002)

print(sportCar)
sportCar.perform(.Windows(.open))
sportCar.perform(.Engine(.on))
sportCar.perform(.NitroBoost(true))
sportCar.perform(.Load(volume: 10))
sportCar.perform(.Engine(.on))
sportCar.perform(.NitroBoost(true))
print(sportCar)



class Truck: CarProtocol{
    var brand: String
    var releaseYear: Int
    var engineState: EngineState = .off
    var windowsState: WindowsState = .close
    let truckBodyVolume: Float;
    
    private var usedTruckBodyVolume: Float = 0.0
    
    func perform(_ action: CarAction) {
        switch action {
        case .Windows(let state):
            windows(state)
        case .Engine(let state):
            engine(state)
        case .Load(let value) where usedTruckBodyVolume + value <= truckBodyVolume :
            usedTruckBodyVolume += value
        case .Unload(let value) where usedTruckBodyVolume - value >= 0:
            usedTruckBodyVolume -= value
        default:
            print("This action is not available for the car")
        }
    }
    
    init(brand: String, releaseYear: Int, truckBodyVolume: Float){
        self.brand = brand
        self.releaseYear = releaseYear
        self.truckBodyVolume = truckBodyVolume
    }

}

extension Truck: CustomStringConvertible{
    var description: String {
        return "Car \(brand), released \(releaseYear), engine \(engineState), windows \(windowsState), \(usedTruckBodyVolume)/\(truckBodyVolume) loaded"
    }
}


let truck = Truck(brand: "КАМАЗ-43118", releaseYear: 2019, truckBodyVolume: 9486000.0)
print(truck)
truck.perform(.Windows(.open))
truck.perform(.NitroBoost(true))
truck.perform(.Load(volume: 5000000))
truck.perform(.Engine(.on))
print(truck)
truck.perform(.Load(volume: 5000000))






