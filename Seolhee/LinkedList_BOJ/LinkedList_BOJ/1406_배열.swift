// BOJ #1406
//
// 배열로 풀었음. 시간 초과

import Foundation

var input = Array(readLine()!).map({String($0)})
input.append(" ") // 맨 뒤에 공백 추가 (커서를 의미)

let count = Int(readLine()!)!
var edit = ""

for _ in 0..<count {
    edit = readLine()! // 명령어 입력
    if edit == "L" && input[input.startIndex] != " " { toLeft() }
    if edit == "D" && input[input.endIndex] != " " { toRight() }
    if edit == "B" && input[input.startIndex] != " " { Remove() }
    if edit.first! == "P" { Insert() }
}

print(input.joined().filter({$0 != " "}))

// 'L' 명령어 처리 함수
func toLeft() {
    let blank = input.firstIndex(of: " ")!
    input.remove(at: blank)
    input.insert(" ", at: blank - 1)
    return
}

// 'D' 명령어 처리 함수
func toRight() {
    let blank = input.firstIndex(of: " ")!
    input.remove(at: blank)
    input.insert(" ", at: blank + 1)
    return
}

// 'B' 명령어 처리 함수
func Remove() {
    let blank = input.firstIndex(of: " ")!
    input.remove(at: blank - 1)
    return
}

// 'P' 명령어 처리 함수
func Insert() {
    let blank = input.firstIndex(of: " ")!
    input.insert(String(edit.last!), at: blank)
    return
}


