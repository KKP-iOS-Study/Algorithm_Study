//
/*
BFS_BOJ 불 4179.swift
https://www.acmicpc.net/problem/7576

Created by: hoseung Lee on 2021/10/08

https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

private func getNextPoints(_ points: (r: Int, c: Int)) -> [(r: Int, c: Int)] {
  [
    (points.r + 1, points.c),
    (points.r - 1, points.c),
    (points.r, points.c + 1),
    (points.r, points.c - 1)
  ]
}


func boj4179() {
  let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
  let rBound = rc[0]
  let cBound = rc[1]
  
  var maze: [[Int]] = .init(repeating: .init(repeating: 0, count: cBound), count: rBound)
  
  var fireQueue: [(r: Int, c: Int)] = []
  var jhQueue: [(r: Int, c: Int)] = []
  var readIndex = 0
  for r in 0..<rBound {
    let line = readLine()!.map{String($0)}
    for c in 0..<line.count {
      if line[c] == "#" {
         maze[r][c] = -3
      }
      if line[c] == "F" {
        maze[r][c] = -2
        fireQueue.append((r, c))
      }
      if line[c] == "J" {
        maze[r][c] = 1
        jhQueue.append((r, c))
      }
    }
  }
  
  var queue = fireQueue + jhQueue
  
  while queue.count > readIndex {
    let current = queue[readIndex]
    readIndex += 1
    for next in getNextPoints(current) {
      if !(next.r > -1 && next.r < rBound && next.c > -1 && next.c < cBound) { continue }
      
      if maze[next.r][next.c] == -3 || maze[next.r][next.c] >= 2 { continue }
      
      if maze[current.r][current.c] == -2 && maze[next.r][next.c] == 0 {
        maze[next.r][next.c] = -2
        queue.append(next)
      } else if maze[current.r][current.c] >= 1 && maze[next.r][next.c] == 0 {
        maze[next.r][next.c] = maze[current.r][current.c] + 1
        queue.append(next)
      }
    }
  }
  
  var time = 1001
  
  for r in 0..<rBound {
    for c in 0..<cBound {
      if (r == rBound - 1
          || r == 0
          || c == cBound - 1
          || c == 0)
          && maze[r][c] >= 1 {
        time = min(time, maze[r][c])
      }
    }
  }
  
  print(time < 1001 ? time : "IMPOSSIBLE")
  
}
