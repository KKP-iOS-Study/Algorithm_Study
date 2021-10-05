//
//  main.swift
//  Array_BOJ
//
//  Created by 강호성 on 2021/07/22.
//

// 알파벳의 갯수를 세서 비교

let N = Int(readLine()!)!
let alpa = Array("abcdefghijklmnopqrstuvwxyz")

Array(0..<N).forEach { _ in
    let input = readLine()!.split(separator: " ").map{String($0)}
    
    var zeroArr = [Int](repeating: 0, count: alpa.count) // 빈 배열 & 초기화
    let checkArr = [Int](repeating: 0, count: alpa.count)
    
    for i in input[0] {
        let idx = alpa.firstIndex(of: i)!
        zeroArr[idx] += 1
    }
    
    for j in input[1] {
        let idx = alpa.firstIndex(of: j)!
        zeroArr[idx] -= 1
    }
    
    if zeroArr != checkArr {
        print("Impossible")
    } else { print("Possible") }
}



