//
//  main.swift
//  BS_BOJ
//
//  Created by 강호성 on 2021/11/03.
//

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}

// 배열에서 두개의 인덱스를 합친 값이 0에 가까운 두개의 인덱스를 오름차순으로 반환

var lef = 0, rig = N-1

//var result = 2000000000 // -1,000,000,000 이상 1,000,000,000 이하 -> 최대 절댓값 합
var result = Int.max // 이값이 더 시간 단축

var tmp_lef = lef, tmp_rig = rig // result값에 따른 lef, rig 저장

while lef < rig {

    let sum = arr[lef] + arr[rig]

    if result > abs(sum) {
        result = abs(sum)
        tmp_lef = lef
        tmp_rig = rig
    }
    
    if sum < 0 {
        lef += 1
    } else if sum > 0 {
        rig -= 1
    } else {
        break
    }
}

print("\(arr[tmp_lef]), \(arr[tmp_rig])")
