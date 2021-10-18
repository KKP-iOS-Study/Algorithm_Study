// BOJ #2583 영역 구하기
/*
 dfs 탐색 전, 미리 직사각형을 그려주고
 #1926 그림 문제처럼 직사각형이 그려지지 않은 부분들의 넓이를 찾아주면 될듯!
 */

let info = readLine()!.split(separator: " ").map({Int(String($0))!})
let m = info[0]
let n = info[1]
let k = info[2]
var paper = Array(repeating: Array(repeating: 0, count: n), count: m)
var area = [Int]()
var area_tmp = 0

// 직사각형들 그려주기
for _ in 0..<k {
    let draw = readLine()!.split(separator: " ").map({Int(String($0))!}) // 직사각형 좌표
    
    for i in draw[0]..<draw[2] {
        for j in draw[1]..<draw[3] {
            paper[j][i] += 1
        }
    }
}

// dfs 재귀함수
func dfs(_ x: Int, _ y: Int) {
    // x와 z가 종이 크기 안에 해당하지 않거나, 0이 아닐 경우에 함수 종료
    if x < 0 || x >= m || y < 0 || y >= n || paper[x][y] != 0 { return }
    
    paper[x][y] = 1 // 이미 체크한 자리는 1로 바꿔주기 (중복으로 같은 영역을 확인하지 않기 위해서!)
    area_tmp += 1 // area_tmp 1 증가시켜주기
    
    // 재귀 호출 (현재 자리와 붙어있는 주변 모든 자리 확인)
    dfs(x+1, y) // 세로로 다음 자리
    dfs(x-1, y) // 세로로 전 자리
    dfs(x, y+1) // 가로로 다음 자리
    dfs(x, y-1) // 가로로 전 자리
}

// 메인 실행문
for i in 0..<n {
    for j in 0..<m {
        if paper[j][i] == 0 {
            area_tmp = 0 // dfs 함수를 통해서 하나의 영역 넓이를 구하기 위해 area_tmp 변수 초기화
            dfs(j, i)
            area.append(area_tmp) // 구한 영역의 넓이를 area 배열에 추가
        }
    }
}

print(area.count)
print(area.sorted().map({String($0)}).joined(separator: " "))
