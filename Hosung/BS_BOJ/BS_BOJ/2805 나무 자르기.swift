//
//  main.swift
//  BS_BOJ
//
//  Created by 강호성 on 2021/11/02.
//

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
var height = readLine()!.split(separator: " ").map{Int(String($0))!}
height.sort()

var min = 1, max = height.max()!

while min < max {
    let mid = (max+min)/2
    var sum = 0
    
    // 나무 자른 길이 = 나무높이 - mid(자르는 위치)
    for h in height {
        if (h - mid) > 0 { // 음수 X
            sum += (h - mid)
        }
    }

    if sum < NM[1] {
        max = mid
    } else {
        min = mid + 1
    }
}
print(min-1)
