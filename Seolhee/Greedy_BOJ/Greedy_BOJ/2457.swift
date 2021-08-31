// BOJ #2457 공주님의 정원

import Foundation

let n = Int(readLine()!)!
var flowers = [[Int]]()

for _ in 0..<n {
    let tmp = readLine()!.split(separator: " ").map{Int(String($0))!}
    let s = tmp[0] * 100 + tmp[1]
    let e = tmp[2] * 100 + tmp[3]
    if e >= 301 {
        if s <= 301 { flowers.append([301, e]) }
        else { flowers.append([s, e]) }
    }
}

flowers.sort(by: {$0[0] < $1[0]})

var start = 301
var max = 0
var answer = 0

for i in 0..<n {
    if flowers.count <= 1 {
        if flowers.count == 0 { break }
        else {
            if flowers[0][0] <= 301 && flowers[0][1] > 1130 { answer = 1; break }
            else { break }
        }
    }
    if flowers[i][0] <= start {
        if flowers[i][1] > max { max = flowers[i][1] }
        if i == n-1 {
            if max > 1130 { answer += 1; break }
            else { answer = 0; break }
        }
        else if flowers[i+1][0] > start {
            answer += 1
            start = max
            if start > 1130 { break }
        }
    }
    else { answer = 0; break }
}

print(answer)
