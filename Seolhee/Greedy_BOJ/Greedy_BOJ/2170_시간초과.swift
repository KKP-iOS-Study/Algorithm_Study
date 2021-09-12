// BOJ #2170 선 긋기
//
// 이것도 이게 최선같은데 한계가 있나.;

import Foundation

var N = Int(readLine()!)!
var dots = [[Int]]()

for _ in 0..<N {
    dots.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
}

if dots.count == 1 {
    print(dots[0][1] - dots[0][0])
}

else {
    dots.sort(by: { $0[0] < $1[0] })
    
    var start = [dots[0][0]]
    var end = [dots[0][1]]
    var answer = 0
    
    for i in 1..<N {
        if dots[i][0] <= end.last! {
            if dots[i][1] > end.last! {
                end.removeLast()
                end.append(dots[i][1])
            }
        }
        else {
            start.append(dots[i][0])
            end.append(dots[i][1])
        }
    }

    for i in 0..<end.count {
        answer += (end[i] - start[i])
    }

    print(answer)
}
