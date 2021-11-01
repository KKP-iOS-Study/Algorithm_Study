// BOJ #1822 차집합

let info = readLine()!.split(separator: " ").map({Int(String($0))!})
let n_A = info[0]
let n_B = info[1]
var A = readLine()!.split(separator: " ").map({Int(String($0))!})
var B = readLine()!.split(separator: " ").map({Int(String($0))!})

A.sort()
B.sort()

var result = [Int]()

for i in A {
    var start = 0
    var end = n_B - 1
    var find = false
    while start <= end {
        let mid = (end + start) / 2
        if B[mid] == i { find = true; break }
        else if B[mid] < i { start = mid + 1 }
        else { end = mid - 1 }
    }
    if find == false { result.append(i) }
}

print(result.count)
if result.count > 0 { print(result.map({String($0)}).joined(separator: " ")) }

