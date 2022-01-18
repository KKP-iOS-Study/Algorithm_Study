// BOJ 14500 테트로미노

let input = readLine()!.split(separator: " ").map({Int(String($0))!})
let n = input[0]
let m = input[1]
var paper = [[Int]]()

for i in 0..<n {
    let now_line = readLine()!.split(separator: " ").map({Int(String($0))!})
    for j in 0..<m {
        paper[i][j] = now_line[j]
    }
}
