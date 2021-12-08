
/*
BruteForce 리모컨 1107.swift
Created by hoseung Lee on 2021/12/08.
https://www.acmicpc.net/problem/1107
https://github.com/KKP-iOS-Study/Algorithm_Study
KKP-iOS-Study : Algorithm Study
*/

func boj1107() {
  let targetChannel = readLine()!
  let exceptionCnt = Int(readLine()!)!

  var exceptions: Set<String> = []
  if exceptionCnt > 0 {
    exceptions = .init(readLine()!.split(separator: " ").map{$0.description})
  }

  var bestPath = abs(Int(targetChannel)! - 100)
  getWholeNumber(channel: "")
  print(bestPath)


  func getWholeNumber(channel: String) {
    if channel.count >= 6 { return }
    
    for i in 0..<10 {
      if exceptions.contains(i.description) {
        continue
      } else {
        let intTargetChannel = Int(targetChannel)!
        let testNumber = Int(channel + i.description)!
        let tapCntToRemote = abs(intTargetChannel - testNumber) + channel.count + 1
        bestPath = min(bestPath, tapCntToRemote)
        getWholeNumber(channel: channel + i.description)
      }
    }
    
  }

}
