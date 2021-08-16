//
//  main.swift
//  Greedy
//
//  Created by 강호성 on 2021/08/16.
//

// k를 만드는데 필요한 동전 개수 n의 최솟값

let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
var n = nk[0]
var k = nk[1] // 4200

var coins = [Int]()
var cnt = 0

for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}

for i in coins.reversed() {
    
    // i가 1000원일 때, 4200을 맞출려면 4개가 필요
    let value = k / i
    
    if i > k { continue } else {
        cnt += value
        k -= value * i
    }
    
    if k == 0 { break }
}

print(cnt)
