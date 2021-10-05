//
/*
BFS_BOJ 7562.swift
Created by: hoseung Lee on 2021/10/05

https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

백준 7562 나이트의 이동
https://www.acmicpc.net/problem/7562
 
*/

fileprivate struct Queue<Element> {
  private var arr: [Element?] = []
  private var readIndex: Int = 0
  private var writeIndex: Int = 0
  
  init(count: Int) {
    arr = .init(repeating: nil, count: count)
  }
  
  @discardableResult
  mutating func enqueue(_ element: Element) -> Bool {
    if !isFull {
      arr[writeIndex % arr.count] = element
      writeIndex += 1
      return true
    } else {
      return false
    }
  }
  
  mutating func dequeue() -> Element? {
    if !isEmpty {
      let element = arr[readIndex % arr.count]
      readIndex += 1
      return element
    } else {
      return nil
    }
  }
  
  var isEmpty: Bool {
    availableSpaceForReading == 0
  }
  
  var isFull: Bool {
    availableSpaceForWriting == 0
  }
  
  private var availableSpaceForReading: Int {
    writeIndex - readIndex
  }
  
  private var availableSpaceForWriting: Int {
    arr.count - availableSpaceForReading
  }
}

func getCourse(_ x: Int, _ y: Int) -> [(x: Int, y: Int)] {
  let pattern: [(x: Int, y: Int)] = [
    (x + 1, y - 2), (x + 2, y - 1), //uur, ur
    (x + 2, y + 1), (x + 1, y + 2), //dr, ddr
    (x - 1, y + 2), (x - 2, y + 1), //ddl, dl
    (x - 2, y - 1), (x - 1, y - 2)  //ul, uul
  ]
  return pattern
}



let testCase = Int(readLine()!)!

for _ in 1...testCase {
  let boardSize = Int(readLine()!)!
  let startPoint = readLine()!.split(separator: " ").map { Int(String($0))! }
  let destinationPoint = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  if startPoint == destinationPoint {
    print(0)
  } else {
    var chessBoard: [[Int]] = .init(repeating: .init(repeating: -1, count: boardSize), count: boardSize)
    var queue = Queue<(x: Int, y: Int)>(count: boardSize * boardSize)
    
    var done = false
    queue.enqueue((x: startPoint[0], y: startPoint[1]))
    chessBoard[startPoint[0]][startPoint[1]] = 0
    
    while let currentPoint = queue.dequeue(), !done {
      let (x, y) = currentPoint
      
     getCourse(x, y).forEach { points in
        if points.x > -1 && points.y > -1 && points.x < boardSize && points.y < boardSize
            && chessBoard[points.x][points.y] == -1 {
          
          queue.enqueue((x: points.x, y: points.y))
          chessBoard[points.x][points.y] = chessBoard[x][y] + 1
          
          //if find destination, quick quit
          if chessBoard[destinationPoint[0]][destinationPoint[1]] != -1{
            done = true
            return
          }
        }
      }
    }
    print(chessBoard[destinationPoint[0]][destinationPoint[1]])
  }
}


