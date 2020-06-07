import UIKit

enum QueueError: Error{
    case QueueIsEmpty
    case OutOfBounds
}

struct Queue<Element: CustomStringConvertible>{
    private var array = [Element]()

    mutating func enqueue(_ element: Element){
        array.append(element)
    }

    mutating func dequeue() throws -> Element {
        guard let element = array.first else { throw QueueError.QueueIsEmpty }
        array.remove(at: 0)
        return element
    }
    
    func elementBy(index: Int) throws -> Element{
        guard (index >= 0) && (index < array.count) else { throw QueueError.OutOfBounds }
        return array[index]
    }
}

var queue = Queue<Int>()
do {
    //try queue.dequeue()
    
    queue.enqueue(1)
    queue.enqueue(2)
    queue.enqueue(3)

    //try queue.elementBy(index: 3)
    
} catch QueueError.QueueIsEmpty {
    print("Ups, the queue is empty!")
} catch QueueError.OutOfBounds {
    print("Your index is out of bounds")
} catch let error {
    print(error.localizedDescription)
}


var queue2 = Queue<Int>()

queue2.enqueue(1)
queue2.enqueue(2)
queue2.enqueue(3)

let element3 = try? queue2.elementBy(index: 2)
print(element3!)
let element5 = try? queue2.elementBy(index: 4)
