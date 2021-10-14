
func boj9095() {
  let inputCase = Int(readLine()!)!
  var dp: [Int] = .init(repeating: 0, count: 12)
  dp[1] = 1
  dp[2] = 2
  dp[3] = 4
  
  for i in 4...11 {
    dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
  }
  
  for _ in 1...inputCase {
    print(dp[Int(readLine()!)!])
  }
  
}

boj9095()
