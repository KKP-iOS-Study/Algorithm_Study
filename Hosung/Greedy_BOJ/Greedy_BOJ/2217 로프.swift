//
//  main.swift
//  Greedy
//
//  Created by 강호성 on 2021/08/18.
//

let N = Int(readLine()!)!

var arr = [Int]()

for _ in 0..<N {
    let weight = Int(readLine()!)!
    arr.append(weight)
}

// 최대 중량 = min( 병렬 연결된 로프의 중량 ) * 병렬 연결된 로프의 수
var tmp = [Int]()
var ans = [Int]() // 계산된 중량을 담을 배열

for i in arr.sorted(by: >) {
    
    if !tmp.isEmpty {
        tmp.append(i)
        ans.append(tmp.min()! * tmp.count)
    } else {
        tmp.append(i)
        ans.append(i)
    }
}
print(ans.max()!)
