//
//  main.swift
//  Greedy2_BOJ
//
//  Created by 강호성 on 2021/11/30.
//

let N = Int(readLine()!)!
let distance = readLine()!.split(separator: " ").map{Int(String($0))!}
let price = readLine()!.split(separator: " ").map{Int(String($0))!}

// 첫번째 도시 -> 두번째 도시는 기름을 채워야하므로 처음값으로 지정
var sumPrice = price[0] * distance[0]

// 기름값의 최소만 고려 -> 최솟값을 갱신
var minPrice = price[0]

for i in 1..<price.count-1 {
    
    // 최소기름값을 갱신해주면서 최솟값일때 남은 거리만큼 sumPrice에 더해준다
    if price[i] < minPrice {
        minPrice = price[i]
    }
    sumPrice += minPrice * distance[i]
}
print(sumPrice)
