// BOJ #2493 탑
// 호성님 코드 리뷰

import Foundation

let N = Int(readLine()!)!
let topHeight = readLine()!.split(separator: " ").map{Int($0)!}
var res = [Int](repeating: 0, count: N)
var stack = [Int]()

stack.append(topHeight[0])

for i in 1..<N {
    if topHeight[i] > stack[stack.count-1] {
        
        // 호성님 원 코드에서 반복문 방향만 반대로 바꿔준 코드
        for j in (0..<stack.count).reversed() {
            if topHeight[i] < stack[j] && i > 1 {
                res[i] = topHeight.firstIndex(of: stack[j])! + 1
            }
        }
        
        stack.append(topHeight[i])
        
        // 호성님 원래 코드
//        for j in stack {
//            if topHeight[i] < j && i > 1 {
//                res[i] = topHeight.firstIndex(of: j)! + 1
//            }
//        }
        // 호성님은 스택에 쌓인 마지막 수보다 현재 입력 수가 크면 계속 쌓고,
        // 쌓인 스택에서 처음부터 확인하여 현재 입력된 탑의 높이가 더 작아지면
        // topHeight에서 해당 인덱스를 찾아 res에 더해줌.
        // -> 검사 횟수가 너무 많아짐.
        //
        // + 근데 처음부터 확인하면,, 예를 들어 탑이 5 4 7 3 일 경우, 3은 7에 레이저를 쏘는데 이미 5, 4 모두 3보다 큼.
        // 그럼 이 때 if문에 걸려서 잘못된 인덱스가 res에 더해질 것 같은데,, 내가 잘못이해했나ㅜ
        // 내가 잘 이해한거라면,, for문을 쓰더라도 앞이 아니라 뒤부터 stack을 검사해줘야 할 것 같음.
        
        // while문으로 바꿔본코드
//        var tmp = stack
//        while tmp[tmp.count-1] < topHeight[i] {
//            tmp.removeLast()
//            if tmp.isEmpty { break }
//        }
//        if !tmp.isEmpty { res[i] = topHeight.firstIndex(of: tmp[tmp.count-1])! + 1 }
//        stack.append(topHeight[i])
    }
    else {
        res[i] = topHeight.firstIndex(of: stack[stack.count-1])! + 1
        stack.append(topHeight[i])
    }
}

print(res.map{String($0)}.joined(separator: " "))
