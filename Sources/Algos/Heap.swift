
public class MaximumRobotsToLoadSolution {
    
    public init() {}
    
    public func maximumRobots(_ chargeTimes: [Int], _ runningCosts: [Int], _ budget: Int) -> Int {
          var left = 0
          var maxRobots = 0
          var cost = 0

          var dequeue: [Int] = []

          for right in 0 ..< chargeTimes.count {
              cost += runningCosts[right]

              while let last = dequeue.last,
                      chargeTimes[last] <= chargeTimes[right] {
                  dequeue.removeLast()
              }
              dequeue.append(right)

             while left <= right {
              let windowSize = right - left + 1
              let totalCost = chargeTimes[dequeue.first!] + windowSize * cost

              if totalCost <= budget { break }

              if dequeue.first == left {
                  dequeue.removeFirst()
              }
              cost -= runningCosts[left]
              left += 1
          }


              maxRobots = max(maxRobots, right - left + 1)


          }

          
          return maxRobots
      }
    
    
//    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
//        var result: [[Int]] = []
//        guard !nums1.isEmpty, !nums2.isEmpty, k > 0 else { return result }
//
//        // Min heap with tuple (sum, i, j)
//        var heap = Heap<(Int, Int, Int)> { $0.0 < $1.0 }
//        
//        // Push first k pairs (nums1[i], nums2[0]) into the heap
//        for i in 0..<min(k, nums1.count) {
//            heap.insert((nums1[i] + nums2[0], i, 0))
//        }
//
//        while result.count < k, let (sum, i, j) = heap.pop() {
//            result.append([nums1[i], nums2[j]])
//            if j + 1 < nums2.count {
//                heap.insert((nums1[i] + nums2[j + 1], i, j + 1))
//            }
//        }
//
//        return result
//    }
}
