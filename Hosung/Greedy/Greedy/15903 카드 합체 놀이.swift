//
//  main.swift
//  Greedy
//
//  Created by 강호성 on 2021/08/23.
//


let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
var n = nm[0] // 카드의 개수
var m = nm[1] // 합체를 몇번하는지

var card = readLine()!.split(separator: " ").map{ Int(String($0))! }

for _ in 0..<m {
    card.sort()

    let change = card[0] + card[1]
    card[0] = change
    card[1] = change
}
print(card.reduce(0, +))
