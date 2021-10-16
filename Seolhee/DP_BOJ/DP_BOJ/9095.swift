// BOJ #9095 1, 2, 3 만들기
/*
 1은 1 = 1개
 2는 1+1, 2 = 2개
 3은 1+1+1, 1+2, 2+1, 3 = 4개
 4는 1+1+1+1, 1+1+2, 1+2+1, 2+1+1, 2+2, 1+3, 3+1, 4 = 7개
 5는 1+1+1+1, 1+1+1+2 * 4, 1+2+2 * 3, 1+1+3 * 3, 2+3 * 2, 5 = 13개
 => 내가 구하고자 하는 수의 조합 개수는 '이전 3개 수들의 모든 조합 개수의 합'과 같음!
 => solution(n) = solution(n-3) + solution(n-2) + solution(n-1)
 */

let cases = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    if n == 1 { return 1 }
    if n == 2 { return 2 }
    if n == 3 { return 4 }
    else { return solution(n-3) + solution(n-2) + solution(n-1) }
}

for _ in 0..<cases { print(solution(Int(readLine()!)!)) }
