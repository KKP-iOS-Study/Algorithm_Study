// BOJ #9019 DSLR
//
// 처음엔 명령어 실행 시
// bfs.append((start*2%10000, result*10+1)) 이 부분을
// bfs.append((start*2%10000, result+"D")) 이렇게 직접 문자열로 추가했는데,
// 문자열로 바로바로 추가 시 시간 초과 나므로 D, S, L, R을 순서대로 1, 2, 3, 4로 쳐서 숫자로 명령어를 추가해주고,
// 목표 값을 만드는데에 성공하면 그 때 그 숫자를 문자열 명령어로 변환해주어서 해결했음.

let T = Int(readLine()!)!
for _ in 0..<T {
    let now = readLine()!.split(separator: " ").map({Int(String($0))!})
    var visited = Array(repeating: 0, count: 100000) // 해당 수를 결과로 하는 연산을 한 적이 있다면 1, 없다면 0을 저장 (같은 연산 반복하지 않도록 하기 위함)
    var bfs = [(Int, Int)]() // (연산된 값, 해당 값을 만든 누적 명령어)
    var index = 0
    
    bfs.append((now[0], 0))
    
    while true {
        let start = bfs[index].0 // 주어진 연산 시작 값
        let target = now[1] // 만들고자 하는 목표 값
        let result = bfs[index].1 // 명령어 누적 값
        
        // 목표 달성 시 결과 출력
        if start == target {
            var answer = ""
            for i in String(result) {
                if i == "1" { answer += "D" }
                else if i == "2" { answer += "S" }
                else if i == "3" { answer += "L" }
                else { answer += "R" }
            }
            print(answer)
            break
        }
        
        index += 1
        
        // D 명령어 실행
        if visited[start*2%10000] == 0 {
            visited[start*2%10000] = 1
            bfs.append((start*2%10000, result*10+1))
        }
        
        // S 명령어 실행
        if start == 0 && visited[9999] == 0 {
            visited[9999] = 1
            bfs.append((9999, result*10+2))
        }
        if start != 0 && visited[start-1] == 0 {
            visited[start-1] = 1
            bfs.append((start-1, result*10+2))
        }
        
        // L 명령어 실행
        if visited[(start%1000)*10+start/1000] == 0 {
            visited[(start%1000)*10+start/1000] = 1
            bfs.append(((start%1000)*10+start/1000, result*10+3))
        }
        
        // R 명령어 실행
        if visited[(start%10)*1000+start/10] == 0 {
            visited[(start%10)*1000+start/10] = 1
            bfs.append(((start%10)*1000+start/10, result*10+4))
        }
    }
}
