//
/*
BFS_BOJ 영역 구하기 2583.swift
Created by: hoseung Lee on 2021/10/10
https://www.acmicpc.net/problem/2583
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

func boj2583() {
  func getNextPoints(_ points: (r: Int, c: Int)) -> [(r: Int, c: Int)] {
    [
      (points.r + 1, points.c),
      (points.r - 1, points.c),
      (points.r, points.c + 1),
      (points.r, points.c - 1)
    ]
  }
  
  let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
  let (rBound, cBound, k) = (inputs[0], inputs[1], inputs[2])
  
  var board: [[Int]] = .init(repeating: .init(repeating: 0, count: cBound), count: rBound)
  var visited = board
  for _ in 1...k {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (x0, y0, x1, y1) = (line[0], line[1], line[2], line[3])
    
    for m in y0..<y1 {
      for n in x0..<x1 {
        board[m][n] = -1
      }
    }
  }
  
  var boardSizes: [Int] = []
  func bfs(_ points: (r: Int, c: Int)) -> Int {
    var queue: [(r: Int, c: Int)] = [points]
    var readIndex = 0
    var boardSize = 0
    while queue.count > readIndex {
      let current = queue[readIndex]
      readIndex += 1
      
      for next in getNextPoints(current) {
        if !(next.r > -1 && next.r < rBound && next.c > -1 && next.c < cBound) { continue }
        
        if board[next.r][next.c] == -1 || visited[next.r][next.c] == 1 { continue }
        visited[next.r][next.c] = 1
        board[next.r][next.c] = boardSize + 1
        boardSize += 1
        queue.append(next)
      }
    }
    return boardSize == 0 ? 1 : boardSize
  }
  
  for r in 0..<rBound {
    for c in 0..<cBound {
      if board[r][c] == 0 {
        boardSizes.append(bfs((r, c)))
      }
    }
  }
   
  print(boardSizes.count)
  boardSizes.sorted().forEach { size in
    print(size, terminator: " ")
  }
  
}

