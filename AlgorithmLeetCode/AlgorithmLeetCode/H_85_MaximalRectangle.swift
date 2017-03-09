//
//  H_85_MaximalRectangle.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/9.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/maximal-rectangle

import Foundation





// MARK: - 题目名称: 85. Maximal Rectangle

/* MARK: - 所属类别:
 标签: Array, Hash Table, Stack, Dynamic Programming
 
 相关题目:
  (H) Largest Rectangle in Histogram
  (M) Maximal Square
 
 */

/* MARK: - 题目英文:
 
 Given a 2D binary matrix filled with 0's and 1's, find the largest rectangle containing only 1's and return its area.
 
 For example, given the following matrix:
 
 1 0 1 0 0
 1 0 1 1 1
 1 1 1 1 1
 1 0 0 1 0
 Return 6.
 
 */


/* MARK: - 题目翻译:
 给一个二维矩阵,里面用 0 和 1 填充 
 找到用1 填充的最大子矩阵的面积
 
 例如, 下面的矩阵
 1 0 1 0 0
 1 0 1 1 1
 1 1 1 1 1
 1 0 0 1 0
 返回结果为6
 
 */



/* MARK: - 解题思路:
 
 假设最后的矩形是(i, j)到(x, y)，01矩阵为n*m矩阵；
 从1到n枚举y，那么要求变成矩形贴着底边，然后面积尽可能大。
 把与底部连着的1统计起来，例如当row=3的时候，分别为[3,1,3,2,2]；
 此时，题目与84. Largest Rectangle in Histogram完全一致；
 维护一个高度不减少的栈，每次可以通过栈，快速得出面积。
 
 -------
 根据上图，可以清楚的看出本题可以转化为Largest Rectangle in Histogarm来做
 初始化height = [0, 0 ,0 ....]
 对于每一行，先求出以这一行为x轴的每个柱子的高度，求解时，可以每次基于上一行的值进行更新。然后O(n)的时间求出最大矩形，不断更新全局变量res
 
 
 */


/* MARK: - 复杂度分析:
 
 时间复杂度是O(N)
 空间复杂度是O(N)
 ------
 时间复杂度为 O(n * (n + n)) = O(n2)
 
 */


// MARK: - 代码:
private class Solution {
    
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        
        // 判断 (矩阵)字符数组 是否为空
        // 如果不为空, 再判断 第一行是否为空
        if matrix.isEmpty || matrix[0].isEmpty {
            return 0
        }
        
        // 获取 矩阵的 高度 (行)
        let m = matrix.count
        // 获取矩阵的 宽度 (列)
        let n = matrix[0].count
        
        // 构建一个用来 记录高度的二维数组 并初始化为0
        var heights = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)

        // 对每一行 进行遍历
        for i in 0 ..< m {
            
            // 对每一行的的 每一个元素进行遍历
            for j in 0 ..< n {
                
                // 如果这个元素是 0, 那么就在 高度的二维数组记为 0
                if matrix[i][j] == "0" {
                    heights[i][j] = 0
                } else {
                    // 如果为 1 ,那么 就 获取 的高度值
                    // 如果 是第一行,那么这个值就是 1 ,因为上面没有值了
                    // 如果是 第三行, 那么 这个高度值就 = 第二行的高度值 + 1
                    // 第二行的高度值 已经计算完全了, 因为遍历 是从上往下遍历的
                    heights [i][j] = (i == 0) ? 1 : (heights[i-1][j] + 1)
                }
            }
        }
        
        // 最大面积
        var  maxArea = 0
        
        // 对 高度 二维数组的 每一行进行遍历
        for i in 0 ..< m {
            // 获取 每一行的最大面积
            maxArea = max(maxArea, largestRectangleArea(heights[i]))
        }

        return maxArea;
    }
    
    
    // 获取一个数组的最大面积
    private func largestRectangleArea(_ heights: [Int]) -> Int {
        
        var stack:[Int] = []
        var maxArea = 0
        
        // 这个标记很重要, 用来指示 小于 (栈低的下标 对应的元素) 的下标
        var i = 0
        // 需要遍历完全
        while i < heights.count {
            
            // 如果当前栈为空, 那么就把 当前元素的下标 压入栈底
            // 如果 当前i对应的元素 大于 当前栈顶的数据(下标) 所对应的元素 那么就把 i 压入栈中
            // 直到找到 小于的值
            if stack.isEmpty || heights[i] >= heights[stack.last!] {
                // 压入栈中
                stack.append(i)
                // 继续向后寻找
                i += 1
            } else {
                // 如果 当前栈顶对应的元素 大于 当前i对应的元素, 那么就可以计算面积了
                let topStact = stack.last!
                // 把栈顶的数据从栈中去除
                stack.removeLast()
                
                // 1, 首先计算的是 栈顶的元素的面积
                //    面积的计算 是当前被pop出来的元素的高度 * (i 与 当前栈顶的数据(下标) 中间的差距)
                //    如果 栈为空, 那么 这个间距 就是 i
                let areaWithTop = heights[topStact] * (stack.isEmpty ? i : (i - stack.last! - 1))
                // 2, 和当前最大值比较 获取最大值
                maxArea = max(areaWithTop, maxArea)
                // 3, 如果 栈中还有元素, 一旦 if判断不成立 那么下次还会来到这里
                //    需要注意的是 这里 i 并没有++
                //    这个很重要, 这保证了栈中数据(下标)对应的元素 是从 小向大的 是有顺序的
            }
            
        }
        
        // 遍历完成后, 栈中可能还有数据, 然后依次出栈 计算面积
        while stack.isEmpty == false {
            let topStact = stack.last!
            stack.removeLast()
            
            let areaWithTop = heights[topStact] * (stack.isEmpty ? i : (i - stack.last! - 1))
            maxArea = max(maxArea, areaWithTop)
        }
        return maxArea
        
    }
    
    
}



// MARK: - 测试代码:
func maximalRectangle() {
    
    var nums1 = [[Character]]()
    nums1 = [
        ["1", "0", "1", "0", "0"],
        ["1", "0", "1", "1", "1"],
        ["1", "1", "1", "1", "1"],
        ["1", "0", "0", "1", "0"]
    ]
    // [1, 0, 1, 0, 0]
    // [2, 0, 2, 1, 1]
    // [3, 1, 3, 2, 2]
    // [4, 0, 0. 3, 0]
    
    
    print(Solution().maximalRectangle(nums1))
    
}



