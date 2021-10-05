//
//  main.swift
//  Array_BOJ
//
//  Created by 강호성 on 2021/07/25.
//

var room = 0

// N 학생 수 -> nk[0], K 최대 인원 수 -> nk[1]
let nk = readLine()!.split(separator: " ").map{Int($0)!}

// [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
var student = Array(repeating: Array(repeating: 0, count: 2), count: 6)

for _ in 0..<nk[0] {
    // S 성별 -> sy[0], Y 학년 -> sy[1]
    let sy = readLine()!.split(separator: " ").map{Int($0)!}
    
    student[sy[1]-1][sy[0]] += 1
}

for i in 0..<student.count {
    room += student[i][0] % nk[1] == 0 ? student[i][0] / nk[1] : (student[i][0] / nk[1]) + 1
    room += student[i][1] % nk[1] == 0 ? student[i][1] / nk[1] : (student[i][1] / nk[1]) + 1
}

print(room)

