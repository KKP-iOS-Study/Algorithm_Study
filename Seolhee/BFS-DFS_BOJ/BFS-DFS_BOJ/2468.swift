// BOJ #2468 안전 영역
/*
 일단 최댓값 변수, 그러니까 결과로 출력할 변수에 1을 넣어줌. 왜냐면 아무리 못해도 1은 되니까.
 그리고 모든 지점을 돌면서 지점들이 가진 높이들을 검사해서 중복 없게 배열에 넣어줌
 그담에 그 배열길이만큼 반복
 가장 낮은 수부터 시작해서 비가 해당 높이만큼 왔을 때 영역의 크기 구해주기.
 */

let n = Int(readLine()!)!
var area = [[Int]]() // 주어진 지역의 높이정보 담을 2차원 배열
var heights = [Int]() // 주어진 지역의 각 지점들의 높이들을 중복없이 담을 배열

for _ in 0..<n {
    area.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    for i in 0..<n {
        // heights 배열에 입력된 지점의 높이가 저장되어있지 않을 경우, heights 배열에 높이 추가!
        if !heights.contains(area[area.count-1][i]) { heights.append(area[area.count-1][i]) }
    }
}

heights.sort() // heights 오름차순 정렬

var count = 0 // 강수량 별 안전영역의 개수 세기 위한 변수
var max = 1 // 최대 안전 영역의 개수를 담기 위한 변수 (아무 지점도 잠기지 않았을 때 안전 영역은 1이므로 처음부터 1로 설정해놓고 시작)
let area_fix = area // area 배열 값을 변경시키면서 dfs 함수를 돌릴 예정이므로, 중간중간 area를 다시 초깃값으로 설정해주기위해 저장해놓음.

// dfs 함수
func dfs(_ x: Int, _ y: Int, _ now_h: Int) {
    if x < 0 || y < 0 || x >= n || y >= n || area[x][y] <= now_h { return } // 예외
    
    area[x][y] = now_h // 이미 체크한 자리는 현재 비의 높이와 동일하게 바꿔주기 (안전 영역에서 제외시킴으로써 중복 피하기 위함)
    
    // 재귀 호출
    dfs(x+1, y, now_h)
    dfs(x-1, y, now_h)
    dfs(x, y+1, now_h)
    dfs(x, y-1, now_h)
}

// 메인 실행문
for i in heights {
    let h = i // 현재 반복에서 확인할 비의 높이
    
    for x in 0..<n {
        for y in 0..<n {
            if area[x][y] > h { // 현재 지점이 비의 높이보다 높을 경우 (안전 영역에 해당하는 경우)
                count += 1 // 안전 영역의 넓이와는 관계 없이, 일단 하나의 안전 영역 확보했으므로 1 카운트
                dfs(x, y, h)
            }
        }
    }
    
    if max < count { max = count } // 지금까지 구한 최대 안전 영역 개수보다, 현재 비 높이에서의 안전 영역의 개수가 더 많으면 max 업데이트
    count = 0 // 카운트 초기화 (다음 비 높이에서의 안전 영역 개수를 새롭게 구하기 위함)
    area = area_fix // dfs 함수에서 중복 피하기 위해 배열의 요소들을 변경하면서 탐색했으므로, 다시 원상복귀!
}

print(max)
