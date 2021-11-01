//
//  main.swift
//  BS_BOJ
//
//  Created by 강호성 on 2021/10/27.
//

let AB = readLine()!.split(separator: " ").map{Int(String($0))!}

var aArr = readLine()!.split(separator: " ").map{Int(String($0))!}
var bArr = readLine()!.split(separator: " ").map{Int(String($0))!}

aArr.sort()
bArr.sort()

func bs(num: Int) -> Bool {
    var start = 0, end = AB[1]-1, mid = (start+end)/2
    
    while start <= end {
        if bArr[mid] == num { return true }
        else if bArr[mid] < num { start = mid + 1}
        else if bArr[mid] > num { end = mid - 1}
        
        mid = (start+end)/2
    }
    return false
}

var ans = [Int]()

for i in aArr { if !bs(num: i) { ans.append(i)} }

if !ans.isEmpty {
    print(ans.count)
    print(ans.map{String($0)}.joined(separator: " "))
} else {
    print(0)
}
