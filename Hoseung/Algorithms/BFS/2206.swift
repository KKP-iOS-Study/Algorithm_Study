//
/*
BFS_BOJ 벽 부수고 이동하기 2206.swift
Created by: hoseung Lee on 2021/12/08
https://www.acmicpc.net/problem/2206
https://github.com/KKP-iOS-Study/Algorithm_Study
KKP-iOS-Study : Algorithm Study
*/

func boj2206() {
  struct Point {
    let row: Int
    let col: Int
    var chance: Int
    
    init(_ row: Int, _ col: Int, _ chance: Int) {
      self.row = row
      self.col = col
      self.chance = chance
    }
  }
  func getNextPoints(_ point: Point) -> [Point] {
    let row = point.row
    let col = point.col
    let chance = point.chance
    
    return [
      Point(row + 1, col, chance),
      Point(row - 1, col, chance),
      Point(row, col + 1, chance),
      Point(row, col - 1, chance),
    ]
  }

  let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    
  var graph: [[Int]] = .init(repeating: .init(repeating: -1, count: nm[1]), count: nm[0])
  
  for row in 0..<nm[0] {
    let line = readLine()!.map{Int(String($0))!}
    for (col, element) in line.enumerated() {
      graph[row][col] = element
    }
  }
  
  var distances: [[[Int]]] = .init(repeating: .init(repeating: .init(repeating: -1, count: 2), count: nm[1]), count: nm[0])
  
  func bfs() -> Int {
    distances[0][0][0] = 1
    distances[0][0][1] = 1
    
    var queue: [Point] = [Point(0,0,0)]
    var readIndex = 0
    while queue.count > readIndex {
      let current = queue[readIndex]
      readIndex += 1
      
      if current.row == nm[0] - 1  && current.col == nm[1] - 1 {
        return distances[current.row][current.col][current.chance]
      }
      
      let nextDistance = distances[current.row][current.col][current.chance] + 1
      
      for next in getNextPoints(current) {
        if !(next.row > -1 && next.row < nm[0] && next.col > -1 && next.col < nm[1]) { continue }
        
        if graph[next.row][next.col] == 0 && distances[next.row][next.col][current.chance] == -1 {
          distances[next.row][next.col][current.chance] = nextDistance
          queue.append(Point(next.row, next.col, current.chance))
        }
        
        if current.chance == 0 && graph[next.row][next.col] == 1 && distances[next.row][next.col][1] == -1 {
          distances[next.row][next.col][1] = nextDistance
          queue.append(Point(next.row, next.col, 1))
        }
      }
    }
    return -1
  }
    
  print(bfs())
}

//boj2206()

/*
8 8
01000100
01010100
01010100
01010100
01010100
01010100
01010100
00010100
 
5 10
0000011000
1101011010
0000000010
1111111110
1111000000
 
13 13
0100011011000
0001001010000
0000100001000
1100010101011
1111101111000
1011010001001
0100001001001
0100111010001
0101010000100
0001110100000
0000001000100
1010001000111
1001000100000
 
*/


//graph.forEach { line in
//  print(line)
//}
//
//queue.forEach { line in
//  print(line)
//}
