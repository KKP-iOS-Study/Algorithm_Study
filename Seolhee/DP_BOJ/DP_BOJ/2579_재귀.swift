// BOJ #2579 계단 오르기 (시간 초과)
/*
 카운트를 늘리면서, 바로 다음 계단으로 가는 경우와 다다음 계단으로 가는 경우를 생각해준다.
 카운트는 바로 다음 계단으로 가는 경우에만 늘려주고, 다다음 계단으로 가는 경우엔 다시 카운트를 리셋한다.
 바로 다음 계단으로 가는 경우는 카운트가 3 미만일 경우에만! 실행해준다.
 어차피 마지막 계단은 꼭 밟아야하므로, 계단의 반대편부터 반복해준다.
 */

var n = Int(readLine()!)!
var stairs = [Int]()
var max = 0

for _ in 0..<n { stairs.append(Int(readLine()!)!) }

if n == 1 { print(stairs[0]) }
else {
    stairs.append(0)
    stairs.reverse()

    func solution(_ next: Int, _ count: Int, _ sum: Int) {
        if next > n { return }
        
        if max < sum + stairs[next] { max = sum + stairs[next] }
        
        if count == 2 { solution(next+2, 1, sum+stairs[next]) }
        else {
            solution(next+2, 1, sum+stairs[next])
            solution(next+1, count+1, sum+stairs[next])
        }
    }

    solution(1, 1, 0)
    print(max)
}
