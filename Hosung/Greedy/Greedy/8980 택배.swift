//
//  main.swift
//  Greedy
//
//  Created by 강호성 on 2021/09/02.
//



let NC = readLine()!.split(separator: " ").map{Int(String($0))!}
var N = NC[0] // 마을 수
var C = NC[1] // 트럭의 용량

let M = Int(readLine()!)! // 보내는 박스 정보의 개수

var tmp = [[Int]]()

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    tmp.append(input)
}

// 도착지 기준
tmp.sort {
    if $0[1] == $1[1] {
        return $0[0] < $1[0]
    } else {
        return $0[1] < $1[1]
    }
}

// 각 마을별 수용 가능한 무게
var load = [Int](repeating: C, count: N)
var ans = 0

for i in 0..<M {
    var minNum = C+1 // 첫 40값 비교위해 +1
    let start = tmp[i][0], arrival = tmp[i][1], weight = tmp[i][2]

    // 수용가능 무게 구하기
    for j in start..<arrival {
        if load[j] < minNum {
            minNum = load[j]
        }
    }

    // t -> 배송받기 전 마을들의 수용가능 갯수와 현재마을에서 실을 개수 중 작은 값
    let t = min(minNum, weight)
    ans += t

    // 각 마을에 t 값만큼 수용가능 개수 빼기
    for k in start..<arrival {
        load[k] -= t
    }

}
print(ans)
