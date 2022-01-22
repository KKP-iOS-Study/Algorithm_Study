// BOJ #10026 적록색약

let n = Int(readLine()!)!
var picture = [[Character]]()
var check = Array(repeating: Array(repeating: 0, count: n), count: n)

for _ in 0..<n { picture.append(Array(readLine()!)) }

func dfs(_ x: Int, _ y: Int) {
    if x < 0 || y < 0 || x >= n || y >= n || check[x][y] == 1 { return } // 예외
    
    check[x][y] = 1 // 이미 체크한 자리 표시해서 중복 피하기
    
    // 재귀 호출
    dfs(x+1, y)
    dfs(x-1, y)
    dfs(x, y+1)
    dfs(x, y-1)
}

