// BOJ 14500 테트로미노
//
// 'ㅏ' 형태의 경우만 예외로 하고, 나머지 경우는 dp로 풀어주었음 (dfs로 했을 때 시간 초과)
// dp는 check 함수의 'before' 파라미터를 통해서 중복을 피해주어 구현
// 'ㅏ'만 예외로 빼 준 이유는 'ㅏ' 모양의 경우 중복을 제외할 수 없기 때문

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0]
let m = input[1]
var paper = [[Int]]()
var result = 0

for _ in 0..<n { paper.append(readLine()!.split(separator: " ").map{Int(String($0))!}) }

func check(_ x: Int, _ y :Int, _ before: Int, _ count: Int, _ sum: Int) {
    if count == 4 { result = max(result, sum); return }

    if x-1 >= 0 && before != 1 { check(x-1, y, 2, count+1, sum+paper[x-1][y]) }
    if x+1 < n && before != 2 { check(x+1, y, 1, count+1, sum+paper[x+1][y]) }
    if y-1 >= 0 && before != 3 { check(x, y-1, 4, count+1, sum+paper[x][y-1]) }
    if y+1 < m && before != 4 { check(x, y+1, 3, count+1, sum+paper[x][y+1]) }
}

func checkSpecial(_ x: Int, _ y: Int) {
    // 'ㅗ', 'ㅜ'
    if x+1 < n && y-1 >= 0 && y+1 < m {
        result = max(result, max(paper[x][y] + paper[x+1][y-1] + paper[x+1][y] + paper[x+1][y+1], paper[x][y] + paper[x][y-1] + paper[x+1][y] + paper[x][y+1]))
    }
    
    // 'ㅏ', 'ㅓ'
    if x+2 < n && y+1 < m {
        result = max(result, max(paper[x][y] + paper[x+1][y] + paper[x+1][y+1] + paper[x+2][y], paper[x+1][y] + paper[x][y+1] + paper[x+1][y+1] + paper[x+2][y+1]))
    }
}

for i in 0..<n {
    for j in 0..<m {
        check(i, j, 0, 1, paper[i][j])
        checkSpecial(i, j)
    }
}

print(result)
