/*
BS 차집합 1822.swift
Created by: hoseung Lee on 2021/11/04
https://www.acmicpc.net/problem/1654
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study
*/

//import Foundation
//func boj1822() {
//  let _ = readLine()!.split(separator: " ").map{Int(String($0))!}
//  var setA: Set<Int> = .init(readLine()!.split(separator: " ").map{Int(String($0))!})
//  let setB: Set<Int> = .init(readLine()!.split(separator: " ").map{Int(String($0))!})
//  setA.subtract(setB)
//  
//  print(setA.count)
//  let result = setA.sorted()
//  var resultString = ""
//  result.forEach { int in
//    resultString.write("\(int) ")
//  }
//  print(resultString)
//}


/*
 시간 초과
 func boj1822() {
   
   let _ = readLine()!
   
   var aSet = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
   
   func searchB(_ subString: Substring) -> Int {
     let number = Int(String(subString))!
     
     var lbound = 0
     var rbound = aSet.count
     
     while lbound <= rbound {
       let mid = (lbound + rbound) / 2
       if mid >= aSet.count { return number }
       let target = aSet[mid]
       if target == number {
         aSet.remove(at: mid)
         return number
       } else if target < number {
         lbound = mid + 1
       } else {
         rbound = mid - 1
       }
     }
       return number
   }
   
   let _ = readLine()!.split(separator: " ").map(searchB(_:))
   
   var result = ""
   aSet.forEach { int in
     result.write("\(int) ")
   }
   
   
   print(aSet.count)
   if aSet.count > 0 {
     print(result)
   }
 }
 
 
 
 */
