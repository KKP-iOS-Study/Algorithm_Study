//
//  main.swift
//  Greedy2_BOJ
//
//  Created by 강호성 on 2021/11/30.
//

// 서류 심사 결과와 면접 성적이 모두 떨어진다면 탈락
// 첫번째 등수를 정렬하고, 두번째 등수로 비교

let T = Int(readLine()!)! // 테스트케이스

var people = [[Int]]()
var cnt = 1

for _ in 0..<T {
    let N = Int(readLine()!)! // 지원자 수
    
    for _ in 0..<N {
        people.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    // 첫번째 등수 기준 오름차순
    people.sort { return $0[0] < $1[0] }
    
    // 두번째 등수 비교
    // 하나씩 등수를 비교하면 시간초과
    
    var second = people[0][1]
    
    for i in 1..<N {
        if second > people[i][1] {
            cnt += 1
            second = people[i][1]
        }
    }
    print(cnt)
    cnt = 1
    people = []
}

// 다른사람들의 정답을 보면
// 라이노님의 파일 입력코드를 사용해서 해결함
