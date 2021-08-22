// BOJ #15903 카드 합체 놀이
//
// 제일 작은 수끼리 더해서 갱신하는 수행을 반복하면 됨.

import Foundation

let info = readLine()!.split(separator: " ").map({Int(String($0))!})
var card = readLine()!.split(separator: " ").map({Int(String($0))!})
var answer = 0

card.sort(by: >) // 내림차순 정렬

for _ in 0..<info[1] {
    let tmp = card[card.count-1] + card[card.count-2] // 제일 작은 수 두 개 더하기
    card[card.count-1] = tmp // 더한 수로 갱신
    card[card.count-2] = tmp // 더한 수로 갱신
    card.sort(by: >) // 한 번의 결합마다 새로 내림차순 정렬
}

for i in card { answer += i }

print(answer)
