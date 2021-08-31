// BOJ #11501 주식

import Foundation

var testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let day = Int(readLine()!)!
    let stocks = readLine()!.split(separator: " ").map({Int(String($0))!})
    
    var answer = 0
    var max = 0
    
    for i in (0..<day).reversed() {
        if max < stocks[i] { max = stocks[i] }
        else { answer += max - stocks[i] }
    }
    
    print(answer)
}
