// BOJ #11501 주식

import Foundation

var testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let day = Int(readLine()!)!
    let stocks = readLine()!.split(separator: " ").map({Int(String($0))!})
    
    var answer = 0
    var max = 0
    
    // 마지막 날부터 반대로 반복
    for i in (0..<day).reversed() {
        if max < stocks[i] { max = stocks[i] } // max보다 클 경우 max 업데이트
        else { answer += max - stocks[i] } // max보다 작을 경우 answer에 max에서 현재가를 뺀 만큼 더해줌
    }
    
    print(answer)
}
