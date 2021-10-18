// BOJ #2667 단지번호붙이기
/*
 #2583 영역구하기 문제와 거의 동일한듯!
 이어진 1들의 모임을 구하고 오름차순 정렬해서 출력
 */

let n = Int(readLine()!)! // 입력되는 한 변의 크기
var map = [[Int]]()
var count = 0
var block = [Int]()
let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

for _ in 0..<n {
    map.append(Array(readLine()!.map({Int(String($0))!})))
}

// dfs 함수
func dfs(_ x: Int, _ y: Int) {
    if x < 0 || y < 0 || x >= n || y >= n || map[x][y] == 0 { return } // 예외
    
    count += 1 // 단지 넓이 누적
    map[x][y] = 0 // 이미 체크한 자리는 0으로 바꿔서 중복 검사 피해주기
    
    // 재귀 호출
    dfs(x+1, y)
    dfs(x-1, y)
    dfs(x, y+1)
    dfs(x, y-1)
}

// 메인 실행
for i in 0..<n {
    for j in 0..<n {
        if map[i][j] == 1 {
            count = 0 // count 초기화
            dfs(i, j) // dfs 호출
            block.append(count) // block 배열에 방금 구한 단지 크기 추가
        }
    }
}

print(block.count)
print(block.sorted().map({String($0)}).joined(separator: "\n"))
