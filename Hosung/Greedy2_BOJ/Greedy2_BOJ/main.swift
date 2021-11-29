//
//  main.swift
//  Greedy2_BOJ
//
//  Created by 강호성 on 2021/11/29.
//

let N = Int(readLine()!)!

// 30의 배수 = 30으로 나눴을 때 나머지가 0
// 주어진 N에서 숫자 조합
// 모든 숫자조합을 찾으면 당연히 시간초과
// 30의 배수이면 맨뒷자리는 무조건 0
// while문으로 모든 숫자중 제일 큰수부터 나열해서 대입했을때 30의 배수이면 break

print(String(N))


