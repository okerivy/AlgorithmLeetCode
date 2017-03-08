//
//  H_154_FindMinimuminRotatedSortedArrayII.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/8.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii

import Foundation




// MARK: - 题目名称: 154. Find Minimum in Rotated Sorted Array II

/* MARK: - 所属类别:
 标签: Array, Binary Search
 
 相关题目:
  (M) Find Minimum in Rotated Sorted Array
 
 */

/* MARK: - 题目英文:
 Follow up for "Find Minimum in Rotated Sorted Array":
 What if duplicates are allowed?
 
 Would this affect the run-time complexity? How and why?
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
 
 Find the minimum element.
 
 The array may contain duplicates.
 
 */


/* MARK: - 题目翻译:
 和 Find Minimum in Rotated Sorted Array 题目类似
 如果 数组中有重复元素怎么办
 这会影响运行的时间复杂度吗
 
 假设一个按升序排序的数组在你事先未知的某个旋转点旋转。
 
 (例如： 0 1 2 4 5 6 7 可能变成 4 5 6 7 0 1 2)。
 找到数组中最小的元素。
 你可以假设数组中可能存在重复的元素。

 
 */



/* MARK: - 解题思路:
 
 这题跟上题唯一的区别在于元素可能有重复，我们仍然采用上面的方法，只是需要处理mid与start相等这种额外情况。
 
 A[mid] > A[start]，右半区间查找。
 A[mid] < A[start]，左半区间查找。
 A[mid] = A[start]，出现这种情况，我们跳过start，重新查找，譬如[2,2,2,1]，A[mid] = A[start]都为2，这时候我们跳过start，使用[2,2,1]继续查找。
 
 */


// FIXME: 没有完成
/* MARK: - 复杂度分析:
 
 
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
                
                // A[mid] = A[start]，那么 证明 左半边元素全是重复的, 那么最小值一定在右半区间
            } else if  nums[mid] == nums[start] {
                start = mid
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
func findMinimuminRotatedSortedArrayII() {
    
    var nums1 = [Int]()
    nums1 = [2,2,2,1,1,1,1,1,1]
    
    print(Solution().findMin(nums1))
    
    print(nums1)
}


