//
/*
BFS_BOJ 다리만들기 2146.swift
Created by: hoseung Lee on 2021/10/12
https://www.acmicpc.net/problem/2146
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

private struct Point: Hashable {
  static func == (lhs: Point, rhs: Point) -> Bool {
    lhs.row == rhs.row && lhs.column == rhs.column
  }
  
  static func - (lhs: Point, rhs: Point) -> Int {
    abs(lhs.row - rhs.row) + abs(lhs.column - rhs.column) - 1
  }
  
  var row: Int
  var column: Int
}

func boj2146() {
  func getNextPoints(_ point: Point) -> [Point] {
    [
      Point(row: point.row + 1, column: point.column),
      Point(row: point.row - 1, column: point.column),
      Point(row: point.row, column: point.column + 1),
      Point(row: point.row, column: point.column - 1)
    ]
  }
  
  let size = Int(readLine()!)!
  var lands: [[Int]] = .init(repeating: .init(repeating: 0, count: size), count: size)
  for r in 0..<size {
    let line = readLine()!.filter { $0 != " " }
    for (c, info) in line.enumerated() {
      let block = Int(String(info))!
      if block == 1 {
        lands[r][c] = -1
      }
    }
  }
  var boundCoordinates: [Int: Set<Point>] = [:]
  func bfs(_ point: Point, _ islandNumber: Int) {
    var queue = [point]
    var readIndex = 0

    while queue.count > readIndex {
      let current = queue[readIndex]
      readIndex += 1

      for next in getNextPoints(current) {
        if !(next.row > -1 && next.row < size && next.column > -1 && next.column < size) { continue }
        if lands[next.row][next.column] >= 0 {
          if lands[next.row][next.column] == 0 {
            boundCoordinates[islandNumber]?.insert(current)
          }
          continue
        }
        
        lands[next.row][next.column] = islandNumber
        queue.append(next)
      }
    }
  }
  
  var islandCnt = 0
  for r in 0..<size {
    for c in 0..<size {
      if lands[r][c] == -1 {
        islandCnt += 1
        lands[r][c] = islandCnt
        boundCoordinates.updateValue([], forKey: islandCnt)
        bfs(Point(row: r, column: c), islandCnt)
      }
    }
  }

  var passComparision: Set<String> = []
  // shortestPath를 100으로 두어서 계속 실패함
  // 0,0 에서 99, 99까지 길이는 100이 아니라 197
  var shortestPath = 197
  for lhs in boundCoordinates.keys {
    for rhs in boundCoordinates.keys {
      if lhs == rhs { continue }
      if passComparision.contains("\(rhs)-\(lhs)") || passComparision.contains("\(lhs)-\(rhs)") {
        continue
      }
      for lPoint in boundCoordinates[lhs]! {
        for rPoint in boundCoordinates[rhs]! {
          shortestPath = min(lPoint - rPoint, shortestPath)
        }
      }
      passComparision.insert("\(rhs)-\(lhs)")
      passComparision.insert("\(lhs)-\(rhs)")
      if shortestPath == 1 { break }
    }
  }
    
  print(shortestPath)
}
