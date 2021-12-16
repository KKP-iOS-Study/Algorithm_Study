import Foundation

fileprivate class Node {
  var value: Int
  var next: Node?
  var previous: Node?
  
  init(value: Int) {
    self.value = value
  }
}

fileprivate class Link: CustomStringConvertible {
  var head: Node?
  var tail: Node?
  
  func input(_ node: Node) {
    
    guard head != nil, tail != nil else {
      head = node
      tail = node
      return
    }
    
    if head!.value <= node.value {
      head!.previous = node
      node.next = head
      let next = head!.next
      let temp = head
      next?.previous = temp
      temp!.next = next
      self.head = node
    } else if tail!.value >= node.value {
      tail!.next = node
      node.previous = tail
      let previous = tail!.previous
      let temp = tail
      previous?.next = temp
      self.tail = node
    } else {
      
      if node.value.distance(to: head!.value) <= tail!.value.distance(to: node.value) {
        var current = self.head
        var done = false
        while let next = current?.next, !done {
          current?.previous = node.previous
          node.previous?.next = current
          
          node.previous = current
          current?.next = node
          
          next.previous = node
          node.next = next
          
          if node.value >= next.value {
            done = true
          }
          current = next
        }
      } else {
        var current = self.tail
        var done = false
        while let previous = current?.previous, !done {
          current?.next = node.next
          node.next?.previous = current
          
          node.next = current
          current?.previous = node
          
          previous.next = node
          node.previous = previous
          
          if node.value <= previous.value {
            done = true
          }
          current = previous
        }
      }
    }
  }
  
  @discardableResult
  func drop(_ positive: Bool) -> Node? {
    // 1 plus
    // -1 minus
    if positive {
      if head != nil, head?.next != nil {
        var first = head
        head = head?.next
        head?.previous = nil
        let next = first?.next?.next
        next?.previous = head
        first = nil
        return head
      } else {
        tail = nil
        head = nil
        return nil
      }
    } else {
      if tail != nil, tail?.previous != nil {
        var last = tail
        tail = tail?.previous
        tail?.next = nil
        let previous = last?.previous?.previous
        previous?.next = tail
        last = nil
        return tail
      } else {
        tail = nil
        head = nil
        return nil
      }
    }
  }
  
  var description: String {
    var current = head
    var stack = ""
    while let cur = current {
      stack.write("\(cur.value) -> ")
      current = cur.next
    }
    return stack
  }
}

func solution(_ operations: [String]) -> [Int] {
  let link = Link()
  for operation in operations {
    let arrOp = operation.components(separatedBy: " ")
    let (pattern, input) = (arrOp[0], arrOp[1])
    if pattern == "I" {
      link.input(Node(value: Int(String(input))!))
    } else {
      link.drop(input == "1")
    }
  }
  
  
  return [link.head?.value ?? 0, link.tail?.value ?? 0]
}
