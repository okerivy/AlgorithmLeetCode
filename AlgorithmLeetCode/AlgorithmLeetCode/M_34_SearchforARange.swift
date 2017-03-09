//
//  M_34_SearchforARange.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/9.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/search-for-a-range

import Foundation




// MARK: - 题目名称: 34. Search for a Range

/* MARK: - 所属类别:
 标签: Binary Search, Array
 
 相关题目:
  (E) First Bad Version
 
 */

/* MARK: - 题目英文:
 
 Given an array of integers sorted in ascending order, find the starting and ending position of a given target value.
 
 Your algorithm's runtime complexity must be in the order of O(log n).
 
 If the target is not found in the array, return [-1, -1].
 
 For example,
 Given [5, 7, 7, 8, 8, 10] and target value 8,
 return [3, 4].
 
 */


/* MARK: - 题目翻译:
 给定一个按升序排列的整数数组，查找给定目标值的起始和结束位置。
 您的算法的时间复杂性必须是O(log n)。
 
 如果在数组中找不到目标，返回 [-1, -1]。
 例如,
 给定[5, 7, 7, 8, 8, 10]和目标值8，
 返回[3, 4]。
 
 */



/* MARK: - 解题思路:
 
 这题要求在一个排好序可能有重复元素的数组里面找到包含某个值的区间范围。
 要求使用O(log n)的时间，所以我们采用两次二分查找。
 首先二分找到第一个该值出现的位置，譬如m，然后在[m, n)区间内第二次二分找到最后一个该值出现的位置。代码如下：

 */


/* MARK: - 复杂度分析:
 
 时间复杂度：O(lgn) 空间复杂度：O(1)
 */


// MARK: - 代码:
private class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        
        // 标定起始位置 和终点位置
        var low = 0
        var high = nums.count - 1
        // 返回的range
        var result = [Int](repeating: -1, count: 2)
        
        //第一次二分找第一个位置
        
        // 如果 low 小于high的时候进行循环 
        // 注意这里不能用 low <= high 可能会死循环
        while low < high {
            
            // 中间指针
            // 因为 mid = (low + high) / 2 是小处取整 所以mid 有很大可能 = row
            let mid = (low + high) / 2
            
            // 如果这个数小于targe low 就指向 中点的下一个位置
            // 需要注意: low = mid + 1 是因为mid 这个位置小于 目标, 所以可以+1
            // 如果 low = mid 可能会死循环
            if nums[mid] < target {
                low = mid + 1
            } else {
                // 这里是high = mid  而不 high = mid - 1 
                // 因为 来到这里,可能是 nums[mid] = target
                high = mid
                
                // 如果相等 high 是向前逐步逼近的
            }
            
            // 进行二分查找第一个元素的时候
            // 1, mid = (low + high) / 2
            // 2, 需要 让 mid < target 进行比较
            // 3, 然后 让 low = mid + 1
            // 4, else 让 high = mid
            
        }
        
        if low < nums.count && nums[low] == target  {
            result[0] = low
        } else {
            return result // [-1, -1]
        }
        
        // 从第一个位置开始进行第二次二分，找最后一个位置
        
        // 重新标定起始位置 low = low
        high = nums.count - 1
        
        while low < high {
            
            // 因为 mid = (low + high + 1) / 2 是小处取整 
            // 所以 + 1 的意思是向大的取整
            let mid = (low + high + 1) / 2
            
            // 注意这里是 nums[mid] > target 和第一个查找不一样
            if nums[mid] > target {
                high = mid - 1
            } else {
                // 如果相等 low 是向后逐步逼近的
                low = mid
            }
            
            // 进行二分查找最后一个元素的时候 
            // 1, mid = (low + high + 1) / 2
            // 2, 需要 让 mid > target 进行比较
            // 3, 然后 让 high = mid - 1
            // 4, else 让 low = mid
        }
        
        result[1] = high
        return result
    }
    
}



// MARK: - 测试代码:
func searchforARange() {
    let nums1  = [5, 7, 7, 8, 8, 8, 10]
    
    print(Solution().searchRange(nums1, 7)) // [1, 2]
    print(Solution().searchRange(nums1, 8)) // [3, 5]

    print(Solution().searchRange(nums1, 5)) // [0, 0]
    print(Solution().searchRange(nums1, 10)) // [6, 6]
    print(Solution().searchRange(nums1, 11)) // [-1, -1]

    
    print(Solution().searchRange([1], 1)) // [0, 0]
    print(Solution().searchRange([1], 9)) // [-1, -1]
    print(Solution().searchRange([1, 1], 1)) // [0, 1]
    print(Solution().searchRange([1, 1], 9)) // [-1, -1]
    
}

