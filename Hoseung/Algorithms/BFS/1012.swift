//
/*
BFS_BOJ 유기농 배추 1012.swift
Created by: hoseung Lee on 2021/10/08

https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

func boj1012() {
  let testCase = Int(readLine()!)!
  for _ in 1...testCase {
    let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
    var graph: [[Int]] = .init(repeating: .init(repeating: 0, count: inputs[0]), count: inputs[1])

    for _ in 1...inputs[2] {
      let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
      let (x, y) = (xy[0], xy[1])
      graph[y][x] = 1
    }

    func dfs(_ graph: inout [[Int]], _ x: Int, _ y: Int) -> Bool {
      guard x > -1 && x < inputs[0] && y > -1 && y < inputs[1] else { return false }
      if graph[y][x] == 1 {
        graph[y][x] = 0
        let _ = dfs(&graph, x - 1, y)
        let _ = dfs(&graph, x, y - 1)
        let _ = dfs(&graph, x + 1, y)
        let _ = dfs(&graph, x, y + 1)
        return true
      }
      return false
    }


    var worm = 0
    for (r, y) in graph.enumerated() {
      for (c, _) in y.enumerated() {
        worm += dfs(&graph, c, r) ? 1 : 0
      }
    }

    print(worm)
  }
}
