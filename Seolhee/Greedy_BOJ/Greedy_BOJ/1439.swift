// BOJ #1439 뒤집기
//
// 연속된 1로 이어진 블록과 연속된 0으로 이어진 블록의 개수를 각각 구하고,
// 0 블록의 개수와 1 블록의 개수를 비교하여 더 작은 블록의 개수를 출력한다.

import Foundation

var input = Array(readLine()!).map({Int(String($0))!})
var zero = 0 // 0 블록의 개수
var one = 0 // 1 블록의 개수
var check = true // 현재 1 블록이 유지되고 있다면 true, 0 블록이 유지되고 있다면 false

// 첫 번째 수가 어떤 수인지에 따라 check 갱신, one 혹은 zero에 1 누적
if input[0] == 0 { check = false; zero += 1 }
else { one += 1 }

for i in input[1...input.count-1] {
    // 현재 0인데, 그 전까지 1 블록이었다면 check를 flase로 바꿔 0 블록이 시작되었음을 알리고, zero에 1 누적
    if i == 0 && check == true { check = false; zero += 1 }
    // 현재 1인데, 그 전까지 0 블록이었다면 check를 true로 바꿔 1 블록이 시작되었음을 알리고, one에 1 누적
    else if i == 1 && check == false { check = true; one += 1 }
}

zero > one ? print(one) : print(zero) // 더 작은 블록의 개수만큼만 뒤집으면 되므로 작은 블록의 개수 출력
