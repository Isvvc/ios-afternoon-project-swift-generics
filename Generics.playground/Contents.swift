import UIKit

// Counted Set

struct CountedSet<T: Hashable>: Hashable {
    private var dictionary: [T: Int] = [:]
    
    lazy var isEmpty: Bool = {
        return dictionary.isEmpty
    }()
    
    mutating func insert(_ item: T) {
        dictionary[item] = self[item] + 1
    }
    
    mutating func remove(_ item: T) {
        if self[item] > 1 {
            dictionary[item]! -= 1
        } else if self[item] == 1 {
            dictionary.removeValue(forKey: item)
        }
    }
    
    subscript(_ member: T) -> Int {
        get {
            return dictionary[member] ?? 0
        }
        
        set(value) {
            dictionary[member] = value
        }
    }
    
    func count() -> Int {
        return dictionary.keys.count
    }
    
    func contains(_ element: T) -> Bool {
        return dictionary.keys.contains(element)
    }
}

// Test

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
aCountedSet.insert(.iron)
aCountedSet[.iron]
aCountedSet.contains(.iron)
aCountedSet.remove(.iron)
aCountedSet.contains(.iron)
aCountedSet.contains(.silver)
aCountedSet[.iron] = 5
aCountedSet[.iron]
aCountedSet.remove(.iron)
aCountedSet[.iron]

var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
