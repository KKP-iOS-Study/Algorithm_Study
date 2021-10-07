//
/*
BFS_BOJ 토마토 7576.swift
Created by: hoseung Lee on 2021/10/07

https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

func getNextPoints(_ r: Int, _ c: Int) -> [(r: Int, c: Int)] {
  return [
    (r + 1, c),
    (r - 1, c),
    (r, c + 1),
    (r, c - 1)
  ]
}

func boj7576() {
  let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
  let cBound = nm[0]
  let rBound = nm[1]
  
  var tomatos: [[Int]] = .init(repeating: .init(repeating: 0, count: cBound), count: rBound)
  
  var queue: [(r: Int, c: Int)] = []
  
  var readIndex = 0
  
  for r in 0..<rBound {
    let line = readLine()!.split(separator: " ").map {Int(String($0))!}
    for c in 0..<line.count {
      if line[c] == 1 {
        queue.append((r, c))
      }
      
      if line[c] == 0 {
        tomatos[r][c] = -1
      }
    }
  }
  
  while queue.count > readIndex {
    let current = queue[readIndex]
    readIndex += 1
    
    for next in getNextPoints(current.r, current.c) {
      if !(next.r > -1 && next.r < rBound && next.c > -1 && next.c < cBound) { continue }
      
      if tomatos[next.r][next.c] >= 0 { continue }
      
      tomatos[next.r][next.c] = tomatos[current.r][current.c] + 1
      queue.append(next)
      
    }
  }
  
  var time = 0
  
  for r in 0..<rBound {
    for c in 0..<cBound {
      if tomatos[r][c] == -1 {
        print(-1)
        return
      }
      time = max(time, tomatos[r][c])
    }
  }
  
  print(time)
  
}
