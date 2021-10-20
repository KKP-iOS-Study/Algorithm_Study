// BOJ #9461 파도반 수열
/*
 P(N) = P(N-1) + P(N-5) 라는 점화식 도출 가능
 5만큼 이전 값까지 필요하므로 첫 번째부터 5번 째 삼각형까지는 예외로 처리해야함
 */

let cases = Int(readLine()!)!
var N = [Int]()

for _ in 0..<cases { N.append(Int(readLine()!)!) }
let max = N.max()!

if max <= 5 {
    for i in 0..<cases {
        if N[i] <= 3 { print(1) }
        else { print(2) }
    }
}

else {
    var P = Array(repeating: 0, count: max+1)
    for i in 1..<P.count {
        if i <= 3 { P[i] = 1 }
        else if i <= 5 { P[i] = 2 }
        else { P[i] = P[i-1] + P[i-5] }
    }
    for i in 0..<cases { print(P[N[i]]) }
}
