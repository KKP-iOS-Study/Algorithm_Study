//
//  main.swift
//  Solved_Class3
//
//  Created by 강호성 on 2021/12/08.
//

//R(뒤집기)
//- 배열에 있는 숫자의 순서를 뒤집는 함수
//- R이 나왔을 때, 실제로 뒤집으면 시간초과
//
//D(버리기)
//- 첫 번째 숫자를 버리는 함수 (배열이 비어있는데 D를 사용한 경우에는 에러)
//- R을 뒤집지 않았으므로, Bool값으로 파악

for _ in 0..<Int(readLine()!)! {
    let function = readLine()!.map { String($0) }
    var first = 0, last = Int(readLine()!)!

    var input = readLine()!
    input.removeFirst(); input.removeLast()
    let arr = input.split(separator: ",")

    var filpOver = true

    for i in function {
        if i == "R" {
            filpOver.toggle()

        } else if i == "D" {
            // 처음엔 arr의 인덱스를 Bool값에 따라 remove해줬는데 시간초과
            // 그래서 arr에서 출력한만큼의 범위를 구해줌
            if filpOver {
                first += 1
            } else {
                last -= 1
            }

            if arr.isEmpty { break }
        }
    }
    
    // first가 크다는건, 배열이 비었다는 것이므로 error
    if first > last {
        print("error")
    } else {
        let ansArr = arr[first..<last]
        filpOver ? print("[\(ansArr.joined(separator: ","))]") : print("[\(ansArr.reversed().joined(separator: ","))]")
    }
}

