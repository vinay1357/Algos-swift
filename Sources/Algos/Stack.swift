//
//  File.swift
//  Algos
//
//  Created by vinay kamra on 02/08/25.
//

import Foundation
import SwiftUI

public struct CustomStack<T> {
    private  var records: [T] = []
    
    mutating func push(_ element: T) {
        records.append(element)
    }
    
    mutating func pop() -> T? {
        guard !isEmpty() else { return nil }
        return records.removeLast()
    }
    
    func peek() -> T? {
        return records.last
    }
    
    func isEmpty() -> Bool {
        return records.isEmpty
    }
    
    func size() -> Int {
        return records.count
    }
}


class Solution {
    func nextGreaterElementsInCircular(_ nums: [Int]) -> [Int] {
        var newNums:[Int] = Array(repeating: -1, count: nums.count)
        var stack:[Int] = []
        let N = nums.count
        for index in stride(from: 2 * N - 1, to: 0, by: -1) {
             while(stack.isEmpty && nums[index % N] >= stack.last! ) {
                stack.removeLast()
             }

             if index < N {
                 newNums[index] = stack.isEmpty ? -1 : stack.last!
             }

             stack.append(nums[index % N])
        }
        return newNums
    }
}



public struct SubArray {
    
    public init() {}
    public func calucltaeMaximumofSubarray(_ nums: [Int]) -> Int {
        
        var stack:[Int] = []
        let N = nums.count
        var result = 0
        for index in 0 ... N {
            let cur = index < N ? nums[index] : Int.max
             while(!stack.isEmpty && cur > stack.last! ) {
                let j = stack.removeLast()
                 let left = stack.last ?? -1
                 let right = index
                 result = result + (((j - left) * (right - j) % 1_000_000_007 ) * (nums[j] % 1_000_000_007)) % 1_000_000_007
             }

             stack.append(index)
        }
        return result
    }
}


public  class Solution1221212 {
    
    public init() {}
    
    func minFlipsMonoIncr(_ s: String) -> Int {

        let array = Array(s)
        let N = array.count
        var prefixSum: [Int] = Array(repeating: 0, count: N + 1)
        var minValue = Int.max
        for i in 0 ..< N {
            prefixSum[i + 1] = prefixSum[i] + (array[i] == "0" ? 1 : 0)
        }

        for j in 0 ..< N {
            let sum = prefixSum[j] + (N - j - (prefixSum[N] - prefixSum[j]))
            minValue = min(minValue, sum)
        }
        
        return minValue
        
    }
    
    public func getMaxLen(_ nums: [Int]) -> Int {
       var maxLen = 0
       var posLen = 0
       var negLen = 0

       for num in nums {
           if num == 0 {
               posLen = 0
               negLen = 0
           } else if num > 0 {
               posLen += 1
               negLen = negLen > 0 ? negLen + 1 : 0
           } else {
               let temp = posLen
               posLen = negLen > 0 ? negLen + 1 : 0
               negLen = temp + 1
           }

           print(posLen, negLen)
           maxLen = max(maxLen, posLen)
       }

       return maxLen
   }
    
    func maximumTruckUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
        let sortedBoxTypes = boxTypes.sorted { $0[1] > $1[1] }
        var truckSize = truckSize
        var totalUnits = 0

        for box in sortedBoxTypes {
            let boxesToTake = min(truckSize, box[0])
            totalUnits += boxesToTake * box[1]
            truckSize -= boxesToTake
            if truckSize == 0 {
                break
            }
        }

        return totalUnits
    }
    
    public func maxProfit(_ inventory: [Int], _ orders: Int) -> Int {
            var newInventory = inventory.sorted(by: >)
            newInventory.append(0)
            var count = newInventory.count
            var newOder = orders
            var i = 0
            var j = i + 1

            var res = 0

            while (newOder > 0 && j < count) {

                let diff = newInventory[i] - newInventory[j] + 1

                let newCount = min(newOder, diff)

                for k in 0 ..< newCount {
                    res +=  newInventory[i] - k
                }

                newOder = newOder - newCount
                i = i + 1
                j = i + 1
            }

            return res

        }
}

