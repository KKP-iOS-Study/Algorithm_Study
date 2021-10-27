//
//  main.swift
//  BS_BOJ
//
//  Created by 강호성 on 2021/10/27.
//

// 해당 좌표의 값을 그 값보다 작은 좌표값들의 개수로 대체
// nArr.sort() -> [-10, -9, 2, 4, 4]
//         압축 ->    0   1  2  3  3
//
// nArr = [2, 4, -10, 4, -9]
//  출력 -> 2  3   0   3   1

let N = Int(readLine()!)!
var nArr = readLine()!.split(separator: " ").map{Int(String($0))!}

var dic = [Int: Int]()
var idx = 0

// nArr를 정렬해서 순서를 딕셔너리에 담고
for i in nArr.sorted() {
    if dic[i] == nil {
        dic[i] = idx
        idx += 1
    }
}

var ans = ""

// 입력받은 nArr의 순서대로 값 빼내기
for i in nArr {
    ans += String(dic[i]!) + " "
}

print(ans)

