//
//  main.swift
//  Queue_BOJ
//
//  Created by 강호성 on 2021/08/12.
//

let N = Int(readLine()!)!
var queue = [Int]()

for i in 1...N {
    queue.append(i)
}

while true {

    if queue.count == 1 {
        break
    }
    
    // 홀수번째 인덱스를 제거한 임시 배열
    var tmp = queue.enumerated().filter { $0.offset % 2 != 0 }.map { $0.element }
    
    if queue.count % 2 != 0 {
        let front = tmp.removeFirst()
        tmp.append(front)
    }
    queue = tmp
}

print(queue[0])


// 시간 초과,,

//let N = Int(readLine()!)!
//var queue = [Int]()
//
//for i in 1...N {
//    queue.append(i)
//}
//
//// 홀수 제거
//for j in queue {
//    if j % 2 != 0 {
//        queue.remove(at: queue.firstIndex(of: j)!)
//    }
//}
//
//while true {
//
//    if queue.count == 1 {
//        break
//    }
//    queue.removeFirst()
//    queue.append(queue.removeFirst())
//}
//
//print(queue[0])
