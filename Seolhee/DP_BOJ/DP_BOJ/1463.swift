// BOJ #1463 1로 만들기

var num = Int(readLine()!)!
var count = 0
var min = num // 최솟값(결괏값) 담을 변수. 아무리 숫자가 커도 주어진 숫자보다 클 수는 없으므로 num 넣고 시작

func solution(_ n: Int, _ count: Int) {
    if count > min { return } // 카운트가 min보다 커지면 어차피 최소가 아니므로 계속할 필요x
    if n == 1 { min = count } // 1일 경우 min 업데이트!
    
    if n % 3 == 0 { solution(n/3, count+1) }
    if n % 2 == 0 { solution(n/2, count+1) }
    solution(n-1, count+1)
}

solution(num, count)
print(min)
