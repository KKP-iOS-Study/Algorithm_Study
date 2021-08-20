//
//  main.swift
//  Greedy
//
//  Created by 강호성 on 2021/08/18.
//

let num = readLine()!

var minus = num.split(separator: "-") // ["55", "50+40"]
var bin = [Int]()

for i in minus {
    let plus = i.split(separator: "+").map{Int($0)!} // [55], [50, 40]
    bin.append(plus.reduce(0, +)) // [55, 90]
}

var ans = bin[0]

for j in 1..<bin.count {
    ans -= bin[j]
}

print(ans)
