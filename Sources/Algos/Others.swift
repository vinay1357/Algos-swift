//
//  Others.swift
//  Algos
//
//  Created by vinay kamra on 06/08/25.
//


public class Others {
    
    public init() {}
    
    public func triangularSum1(_ nums: [Int]) -> Int {
        let n = nums.count
        var result = 0
        var coeff = 1
        
        for i in 0..<n {
            result = (result + coeff * nums[i]) % 10
            // Update coefficient using multiplicative formula:
            coeff = coeff * (n - 1 - i) / (i + 1)
        }
        
        return result
    }
    
    
    public func triangularSum(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        
        var array = nums
        
        while(array.count > 1) {
            
            for i in 0 ..< array.count - 1 {
                array[i] = (array[i] + array[i+1]) % 10
            }
            
            array.removeLast()
        }
        return array[0]
        
        
    }
    
    
    public func goodDaysToRobBank(_ security: [Int], _ time: Int) -> [Int] {
        
        let start = time - 1
        let N = security.count - time
        
        var result: [Int] = []
        
        for i in start ... N {
            var t = time, k = 0
            while (i - t > 0 && security[i - t] >= security[i - t + 1]) {
                t  = t - 1
            }
            
            if t == 0 {
                while (k < time && (i + k) < 0 && security[i + k] <= security[i + k + 1] ) {
                    k = k + 1
                }
                
                if k == time {
                    result.append(i)
                }
            }
        }
        
        return result
    }
    
}

