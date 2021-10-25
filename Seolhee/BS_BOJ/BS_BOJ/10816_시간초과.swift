// BOJ #10816 숫자 카드 2
//
// 시간 초과

let N = Int(readLine()!)!
var cards = readLine()!.split(separator: " ").map({Int(String($0))!})
let M = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map({Int(String($0))!})
var result = [Int]()

cards.sort()

for i in nums {
    if i < cards.first! || i > cards.last! { result.append(0) } // 예외
    else {
        var start = 0
        var end = N
        var count = 0
        
        while start <= end {
            let mid = (start + end) / 2 // 중간 값 정의
            
            if cards[mid] == i {
                count += 1
                
                if mid > 0 {
                    var pre = mid - 1
                    while cards[pre] == i {
                        count += 1
                        pre -= 1
                        if pre < 0 { break }
                    }
                }
                
                if mid < N-1 {
                    var next = mid + 1
                    
                    while cards[next] == i {
                        count += 1
                        next += 1
                        if next == N { break }
                    }
                }
                
                break
            }
            
            else if cards[mid] < i { start = mid + 1 }
            else { end = mid - 1 }
        }
        
        result.append(count)
    }
}

print(result.map({String($0)}).joined(separator: " "))

/*
let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map({Int(String($0))!})
let M = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map({Int(String($0))!})
var result = [Int]()

A.sort()

for i in nums {
    if i < A.first! || i > A.last! { print(0) }
    else {
        var start = 0
        var end = N
        var check = false
        
        while start <= end {
            let mid = (start + end) / 2
            
            if A[mid] == i {
                result.append(A.lastIndex(of: i)! - A.firstIndex(of: i)! + 1)
                check = true
                break
            }
            else if A[mid] < i { start = mid + 1 }
            else { end = mid - 1 }
        }
        
        if check == false { result.append(0) }
    }
}

print(result.map({String($0)}).joined(separator: " "))
*/
