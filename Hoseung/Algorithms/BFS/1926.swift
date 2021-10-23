//
/*
BFS_BOJ 그림 1926.swift
Created by: hoseung Lee on 2021/10/05

https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

func boj1926Solve() {
  let nm = readLine()!.split(separator: " ").map {Int(String($0))!}
  let (n, m) = (nm[0], nm[1])

  var whitePaper: [[Int]] = []
  var visited: [[Bool]] = .init(repeating: .init(repeating: false, count: m), count: n)

  func getNextPoints(_ x: Int, _ y: Int) -> [(x: Int, y: Int)] {
    return [
      (x - 1, y),
      (x + 1, y),
      (x, y - 1),
      (x, y + 1)
    ]
  }

  for _ in 1...n {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    whitePaper.append(line)
  }

  var size = 0
  var maxSize = 0
  var picturesCnt = 0

  func bfs(x: Int, y: Int) {
    visited[y][x] = true
    var queue: [(x: Int, y: Int)] = [(x, y)]
    var queueIndex = 0
    size = 1
    while queue.count > queueIndex {
      let current = queue[queueIndex]
      queueIndex += 1
      for next in getNextPoints(current.x, current.y) {
        if next.x > -1 && next.x < m && next.y > -1 && next.y < n && !visited[next.y][next.x] && whitePaper[next.y][next.x] == 1 {
          queue.append(next)
          visited[next.y][next.x] = true
          size += 1
        }
      }
      maxSize = maxSize < size ? size : maxSize
    }
  }


  for y in 0..<n {
    for x in 0..<m {
      if whitePaper[y][x] == 1 && !visited[y][x] {
        bfs(x: x, y: y)
        picturesCnt += 1
      }
    }
  }
  print("\(picturesCnt)\n\(maxSize)")
}








