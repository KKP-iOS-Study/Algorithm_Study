// BOJ #1149 RGB거리
/*
 1, 2, 3 이 있을 때.
 1을 골랐다고 치면 그 전 집은 2나 3으로 칠했다는 전제가 생김
 따라서 1을 골랐다고 치는 배열에는, 이전 집의 2를 골랐다고 치는 배열과 3을 골랐다고 치는 배열의 최솟값을 더해줌
 이걸 반복!..!!
 
 근데 맨 첨에는 이게 불가능하니까
 그냥 각 배열에 해당 색깔 값을 그대로 넣어줌
 그리고 그 다음부터 위에서 설명한 반복 고고
 
 #2579 문제랑 완전 유사!@!@
 */

let n = Int(readLine()!)!
var red = Array(repeating: 0, count: n)
var green = Array(repeating: 0, count: n)
var blue = Array(repeating: 0, count: n)

for i in 0..<n {
    let now = readLine()!.split(separator: " ").map({Int(String($0))!})
    
    if i == 0 {
        red[0] = now[0]
        green[0] = now[1]
        blue[0] = now[2]
    }
    else {
        red[i] = min(green[i-1], blue[i-1]) + now[0]
        green[i] = min(red[i-1], blue[i-1]) + now[1]
        blue[i] = min(red[i-1], green[i-1]) + now[2]
    }
}

print(min(red.last!, green.last!, blue.last!))


