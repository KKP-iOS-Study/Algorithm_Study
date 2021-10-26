//
//  main.swift
//  Greedy
//
//  Created by 강호성 on 2021/08/20.
//

// 연속된 하나 이상의 숫자를 잡고 모두 뒤집는 것
// 0과 1의 구간을 나눠줘서 구간이 작은 수를 반환

var num = Array(readLine()!)

var oneSec = 0, zeroSec = 0

for i in 1..<num.count {
    
    if num[0] == "0" { zeroSec += 1 } else { oneSec += 1 }
    
    if num[i] != num[i-1] {
        
        if num[i] == "0" { zeroSec += 1 } else { oneSec += 1 }
        
    }
}

print(zeroSec > oneSec ? oneSec : zeroSec)
