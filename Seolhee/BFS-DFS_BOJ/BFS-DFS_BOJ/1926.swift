// BOJ #1926 그림

import Foundation

let paper = readLine()!.split(separator: " ").map({Int(String($0))!}) // 주어진 도화지의 크기 (세로, 가로)
var check = [[Int]]() // 도화지 칸 별로 숫자 입력받는 배열

for _ in 0..<paper[0] {
    check.append(Array(readLine()!.split(separator: " ").map({Int(String($0))!})))
}

var count = 0 // 그림 개수 카운트
var area = 0 // 그림마다 넓이 체크
var max = 0 // 최대 그림 크기

// bfs 재귀함수
func solution(_ x: Int, _ y: Int) {
    // i와 j가 도화지 크기 안에 해당하지 않거나, 1이 아닐 경우에 함수 종료
    if x < 0 || x >= paper[0] || y < 0 || y >= paper[1] || check[x][y] != 1 { return }
    
    check[x][y] = 0 // 이미 체크한 자리는 0으로 바꿔주기
    area += 1 // area 1 증가시켜주기
    
    // 재귀 호출 (현재 자리와 붙어있는 주변 모든 자리 확인)
    solution(x+1, y) // 세로로 다음 자리
    solution(x-1, y) // 세로로 전 자리
    solution(x, y+1) // 가로로 다음 자리
    solution(x, y-1) // 가로로 전 자리
}

// 세로가 0 이상일 경우 코드 실행
if paper[0] > 0 {
    for i in 0..<paper[0] {
        for j in 0..<paper[1] {
            // 1일 경우 (메인 실행 코드)
            if check[i][j] == 1 {
                area = 0 // bfs 함수 실행 전 max 초기화
                solution(i, j) // 함수 호출
                count += 1 // 카운트
                if max < area { max = area } // max가 total보다 클 경우 max 업데이트
            }
        }
    }
}

print(count) // 그림의 개수
print(max) // 최대 그림의 크기
