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
 
 (1) 在height尾部添加一个0，也就是一个高度为0的立柱。作用是在最后也能凑成上面提的那种“波峰图”。
 
 (2) 定义了一个stack，然后遍历时如果height[i] 大于stack.top()，进栈。反之，出栈直到栈顶元素小于height[i]。
 
 由于出栈的这些元素高度都是递增的，我们可以求出这些立柱中所围成的最大矩形。更妙的是，由于这些被弹出的立柱处于“波峰”之上(比如弹出i 到 i+k，那么所有这些立柱的高度都高于 i-1和 i+k+1的高度)，因此，如果我们使用之前所提的“左右延伸找立柱”的思路解，以这些立柱的高度作为整个矩形的高度时，左右延伸出的矩形所包含的立柱不会超出这段“波峰”，因为波峰外的立柱高度都比他们低。“波峰图”其实就是求解最大矩形的“孤岛”，它不会干扰到外部。
 
 (3) 由于比height[i]大的元素都出完了，height[i]又比栈顶元素大了，因此再次进栈。如此往复，直到遍历到最后那个高度为0的柱，触发最后的弹出以及最后一次面积的计算，此后stack为空。
 
 (4) 返回面积最大值。
 
 栈中存的不是高度，而是height的索引，这样做的好处是不会影响宽度的计算，索引值相减 = 宽度。
 
 自己实现代码如下，虽然是二重循环，但时间复杂度实际  2N，故为O(N)
 
 
 (1) stack里存的是index，计算面积时的宽度使用 index的差值，所以虽然stack 弹出了立柱，但是不影响宽度的计算，依然可以计算面积。
 
 (2) 这种解法本质上是查看以每一个立柱为矩形高度，求出最大面积，但是它通过入栈出栈，把整个height变成一组组“波峰图”来解，这种高度布局下，最大面积的计算是O(n)的，然后将所有波峰图的最大面积取最大值。最后做到了以O(n)的时间复杂度覆盖了所有的立柱。
 

 

 
 */

// FIXME: 没有完成
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
        // 修正错误 以前少遍历一次
        while i < heights.count  {
            
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
                print(maxArea)
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
            print(maxArea)

        }
        return maxArea

    }
}



// MARK: - 测试代码:
func largestRectangleinHistogram() {
    
    var nums1 = [Int]()
    nums1 = [3, 1, 3, 2, 2]//[2,1,5,6,2,3]
    
    print(Solution().largestRectangleArea(nums1))
    
    print(nums1)
}



