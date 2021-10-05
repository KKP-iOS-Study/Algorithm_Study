//
//  main.swift
//  Greedy
//
//  Created by 강호성 on 2021/08/24.
//


/* 1. 시간초과

let N = Int(readLine()!)! // 그은 횟수
var starts = [Int](), ends = [Int]()

for _ in 0..<N {
    let xy = readLine()!.split(separator: " ").map{Int(String($0))!}
    let start = xy[0], end = xy[1]

    starts.append(start)
    ends.append(end)
}

print(starts, ends)

var tmp = [starts[0], ends[0]]
var len = 0 // 선 길이 (반환 값)

// 특정 A번 점에서 B번 점까지 잇는 선분을 그음으로써 어떠어떠한 선들을 한번에 해결할 수 있는지 알 수 있다면,
// 그 길이는 B - A

for i in 1..<N {

    // 현재 설정되있는 A 도착점이 i번째 입력값 B 시작점보다 클 때
    // 선을 이어 그릴 수 있다
    if tmp.last! >= starts[i] {

        // B의 도착점이 A의 도착점보다 클 때, B의 도착점으로 교체
        if ends[i] > tmp.last! {
            tmp.removeLast()
            tmp.append(ends[i])
        }

        // B의 시작점이 A의 시작점보다 크다면, B의 시작점으로 교체
        if starts[i] < tmp.first! {
            tmp.removeFirst()
            tmp.insert(starts[i], at: 0)
        }

    } else {
        len += (ends[i] - starts[i])
    }
}
len += (tmp[1] - tmp[0])
print(len)
*/



/* 2. 정렬_실패

let N = Int(readLine()!)!

var tmp = [[Int]]()

for _ in 0..<N {
    let xy = readLine()!.split(separator: " ").map{Int(String($0))!}
    tmp.append(xy)
}

tmp.sort {
    if $0[1] == $1[1] {
        return $0[0] < $1[0]
    } else {
        return $0[1] < $1[1]
    }
}

var len = 0
var first = tmp[0]

for i in 1..<N {

    // 현재 설정되있는 A 도착점이 i번째 입력값 B 시작점보다 클 때
    // 선을 이어 그릴 수 있다

    if first[1] >= tmp[i][0] {

        // B의 도착점이 A의 도착점보다 클 때, B의 도착점으로 교체
        if tmp[i][1] > first[1] {
            first[1] = tmp[i][1]
        }

        // B의 시작점이 A의 시작점보다 작다면, B의 시작점으로 교체
        if tmp[i][0] < first[0] {
            first[0] = tmp[i][0]
        }

    } else {
        len += (tmp[i][1] - tmp[i][0])
    }
}
len += (first[1] - first[0])
print(len)
*/



/* 3 이어그릴 수 없는 선에서 그 선분들을 합쳐지는 값 고려를 안했음

let N = Int(readLine()!)!

var tmp = [[Int]]()

for _ in 0..<N {
    let xy = readLine()!.split(separator: " ").map{Int(String($0))!}
    tmp.append(xy)
}

// 도착점이 작은 것과 같은 경우 시작점이 작은 것부터
tmp.sort {
    if $0[1] == $1[1] {
        return $0[0] < $1[0]
    } else {
        return $0[1] < $1[1]
    }
}

var first = tmp[0]
var len = first[1] - first[0]

for i in 1..<N {

    print(tmp[i])
    let curStart = tmp[i][0], curEnd = tmp[i][1]

    // 현재 설정되있는 A 도착점이 i번째 입력값 B 시작점보다 크거나 같을 때, 이어 그릴 수 있다.
    if first[1] >= curStart {

        if first[1] < curEnd {
            len += curEnd - first[1]
        }

        if first[0] > curStart {
           len += first[0] - curStart
       }

    } else {
        len += curEnd - curStart
        first[0] = tmp[i][0]
    }
    first[1] = curEnd > first[1] ? curEnd : first[1]
    first[0] = curStart < first[0] ? curStart : first[0]
    print("first \(first)")
}

print(len)
*/


// 4 시작점 기준으로 오름차순

let N = Int(readLine()!)!

var tmp = [[Int]]()

for _ in 0..<N {
    let xy = readLine()!.split(separator: " ").map{Int(String($0))!}
    tmp.append(xy)
}

// 시작점순
tmp.sort {
    if $0[0] == $1[0] {
        return $0[1] < $1[1]
    } else {
        return $0[0] < $1[0]
    }
}

var preA = tmp[0][0], preB = tmp[0][1]

var len = preB - preA

for i in 1..<N {
    
    let nowA = tmp[i][0], nowB = tmp[i][1]

    if preB < nowA { // 이어 그리기 X
        
        len += nowB - nowA
        preA = nowA
        preB = nowB
        
    } else if nowA <= preB && preB < nowB { // 이어 그리기 O

        // 겹칠 때
        len += (nowB - preB)
        preA = nowA
        preB = nowB
        
    }
    // 포함될 때는 제외
}

print(len)
