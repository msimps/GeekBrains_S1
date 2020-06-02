import UIKit



struct Queue<Element: CustomStringConvertible>{
    private var array = [Element]()
    
    func peek() -> Element?{
        return array.last
    }
    
    mutating func enqueue(_ element: Element){
        array.append(element)
    }
    
    mutating func dequeue() -> Element? {
        guard let element = array.first else { return nil}
        array.remove(at: 0)
        return element
    }
}

extension Queue: CustomStringConvertible{
    var description: String {
        array.reduce("", {x, y in
            x + y.description + " "
        })
    }
}

var queue = Queue<String>()

queue.enqueue("first")
queue.enqueue("second")
queue.enqueue("third")

print("First task: ", queue)




extension Queue{
    func filter(_ closure: (Element) -> Bool) -> [Element]{
        var tmpArray = [Element]()
        for element in array{
            if closure(element){
                tmpArray.append(element)
            }
        }
        return tmpArray
    }
    
    mutating func remove(_ closure: (Element) -> Bool){
        for (index, element) in array.enumerated().reversed(){
            if closure(element){
                array.remove(at: index)
            }
        }
    }
    
    
}


var array = queue.filter { $0.count == 5 }
print("Second task:")
array.forEach { print($0)}

queue.enqueue("third")
queue.remove {$0 == "third"}
print("After removing: ", queue)

extension Queue{
    subscript(index: Int) -> Element?{
        guard (index >= 0) && (index < array.count) else { return nil }
        return array[index]
    }
}

print(queue[0])
print(queue[1])
print(queue[2])

var queue2 = Queue<Int>()
queue2.enqueue(1)
queue2.enqueue(2)
queue2.enqueue(2)
queue2.enqueue(3)
queue2.remove {$0== 2}
print(queue2)






