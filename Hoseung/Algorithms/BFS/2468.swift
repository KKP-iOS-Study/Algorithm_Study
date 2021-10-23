//
/*
BFS_BOJ 안전 영역 2468.swift
Created by: hoseung Lee on 2021/10/11
https://www.acmicpc.net/problem/2468
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

func boj2468() {
  typealias point = (r: Int, c: Int)
  func getNextPoints(_ point: point) -> [point] {
    [
      (point.r + 1, point.c),
      (point.r - 1, point.c),
      (point.r, point.c + 1),
      (point.r, point.c - 1),
    ]
  }
  
  var highestArea = -1
  var lowestArea = 101
  
  func boundSearch(_ area: Substring) -> Int? {
    guard let area = Int(String(area)) else { return nil }
    highestArea = max(highestArea, area)
    lowestArea = min(lowestArea, area)
    
    return area
  }
  
  
  let size = Int(readLine()!)!
  var area: [[Int]] = []
  
  for _ in 1...size {
    let line = readLine()!.split(separator: " ").compactMap(boundSearch(_:))
    area.append(line)
  }
  
  var visited: [[Bool]] = .init(repeating: .init(repeating: false, count: size), count: size)
  
  func bfs(_ point: point, _ limit: Int) {
    var queue = [point]
    var readIndex = 0
    
    while queue.count > readIndex {
      let current = queue[readIndex]
      readIndex += 1
      
      for next in getNextPoints(current) {
        if !(next.r > -1 && next.r < size && next.c > -1 && next.c < size)
            || visited[next.r][next.c]
            || area[next.r][next.c] <= limit { continue }
        
        visited[next.r][next.c] = true
        queue.append(next)
      }
    }
  }
  var maxSafeArea = 0
  
  for limit in 0..<highestArea {
    var safeArea = 0
    for r in 0..<size {
      for c in 0..<size {
        if area[r][c] > limit && !visited[r][c] {
          visited[r][c] = true
          bfs((r, c), limit)
          safeArea += 1
        }
      }
    }
    if maxSafeArea < safeArea {
      maxSafeArea = safeArea
    }
    visited = .init(repeating: .init(repeating: false, count: size), count: size)
  }
  print(maxSafeArea)
}
