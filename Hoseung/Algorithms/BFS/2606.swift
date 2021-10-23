//
/*
BFS_BOJ 바이러스 2606.swift
Created by: hoseung Lee on 2021/10/16
https://www.acmicpc.net/problem/2606
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

//dfs
func boj2606dfs() {
  let computerCount = Int(readLine()!)!
  let edgeCount = Int(readLine()!)!
  
  var network: [[Int]] = .init(repeating: [], count: computerCount)
  
  for _ in 1...edgeCount {
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    network[inputs[0]-1].append(inputs[1]-1)
    network[inputs[1]-1].append(inputs[0]-1)
  }
  
  var visited: Set<Int> = []
  
  func dfs(_ n: Int) {
    visited.insert(n)
    
    for edge in network[n] {
      if !visited.contains(edge) {
        dfs(edge)
      }
    }
  }
  
  dfs(0)
  print(visited.count - 1)
}

//bfs
func boj2606bfs() {
  let computerCount = Int(readLine()!)!
  let edgeCount = Int(readLine()!)!
  
  var network: [[Int]] = .init(repeating: [], count: computerCount)
  
  for _ in 1...edgeCount {
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    network[inputs[0]-1].append(inputs[1]-1)
    network[inputs[1]-1].append(inputs[0]-1)
  }
  
  var queue: [Int] = .init(repeating: 0, count: computerCount)
  var readIndex = 0
  queue[0] = 0
  var writeIndex = 1
  var visited: Set<Int> = []
  visited.insert(0)
  
  while writeIndex > readIndex {
    let current = queue[readIndex]
    readIndex += 1
    
    for node in network[current] {
      if visited.contains(node) { continue }
      visited.insert(node)
      queue[writeIndex] = node
      writeIndex += 1
    }
    
  }
  print(visited.count - 1)
}
