//
//  9019.swift
//  Algorithms
//
//  Created by hoseung Lee on 2021/12/30.
//

import Foundation


//1234

fileprivate enum Command: String {
  case D
  case S
  case L
  case R
}

fileprivate class Queue<T> {
  var list: [T?] = []
  var readIndex: Int = 0
  
  func enqueue(_ element: T) {
    list.append(element)
  }
  
  func dequeue() -> T? {
    if readIndex < list.count {
      defer {
        list[readIndex] = nil
        readIndex += 1
      }
      return list[readIndex]
    } else {
      return nil
    }
  }
  init() {}

  init(list: [T]) {
    self.list = list
  }
}

//D, S, L, R
func boj9019() {
  let inputs = readLine()!.split(separator: " ").map{String($0)}
  let (input, output) = (Int(inputs[0])!, Int(inputs[1])!)

  var answer: [Command] = []
  let start = (input, [Command]())
  var visited: Set<Int> = []
  let queue = Queue<(value: Int, stack: [Command])>()
  queue.enqueue(start)
  func bfs() {
    
    while let element = queue.dequeue() {
      if element.value == output {
        answer = element.stack
        return
      }
      
      for command in [1,2,3,4] {
        switch command {
          case 1:
            let new = element.value * 2 % 10000
            
            if !visited.contains(new) {
              visited.insert(new)
              var newStack = element.stack
              newStack.append(.D)
              queue.enqueue((new, newStack))
            }
            
          case 2:
            let new = element.value - 1 == 0 ? 9999 : element.value - 1
            
            if !visited.contains(new) {
              visited.insert(new)
              var newStack = element.stack
              newStack.append(.S)
              queue.enqueue((new, newStack))
            }
          case 3:
            let new = element.value % 1000 * 10 + (element.value / 1000)
            
            if !visited.contains(new) {
              visited.insert(new)
              var newStack = element.stack
              newStack.append(.L)
              queue.enqueue((new, newStack))
            }
            
          default:
            let new = element.value % 10 * 1000 + (element.value / 10)
            
            if !visited.contains(new) {
              visited.insert(new)
              var newStack = element.stack
              newStack.append(.R)
              queue.enqueue((new, newStack))
            }
        }
      }
    }
  }
  bfs()
  print(answer.map{ $0.rawValue }.joined())
}


