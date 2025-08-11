// The Swift Programming Language
// https://docs.swift.org/swift-book


public class FLoodFill {
    
    public init() {
     
    }

    var rows = 0
    var cols = 0
    public func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {

         if image.count == 0 { return image }
        rows = image.count
        cols = image[0].count
        print(rows, cols)
        var newImage = image
        var visitedArray: [[Int]] = Array(repeating: Array(repeating: -1, count: cols), count: rows)
        print(visitedArray)
        DFS(&newImage, sr, sc, color, newImage[sr][sc], &visitedArray)
        return newImage
    }

    func DFS(_ images: inout [[Int]],  _ sr: Int, _ sc: Int, _ newColor: Int, _ orignaColor: Int, _ visited: inout [[Int]]) {
        if sr >= rows || sr < 0 || sc >= cols || sc < 0 || images[sr][sc] != orignaColor || images[sr][sc] == newColor {
            return
        }
        print(images)
        visited[sr][sc] = 0
        images[sr][sc] = newColor
        print(images)

        DFS(&images, sr + 1, sc, newColor, orignaColor, &visited)
        DFS(&images, sr - 1, sc, newColor, orignaColor, &visited)
        DFS(&images, sr, sc + 1, newColor, orignaColor, &visited)
        DFS(&images, sr, sc - 1, newColor, orignaColor, &visited)

    }
}


class WordBreak {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let setWord = Set(wordDict)
        var memo: [Int: Bool] = [:]
        let array = Array(s)

        func dps(_ index: Int) -> Bool {

            var tempString = ""
            if index == s.count {
                return true
            }
            for i in index ..< s.count {
                  
                tempString.append(array[i])

                if setWord.contains(tempString) && dps(i + 1) {
                    memo[index] =  true
                    return true
                }
            }
            
            memo[index] =  false
            return false
            
        }

        return dps(0)
        
  
    }
}



