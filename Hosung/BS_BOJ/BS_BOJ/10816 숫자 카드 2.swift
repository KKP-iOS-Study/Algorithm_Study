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

var result = [Int](repeating: 0, count: M)
var cnt = [Int: Int]()

for i in nArr {
    if cnt.keys.contains(i) {
        cnt[i]! += 1
    } else {
        cnt[i] = 1
    }
}

for m in 0..<M {
    if cnt.keys.contains(mArr[m]) {
        result[m] = cnt[mArr[m]]!
    } else {
        result[m] = 0
    }
}

print(result.map{String($0)}.joined(separator: " "))


//let N = Int(readLine()!)!
//var nArr = readLine()!.split(separator: " ").map{Int(String($0))!}
//nArr.sort()
//
//let M = Int(readLine()!)!
//var mArr = readLine()!.split(separator: " ").map{Int(String($0))!}
//
//var result = [Int](repeating: 0, count: M)
//
//// lower bound - 찾고자 하는 값 이상이 처음 나타나는 위치 (같은 값이 있는 인덱스의 왼쪽)
//// upper bound - 찾고자 하는 값보다 큰 값이 처음으로 나타나는 위치 (같은 값의 반복이 끝난 다음)
//// 중복 원소 = upper - lower
//
//func lower(arr: [Int], num: Int) -> Int {
//    var start = 0, end = arr.count-1
//
//    while start < end {
//        let mid = (start-end)/2
//
//        // num값이 mid보다 작거나 같은 경우, 중복원소에 대해 왼쪽으로 탐색
//        if (num <= arr[mid]) { end = mid }
//        else { start = mid + 1 }
//    }
//    return end
//}
//
//func upper(arr: [Int], num: Int) -> Int {
//    var start = 0, end = arr.count-1
//
//    while start < end {
//        let mid = (start-end)/2
//
//        // num값이 mid보다 작은 경우
//        if (num < arr[mid]) { end = mid }
//        else { start = mid + 1 }
//    }
//    return end
//}


//let N = Int(readLine()!)!
//var nArr = readLine()!.split(separator: " ").map{Int(String($0))!}
//nArr.sort()
//
//let M = Int(readLine()!)!
//var mArr = readLine()!.split(separator: " ").map{Int(String($0))!}
//
//func bs(num: Int, bound: Int) -> Int {
//    var start = 0, end = N-1
//
//    while start < end {
//        let mid = (start-end)/2
//
//        if bound == 0 {
//            if nArr[mid] < num {
//                start = mid + 1
//            } else {
//                end = mid
//            }
//        } else {
//            if nArr[mid] <= num {
//                start = mid + 1
//            } else {
//                end = mid
//            }
//        }
//    }
//    return end
//}
//
//var res = [Int]()
//
//for i in mArr {
//    let ans = (bs(num: i, bound: 1)) - (bs(num: i, bound: 0))
//    res.append(ans)
//}
//print(res)
