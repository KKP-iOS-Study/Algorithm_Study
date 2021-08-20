// BOJ #1700 멀티탭 스케줄링
//
// while true
//
// if 멀티탭에 빈 공간이 있을 경우, 해당 순서 물건이 이미 멀티탭에 꽂혀 있다면 그냥 use에서 삭제
// 해당 순서 물건이 멀티탭에 꽂혀있지 않을 경우에는 use에서 삭제함과 동시에 multitap 배열에 추가
//
// else 멀티탭에 빈 공간이 없을 경우, 멀티탭에 해당 순서 물건이 이미 존재하는지 확인.
// 이미 존재한다면 그냥 use에서 삭제
// 존재하지 않는다면 multitap에 꽂혀 있는 물건들 중 use에 존재하는 것이 있는지, 존재한다면 몇 번째에 존재하는지 확인.
// multitap에는 꽂혀있는데, use에는 꽂혀있지 않은 물건이 있다면! 바로 그 자리에 새로운 순서 물건을 꽂아주기.
// multitap에 꽂혀있는 물건들이 전부 use에 존재하지 않는다면, 첫 번째 자리에 새로운 순서 물건 꽂아주기.
// multitap에 꽂혀있는 물건들이 전부 use에 존재한다면, 그 중 가장 늦게 사용할 물건이 있는 자리에 새로운 순서 물건 꽂아주기.

import Foundation

let info = readLine()!.split(separator: " ").map({Int(String($0))!})
var use = readLine()!.split(separator: " ").map({Int(String($0))!}) // 사용 순서 대기열
var multitap = Array(repeating: 0, count: info[0]) // 구 개수만큼 0으로 채운 멀티탭 배열
var answer = 0

use.reverse() // 순서 지난것을 앞에서부터 빼주면 너무 비효율적 -> 반대로 돌려서 뒤부터 삭제하며 진행하기 위함

while use.count > 0 {
    // 멀티탭에 빈 공간이 있을 경우
    if multitap.contains(0) {
        if multitap.contains(use.last!) { use.removeLast() } // 멀티탭에 이미 그 물건이 있다면 그냥 use에서 삭제
        else { multitap[multitap.firstIndex(of: 0)!] = use.removeLast() } // 없다면 빈 자리에 해당 물건 꽂기
    }
    // 멀티탭에 빈 공간 없을 경우
    else {
        if multitap.contains(use.last!) { use.removeLast() } // 멀티탭에 이미 그 물건이 있다면 그냥 use에서 삭제
        else {
            var min = use.count
            var check = 0
            for j in multitap {
                if !use.contains(j) { check = j; break }
                else if use.lastIndex(of: j)! < min { min = use.lastIndex(of: j)! }
            }
            // 멀티탭에 꽂혀있는 물건들 모두 use에 존재하지 않는다면, muititap 첫 번째 자리에 꽂기
            if min == use.count { multitap[0] = use.removeLast() }
            // 멀티탭에 꽂혀있는 물건들 중 use에 존재하지 않는 물건이 있다면, multitap의 해당 물건이 자리에 순서가 온 물건 꽂아주기
            else if check != 0 { multitap[multitap.firstIndex(of: check)!] = use.removeLast() }
            // 멀티탭에 있는 물건들 전부가 use에 존재한다면, 그 중 가장 순서가 늦게 오는 물건이 위치한 자리에 순서가 온 물건 꽂아주기
            else { multitap[multitap.firstIndex(of: use[min])!] = use.removeLast() }
            answer += 1
        }
    }
}

print(answer)
