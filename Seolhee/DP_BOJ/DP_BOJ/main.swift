// BOJ #1463 1로 만들기

var num = Int(readLine()!)!
var count = 0
var min = num

func solution(_ n: Int, _ count: Int) {
    if n == 0 || count > min { return }
    if n == 1 { min = count }
    
    if n % 3 == 0 { solution(n/3, count+1) }
    if n % 2 == 0 { solution(n/2, count+1) }
    solution(n-1, count+1)
}

solution(num, count)
print(min)
