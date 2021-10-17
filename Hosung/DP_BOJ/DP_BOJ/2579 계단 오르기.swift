//
//  main.swift
//  DP_BOJ
//
//  Created by 강호성 on 2021/10/15.
//

//                      여기서부터는 세계단을 밟을 수 없기 때문에, 전전값과 더해준다.
//         10 20        15         25           10          20
//        --------------------------------------------------------------
//          1  2         3          4           5           6
//        --------------------------------------------------------------
// step    10 30(10+20)  35(20+15)  50(25+25)   65(55+10)   65(45+20)
//                       전인 step2에서 업데이트한 값을 +
// step2    0 20         25(10+15)  55(30+25)   45(35+10)   75(55+20)
//                       전전 값에서 더 큰값 +

// step = 전인 step2에서 업데이트한 값 + score
// step2 = 전전 값에서 더 큰값 + score

let n = Int(readLine()!)!

var step = [Int](repeating: 0, count: n) // 이전으로부터 업데이트한 값(세번의 계단을 밟지못하는 경우 고려)
var step2 = [Int](repeating: 0, count: n) // 전전으로부터 업데이트한 값

for i in 0..<n {
    
    let score = Int(readLine()!)!
    
    // 첫번째 계단만 점수 그대로 넣고 시작 (else문)
    
    if i-1 >= 0 {
        step[i] = step2[i-1] + score // 전인 step2에서 업데이트한 값 + score
    } else {
        step[i] = score
    }
    
    if i-2 >= 0 {
        step2[i] = max(step[i-2], step2[i-2]) + score // 전전 값에서 더 큰값 + score
    } else {
        step2[i] = score
    }
}

print(max(step[n-1], step2[n-1]))
