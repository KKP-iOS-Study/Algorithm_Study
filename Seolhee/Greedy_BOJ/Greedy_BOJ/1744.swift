// BOJ #1744 수 묶기
//
// 1보다 같거나 작은 수는 곱하는것보다 더하는게 더 이득
// -> 만약에 -인 수가 짝수로 있으면 그건 또 곱하는게 더 이득
// -> -인 수가 홀수로 남는 상황에는 0이 있으면 0이랑 곱해주는게 이득
// => 0부터 -인 수들은 따로 모아서 정렬, 순서대로 짝지어 곱해주면 될듯
// 작은건 작은거끼리 곱하고 큰건 큰거끼리 곱하는게 더 이득
// 더이상 예외 없을듯
//
// => 0 이하, 1, 2 이상. 이렇게 세 가지로 나눠받으면 될듯.

import Foundation

let N = Int(readLine()!)!
var minus = [Int]()
var plus = [Int]()
var answer = 0

for _ in 0..<N {
    let input = Int(readLine()!)!
    if input <= 0 { minus.append(input) } // 음수
    else if input == 1 { answer += 1 } // 1일 경우 바로 answer에 누적
    else { plus.append(input) } // 양수
}

plus.sort(by: >) // 양수는 내림차순 정렬 (뒤에서부터 removeLast 하면서 곱해주기 위함)
minus.sort(by: <) // 양수와는 반대로 큰 수일수록 더할 때 피해 작고, 작은 수일수록 곱할 때 큰 수가 되기에 오름차순 정렬

// minus와 plus모두 개수가 홀수일 경우 묶을 수 없는 수가 존재하는 것이기 때문에
// 마지막 요소 삭제와 동시에 answer에 해당 수 누적
if minus.count % 2 == 1 { answer += minus.removeLast() }
if plus.count % 2 == 1 { answer += plus.removeLast() }

while minus.count > 0 || plus.count > 0 {
    // 마지막, 그 전 수 곱하여 answer에 누적하는 동시에 삭제
    if minus.count > 0 { answer += minus.removeLast() * minus.removeLast() }
    if plus.count > 0 { answer += plus.removeLast() * plus.removeLast() }
}

print(answer)
