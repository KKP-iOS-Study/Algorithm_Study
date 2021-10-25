fileprivate enum Direction {
  case low, high
}

fileprivate func getBoundIndex(_ array: [Int], _ direction: Direction , _ target: Int , _ low: Int, _ high: Int) -> Int {
  let midIndex = (low + high) / 2
  guard low < high else { return low }
  
  switch direction {
  case .low:
    if array[midIndex] >= target {
      return getBoundIndex(array, direction, target, low, midIndex)
    } else {
      return getBoundIndex(array, direction, target, midIndex + 1, high)
    }
  case .high:
    if array[midIndex] > target {
      return getBoundIndex(array, direction, target, low, midIndex)
    } else {
      return getBoundIndex(array, direction, target, midIndex + 1, high)
    }
  }
}

func boj10816() {
  let _ = readLine()
  let sangeunsCards: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
  let _ = readLine()
  
  var resultPrint = ""
  
  func fileResult(_ element: Substring) -> Int {
    let convert = Int(String(element))!
    
    let high = getBoundIndex(sangeunsCards, .high, convert, 0, sangeunsCards.count)
    let low = getBoundIndex(sangeunsCards, .low, convert, 0, sangeunsCards.count)
    
    resultPrint.write("\(high - low) ")
    
    return convert
  }
  
  let _ = readLine()!.split(separator: " ").map(fileResult(_:))
  
  print(resultPrint)
  
  
}
