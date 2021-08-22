// BOJ #8980 택배

import Foundation

let info = readLine()!.split(separator: " ").map({Int(String($0))!}) // [마을 개수, 트럭 용량]
let count = Int(readLine()!)!
var nums = [[Int]]() // [출발 마을, 도착 마을, 택배 개수]
var town = Array(repeating: 0, count: info[0]) // 마을 별 적재중인 택배 개수
var answer = 0

for _ in 0..<count { nums.append(readLine()!.split(separator: " ").map({Int(String($0))!})) }

// 도착 마을 기준 가장 빨리 도착하는 마을부터 순으로 정렬, 도착 마을이 같을 경우 시작 마을이 빠른 순으로 정렬
nums.sort {
    if $0[1] != $1[1] { return $0[1] < $1[1] }
    else { return $0[0] < $1[0] }
}

// town에서 nums[i]의 출발하는 마을부터 도착하는 마을 전까지 중 적재된 택배의 개수가 가장 큰 수를 max에 저장
// max가 트럭 용량과 같다면 해당 마을을 지나는 택배는 적재할 수 없다는 의미이므로,
// max가 트럭 용량보다 작을 시에 if문을 실행해준다.
// 해당 택배가 지나는 마을들에 추가로 적재해줄 택배 개수를 add에 저장
// 택배의 개수와 max를 더했을 때 용량보다 크면 용량에서 max를 뺀 값을 저장, 아니면 해당 택배 개수를 저장
for i in 0..<count {
    let max = (town[nums[i][0]-1..<nums[i][1]-1]).max()!
    if max < info[1] {
        let add = nums[i][2] + max > info[1] ? info[1] - max : nums[i][2]
        answer += add // 더해지는 택배 개수를 answer에 추가
        for j in nums[i][0]-1...nums[i][1]-2 {
            town[j] += add // 현재 택배가 지나가는 마을들에 add만큼의 택배 개수를 추가
        }
    }
}

print(answer)
