// BOJ #13300

import Foundation

let info = readLine()!.components(separatedBy: " ").map({Int($0)!})

var stuInfo = Array(repeating: Array(repeating: 0, count: 2), count: 6)
var result = 0

for _ in 0..<info[0] {
    let stu = readLine()!.components(separatedBy: " ").map({Int($0)!})
    stuInfo[stu[1]-1][stu[0]] += 1
}

for i in 0..<stuInfo.count {
    if stuInfo[i][0] % info[1] == 0 { result += stuInfo[i][0] / info[1] }
    else { result += (stuInfo[i][0] / info[1]) + 1 }
    
    if stuInfo[i][1] % info[1] == 0 { result += stuInfo[i][1] / info[1] }
    else { result += (stuInfo[i][1] / info[1]) + 1 }
}

print(result)
