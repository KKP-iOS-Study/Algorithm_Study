//
//  main.swift
//  BS_BOJ
//
//  Created by 강호성 on 2021/11/01.
//

let MN = readLine()!.split(separator: " ").map{Int(String($0))!}
var len = readLine()!.split(separator: " ").map{Int(String($0))!}
len.sort()

var min = 1, max = len.max()!+1

while min < max {
    let mid = (max+min)/2
    var cnt = 0
    
    for i in 0..<len.count {
        cnt += (len[i]/mid)
    }
        
    if cnt < MN[0] {
        max = mid
    } else {
        min = mid + 1
    }
}

print(min-1)
