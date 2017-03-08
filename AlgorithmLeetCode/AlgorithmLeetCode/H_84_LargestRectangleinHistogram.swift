//
//  H_84_LargestRectangleinHistogram.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/8.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/largest-rectangle-in-histogram

import Foundation




// MARK: - 题目名称: 84. Largest Rectangle in Histogram

/* MARK: - 所属类别:
 标签: Array, Stack
 
 相关题目:
  (H) Maximal Rectangle
 
 */

/* MARK: - 题目英文:
 Given n non-negative integers representing the histogram's bar height where the width of each bar is 1, find the area of largest rectangle in the histogram.
 
 
 Above is a histogram where width of each bar is 1, given height = [2,1,5,6,2,3].
 
 
 The largest rectangle is shown in the shaded area, which has area = 10 unit.
 
 For example,
 Given heights = [2,1,5,6,2,3],
 return 10.
 
 */


/* MARK: - 题目翻译:
 
 
 */



/* MARK: - 解题思路:
 
 
 
 */


/* MARK: - 复杂度分析:
 
 
 */


// MARK: - 代码:
private class Solution {
    
    func largestRectangleArea(_ heights: [Int]) -> Int {

        var stack:[Int] = []
        var maxArea = 0
        
        // 这个标记很重要, 用来指示 小于 (栈低的下标 对应的元素) 的下标
        var i = 0
        // 需要遍历完全
        while i < heights.count - 1 {
            
            // 如果当前栈为空, 那么就把 当前元素的下标 压入栈底
            // 如果 当前i对应的元素 大于 当前栈顶的数据(下标) 所对应的元素 那么就把 i 压入栈中
            // 直到找到 小于的值
            if stack.isEmpty || heights[i] >= heights[stack.last!] {
                // 压入栈中
                stack.append(i)
                // 继续向后寻找
                i += 1
            } else {
                print(stack)
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
            print(stack)
            let topStact = stack.last!
            stack.removeLast()
            
            let areaWithTop = heights[topStact] * (stack.isEmpty ? i : (i - stack.last! - 1))
            maxArea = max(maxArea, areaWithTop)
        }
        return maxArea

    }
}



// MARK: - 测试代码:
func largestRectangleinHistogram() {
    
    var nums1 = [Int]()
    nums1 = [2,1,5,6,2,3]
    
    print(Solution().largestRectangleArea(nums1))
    
    print(nums1)
}



