//
//  main.swift
//  Greedy
//
//  Created by 강호성 on 2021/08/19.
//

// 마이너스는 절댓값이 큰 두수끼리 곱 (오름차순) -> ex. -5 * -4 = 20
// 플러스는 값이 큰 두수끼리 곱 (내림차순) 해야 최대 합
// 1은 곱하지 않고 더해줘야 함
// 0은 음수랑 곱해야 함 -> 마이너스 배열에 넣어줌

let N = Int(readLine()!)!

var minus = [Int](), plus = [Int]()
var sum = 0

for _ in 0..<N {
    let num = Int(readLine()!)!
    
    if num == 1 { sum += 1 }
    else if num > 1 { plus.append(num) }
    else if num <= 0 { minus.append(num) }
}

minus.sort(by: <)
plus.sort(by: >)

// plus, minus 배열 홀/짝 고려
// 홀수이면 마지막 값은 sum에 더해주고, 나머지 짝수값끼리 곱
if minus.count % 2 == 1 { sum += minus.removeLast() }
if plus.count % 2 == 1 { sum += plus.removeLast() }


// 남은 짝수개의 인덱스들을 곱해서 sum에 더해준다
while !minus.isEmpty && minus.count > 0 {
    let a = minus.removeLast()
    let b = minus.removeLast()
    sum += a * b
}

while !plus.isEmpty && plus.count > 0 {
    let a = plus.removeLast()
    let b = plus.removeLast()
    sum += a * b
}

print(sum)

