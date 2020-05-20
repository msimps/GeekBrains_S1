import UIKit

enum WindowsState{
    case open, close
}

enum EngineState{
    case on, off
}

enum CarTrunkAction{
    case load(volume: Float)
    case unload(volume: Float)
}

struct Car {
    let brend: String
    let releaseYear: Int
    let trunkVolume: Float;
    private var _engineState: EngineState = .off
    var engineState: EngineState {
        get { return _engineState }
        set {
           _engineState = newValue
        }
    }
    private var windowsState: WindowsState = .close
    private var usedTrunkVolume: Float = 0.0
    
    func getUsedTrunkVolume()-> Float {
        return usedTrunkVolume
    }
    
    func getWindowsState() -> WindowsState{
        return windowsState
    }
    
    mutating func setWindowState(_ value: WindowsState){
        windowsState = value
    }
    
    mutating func actionWithTrunkVolume(_ action: CarTrunkAction){
        switch action {
        case let .load(value) where usedTrunkVolume + value <= trunkVolume :
            usedTrunkVolume += value
        case let .unload(value) where usedTrunkVolume - value >= 0:
            usedTrunkVolume -= value
        default:
            print("Something went wrong. Please, check your arguments and permission volume of the car trunk.")
        }
    }
    
    init(){
        brend  = "Honda Accord"
        releaseYear = 2020
        trunkVolume = 473.0
    }
}

var hondaAccord = Car()
print("Trunk volume = \(hondaAccord.getUsedTrunkVolume())")
hondaAccord.actionWithTrunkVolume(.load(volume: 300))
print("New trunk volume = \(hondaAccord.getUsedTrunkVolume())")
hondaAccord.actionWithTrunkVolume(.load(volume: 300))
print("New trunk volume = \(hondaAccord.getUsedTrunkVolume())")

print("The car windows status = \(hondaAccord.getWindowsState())")
hondaAccord.setWindowState(.open)
print("The car windows status = \(hondaAccord.getWindowsState())")

print("The car engine status = \(hondaAccord.engineState)")
hondaAccord.engineState = .on
print("The car engine status = \(hondaAccord.engineState)")


enum CarTruckBodyAction{
    case load(volume: Float)
    case unload(volume: Float)
}

struct Truck {
    let brend: String
    let releaseYear: Int
    let truckBodyVolume: Float;
    private var _engineState: EngineState = .off
    var engineState: EngineState {
        get { return _engineState }
        set {
           _engineState = newValue
        }
    }
    private var windowsState: WindowsState = .close
    private var usedTruckBodyVolume: Float = 0.0
    
    func getUsedTruckBodyVolume()-> Float {
        return usedTruckBodyVolume
    }
    
    func getWindowsState() -> WindowsState{
        return windowsState
    }
    
    mutating func setWindowState(_ value: WindowsState){
        windowsState = value
    }
    
    mutating func actionWithTruckBodyVolume(_ action: CarTruckBodyAction){
        switch action {
        case let .load(value) where usedTruckBodyVolume + value <= truckBodyVolume :
            usedTruckBodyVolume += value
        case let .unload(value) where usedTruckBodyVolume - value >= 0:
            usedTruckBodyVolume -= value
        default:
            print("Something went wrong. Please, check your arguments and permission volume of the car trunk.")
        }
    }
    
    init(){
        brend  = "КАМАЗ-43118"
        releaseYear = 2019
        truckBodyVolume = 9486000.0
    }
}

var truck = Truck()
print("Truck body volume = \(truck.getUsedTruckBodyVolume())")
truck.actionWithTruckBodyVolume(.load(volume: 9000000))
print("New truck Body volume = \(truck.getUsedTruckBodyVolume())")
truck.actionWithTruckBodyVolume(.load(volume: 9000000))
print("New truck Body volume = \(truck.getUsedTruckBodyVolume())")

print("The truck windows status = \(truck.getWindowsState())")
truck.setWindowState(.open)
print("The truck windows status = \(truck.getWindowsState())")

print("The truck engine status = \(truck.engineState)")
truck.engineState = .on
print("The truck engine status = \(truck.engineState)")


