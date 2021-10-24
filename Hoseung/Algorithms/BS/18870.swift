/*
BS BOJ 좌표 압축 18870.swift
Created by: hoseung Lee on 2021/10/24
https://www.acmicpc.net/problem/18870
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study
*/


fileprivate func binarySearch(_ array: [Int], _ target: Int, _ lbound: Int, _ rbound: Int) -> Int {
  let midIndex = (lbound + rbound) / 2
  
  guard lbound < rbound else { return midIndex }
  
  let currentNumber = array[midIndex]
  
  if currentNumber == target {
    return midIndex
  } else if currentNumber > target {
    return binarySearch(array, target, lbound, midIndex - 1)
  } else {
    return binarySearch(array, target, midIndex + 1, rbound)
  }
}

func boj18870() {

  var uniques: Set<Int> = []
  
  func convertSet(_ subString: Substring) -> Int {
    let convert = Int(String(subString))!
    uniques.insert(convert)
    return convert
  }
  
  let _ = Int(readLine()!)!
  
  let inputPoints = readLine()!.split(separator: " ").map(convertSet(_:))
  
  let reference: [Int] = uniques.sorted()
  
  
  var output: String = ""
  
  for point in inputPoints {
    output.write("\(binarySearch(reference, point, 0, reference.count - 1)) ")
  }
  
  print(output)
  
}

