//
//  2164-카드.swift
//  Greedy_BOJ
//
//  Created by 박소민 on 2021/08/14.
//

import Foundation

let N = Int(readLine()!)!
var cardQueue : [Int] = Array(1...N)
let size = cardQueue.count
var front = 0
var rear = size - 1

while true {
    front = (front + 1) % size
    if (front == rear){
        break
    }
    rear = (rear + 1) % size
    cardQueue[rear] = cardQueue[front]
    front = (front + 1) % size
    if (front == rear){
        break
    }
}
print(cardQueue[rear])
