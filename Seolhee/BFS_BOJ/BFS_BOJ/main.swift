// BOJ #2583 영역 구하기

import Foundation

let info = readLine()!.split(separator: " ").map({Int(String($0))!})
let m = info[0]
let n = info[1]
let k = info[2]
var paper = Array(repeating: Array(repeating: 0, count: n), count: m)

for _ in 0..<k {
    let draw = readLine()!.split(separator: " ").map({Int(String($0))!}) // 직사각형 좌표
    // let size = (draw[2]-draw[0])*(draw[3]-draw[1]) // 현재 입력받은 직사각형의 넓이
    
    for i in draw[0]..<draw[2] {
        for j in draw[1]..<draw[3] {
            paper[j][i] += 1
        }
    }
}

print(paper)
