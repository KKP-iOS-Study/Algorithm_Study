// BOJ #2579 계단 오르기
/*
 카운트를 늘리면서, 바로 다음 계단으로 가는 경우와 다다음 계단으로 가는 경우를 생각해준다.
 카운트는 바로 다음 계단으로 가는 경우에만 늘려주고, 다다음 계단으로 가는 경우엔 다시 카운트를 리셋한다.
 바로 다음 계단으로 가는 경우는 카운트가 3 미만일 경우에만! 실행해준다.
 */

let n = Int(readLine()!)!
var stairs = [0]
var max = 0

for _ in 0..<n { stairs.append(Int(readLine()!)!) }

func solution(_ next: Int, _ count: Int, _ sum: Int) {
    if next >= n {
        if next > n || count == 2 { return }
        if max < sum + stairs[next] { max = sum + stairs[next] }
    }
    
    if count == 2 { solution(next+2, 0, sum+stairs[next]) }
    else { solution(next+1, count+1, sum+stairs[next]); solution(next+2, 0, sum+stairs[next]) }
}

solution(1, 0, 0)
print(max)
