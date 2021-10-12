//
/*
BFS_BOJ 단지번호붙이기 2667.swift
Created by: hoseung Lee on 2021/10/11
https://www.acmicpc.net/problem/2667
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

func boj2667() {
  func getNextPoints(_ point: (r: Int, c: Int)) -> [(r: Int, c: Int)] {
    [
      (point.r + 1, point.c),
      (point.r - 1, point.c),
      (point.r, point.c + 1),
      (point.r, point.c - 1)
    ]
  }
  
  let size = Int(readLine()!)!
  var mapBoard: [[Int]] = .init(repeating: .init(repeating: 0, count: size), count: size)
  for r in 0..<size {
    let line = readLine()!.map{Int(String($0))!}
    for c in 0..<line.count {
      if line[c] == 1 {
        mapBoard[r][c] = -1
      }
    }
  }

  var sizes: [Int] = []
  func bfs(_ point: (r: Int, c: Int)) {
    var pieceSize = 1
    var queue: [(r: Int, c: Int)] = [point]
    var readIndex = 0
    while queue.count > readIndex {
      let current = queue[readIndex]
      readIndex += 1
      
      for next in getNextPoints(current) {
        if !(next.r > -1 && next.r < size && next.c > -1 && next.c < size) { continue }
        if mapBoard[next.r][next.c] >= 0 { continue }
        
        mapBoard[next.r][next.c] = pieceSize + 1
        pieceSize = mapBoard[next.r][next.c]
        queue.append(next)
      }
    }
    sizes.append(pieceSize)
  }
  
  for r in 0..<size {
    for c in 0..<size {
      if mapBoard[r][c] == -1 {
        mapBoard[r][c] = 1
        bfs((r, c))
      }
    }
  }
  
  
  print(sizes.count)
  sizes.sorted().forEach { size in
    print(size)
  }
}
