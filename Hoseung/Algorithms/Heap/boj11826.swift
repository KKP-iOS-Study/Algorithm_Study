//  절댓값 힙
//  boj11826.swift
//  Algorithms
//
//  Created by hoseung Lee on 2021/12/30.
//


fileprivate struct Heap<Element: Equatable> {
  var elements: [Element] = []
  let sort: (Element, Element) -> Bool
  
  init(sort: @escaping (Element, Element) -> Bool) {
    self.sort = sort
  }
  
  var isEmpty: Bool {
    elements.isEmpty
  }
  
  var count: Int {
    elements.count
  }
  
  var peek: Element? {
    elements.first
  }
  
  func leftChildIndex(parent: Int) -> Int {
    (2 * parent) + 1
  }
  
  func rightChildIndex(parent: Int) -> Int {
    (2 * parent) + 2
  }
  
  func parentIndex(child: Int) -> Int {
    (child - 1) / 2
  }
  
  mutating func remove() -> Element? {
    guard !isEmpty else { return nil }
    elements.swapAt(0, count - 1)
    defer {
      siftDown(from: 0)
    }
    return elements.removeLast()
  }
  
  mutating func siftDown(from index: Int) {
    var parent = index
    while true {
      let left = leftChildIndex(parent: parent)
      let right = rightChildIndex(parent: parent)
      var candidate = parent
      
      if left < count && sort(elements[left], elements[candidate]) {
        candidate = left
      }
      
      if right < count && sort(elements[right], elements[candidate]) {
        candidate = right
      }
      
      if candidate == parent {
        return
      }
      elements.swapAt(parent, candidate)
      parent = candidate
    }
  }
  
  mutating func insert(_ element: Element) {
    elements.append(element)
    siftUp(from: elements.count - 1)
  }
  
  mutating func siftUp(from index: Int) {
    var child = index
    var parent = parentIndex(child: child)
    while child > 0 && sort(elements[child], elements[parent]) {
      elements.swapAt(child, parent)
      child = parent
      parent = parentIndex(child: child)
    }
  }
}

func boj11286() {
  let n = Int(readLine()!)!
  
  var positiveHeap: Heap<Int> = .init(sort: <)
  var negativeHeap: Heap<Int> = .init(sort: >)
  var answer = ""
  for _ in 1...n {
    let input = Int(readLine()!)!
    if input > 0 {
      positiveHeap.insert(input)
    } else if input < 0 {
      negativeHeap.insert(input)
    } else {
      if let positive = positiveHeap.peek, let negative = negativeHeap.peek {
        if positive >= abs(negative) {
          answer.write("\(negativeHeap.remove()!)\n")
        } else {
          answer.write("\(positiveHeap.remove()!)\n")
        }
      } else if let _ = positiveHeap.peek {
        answer.write("\(positiveHeap.remove()!)\n")
      } else if let _ = negativeHeap.peek {
        answer.write("\(negativeHeap.remove()!)\n")
      } else {
        answer.write("\(0)\n")
      }
    }
  }
  print(answer)
}
