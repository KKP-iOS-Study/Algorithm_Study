//
//  main.swift
//  Greedy
//
//  Created by 강호성 on 2021/08/16.
//

let N = Int(readLine()!)!

var arr = [[Int]]()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    arr.append(input)
}
//print("before \(arr)")


// 종료시간이 짧은 것, 같은 경우는 시작시간이 빠른 것부터
arr.sort {
    if $0[1] == $1[1] {
        return $0[0] < $1[0]
    } else {
        return $0[1] < $1[1]
    }
}
//print("after \(arr)")


// 처음 종료시간과 다음 시작시간을 비교하여 갯수 파악

var cnt = 1 // 처음값 포함
var first = arr[0]

for i in 1..<N {
    if first[1] <= arr[i][0] {
        cnt += 1
        first = arr[i]
    }
}

print(cnt)
