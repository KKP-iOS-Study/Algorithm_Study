//
/*
DP 1로 만들기2 12852.swift
Created by: hoseung Lee on 2021/10/17
https://www.acmicpc.net/problem/12852
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/


fileprivate struct Queue<Element> {
  private var elements: [Element?] = []
  private var readIndex = 0
  private var writeIndex = 0
  
  mutating func enqueue(_ element: Element) {
    elements[writeIndex % elements.count] = element
    writeIndex += 1
  }
  
  mutating func dequeue() -> Element? {
    if readIndex < writeIndex {
      defer {
        readIndex += 1
      }
      return elements[readIndex % elements.count]
    } else {
      return nil
    }
  }
  
  init(_ capacity: Int) {
    elements = .init(repeating: nil, count: capacity)
  }
}

func boj12852Topdown() {
  let input = Int(readLine()!)!
  guard input > 1 else { print("0\n1"); return }
  
  var queue: Queue<(Int, Int, String)> = .init(input + 1)
  var visited: [Int: Bool] = [:]
  queue.enqueue((input, 0, ""))
  
  while let (n, distance, root) = queue.dequeue() {
    
    if n == 1 {
      print(distance)
      print(root + "1")
      break
    }
    
    if n % 3 == 0 && visited[n / 3] == nil {
      queue.enqueue((n / 3, distance + 1, root + "\(n) "))
      visited[n / 3] = true
    }
    
    if n % 2 == 0 && visited[n / 2] == nil {
      queue.enqueue((n / 2, distance + 1, root + "\(n) "))
      visited[n / 2] = true
    }
    
    if visited[n - 1] == nil {
      queue.enqueue((n - 1, distance + 1, root + "\(n) "))
      visited[n - 2] = true
    }
  }
}
