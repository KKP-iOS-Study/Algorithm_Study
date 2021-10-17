// BOJ #2579 계단 오르기
/*
 직전 계단을 밟았을 경우, 직전 계단을 밟지 않았을 경우 이렇게 두 가지로 나눌 수 있음
 
 (1) 직전 계단을 밟았다고 친다면, 전전 계단은 밟지 않았다는 의미!
 => arr2의 직전 계단에 저장된 수에 현재 계단의 값을 더해서 저장해주면 됨
 (arr1의 직전 계단 값을 저장하면 안됨. 왜냐면 arr1은 직전 계단을 밟았을 때를 저장하는 배열이므로
 arr1의 직전 계단 값은 또 바로 그 직전 계단을 밟았을 때의 값을 의미하기 때문!!
 문제에서 3연속 직전 계단을 밟으면 안된다고 했으므로 arr2의 직전 계단값에 더해줘야함.)
 
 (2) 직전 계단을 밟지 않았다고 친다면, 전전 계단을 밟고 올라왔다는 의미!
 => arr1의 전전 계단과 arr2의 전전 계단 중 더 큰 수를 고르면 됨
 */

let n = Int(readLine()!)!
var arr1 = Array(repeating: 0, count: n) // 직전 계단 밟은 경우 배열
var arr2 = Array(repeating: 0, count: n) // 직전 계단 밟지 않은 경우 배열

for i in 0..<n {
    let now = Int(readLine()!)!
    
    // 직전 계단을 밟았다고 할 때
    if i == 0 { arr1[i] = now }
    else { arr1[i] = now + arr2[i-1] }
    
    // 직전 계단을 밟지 않았다고 할 때
    if i < 2 { arr2[i] = now }
    else { arr2[i] = now + max(arr1[i-2], arr2[i-2]) }
}

print(max(arr1[n-1], arr2[n-1]))
