//
//  QS-DS.swift
//  Algos
//
//  Created by vinay kamra on 02/08/25.
//


class QS_DS {
    func isValidParentheses(_ s: String) -> Bool {
        
        var stack = CustomStack<Character>()
        
        let charcters: [Character] = Array(s)
        
        for character in charcters {
            
            if character == "(" || character == "[" || character == "{" {
                stack.push(character)
                
            } else if character == ")" || character == "]" || character == "{" {
                
                if stack.isEmpty() {
                    return false
                }
                
                let lastOpen = stack.pop()!
                
                if lastOpen == "(" && character != ")" || lastOpen == "[" && character != "]" || lastOpen == "{" && character != "}" {
                    
                } else {
                    return false
                }
            }

        }
        
        if stack.isEmpty() {
            return true
        }
        
        //  var stac: CustomStack
        
        return false
        
    }
}

class Solution1 {
    func removeKdigits(_ num: String, _ k: Int) -> String {

        if k == num.count {
            return "0"
        }

        var count = k
        var stack:[Character] = []
        let array = Array(num)

        for i in 0 ..< array.count {

            while !stack.isEmpty && stack.last! > array[i] && count > 0 {
                stack.removeLast()
                count = count - 1
            }



            stack.append(array[i])

            if count == 0 {
                var j = i
                 while (j < array.count ) {
                    stack.append(array[i])
                    j = j + 1

                }
                break
            }
        }

       

        return String(stack.reversed())

        
    }
}
