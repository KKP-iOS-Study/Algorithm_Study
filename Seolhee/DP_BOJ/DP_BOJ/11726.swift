// BOJ #11726 2*n 타일링
/*
 n이 1일 경우 답은 1
 n이 2일 경우 답은 2
 n이 3일 경우 답은 3
 n이 4일 경우 답은 5
 n이 5일 경우 답은 8
 => dp[n] = dp[n-1] + dp[n-2]
 */

let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1001)

func solution(_ n: Int) -> Int {
    if n == 1 { return 1 }
    if n == 2 { return 2 }
    if dp[n] > 0 { return dp[n] } // 중복을 피하기 위함 (이미 계산된건 또 계산할 필요없으므로)
    dp[n] = (solution(n-2) + solution(n-1)) % 10007
    return dp[n]
}

print(solution(N))
