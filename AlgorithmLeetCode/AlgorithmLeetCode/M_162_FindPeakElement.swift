//
//  M_162_FindPeakElement.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/9.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/find-peak-element

import Foundation




// MARK: - 题目名称: 162. Find Peak Element

/* MARK: - 所属类别:
 标签:  Array, Binary Search
 
 相关题目:
 
 */

/* MARK: - 题目英文:
 A peak element is an element that is greater than its neighbors.
 
 Given an input array where num[i] ≠ num[i+1], find a peak element and return its index.
 
 The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.
 
 You may imagine that num[-1] = num[n] = -∞.
 
 For example, in array [1, 2, 3, 1], 3 is a peak element and your function should return the index number 2.
 
 click to show spoilers.
 
 Note:
 Your solution should be in logarithmic complexity.
 
 Credits:
 Special thanks to @ts for adding this problem and creating all test cases.
 
 */


/* MARK: - 题目翻译:
 
 峰值元素是大于其邻居的元素。
 
 给定一个输入数组中的num[i] ≠ num[i+1]，找到一个元素并返回它的下标。
 该数组可能包含多个峰值，在这种情况下返回索引的任何一个峰是可以的。
 
 你可以认为 num[-1] = num[n] = -∞
 
 例如，在数组[1, 2, 3, 1]中，3是一个峰值元素，你的函数应该返回索引数2。

 注：
 你的解决方案应该是对数复杂度。
 信用:
 特别感谢@ TS添加这个问题，并创建所有的测试用例。
 
 */



/* MARK: - 解题思路:
 num[i] ≠ num[i+1]  num[-1] = num[n] = -∞
 这两句话是关键
 
 
 这题要求我们在一个无序的数组里面找到一个peak元素，所谓peak，就是值比两边邻居大就行了。
 
 对于这题，最简单地解法就是遍历数组，只要找到第一个元素，大于两边就可以了，复杂度为O(N)。
 
 但这题还可以通过二分来做。
 
 首先我们找到中间节点mid，如果大于两边返回当前index就可以了, 让 mid 和mid+1 进行比较
 
 1, 如果 num[mid] < num[mid+1] 那么说明 peak 在右边,因为 num[n] = -∞
     也就是说 num[mid] < num[mid+1] > num[n]
     这时候 low = mid+1 重新计算得到mid 继续查找 
     
     1,
     如果 num[mid] < num[mid+1] 那么说明 peak 在右边,因为 num[n] = -∞
     也就是说 num[mid] < num[mid+1] > num[n]
     这时候 low = mid+1 重新计算得到mid 继续查找
     2, 
     如果 num[mid] > num[mid+1] 那么说明 peak 在左边
     因为 刚才已经 出现过一次 num[mid] < num[mid+1]了, 左右夹逼 就成了
     3,
     如果 num[mid] == num[mid+1] 
     不可能,因为题目要求了 num[i] ≠ num[i+1]
 
 2, 如果 num[mid] > num[mid+1] 那么说明 peak 在左边,因为 num[-1] = -∞
    同理 查找
 */

// FIXME: 没有完成
/* MARK: - 复杂度分析:
 时间复杂度：O(lgn)
 
 */


// MARK: - 代码:
private class Solution {
    
    // 利用二分法查找
    func findPeakElement(_ nums: [Int]) -> Int {
        
        let n = nums.count
        // 一个元素无需比较,直接retun
        if n == 1 {
            return 0
        } else if n == 0 {
            return -1
        }
        
        var low = 0
        var high = n - 1
        var mid1 = 0
        var mid2 = 0
        while low < high {
            mid1 = (high - low)/2 + low
            mid2 = mid1 + 1
            // 这里mid2 不会越界, 因为n=1的时候直接return掉了
            // 并且因为 low<high 所以low≠high, 也就是说 mid1≠high 
            // 所以mid1始终小于high mid1+1也就不会越界
            
            
            if nums[mid1] < nums[mid2] {
                low = mid2
            } else {
                high = mid1
            }
        }
        
        return low
    }
    
    // 利用遍历查找
    func findPeakElement2(_ nums: [Int]) -> Int {
        
        let n = nums.count
        
        for i in 1 ..< nums.count {
            // 只需要判断一次就行了, 因为 num[-1] = num[n] = -∞
            if nums[i] < nums[i-1] {
               return i-1
            }
        }
        
        return n-1
    }
    
    
}



// MARK: - 测试代码:
func findPeakElement() {
    
    
    print(Solution().findPeakElement([1]))
    print(Solution().findPeakElement([1, 2, 5, 1]))
    print(Solution().findPeakElement([8, 2, 5, 8]))
    
}


