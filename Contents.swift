import Foundation

// What Big O Notation is?, how it works?, what the most common runtime is?,
// Are we use when talking about the performance of algorithms?,
// Why it's so important?

// Language computer scientists use when comparing the performance of algorithms.
// It is all about dominant operations
//      - time (how fast)
//      - space (how much memory)

func findNemo(_ arr: [String]) {  // O(n) - Linear
    let before = Date()
    
    for i in 0 ..< arr.count {
        if arr[i] == "nemo" {
            print("Found him!")
        }
    }
    
    let after = Date()
    let component = Calendar.current.dateComponents([.nanosecond], from: before, to: after)
    let milliSeconds: Double = Double(component.nanosecond! / 1000000)
    //print("Finding nemo took: \(milliSeconds) ")
}

// let nemo = ["nemo"]
let nemo = Array<String>(repeating: "", count: 100000)
findNemo(nemo)


// *************** Constant time O(1) ***************

func constantTime(_ n: Int) -> Int { // no loop and half element
    let result = n * n
    return result
}


// *************** Linear time O(n) ***************

func linearTime(_ A: [Int]) -> Int { // one loop, Worst Case Performance
    for i in 0 ..< A.count {
        if A[i] == 0 {
            return 0
        }
//       print(i)
    }
    return 1
}
linearTime([1,2,3])


// *************** Logarithmic time O(log n) ***************

func logarithmicTime(_ N: Int) -> Int { // half an element, Binary Search tree
    var n = N
    var result = 0
    while n > 1 {
        n /= 2
//        print(n)
        result += 1
    }
    return result
}
logarithmicTime(128)


// *************** Quadratic time O(n^2) ***************

func quadratic(_ n: Int) -> Int { // two nested loop
    var result = 0
    for i in 0 ..< n {
        for j in i ..< n {
            result += 1
//            print("\(i) \(j)")
        }
    }
    return result
}
quadratic(16)

var arr = [1, 2, 3]
arr.append(4)  // O(1)

var set = Set<Int>()
set.count  // O(1)


/*
 
 Given two arrays, create a function that let's a user know whether these two arrays contain any common items.
 
 */

// *************** Naive brute force O(n^2) ***************

func commonItemsBrute(_ A: [Int], _ B: [Int]) -> Bool { // Quadratic time
    for i in 0..<A.count {
        for j in 0 ..< B.count {
            if A[i] == B[j] {
                return true
            }
        }
    }
    
    return false
    
// Brute; Time: O(n^2), Space: O(1)
}

commonItemsBrute([1,2,3], [4,5,6])
commonItemsBrute([1,2,3], [3,5,6])


// *************** Convert to hash and lookup via other index ***************

func commonItemsHash(_ A: [Int], _ B: [Int]) -> Bool { // O(2n)
    
    // Still looping...but not nested - O(2n) vs O(n^2)
    
    var hashA = [Int: Bool]() // O(n) ; trading off space, by creating an extra data structure
    for a in A { // O(n)
        hashA[a] = true
    }
    
    // Now lookup in the hash to see if elements of B exist
    
    for b in B { // O(n)
        if hashA[b] == true {
            return true
        }
    }
    
    // O(n) + O(n) = O(2n) -> reduces to O(n)
    return false
    
// Hash Map; Time: O(n), Space: O(n)
}
commonItemsHash([1,2,3], [4,5,6])
commonItemsHash([1,2,3], [3,5,6])

/*
 What we learned?
 
 1. Big O is the language used to compare performance of algorithms ( time and space ).
 
 Most common characteristics are:
 
 - Constant O(1)
 - Logarithmic O(logn)
 - Linear O(n)
 - Quadratic O(n^2)
 
 
 2. When measuring O(n), always think worst case.
 
 3. Can often trade-off time for space.
 
 - Often we can improve the performance of an algorithm by taking more space, for example,
 by creating a hash map.
 But we gain a lot in terms of time by doing that. And that's why hash maps and dictionaries
 are one of the number one ways we can improve the performance of our algorithm is by swapping
 off that time in space, by using them.
 
 */

// #1 Tip - Hash Maps / Dictionaries are your friend.
