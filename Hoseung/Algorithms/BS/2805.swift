/*
BS 나무자르기 2805.swift
Created by hoseung Lee on 2021/11/04.
https://www.acmicpc.net/problem/2805
https://github.com/KKP-iOS-Study/Algorithm_Study
KKP-iOS-Study : Algorithm Study
*/

import Foundation

func boj2805() {
  var bytes: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0

  func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return bytes.withUnsafeBufferPointer { $0[byteIdx] }
  }

  func readInt() -> Int {
    var number = 0, byte = readByte(), isNegative = false
    while byte == 10 || byte == 32 { byte = readByte() }
    if byte == 45 { byte = readByte(); isNegative = true }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number * (isNegative ? -1 : 1)
  }

  let (n, m) = (readInt(), readInt())

  var trees: [Int] = .init(repeating: 0, count: n)

  var maxHeight = 0
  for i in 0..<n {
    trees[i] = readInt()
    maxHeight = max(maxHeight, trees[i])
  }

  var lbound = 0
  var rbound = maxHeight

  maxHeight = 0
  while rbound >= lbound {
    let mid = (lbound + rbound) / 2

    let cuttedLengthSum = trees.reduce(0) {
      if $1 - mid > 0 {
        return $0 + $1 - mid
      } else {
        return $0
      }
    }

    if cuttedLengthSum >= m {
      maxHeight = max(maxHeight, mid)
      lbound = mid + 1
    } else {
      rbound = mid - 1
    }
  }

  print(maxHeight)
}



