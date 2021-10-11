// BOJ #7562 나이트의 이동
/*
 이건 굳이 따로 재귀함수 작성할 필요 없이 그냥 반복문으로,,! 작성하면 될듯
 index 사용해서 while 반복하고, 큐에 탐색할 자리 추가해주면서 큐 빌때까지 반복
 */

let cases = Int(readLine()!)!
var dx = [-2, -1, 1, 2, 2, 1, -1, -2], dy = [1, 2, 2, 1, -1, -2, -2, -1]
var result = [Int]()

for _ in 0..<cases {
    let n = Int(readLine()!)!
    let start = readLine()!.split(separator: " ").map({Int(String($0))!})
    let target = readLine()!.split(separator: " ").map({Int(String($0))!})
    
    if (start[0], start[1]) == (target[0], target[1]) { result.append(0) }
    else {
        let target_check = (target[0], target[1])
        var queue = [(start[0], start[1])]
        var board = Array(repeating: Array(repeating: 0, count: n), count: n)
        var arrive = 0
        
        var index = 0
        while !queue.isEmpty {
            let (x, y) = queue[index]
            index += 1
            
            for i in 0..<8 {
                let dx = x + dx[i]
                let dy = y + dy[i]
                
                if dx < 0 || dy < 0 || dx >= n || dy >= n || board[dx][dy] != 0 { continue }
                
                board[dx][dy] = board[x][y] + 1
                
                if target_check == (dx, dy) { arrive = board[dx][dy]; break }
                
                queue.append((dx, dy))
            }
            
            if arrive != 0 { result.append(arrive); break }
        }
    }
}

print(result.map({String($0)}).joined(separator: "\n"))
