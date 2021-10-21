// BOJ #14501 퇴사
/*
 뒤에서부터 하나씩 가능한 수를 고려해주면서 풀이했다.
 맨 마지막 날짜부터, 현 날짜에 상담을 한다면?
 (1)상담이 가능한지, (2)상담이 불가한지
 (1)상담이 가능하다면, (1-1)바로 다음에 가능한 상담을 하는게 이득인지, (1-2)그 후에 더 큰 이득을 가져다 줄 상담이 존재하는지
 (2)상담이 불가하다면 다음에 있는 상담들 중 진행했을 때 가장 큰 이득을 가져다줄 수 있는 상담의 값을 저장!
 이런 방식으로 고려해주면 될 것 같음
 */

let n = Int(readLine()!)!
var input = [[Int]]()
var dp = Array(repeating: 0, count: n+1) // 날짜별로 해당 날짜에서 취할 수 있는 가장 큰 값을 저장하기 위한 배열
var maxValue = 0

for _ in 0..<n { input.append(readLine()!.split(separator: " ").map({Int(String($0))!})) }

for i in (0..<n).reversed() {
    let day = input[i][0] + i // i번째 날짜의 상담 기간 + i번째 날짜 == 다음 상담 시작 날짜
    
    // day가 n보다 작거나 같은 경우 == 상담 가능
    if day <= n {
        dp[i] = max(input[i][1] + dp[day], maxValue) // (i번째 날짜 상담 가격 + 다음 상담 가격)과 maxValue 중 더 큰 값
        maxValue = dp[i] // maxValue를 방금 연산한 최댓값으로 업데이트
    }
    else { dp[i] = maxValue } // 상담을 할 수 없으므로 maxValue 그대로 삽입
}

print(dp.max()!)
