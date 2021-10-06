//
/*
BFS_BOJ 미로탐색 2178.swift
Created by: hoseung Lee on 2021/10/05

https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

func boj2178() {
  
  let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
  let yBound = nm[0]
  let xBound = nm[1]
  
  var maze: [[Int]] = []

  for _ in 1...nm[0] {
    let line = readLine()!.map{Int(String($0))!}
    maze.append(line)
  }

  func getNextPoint(x: Int, y: Int) -> [(x: Int, y: Int)] {
    return [
      (x - 1, y),
      (x + 1, y),
      (x, y - 1),
      (x, y + 1)
    ]
  }
  
  var queue: [(x: Int, y: Int)] = [(0, 0)]
  var qIdx = 0
  
  while queue.count > qIdx {
    let dequeue = queue[qIdx]
    qIdx += 1
    
    for next in getNextPoint(x: dequeue.x, y: dequeue.y) {
      if !(next.x > -1 && next.x < xBound && next.y > -1 && next.y < yBound) {
        continue
      }
      
      if maze[next.y][next.x] == 0 {
        continue
      }
      
      if maze[next.y][next.x] == 1 {
        maze[next.y][next.x] = maze[dequeue.y][dequeue.x] + 1
        queue.append(next)
      }
    }
  }
  print(maze[yBound - 1][xBound - 1])
}
