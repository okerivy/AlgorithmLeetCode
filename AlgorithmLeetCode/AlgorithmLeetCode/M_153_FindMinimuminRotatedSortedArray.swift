//
//  M_153_FindMinimuminRotatedSortedArray.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/8.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/find-minimum-in-rotated-sorted-array

import Foundation


// MARK: - 题目名称: 153. Find Minimum in Rotated Sorted Array

/* MARK: - 所属类别:
 标签: Array, Binary Search
 
 相关题目:
  (M) Search in Rotated Sorted Array
  (H) Find Minimum in Rotated Sorted Array II
 
 */

/* MARK: - 题目英文:
 
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
 
 Find the minimum element.
 
 You may assume no duplicate exists in the array.
 
 */


/* MARK: - 题目翻译:
 
 假设将一个排好序的数组以某个你不知道的轴旋转。(例如： 0 1 2 4 5 6 7 可能变成 4 5 6 7 0 1 2)。 
 找到数组中最小的元素。
 你可以假设数组中不存在重复的元素。
 
 */



/* MARK: - 解题思路:
 
 // 1.二分查找
 这题要求在一个轮转了的排序数组里面找到最小值，我们可以用二分法来做。
 
 首先我们需要知道，对于一个区间A，如果A[start] < A[stop]，那么该区间一定是有序的了。
 
 假设在一个轮转的排序数组A，我们首先获取中间元素的值，A[mid]，mid = (start + stop) / 2。因为数组没有重复元素，那么就有两种情况：
 
 A[mid] > A[start]，那么最小值一定在右半区间，譬如[4,5,6,7,0,1,2]，中间元素为7，7 > 4，最小元素一定在[7,0,1,2]这边，于是我们继续在这个区间查找。
 A[mid] < A[start]，那么最小值一定在左半区间，譬如[7,0,1,2,4,5,6]，这件元素为2，2 < 7，我们继续在[7,0,1,2]这个区间查找。

 // 2. 遍历查找
 遍历当前数组元素，如果当前元素比它之后的一个元素大，说明这个地方是发生旋转的地方。
 后一个元素就是最小的元素。
 思路非常简单，完整代码如下所示：
 
 */


// FIXME: 没有完成
/* MARK: - 复杂度分析:
 
 二分查找 时间 O(N) 空间 O(N) 
 遍历重找
 
 */


// MARK: - 代码:
private class Solution {
    
    // 二分查找
    func findMin(_ nums: [Int]) -> Int {
        
        // 对 size <= 2的情况直接判断
        let size = nums.count
        if size == 0 {
            return 0
        } else if size == 1 {
            return nums[0]
        } else if size == 2 {
            return min(nums[0], nums[1])
        }
        
        var start = 0
        var stop = size - 1
        
        while  start < stop  {
            if nums[start] < nums[stop] {
                return nums[start]
            }
            
            // mid 肯定 > 1
            let mid = (start + stop)/2
            // mid == start 证明已经找到 肯定会来到这里的 结束循环
            if mid == start  {
                break
            }
            
            // A[mid] > A[start]，那么 证明 左半边是有序的, 那么最小值一定在右半区间
            if nums[mid] > nums[start] {
                start = mid
                
                // A[mid] < A[start]，那么 证明 左半边是无序的, 那么最小值一定在左半区间
            } else if  nums[mid] < nums[start] {
                stop = mid
            }
        }
        
        // 返回最小值, 这个时候 start 和 stop 差值不会大于 1
        return min(nums[start], nums[stop])
    }
    

    
    
    // 遍历查找
    func findMin2(_ nums: [Int]) -> Int {
        
        // 返回值为 Int? 用来 返回nil
        if nums.count <= 0 {
            return 0
        }
        
        for i in 0 ..< nums.count - 1 {
            
            if nums[i] > nums[i + 1] {
                return nums[i + 1]
            }
            
        }
        
        return nums[0]
    }
    
}


// MARK: - 测试代码:
func findMinimuminRotatedSortedArray() {
    
    var nums1 = [Int]()
    nums1 = [4,5,6,7,0,1,2]
    
    print(Solution().findMin(nums1))
    
    print(nums1)
}


