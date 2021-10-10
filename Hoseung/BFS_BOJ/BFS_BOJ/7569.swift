//
/*
BFS_BOJ 토마토 7569.swift
Created by: hoseung Lee on 2021/10/10
https://www.acmicpc.net/problem/7569
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

func getNextPoints(_ points: (m: Int, n: Int, h: Int)) -> [(m: Int, n: Int, h: Int)] {
  [
    (points.m + 1, points.n, points.h),
    (points.m - 1, points.n, points.h),
    (points.m, points.n + 1, points.h),
    (points.m, points.n - 1, points.h),
    (points.m, points.n, points.h + 1),
    (points.m, points.n, points.h - 1),
  ]
}

func boj7569() {
  let coordinate = readLine()!.split(separator: " ").map {Int(String($0))!}
  let mBound = coordinate[0]
  let nBound = coordinate[1]
  let hBound = coordinate[2]
  
  
  var tomatos: [[[Int]]] =
    .init(repeating:
              .init(repeating:
                        .init(repeating: 0, count: mBound), count: nBound), count: hBound)
  
  var queue: [(m: Int, n: Int, h: Int)] = []
  var readIndex = 0
  for h in 0..<hBound {
    for n in 0..<nBound {
      let line = readLine()!.split(separator: " ").map {Int(String($0))!}
      for m in 0..<line.count {
        if line[m] == 1 {
          queue.append((m: m, n: n, h: h))
        }
        if line[m] == 0 {
          tomatos[h][n][m] = -1
        }
      }
    }
  }
  
  
  while queue.count > readIndex {
    let current = queue[readIndex]
    readIndex += 1
    
    for next in getNextPoints(current) {
      if !(next.h > -1 && next.h < hBound
          && next.n > -1 && next.n < nBound
           && next.m > -1 && next.m < mBound) {
        continue
      }
      
      if tomatos[next.h][next.n][next.m] >= 0 { continue }
      
      tomatos[next.h][next.n][next.m] = tomatos[current.h][current.n][current.m] + 1
      queue.append(next)
    }
  }
  
  var time = 0
  
  for h in 0..<hBound {
    for n in 0..<nBound {
      for m in 0..<mBound {
        if tomatos[h][n][m] == -1 {
          print(-1)
          return
        }
        time = max(tomatos[h][n][m], time)
      }
    }
  }
  print(time)
}

