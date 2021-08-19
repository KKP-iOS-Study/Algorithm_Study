// BOJ #13305 주유소
//
// 첫 번째 도시부터 min 값을 갱신해주며 거리에 min 값을 곱해나가는 방식으로 풀이
// 첫 번째 도시에서 두 번째 도시로 가는 길은 무조건 첫 번째 도시에서 주유해야하기 때문에,
// price에 우선적으로 (첫 번째 도시 기름값 * 두 번째 도시로 가는 거리)를 넣어주었다.
// min에는 일단 첫 번째 도시의 기름값을 넣어주고, 두 번째 도시부터는 더 작은지 큰지 비교하여
// 현재 도시의 기름값이 저번 도시의 기름값보다 클 경우 min을 갱신하지 않고, 저번 도시의 기름값에 거리를 곱한다.

import Foundation

let N = Int(readLine()!)!
let distance = readLine()!.split(separator: " ").map({Int(String($0))!})
let city = readLine()!.split(separator: " ").map({Int(String($0))!})
var min = city[0]
var price = city[0] * distance[0]
var d = 0

for i in 1..<city.count-1 {
    d += 1
    if city[i] < min { min = city[i] }
    price += min * distance[d]
}

print(price)
