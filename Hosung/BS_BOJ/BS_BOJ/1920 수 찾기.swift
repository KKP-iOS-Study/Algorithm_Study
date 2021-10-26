//
//  main.swift
//  BS_BOJ
//
//  Created by 강호성 on 2021/10/26.
//

let N = Int(readLine()!)!
var nArr = readLine()!.split(separator: " ").map{Int(String($0))!}
nArr.sort()

let M = Int(readLine()!)!
var mArr = readLine()!.split(separator: " ").map{Int(String($0))!}

func bs(arr: [Int], num: Int) -> Int {
    var start = 0, end = N-1, mid = (start+end)/2

    while start <= end {
        if nArr[mid] == num { return 1 }
        else if nArr[mid] > num { end = mid - 1 }
        else if nArr[mid] < num { start = mid + 1 }
        
        mid = (start+end)/2
    }
    return 0
}

for m in mArr {
    print(bs(arr: nArr, num: m))
}

