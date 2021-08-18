// BOJ #1541 잃어버린 괄호
//
// 이 문제의 요점은,, "-" 뒤에 괄호를 넣는 것이 베스트라는 것
//
// 우선 "-"를 기준으로 나눠 배열 생성하고,
// 반복문으로 요소마다 "+"로 다시 나눠 배열 생성 후
// 모든 수를 더하여 기존 누적 값에서 빼주는 것을 반복

import Foundation

var input = readLine()!.split(separator: "-").map({String($0)}) // "-" 기준으로 나눠 배열 생성
var sum = 0
var tmp = 0

for i in 0..<input.count {
    let n = input[i].split(separator: "+").map({Int(String($0))!}) // "+"로 다시 한 번 나누기
    for j in n { tmp += j } // "+"로 나눈 배열의 모든 요소 더하기
    
    if i == 0 { sum += tmp } // 첫 번째 요소의 경우에만 sum에 더해주기
    else { sum -= tmp } // 첫 번째 요소를 제외, "-"를 기준으로 나눈것이기 때문에 sum에서 빼주기
    tmp = 0 // tmp 초기화
}

print(sum)

