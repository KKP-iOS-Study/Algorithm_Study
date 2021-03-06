//
//  main.swift
//  Linked list_BOJ
//
//  Created by 강호성 on 2021/07/29.
//

let nk = readLine()!.split(separator: " ").map{Int($0)!}
var N = nk[0]
var K = nk[1]

var nArr = Array(1...N)
var ans = ""

// K씩 끊기는 idx를 ans에 추가하고(","도 추가), 제거
while !nArr.isEmpty {
    
    // 1~7에서 3, 6이 빠지면 끝번호 7부터 앞으로 세야한다. → ex) 7, 1, 2해서 2제거
    if K > nArr.count {
        K = K - nArr.count
        continue
    }
    
    let tmp = nArr.remove(at: K-1)
    ans += String(tmp) + (nArr.count != 0 ? ", " : "")
    
    // k값에 k-1을 해줌으로써, 제거된 후에도 k의 값 유지
    K += nk[1] - 1
}
print("<" + ans + ">")

