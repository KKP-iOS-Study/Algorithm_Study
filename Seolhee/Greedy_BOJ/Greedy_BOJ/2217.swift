// BOJ #2217 로프
//
// 로프들의 최대 무게를 오름차순으로 정렬한 후, 순서대로 탐색하며
// 해당 무게의 로프를 포함할 경우 감당할 수 있는 무게를 구해 answer 배열에 추가, 마지막에 max 출력.
//
// -> 오름차순으로 정렬했기 때문에, 로프 배열의 앞에서부터 반복한다면
// 해당 무게의 로프 선택 시 그 뒤의 무게들은 모두 선택되는것이 당연하다는 점을 이용했음.
//
// (Ex. 1 2 3 100)
// 이 때 1 무게를 감당할 로프를 선택하는데, 그 뒤의 더 큰 무게를 감당할 수 있는 로프를 선택하지 않을 이유가 없기 때문.

import Foundation

let N = Int(readLine()!)!
var rope = [Int]()
var answer = [Int]()

for _ in 0..<N {
    rope.append(Int(readLine()!)!)
}

rope.sort()

for i in 0..<rope.count {
    answer.append(rope[i] * rope[i...rope.count-1].count)
}
print(answer.max()!)
