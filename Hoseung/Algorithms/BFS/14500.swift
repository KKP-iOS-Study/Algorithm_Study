//
//  14500.swift
//  Algorithms
//
//  Created by hoseung Lee on 2022/01/12.
//

import Foundation
typealias Point = (r: Int, c: Int)

func generalNext(_ current: Point) -> [Point] {
  let (r, c) = current
  return  [
    (r - 1, c),
    (r, c - 1),
    (r + 1, c),
    (r, c + 1)
  ]
}

func typeTNext(_ current: Point) -> [[Point]] {
  let (r, c) = current
  return [
    [(r,c), (r,c + 1), (r, c + 2), (r + 1, c + 1)],
    [(r,c), (r + 1,c), (r + 2, c), (r + 1, c + 1)],
    [(r,c), (r,c + 1), (r, c + 2), (r - 1, c + 1)],
    [(r,c), (r,c + 1), (r - 1, c + 1), (r + 1, c + 1)]
  ]
}


func boj14500() {
  let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
  let (n, m) = (nm[0], nm[1])
  
  var board: [[Int]] = []
  var visited: [[Bool]] = .init(repeating: .init(repeating: false, count: m), count: n)
  var answer = 0
  
  for _ in 1...n {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.append(line)
  }
  
  func dfs(_ size: Int, _ sum: Int, _ point: Point) {
    if size == 4 {
      answer = max(answer, sum)
      return
    }
    
    for next in generalNext(point) {
      let (nr, nc) = (next.r, next.c)
      guard 0 <= nr && nr < n && 0 <= nc && nc < m else { continue }
      
      if !visited[nr][nc] {
        visited[nr][nc] = true
        dfs(size + 1, sum + board[nr][nc], next)
        visited[nr][nc] = false
      }
    }
  }
  
  func typeTDfs(_ point: Point) {
    for spin in typeTNext(point) {
      var sum = 0
      var done = true
      for (nr, nc) in spin {
        guard 0 <= nr && nr < n && 0 <= nc && nc < m else {
          done = false
          break
        }
        sum += board[nr][nc]
      }
      if done {
        answer = max(answer, sum)
      }
    }
  }
  
  for r in 0..<n {
    for c in 0..<m {
      visited[r][c] = true
      dfs(0, 0, (r, c))
      visited[r][c] = false
      typeTDfs((r, c))
    }
  }
  print(answer)
}
