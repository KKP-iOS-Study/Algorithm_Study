// BOJ #1874 스택 수열
//
// 진짜 문제 그대로 정직하게 풀었더니 시간초과.

import Foundation

let n = Int(readLine()!)!

var nums = [Int]() // 지금까지 입력된 숫자들 순서대로 저장
var stack = [Int]() // 스택
var result = [String]() // 결과 (push, pop 순서대로 저장)
var answer = ""

for i in 0..<n {
    let num = Int(readLine()!)!
    
    // 수열 첫 번째 수
    if i == 0 {
        for i in 1...num {
            stack.append(i)
            result.append("+")
        }
        nums.append(stack.removeLast())
        result.append("-")
    }
    
    // 수열 두 번째 ~ 마지막 수
    else
    {
        if num < nums[nums.count-1] && num != stack[stack.count-1] {
            answer = "NO"
            break
        }
        else {
            if stack.contains(num) {
                nums.append(stack.removeLast())
                result.append("-")
            }
            else {
                if nums.max()! == n {
                    nums.append(stack.removeLast())
                    result.append("-")
                }
                else {
                    for i in (nums.max()! + 1)...num {
                        stack.append(i)
                        result.append("+")
                    }
                    nums.append(stack.removeLast())
                    result.append("-")
                }
            }
        }
    }
    
    if stack.isEmpty { answer = result.joined(separator: "\n") }
}

print(answer)
