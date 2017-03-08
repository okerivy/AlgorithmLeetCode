//
//  E_88_MergeSortedArray.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/8.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/merge-sorted-array

import Foundation




// MARK: - 题目名称: 88. Merge Sorted Array

/* MARK: - 所属类别:
 标签: Array, Two Pointers
 
 相关题目:
  (E) Merge Two Sorted Lists
 
 */

/* MARK: - 题目英文:
 
 Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
 
 Note:
 You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2. The number of elements initialized in nums1 and nums2 are m and n respectively.
 
 */


/* MARK: - 题目翻译:
 
 给定两个排好顺序的整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，并使得 nums1 成为一个有序数组。
 注意：
 你可以认为 nums1 有足够的空间(大于或等于m + n)来存储 nums2 中的元素。数组 nums1 和 nums2 初始化的元素数量分别 m 和 n。
 
 */



/* MARK: - 解题思路:
 
 A和B都已经是排好序的数组，我们只需要从后往前比较就可以了。
 
 因为A有足够的空间容纳A + B，我们使用游标i指向m + n - 1，也就是最大数值存放的地方，从后往前遍历A，B，谁大就放到i这里，同时递减i。
 
 */


// FIXME: 没有完成
/* MARK: - 复杂度分析:
 
 
 */


// MARK: - 代码:
private class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        // 游标 记录待插入位置
        var last = m + n - 1
        // 记录 num1 待比较的位置
        var index1 = m - 1
        // 记录 num2 待比较的位置
        var index2 = n - 1
        
        // 如果插入的位置一直有空位,就继续循环
        while last >= 0 {
            
            // 如果两个数组都还没有比较完成
            if index1 >= 0 && index2 >= 0 {
                
                // 如果nums1 的元素大于 nums2 的元素, 那么就把nums1 的元素插入游标所在的位置
                if nums1[index1] >= nums2[index2] {
                    nums1[last] = nums1[index1]
                    index1 -= 1
                } else {
                    nums1[last] = nums2[index2]
                    index2 -= 1
                }
                
                // nums2 数组已经比较完成, 只剩下 num1了
            } else if index1 >= 0 {
                nums1[last] = nums1[index1]
                index1 -= 1
                
                // nums1 数组已经比较完成 只剩下 num2了
            } else if index2 >= 0 {
                nums1[last] = nums2[index2]
                index2 -= 1
            }
            
            // 游标指向前一个位置
            last -= 1
        }
    }
    
    
}



// MARK: - 测试代码:
func mergeSortedArray() {
    
    var nums1 = [2, 4, 5, 7, 10]
    let m = nums1.count
    let nums2 = [1, 3, 3, 4, 5, 8,9,9]
    let n = nums2.count
    
    // 先增加 nums1的数组长度,方便插入nums2的数据
    for _ in 0 ..< n {
        nums1.append(0)
    }
    
    Solution().merge(&nums1, m, nums2, n)
    
    print(nums1)
}


