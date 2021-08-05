// BOJ #6198 옥상 정원 꾸미기
import Foundation

let count = Int(readLine()!)!
var result = 0
var stack = [Int]()

for i in 0..<count {
    let h = Int(readLine()!)!
    
    if stack.isEmpty {
        stack.append(h)
    }
    else {
        if stack[stack.count-1] > h {
            stack.append(h)
        }
        else {
            while stack[stack.count-1] <= h {
                stack.removeLast()
                result += stack.count
                if stack.isEmpty { break }
            }
            stack.append(h)
        }
    }
    
    if i == count-1 && stack.count > 1 {
        for _ in 0..<stack.count-1 {
            stack.removeLast()
            result += stack.count
        }
    }
}

print(result)
