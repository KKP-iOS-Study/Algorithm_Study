/*
 BOJ BFS 적록색약 10026.swift
 Created by hoseung Lee on 2021/10/19.
 
 https://www.acmicpc.net/problem/10026
 https://github.com/KKP-iOS-Study/Algorithm_Study
 
 KKP-iOS-Study : Algorithm Study
 
 
 */

/*
 visited가 문제였음 -> enqueued로 변경
 grid를 색약용, 비색약용으로 같이 선언 한게 문제였음 -> 애초에 grid는 하나만 선언하고 bfs를 돌때는 복사한 별개의 grid를 전달했음, 함수가 스택에서 해제되면서 메모리 삭제
 
 */

fileprivate typealias Point = (r: Int, c: Int)

fileprivate func getNextPoint(_ point: Point) -> [Point] {
  [(point.r + 1, point.c),
   (point.r - 1, point.c),
   (point.r, point.c + 1),
   (point.r, point.c - 1),]
}

func boj10026() {
  let size = Int(readLine()!)!
  
  var inputGrid: [[Int]] = []
  
  func colorPattern(_ element: Character) -> Int {
    switch element {
    case "R":
      return 0
    case "G":
      return 1
    default:
      return 2
    }
  }
  
  for _ in 0..<size {
    let line = readLine()!.compactMap(colorPattern(_:))
    inputGrid.append(line)
  }
  
  func bfs(_ point: Point, pattern: Bool, color: Int, grid: inout [[Int]]) {
    var queue: [Point] = []
    var readIndex = 0
    queue.append(point)
    
    var enqueued: [[Bool]] = .init(repeating: .init(repeating: false, count: size), count: size)
    
    while queue.count > readIndex {
      let current = queue[readIndex]
      readIndex += 1
      enqueued[current.r][current.c] = true
      grid[current.r][current.c] = -1
            
      for next in getNextPoint(current) {
        if !(next.0 > -1 && next.0 < size
             && next.1 > -1 && next.1 < size) { continue }
        
        if enqueued[next.0][next.1] { continue }
        
        if pattern {
          if (grid[next.0][next.1] == 1 && color == 0) || (grid[next.0][next.1] == color) || (grid[next.0][next.1] == 0 && color == 1){
            enqueued[next.0][next.1] = true
            queue.append(next)
          }
        } else {
          if grid[next.0][next.1] == color {
            enqueued[next.0][next.1] = true
            queue.append(next)
          }
        }
      }
    }
  }
  
  func treversal(_ inputGrid: [[Int]], pattern: Bool) -> Int {
    var grid = inputGrid
    var patternCount: Int = 0
    for r in 0..<size {
      for c in 0..<size {
        if grid[r][c] != -1 {
          bfs((r, c), pattern: pattern, color: grid[r][c], grid: &grid)
          patternCount += 1
        }
      }
    }
    return patternCount
  }
  
  print(treversal(inputGrid, pattern: false), treversal(inputGrid, pattern: true))
}
