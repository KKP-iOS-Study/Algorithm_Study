//
//  main.swift
//  Solved_Class3
//
//  Created by 강호성 on 2021/12/27.
//

// D: n*2
// S: n-1
// L: 1,2,3,4 -> 2,3,4,1
// R: 1,2,3,4 -> 4,1,2,3

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    let before = input[0], after = input[1]
    var queue = [before]
    
    var visit = [Int](repeating: -1, count: 10000)
    var idx = 0
    
    while true {
        let pop = queue[idx]
        idx += 1
        
        // D, S, L, R 연산을 하고 해당 숫자 만든 적 없으면 queue에 push, queue 빌 때까지
        if visit[D(pop)] == -1 {
            queue.append(D(pop))
            visit[D(pop)] = pop
        }
        
        if visit[S(pop)] == -1 {
            queue.append(S(pop))
            visit[S(pop)] = pop
        }
        
        if visit[L(pop)] == -1 {
            queue.append(L(pop))
            visit[L(pop)] = pop
        }
        
        if visit[R(pop)] == -1 {
            queue.append(R(pop))
            visit[R(pop)] = pop
        }
        
        // 결과값 after와 비교
        if pop == after {
            var ans = [String]()
            var tmp = after

            while tmp != before {
                let check = visit[tmp]

                if D(check) == tmp {
                    ans.append("D")
                } else if S(check) == tmp {
                    ans.append("S")
                } else if L(check) == tmp {
                    ans.append("L")
                } else if R(check) == tmp {
                    ans.append("R")
                }
                tmp = check
            }
            
            print(ans.reversed().joined())
            break
        }
    }
}

// MARK: - DSLR

func D(_ num: Int) -> Int {
    var result = num * 2
    if result > 9999 {
        result %= 10000
    }
    return result
}

func S(_ num: Int) -> Int {
    return num == 0 ? 9999 : num - 1
}

func L(_ num: Int) -> Int {
    let front = num % 1000
    let back = num / 1000
    return front * 10 + back
}

func R(_ num: Int) -> Int {
    let front = num % 10
    let back = num / 10
    return front * 1000 + back
}
