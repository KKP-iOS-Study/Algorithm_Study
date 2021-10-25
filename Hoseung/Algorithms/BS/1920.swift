/*
BS BOJ 수 찾기 1920.swift
Created by: hoseung Lee on 2021/10/22
https://www.acmicpc.net/problem/10844
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study
*/
func boj1920() {
  let _ = readLine()
  var references: Set<Int> = []
  let _ = readLine()!.split(separator: " ").map(fillInA(_:))
  let _ = readLine()
  var resultPrint = ""
  let _ = readLine()!.split(separator: " ").map(searchNumber(_:))
  
  func fillInA(_ input: Substring) -> Int {
    let convert = Int(String(input))!
    references.insert(convert)
    return convert
  }

  func searchNumber(_ input: Substring) -> Int {
    let convert = Int(String(input))!
    resultPrint += references.contains(convert) ? "1\n" : "0\n"
    return convert
  }
  print(resultPrint)
}
