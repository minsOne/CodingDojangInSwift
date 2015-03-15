import Foundation

func partition(array: [String]) -> [[String]] {
  var result = [[String]]()
  var lastValue: String?
  
  for item in array {
    let value = item
    
    if value == lastValue {
      result[result.count-1].append(value)
    } else {
      result.append([value])
      lastValue = value
    }
  }
  return result
}

var x = partition(["a","a","c", "d", "b","b","b","b","c","c","c","c"])
  .map{ (item: [String]) -> String in
    let count = item.reduce(0){ (s0, s1) in s0 + 1 }
    let str = item.first! + String(count)
    return str
  }.reduce("") { $0 + $1 }

println("Result : \(x)")