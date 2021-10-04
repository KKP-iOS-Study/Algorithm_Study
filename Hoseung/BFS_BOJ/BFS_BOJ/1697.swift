//
/*
BFS_BOJ 1697.swift
Created by: hoseung Lee on 2021/10/04

https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/


struct Queue {
  private var arr: [Int?] = []
  private var readIndex = 0
  private var writeIndex = 0
  
  init(count: Int) {
    arr = .init(repeating: nil, count: count)
  }
  
  @discardableResult
  mutating func enqueue(_ element: Int) -> Bool {
    if !isFull {
      arr[writeIndex % arr.count] = element
      writeIndex += 1
      return true
    } else {
      return false
    }
  }
  
  mutating func dequeue() -> Int? {
    if !isEmpty {
      let element = arr[readIndex % arr.count]
      readIndex += 1
      return element
    } else {
      return nil
    }
  }
  
  private var availableSpaceForReading: Int {
    writeIndex - readIndex
  }
  
  private var availableSpaceForWriting: Int {
    arr.count - availableSpaceForReading
  }
  
  public var isFull: Bool {
    availableSpaceForWriting == 0
  }
  
  public var isEmpty: Bool {
    availableSpaceForReading == 0
  }
  
}

let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let source = inputs[0]
let destination = inputs[1]
var queue = Queue(count: 100000)
var visited: Set<Int> = []

queue.enqueue(source)
visited.insert(source)

var level = 1
var mark = -1
var done = false

if source == destination {
  print(0)
} else if source > destination {
  print(source - destination)
} else {
  
  while let currentPoint = queue.dequeue(), !done {
    if currentPoint == mark {
      level += 1
      mark = -1
    }
    [currentPoint - 1, currentPoint + 1, currentPoint * 2].forEach { node in
      if !visited.contains(node) && node != destination {
        if node < destination + 2 {
          queue.enqueue(node)
          visited.insert(node)
        }
        mark = mark == -1 ? node : mark
      } else if node == destination {
        mark = mark == -1 ? node : mark
        done = true
        return
      }
    }
  }
  print(level)

}


