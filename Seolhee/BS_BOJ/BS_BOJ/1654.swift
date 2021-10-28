// BOJ #1654 랜선 자르기
/*
 지금까지는 배열의 위치를 start, end 값으로 잡고 이분탐색을 했다면
 이번 문제에서는 가장 작게 자를 수 있는 값인 1을 start로 설정하고,
 가장 크게 자를 수 있는 값은 입력된 k개의 선 중 가장 긴 선의 길이이므로 해당 길이를 end 값으로 설정하여 이분탐색을 진행했다.
 가장 작은 값과 가장 큰 값의 중간 값부터 시작해서 n개의 랜선을 만들 수 있는 중간값을 찾아내고,
 가능한 수를 찾을 때마다 result와 비교해서 그 중에서도 가장 큰 값을 찾아주었다.
 */

let info = readLine()!.split(separator: " ").map({Int(String($0))!})
let k = info[0]
let n = info[1]
var lines = [Int]()

for _ in 0..<k { lines.append(Int(readLine()!)!) }

var start = 1 // 자를 수 있는 가장 작은 값
var end = lines.max()! // 자를 수 있는 가장 큰 값
var result = 0

while start <= end {
    let mid = (start + end) / 2
    var tmp = 0
    
    for i in lines { tmp += i / mid }
    
    if tmp >= n {
        if result < mid { result = mid }
        start = mid + 1
    }
    else { end = mid - 1 }
}

print(result)
