// BOJ #11000 강의실 배정
//
// 우선순위 큐 이용해야하는데, 스위프트에는 라이브러리가 없으므로,,
// 배열 만들고 append 해줄때마다 정렬해주는 식으로 구현했는데.. 어떻게 해도 시간초과네
// 스위프트로 푸신거 딱 하나 발견했는데 우선순위 큐 직접 구현해서 푸셨음,.,.,.,.,.,

import Foundation

var N = Int(readLine()!)!
var times = [[Int]]()

for _ in 0..<N {
    times.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
}

times.sort(by: { $0[0] < $1[0] })

var end = [times[0][1]]

for i in 1..<N {
    if times[i][0] >= end.last! { end.removeLast() }
    end.append(times[i][1])
    end.sort(by: >)
}
 
print(end.count)

/*
6
1 3
2 5
4 12
7 8
7 11
9 10
*/
