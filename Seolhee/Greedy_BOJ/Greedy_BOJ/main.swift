// BOJ #1700 멀티탭 스케줄링
//
// 예외가 끊임없네; 다시풀래ㅜ

import Foundation

let info = readLine()!.split(separator: " ").map({Int(String($0))!})
var use = readLine()!.split(separator: " ").map({Int(String($0))!})
var multitap = [Int]()
var wait1 = [Int]()
var wait2 = [Int]()
var answer = 0

use.reverse()

while multitap.count < info[0] {
    if !multitap.contains(use.last!) { multitap.append(use.removeLast()) }
    else { use.removeLast() }
    if use.count == 0 { break }
}

print(multitap)

while true {
    if multitap.count >= info[1] || use.isEmpty { break }
    
    if !multitap.contains(use.last!) {
        if !wait2.contains(use.last!) { wait2.append(use.removeLast()) }
        else { use.removeLast() }
    }
    else if multitap.contains(use.last!) {
        if !wait1.contains(use.last!) { wait1.append(use.removeLast()) }
        else { use.removeLast() }
    }
    if use.isEmpty { answer += wait2.count; break }
    
    if wait1.count + wait2.count == multitap.count {
        answer += wait2.count
        wait1 = wait1 + wait2
        for i in 0..<multitap.count {
            multitap[i] = wait1[i]
        }
        wait1 = []
        wait2 = []
    }
}

print(answer)
