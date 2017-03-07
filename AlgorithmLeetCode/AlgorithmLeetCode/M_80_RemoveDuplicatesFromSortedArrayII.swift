//
//  M_80_RemoveDuplicatesFromSortedArrayII.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/7.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii

import Foundation



// MARK: - 题目名称: 80. Remove Duplicates from Sorted Array II

/* MARK: - 所属类别:
 标签: Array, Two Pointers
 
 相关题目:
 
 */

/* MARK: - 题目英文:
 
 Follow up for "Remove Duplicates":
 What if duplicates are allowed at most twice?
 
 For example,
 Given sorted array nums = [1,1,1,2,2,3],
 
 Your function should return length = 5, with the first five elements of nums being 1, 1, 2, 2 and 3. It doesn't matter what you leave beyond the new length.

 
 */


/* MARK: - 题目翻译:
 题意每个数只允许重复一次，输出去重后的数组和个数，依旧上一题的要求，常数空间也就是只能在原数组上操作。
 
 例如:
 给一个排序后的数组 nums = [1,1,1,2,2,3]
 你的函数应该返回长度 5 , 并且 nums 的前5个元素分别是1, 1, 2, 2 和 3. 新数组超过 5 以后的元素是什么无关紧要。
 
 */



/* MARK: - 解题思路:
 应为允许一个重复，所以判断就不是相邻而是相隔一个的数字是否不一样。
 
 上加了限制条件元素最多可重复出现两次。
 核心思想仍然是两根指针，只不过此时新索引自增的条件是当前遍历的数组值和『新索引』或者『新索引-1』两者之一不同。

 */


/* MARK: - 复杂度分析:
 
 时间复杂度 O(n), 空间复杂度 O(1).
 */


// MARK: - 代码:
private class Solution {
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        // 如果count <= 2 肯定不会有三个重复,直接返回
        if nums.count <= 2 {
            return nums.count
        }
        
        // 初始下标指向 1,也就第二个元素 因为数组至少为三个元素
        var index = 1
        for i in 2..<nums.count {
            
            // 让第i个元素和 index的元素以及index-1的元素相比较, 如果有一个不相等
            // 证明 这三个元素 不是重复元素
            // 那么就把 这个元素 放到 index+1的位置
            if nums[i] != nums[index] || nums[i] != nums[index-1] {
                index += 1
                nums[index] = nums[i]
            }
        }
        
        // index是下标, index+1 才是元素的个数
        return index + 1
    }
}



// MARK: - 测试代码:
func removeDuplicatesFromSortedArrayII() {
    
    var array = [1,2,3,4,4,5,6,6,6,7,7,7,7,10]
    
    print("改变前的数组 \(array)")

    let count = Solution().removeDuplicates(&array)
    print("改变后的的数组的长度为 \(count) \(array)") // [1, 2, 3, 4, 4, 5, 6, 6, 7, 7, 10, 7, 7, 10]
    
}




