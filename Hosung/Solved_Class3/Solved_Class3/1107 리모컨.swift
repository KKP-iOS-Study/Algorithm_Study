//
//  main.swift
//  Solved_Class3
//
//  Created by 강호성 on 2021/12/05.
//

// 숫자 입력이 끝난 후 연산자 (연산자 다음에 숫자는 연산자를 누른 횟수가 무의미)

let N = Int(readLine()!)! // 이동하려는 채널
let M = Int(readLine()!)! // 고장난 버튼의 개수
var broken = [Character]()
let startNum = 100
var ans = abs(N-startNum) // N이 100이면 0이 출력된다.

// 고장난 버튼이 있으면
if M != 0 {
    broken = readLine()!.split(separator: " ").map{Character(String($0))}
    
    // 버튼이 다 고장났으면
    if M == 10 {
        print(ans) // 오로지 +,- 누른 횟수
    } else {
        var check = 0 // 고장난 버튼 체크
        var max = 1000000 // 임의로 지정한 최댓수
        
        for channel in 0..<1000000 { // 브루트포스로 전체 채널 탐색
            check = 0 // 초기화
            let channelNumArray = Array(String(channel)) // 채널의 각 번호를 배열로 담기
            
            for num in channelNumArray { // 해당 배열의 인덱스가 고장난 버튼에 포함이 되면 체크하고 break
                if broken.contains(num) {
                    check = 1; break
                }
            }
            
            // 고장이 안난 버튼들 중에서
            if check == 0 {
                let pressedCnt = String(channel).count // 고장나지 않은 번호로 버튼을 누른 횟수
                let press = abs(channel-N) // 숫자입력이 끝난 후 눌러야하는 +,- 횟수
                
                // ex) pressedCnt(4) + press(2) -> 5455(4)++(2) 또는 5459--
                max = min(max, pressedCnt + press)
            }
        }
        print(min(ans, max))
    }
} else { // 고장난 버튼이 없으면
    print(min(ans, String(N).count))
}




