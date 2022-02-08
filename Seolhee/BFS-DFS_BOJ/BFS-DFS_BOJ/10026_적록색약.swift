// BOJ #10026 적록색약
//
// dfs 문제
// 1차로 적록색약이 아닌 사람의 시선으로 dfs를 한 번 돌리고, 2차로 적록색약의 시선으로 dfs 한 번 더 돌리기 !
//
// picture을 var로 두고, dfs를 통해서 체크가 완료된 자리는 다른 알파벳으로 변경해서 중복된 체크를 피해주었음
// 근데 여기서 포인트는, R과 G의 경우 "s", B의 경우 "c"로 변경해주었다.
// R과 G의 경우 적록색약인 사람은 구분할 수 없기 때문에 2차로 체크할 때 같은 색으로 구분하기 위함이다.
// 이렇게 1차 체크를 끝내면, picture 배열이 "s"혹은 "c" 두 가지 알파벳으로 채워져있을테고
// "s" 영역과 "c" 영역으로 구분하여 영역의 개수를 구해주면 된다.

let n = Int(readLine()!)!
var picture = [[Character]]()
var count = 0
var count2 = 0

for _ in 0..<n { picture.append(Array(readLine()!)) }

func dfs(_ x: Int, _ y: Int, _ mark: Character, _ color: Character) {
    if x < 0 || y < 0 || x >= n || y >= n || picture[x][y] == mark || picture[x][y] != color { return } // 예외
    
    picture[x][y] = mark // 이미 체크한 자리 표시해서 중복 피하기
    
    // 재귀 호출
    dfs(x+1, y, mark, color)
    dfs(x-1, y, mark, color)
    dfs(x, y+1, mark, color)
    dfs(x, y-1, mark, color)
}

// 적록색약 아닌 사람 (1차)
for i in 0..<n {
    for j in 0..<n {
        if picture[i][j] == "c" || picture[i][j] == "s" { continue }
        else {
            if picture[i][j] == "R" { dfs(i, j, "s", "R") }
            else if picture[i][j] == "G" { dfs(i, j, "s", "G") }
            else if picture[i][j] == "B" { dfs(i, j, "c", "B") }
            count += 1
        }
    }
}

// 적록색약인 사람 (2차)
for i in 0..<n {
    for j in 0..<n {
        if picture[i][j] == "f" { continue }
        else {
            if picture[i][j] == "s" { dfs(i, j, "f", "s") }
            else if picture[i][j] == "c" { dfs(i, j, "f", "c") }
            count2 += 1
        }
    }
}

print(String(count) + " " + String(count2))
