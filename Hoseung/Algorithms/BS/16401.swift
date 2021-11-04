/*
BS 과자 나눠주기 16401.swift
Created by hoseung Lee on 2021/11/04.
https://www.acmicpc.net/problem/16401
https://github.com/KKP-iOS-Study/Algorithm_Study
KKP-iOS-Study : Algorithm Study
*/

func boj16401() {
  let mn = readLine()!.split(separator: " ").map{Int(String($0))!}
  
  var maxSnack = 0
  
  func maxSnackSearch(_ subString: Substring) -> Int {
    let convert = Int(String(subString))!
    
    maxSnack = max(maxSnack, convert)
    
    return convert
  }
  let snacks = readLine()!.split(separator: " ").map(maxSnackSearch(_:)).sorted(by: >)
  
  var maxLength = 0
  
  var lbound = 0
  var rbound = maxSnack
  
  while rbound >= lbound {
    let mid = (lbound + rbound) / 2
    
    var validate = 0
    
    for snack in snacks.indices where mid > 0 && snacks[snack] / mid > 0 {
      validate += snacks[snack] / mid
    }
    
    if validate >= mn[0] {
      maxLength = max(maxLength, mid)
      lbound = mid + 1
    } else {
      rbound = mid - 1
    }
  }
  print(maxLength)
}
