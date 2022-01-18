// BOJ 14500 테트로미노
/*
let input = readLine()!.split(separator: " ").map({Int(String($0))!})
let n = input[0]
let m = input[1]
var paper = [[Int]]()
var check = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var result = 0

for _ in 0..<n {
    paper.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
}

let d: [(x: Int, y: Int)] = [(-1, 0), (0, -1), (1, 0), (0, 1)]
let d2: [[(x: Int, y: Int)]] = [[(0, 0), (0, 1), (0, 2), (1, 1)],
          [(0, 0), (1, 0), (2, 0), (1, 1)],
          [(0, 0), (0, 1), (0, 2), (-1, 1)],
          [(0, 0), (0, 1), (-1, 1), (1, 1)]]

func dfs(_ x: Int, _ y: Int, _ count: Int, _ sum: Int) {
    if count == 4 { result = max(result, sum); return }
    
    for i in 0..<4 {
        let nx = x + d[i].x
        let ny = y + d[i].y
        guard 0 <= nx && nx < n && 0 <= ny && ny < m else { continue }
        if check[nx][ny] == true { break }
        check[nx][ny] = true
        dfs(nx, ny, count+1, sum+paper[nx][ny])
        check[nx][ny] = false
    }
}

func checkSpecial(_ x: Int, _ y: Int) {
    for i in 0..<4 {
        var sum = 0
        var success = true
        
        for j in 0..<4 {
            let nx = x + d2[i][j].x
            let ny = y + d2[i][j].y
            guard 0 <= nx && nx < n && 0 < ny && ny < m else { success = false; break }
            sum += paper[nx][ny]
        }
        
        if success == true { result = max(result, sum) }
    }
}

for x in 0..<n {
    for y in 0..<m {
        check[x][y] = true
        dfs(x, y, 0, 0)
        check[x][y] = false
        checkSpecial(x, y)
    }
}

print(result)
*/
