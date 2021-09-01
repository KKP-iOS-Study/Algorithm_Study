// BOJ #2457 공주님의 정원

import Foundation

let n = Int(readLine()!)!
var flowers = [[Int]]()

// 꽃이 피고 지는 시기들을 입력받는 반복문
for _ in 0..<n {
    let tmp = readLine()!.split(separator: " ").map{Int(String($0))!}
    let s = tmp[0] * 100 + tmp[1] // 피는 시기
    let e = tmp[2] * 100 + tmp[3] // 지는 시기
    
    // 지는 시기가 301 이후일 경우 (이전일 경우는 아예 입력도 받지 않기 위함)
    if e >= 301 {
        if s <= 301 { flowers.append([301, e]) } // 피는 시기가 301 이전일 경우, 피는 시기를 301로 바꿔줌
        else { flowers.append([s, e]) } // 피는 시기가 301 이후일 경우에는 그대로!
    }
}

flowers.sort(by: {$0[0] < $1[0]}) // 피는 시기를 기준으로 오름차순 정렬

var start = 301 // 꽃이 피어야 하는 시기를 저장하기 위한 변수
var max = 0 // 선택한 꽃들 중 가장 늦게 지는 시기를 저장하기 위한 변수
var answer = 0 // 선택한 꽃의 개수를 카운트하는 변수

// 입력받은 꽃들을 차례대로 검사하며 꽃 선택
for i in 0..<n {
    // 입력받은 꽃의 개수가 1개 이하일 경우
    if flowers.count <= 1 {
        if flowers.count == 0 { break } // 0개일 경우엔 바로 break
        else {
            // 피는 시기가 301, 지는 시기는 1130 이후면 성공이므로 answer에 1 저장 후 break
            if flowers[0][0] == 301 && flowers[0][1] > 1130 { answer = 1; break }
            else { break } // 그렇지 않을 경우 분명 빈 기간이 존재하게 되므로 바로 break
        }
    }
    
    // 꽃이 피는 시기가 start 이전일 경우 (첫 반복에서는 start == 301, 이후로는 상황에 맞게 업데이트)
    if flowers[i][0] <= start {
        if flowers[i][1] > max { max = flowers[i][1] } // 끝나는 시기가 max보다 클 경우 max 업데이트
        
        // 마지막 반복일 경우
        if i == n-1 {
            if max > 1130 { answer += 1; break } // max가 1130보다 크다면 모든 기간을 채웠다는 의미이므로 answer += 1 해주고 반복 종료
            else { answer = 0; break } // max가 1130보다 작다면 기간을 끝까지 채우지 못했다는 의미이므로 answer를 0으로 초기화, 반복 종료
        }
        
        // 다음 꽃의 시작 시기가 start 이후일 경우, 시행되어야 할 업데이트
        else if flowers[i+1][0] > start {
            answer += 1 // 꽃 개수 카운트
            start = max // start를 max로 업데이트 (다음번에 올 꽃의 지는 시기는 최소한 max보다는 클 예정이므로 max는 업데이트할 필요x)
            if start > 1130 { break } // start가 1130보다 커졌다면 더이상 반복할 필요x, 반복 종료
        }
    }
    
    // 꽃이 피는 시기가 start 이후일 경우, 중간에 비는 기간이 생긴다는 의미이므로 answer를 0으로 초기화, 반복 종료
    else { answer = 0; break }
}

print(answer)
