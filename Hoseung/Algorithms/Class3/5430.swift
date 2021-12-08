/*
구현 AC 5430.swift
Created by hoseung Lee on 2021/12/08.
https://www.acmicpc.net/problem/5430
https://github.com/KKP-iOS-Study/Algorithm_Study
KKP-iOS-Study : Algorithm Study
*/


fileprivate class Node {
  var value: Int
  var next: Node?
  var previous: Node?
  
  init(value: Int, next: Node? = nil, previous: Node? = nil) {
    self.value = value
    self.next = next
    self.previous = previous
  }
}

fileprivate class Link: CustomStringConvertible {
  
  enum Direction {
    case standard, reverse
  }
  
  var head: Node?
  var tail: Node?
  var current: Node?
  
  var direction: Direction = .standard
  
  
  func append(node: Node) {
    
    if head == nil {
      head = node
      current = node
      tail = node
    } else {
      current!.next = node
      node.previous = current
      current = node
      tail = node
    }
    
  }
  
  
  @discardableResult
  func drop() -> Int? {
    
    if direction == .standard {
      var first = head
      head = head?.next
      head?.previous = nil
      defer {
        first = nil
      }
      return first?.value
      
    } else {
      var last = tail
      tail = tail?.previous
      tail?.next = nil
      defer {
        last = nil
      }
      return last?.value
    }
  }
  
  var description: String {
    
    var currentNode = self.direction == .standard ? head : tail
    var description = "["
    while let node = currentNode {
      description.write("\(String(node.value)),")
      currentNode = self.direction == .standard ? node.next : node.previous
    }
    if description.count > 2 {
      description.removeLast(1)
    }
    description.write("]")
    return description
  }
}
func boj5430() {
  let caseT = Int(readLine()!)!
escape: for _ in 0..<caseT {
    let funcP = readLine()!
    let _ = readLine()!
    var arr = readLine()!
    
    arr = String(arr[arr.index(after: arr.startIndex)..<arr.index(before: arr.endIndex)])
    let link = Link()
    
    var stack = 0
    for input in arr {
      if let value = Int(String(input)) {
        stack *= 10
        stack += value
      } else if input == "," {
        link.append(node: Node(value: stack))
        stack = 0
        continue
      }
    }
    if stack > 0 {
      link.append(node: Node(value: stack))
    }
    
    for command in funcP {
      if command == "R" {
        link.direction = link.direction == .standard ? .reverse : .standard
      } else {
        guard let _ = link.drop() else { print("error"); continue escape }
      }
    }
    print(link)
  }
}
