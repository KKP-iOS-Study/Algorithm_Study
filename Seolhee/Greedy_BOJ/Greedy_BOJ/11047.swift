// BOJ #11047 동전 0

import Foundation

let info = readLine()!.split(separator: " ").map({Int(String($0))!})
var money = [Int]() // 돈 단위들 저장 (오름차순)
var left = info[1] // 남은 돈 저장
var answer = 0

// 입력되는 돈의 단위들을 순서대로 money 배열에 저장
for _ in 0..<info[0] {
    let input = Int(readLine()!)!
    money.append(input)
}

// 남은돈이 없을 때까지 반복
while left > 0 {
    // money의 마지막요소가 가장 큰 액수임으로, 마지막 요소로 나눈 값을 answer에 더해준다.
    answer += left / money.last!
    // 남은 돈 left 업데이트
    // money 마지막 요소로 나눈 나머지를 left에 저장한다.
    // 마지막 요소가 가장 큰 액수가 되도록 하기 위하여 removeLast 이용
    left = left % money.removeLast()
}

print(answer)
