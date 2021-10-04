// BOJ #1697
/*
 [풀기 전 정리]
 수빈이가 할 수 있는 것 ==> (1)앞으로가기, (2)뒤로가기, (3)*2로가기
 수빈이의 처음 위치를 기준으로 세 가지 경우의 수 체크해주고, 이동한 위치는 큐에 추가!
 물론 이 때 이동한 위치가 타겟 위치와 같으면 바로 끝
 
 [풀고나서 정리]
 자꾸 메모리초과가 났음 => 반례는 0 100000 혹은 100000 0
 이렇게 큰 수를 입력하니까 같은 곳을 반복하는 경우가 아주 많이 생겨버림
 따라서 visited배열을 문제에서 주어진 범위의 크기로 만들어주고 체크해줌!
 (가장 대표적인 예로, 0에서 시작하는 경우 *2 했을 때 범위에 들어오기 때문에 0에서 가는 경우를 무한대로 탐색하게됨)
*/

import Foundation

let info = readLine()!.split(separator: " ").map({Int(String($0))!})
var subin = info[0] // 수빈이의 시작점
var target = info[1] // 동생 위치
var queue = [(subin, 0)] // 이동하는 수빈이의 위치와 해당 위치까지 가는데까지 걸린 시간을 튜플로 담음
var found = false // 찾았는지 체크하는 불 변수
var visited = Array(repeating: 0, count: 100001) // 이미 수빈이가 다녀간 자리들을 체크해주기 위함

var index = 0

if subin == target { print(0) } // 처음부터 수빈이와 동생의 위치가 같을 경우 => 바로 끝
else {
    while true {
        let (now, now_count) = queue[index]
        index += 1
        var next = 0 // 수빈이가 이동할 위치를 담을 변수

        for i in 0..<3 {
            if i == 0 { next = now - 1 } // X-1 이동
            else if i == 1 { next = now + 1 } // X+1 이동
            else { next = now * 2 } // X*2 이동
            
            if next < 0 || next > 100000 || visited[next] == 1 { continue } // 예외!
            if next == target { found = true; break } // 찾았을 경우
            visited[next] = 1 // 수빈이가 지나간 곳은 1로 체크헤주기 (같은 곳 또 지나갈 필요 전혀x)
            queue.append((next, now_count + 1)) // 수빈이가 이동할 위치와 그 위치까지 가는데 걸린 시간 추가!
        }
        
        if found { print(now_count+1); break } // 결과 출력
    }
}
