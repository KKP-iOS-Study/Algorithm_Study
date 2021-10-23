/*
BOJ BFS 불 5427.swift
Created by hoseung Lee on 2021/10/20.

https://www.acmicpc.net/problem/5427

https://github.com/KKP-iOS-Study/Algorithm_Study
KKP-iOS-Study : Algorithm Study


*/

fileprivate enum Category {
  case fire, user, bound
}

fileprivate struct Point: Hashable {
  var row: Int
  var col: Int
  var category: Category
  var currentDistance: Int = 1
}

func boj5427() {
  
  func getNextPoint(_ point: Point) -> [Point] {
    [
      Point(row: point.row + 1, col: point.col, category: point.category),
      Point(row: point.row - 1, col: point.col, category: point.category),
      Point(row: point.row, col: point.col + 1, category: point.category),
      Point(row: point.row, col: point.col - 1, category: point.category),
    ]
  }
  
  func filedMaze(_ element: String.Element) -> Int {
    switch element {
    case "#":
      return -3
    case "*":
      return -2
    case ".":
      return 0
    default:
      return 1
    }
  }
  
  let testCase = Int(readLine()!)!
  
  for _ in 1...testCase {
    let wh = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (w, h) = (wh[0], wh[1])
    
    var maze: [[Int]] = .init(repeating: .init(repeating: 0, count: w), count: h)

    var fireQueue: [Point] = []
    var userQueue: [Point] = []
    var bounds: Set<Point> = []
    
    for row in 0..<h {
      for (col, mark) in readLine()!.map(filedMaze(_:)).enumerated() {
        maze[row][col] = mark
        if mark == -2 {
          fireQueue.append(Point(row: row, col: col, category: .fire))
        } else if mark == 1 {
          userQueue.append(Point(row: row, col: col, category: .user))
        }
        
        if row == 0 || col == 0 || row == h - 1 || col == w - 1 {
          bounds.insert(Point(row: row, col: col, category: .bound))
        }
      }
    }
    
    var queue = fireQueue + userQueue
    var readIndex = 0
    while queue.count > readIndex {
      let current = queue[readIndex]
      readIndex += 1
      for next in getNextPoint(current) {
        
        if !(next.row > -1 && next.row < h
             && next.col > -1 && next.col < w) { continue}
          
        if next.category == .fire {
          if maze[current.row][current.col] == -2 && maze[next.row][next.col] == 0 {
            queue.append(next)
            maze[next.row][next.col] = -2
            
          } else if maze[current.row][current.col] == -2 && maze[next.row][next.col] >= 1
                      && next.row != h - 1 && next.row != 0
                      && next.col != w - 1 && next.col != 0 {
            queue.append(next)
            maze[next.row][next.col] = -1
          }
        } else if next.category == .user {
          if maze[next.row][next.col] == 0 {
            let userNextPoint = Point(row: next.row, col: next.col, category: .user, currentDistance: current.currentDistance + 1)
            queue.append(userNextPoint)
            maze[next.row][next.col] = userNextPoint.currentDistance
          }
        }
         
      }
    }
 
    //shortestPath 초기값을 100x100으로 줬는데 w와 h사이즈를 100x100이라고 착각함, 문제를 똑바로 읽자.
    var shortestPath = 1011*1011
    
    for check in bounds {
      if maze[check.row][check.col] > 0 {
        shortestPath = min(maze[check.row][check.col], shortestPath)
        
      }
    }
    print(shortestPath == 1011*1011 ? "IMPOSSIBLE" : shortestPath)
  }
}
