// BOJ #11659 구간 합 구하기 4
/*
 그냥 더하면 시간초과.
 1부터 끝까지 누적 값을 넣는 배열을 만들어주고
 예를들어 1부터 3까지 구하고싶다면 sum[3]-sum[0] 하면 됨
 */

let info = readLine()!.split(separator: " ").map({Int(String($0))!})
let nums = readLine()!.split(separator: " ").map({Int(String($0))!})
var sum = [0, nums[0]]

for i in 2...info[0] {
    sum.append(nums[i-1] + sum[i-1])
}

for _ in 0..<info[1] {
    let section = readLine()!.split(separator: " ").map({Int(String($0))!})
    print(sum[section[1]] - sum[section[0]-1])
}
