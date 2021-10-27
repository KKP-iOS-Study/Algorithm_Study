// BOJ #2295 세 수의 합
/*
 x + y + z = k
 x + y = k - z
 (💥 x, y, z, k 는 모두 같을 수 있음)
 */

let n = Int(readLine()!)!
var u = [Int]()
var sum = Set<Int>() // x + y 가 될 수 있는 모든 경우의 수
var result = Set<Int>() // k - z 가 될 수 있는 모든 경우의 수

for _ in 0..<n { u.append(Int(readLine()!)!) }

for i in 0..<n {
    for j in 0..<n {
        sum.insert(u[i] + u[j])
    }
}

for i in 0..<n {
    for j in (0..<n).reversed() {
        if sum.contains(u[i] - u[j]) { result.insert(u[i]) } // k - z 값이 sum에 존재할 경우 result에 k 값 넣어주기
    }
}

print(result.max()!)
