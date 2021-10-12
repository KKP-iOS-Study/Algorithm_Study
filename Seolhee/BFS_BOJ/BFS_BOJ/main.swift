// BOJ #2468 안전 영역
/*
 어렵네
 일단..
 일단 최댓값 변수, 그러니까 결과로 출력할 변수에 1을 넣어줌. 왜냐면 아무리 못해도 1은 되니까.
 그리고 모든 지점을 돌면서 지점들이 가진 높이들을 검사해서 중복 없게 배열에 넣어줌
 그담에 그 배열길이만큼 반복
 가장 낮은 수부터 시작해서 비가 해당 높이만큼 왔을 때 영역의 크기 구해주기.
 */

let n = Int(readLine()!)!
var area = [[Int]]()
var heights = [Int]()

for _ in 0..<n {
    area.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    for i in 0..<n {
        if !heights.contains(area[area.count-1][i]) { heights.append(area[area.count-1][i]) }
    }
}

heights.sort()

var count = 0
var max = 1
let area_fix = area

func bfs(_ x: Int, _ y: Int, _ now_h: Int) {
    if x < 0 || y < 0 || x >= n || y >= n || area[x][y] <= now_h { return }
    
    area[x][y] = now_h
    
    // 재귀 호출
    bfs(x+1, y, now_h)
    bfs(x-1, y, now_h)
    bfs(x, y+1, now_h)
    bfs(x, y-1, now_h)
}

for i in heights {
    let h = i
    
    for x in 0..<n {
        for y in 0..<n {
            if area[x][y] > h {
                count += 1
                bfs(x, y, h)
            }
        }
    }
    
    if max < count { max = count }
    count = 0
    area = area_fix
}

print(max)
