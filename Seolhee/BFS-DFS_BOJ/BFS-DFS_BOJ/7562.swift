// BOJ #7562 나이트의 이동
/*
 이건 굳이 따로 재귀함수 작성할 필요 없이 그냥 반복문으로,,! 작성하면 될듯
 index 사용해서 while 반복하고, 큐에 탐색할 자리 추가해주면서 큐 빌때까지 반복
 */

let cases = Int(readLine()!)!
var dx = [-2, -1, 1, 2, 2, 1, -1, -2], dy = [1, 2, 2, 1, -1, -2, -2, -1] // 나이트의 이동을 위한 좌표값 변화량
var result = [Int]()

// 입력된 테스트 케이스의 수 만큼 반복
for _ in 0..<cases {
    let n = Int(readLine()!)! // 체스 보드 한 변의 길이
    let start = readLine()!.split(separator: " ").map({Int(String($0))!}) // 시작점
    let target = readLine()!.split(separator: " ").map({Int(String($0))!}) // 목적지
    
    if (start[0], start[1]) == (target[0], target[1]) { result.append(0) } // 처음부터 시작점과 목적지가 같을 경우 바로 result에 0추가
    else {
        let target_check = (target[0], target[1]) // 목적지를 튜플로 생성
        var queue = [(start[0], start[1])] // 큐 생성, 시작점을 튜플로 만들어서 넣어주기
        var board = Array(repeating: Array(repeating: 0, count: n), count: n) // 경로마다 걸린 시간을 누적해주면서 체크하기 위한 보드 배열
        var arrive = 0 // 목적지에 도착했는지 안했는지 체크하기 위함 (0이면 도착x)
        
        var index = 0
        while !queue.isEmpty {
            let (x, y) = queue[index]
            index += 1
            
            // 나이트가 움직일 수 있는 8가지 경로를 탐색해주기 위해 8번 반복
            for i in 0..<8 {
                let dx = x + dx[i]
                let dy = y + dy[i]
                
                // 예외 - 보드 바깥으로 넘어가거나, 해당 자리가 0이 아닐 경우 continue (0이 아니라면 중복검사하는게 되므로)
                if dx < 0 || dy < 0 || dx >= n || dy >= n || board[dx][dy] != 0 { continue }

                board[dx][dy] = board[x][y] + 1 // 해당 자리까지 걸린 시간 누적
                
                if target_check == (dx, dy) { arrive = board[dx][dy]; break } // 탐색한 자리가 목적지와 같을 경우 arrive에 누적값 넣고 끝!
                queue.append((dx, dy)) // 아닐 경우 큐에 추가
            }
            
            if arrive != 0 { result.append(arrive); break } // arrive가 0이 아닐 경우 목적지에 도착했다는 뜻이므로 redsult에 해당 값을 추가하고 끝!
        }
    }
}

print(result.map({String($0)}).joined(separator: "\n"))
