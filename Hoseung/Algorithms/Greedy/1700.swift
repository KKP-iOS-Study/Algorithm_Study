/*
Greedy 멀티탭 스캐줄링 1700.swift
Created by hoseung Lee on 2021/11/07.
https://www.acmicpc.net/problem/1700
https://github.com/KKP-iOS-Study/Algorithm_Study
KKP-iOS-Study : Algorithm Study
*/

fileprivate struct Queue {
  private var storage: [Int] = []
  private var readIndex = 0
  private var writeIndex = 0
  
  init(capacity: Int) {
    storage = .init(repeating: 9999999, count: capacity)
  }
  
  mutating func enqueue(_ element: Int) {
    storage[writeIndex] = (element)
    writeIndex += 1
  }
  
  @discardableResult
  mutating func dequeue() -> Int {
    defer {
      readIndex += 1
    }
    return storage[readIndex]
  }
  
  var peek: Int {
    storage[readIndex]
  }
}

func boj1700() {
  let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
    
  var powerStrip: Set<Int> = []
  
  var priority: [Int: Queue] = [:]
  var index = 0
  
  let schedule = readLine()!.split(separator: " ").map({ (element) -> Int in
    let convert = Int(String(element))!
    
    if priority[convert] == nil {
      priority[convert] = Queue(capacity: nk[1])
      priority[convert]!.enqueue(index)
    } else {
      priority[convert]!.enqueue(index)
    }
    index += 1
    return convert
  })
  
  var changeCount = 0
  for power in schedule {
    if powerStrip.count >= nk[0] && !powerStrip.contains(power) {
      changeCount += 1
      let lowPriority = priority.filter {
        powerStrip.contains($0.key)
      }.sorted { lhs, rhs in
        lhs.value.peek > rhs.value.peek
      }
      
      powerStrip.remove(lowPriority.first!.key)
    }
    powerStrip.insert(power)
    priority[power]?.dequeue()
  }
  
  print(changeCount)
  
}
