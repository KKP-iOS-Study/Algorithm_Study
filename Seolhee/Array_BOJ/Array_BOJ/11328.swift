// BOJ #11328 Strfry

import Foundation

var num = Int(readLine()!)!

for _ in 0..<num {
    print(solution(readLine()!))
}

func solution(_ str: String) -> String {
    var arr = str.components(separatedBy: " ")
    
    for i in arr[1] {
        var n1 = 0
        var n2 = 0
        
        for j in arr[0] {
            if i == j { n1 += 1 }
        }
        for j in arr[1] {
            if i == j { n2 += 1  }
        }
        
        if n1 != n2 { return "Impossible" }
        else {
            arr[0] = arr[0].filter({$0 != i})
            arr[1] = arr[1].filter({$0 != i})
        }
    }
    
    return "Possible"
}


