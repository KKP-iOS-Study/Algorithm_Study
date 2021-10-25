// BOJ #1920 수 찾기
/*
 A수들을 오름차순 정렬해주고,
 찾으려는 수 i를 가장 효율적으로, 빨리! 찾을 수 있는 A배열의 위치를 정하는 반복문을 돌려준다.
 
 A배열의 시작점과 끝점을 기준으로 가장 중간값이 되는 위치를 먼저 확인해주고,
 그 중간값보다 i가 크다면 시작점을 저장하는 start 변수를 중간값보다 1 큰 수로 변경해준다.
 중간값보다 i가 작을 경우에는 끝점을 저장하는 end 변수를 중간값보다 1 작은 수로 변경헤준다.
 이렇게 범위를 좁혀나가면서 원하는 수가 존재하는지를 확인해주는것.
 
 반복문 돌리기 전, i가 A배열의 첫 번째 값보다 작거나 마지막 값보다 큰 경우에는
 오름차순정렬되어있으므로 A배열에 존재하지 않는다는 것을 의미한다. 따라서 예외로 빼서 바로 결과를 출력했다.
 */

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map({Int(String($0))!})
let M = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map({Int(String($0))!})

A.sort()

for i in nums {
    if i < A.first! || i > A.last! { print(0) } // A수의 범위에 포함되지 않을 경우
    else {
        var start = 0
        var end = N
        var check = false // i가 A에 존재하는지 안하는지 표현하는 불 변수
        
        while start <= end {
            let mid = (start + end) / 2 // 중간 값 정의
            
            if A[mid] == i { print(1); check = true; break } // 찾은 경우
            else if A[mid] < i { start = mid + 1 } // i보다 중간값이 더 작을 때 start 업데이트
            else { end = mid - 1 } // i보다 중간값이 더 클 때 end 업데이트
        }
        
        if check == false { print(0) } // while 반복이 끝났음에도 i를 찾지 못한 경우
    }
}
