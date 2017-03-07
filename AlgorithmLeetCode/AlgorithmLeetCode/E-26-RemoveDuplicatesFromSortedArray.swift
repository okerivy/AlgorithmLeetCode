//
//  E-26-RemoveDuplicatesFromSortedArray.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/7.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/remove-duplicates-from-sorted-array

import Foundation



// MARK: - 题目名称: 26. Remove Duplicates from Sorted Array

/* MARK: - 所属类别:
 标签: Array, Two Pointers
 
 相关题目:
  (E) Remove Element
 
 */

/* MARK: - 题目英文:
 
 Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.
 
 Do not allocate extra space for another array, you must do this in place with constant memory.
 
 For example,
 Given input array nums = [1,1,2],
 
 Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the new length.
 

 
 */


/* MARK: - 题目翻译:
 给定一个排好顺序的数组，删除重复的元素，这样每个元素只出现一次，并返回新数组的长度。
 
 不要为另一个数组分配额外的空间，你必须使用常量的内存空间。
 
 例如：给定输入数组 nums = [1,1,2], 你的函数应该返回长度 2 , 并且 nums 的前两个元素分别是1和 2。新数组 2 以后的元素是什么无关紧要。
 
 */



/* MARK: - 解题思路:
 1. 两个指针
 在一个排序好的数组里面删除重复的元素。
 
 首先我们需要知道，对于一个排好序的数组来说，A[N + 1] >= A[N]，我们仍然使用两个游标i和j来处理，假设现在i = j + 1，如果A[i] == A[j]，那么我们递增i，直到A[i] != A[j]，这时候我们再设置A[j + 1] = A[i]，同时递增i和j，重复上述过程直到遍历结束。
 
 2.
 由于给定的数组是排好顺序的，所以遍历数组的时候，只需要判断当前元素是否跟前一个元素相等。
 如果相等，则需要从数组中将当前元素删除；
 若不相等，则继续下一个循环，判断下一个元素。
 
 */


/* MARK: - 复杂度分析:
 
 遍历一次数组，时间复杂度 O(n), 空间复杂度 O(1).
 
 */



// MARK: - 代码:
private class Solution {
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
     
        // 如果count < 2 肯定不会重复,直接返回
        if nums.count < 2 {
            return nums.count
        }
        
        var j = 0
        for i in 1..<nums.count {
            
            // 如果i 和 j 对应的元素相等, 那么就继续寻找,但是 j的位置不变
            if nums[i] != nums[j] {
                // 如果找到这个不相等的元素, 那么就把把这个元素移动到 j的下一个位置.
                // 移动到j的下一个位置并不会覆盖其他元素
                // 因为 如果 i>j+1 那么i和j中间的元素都是和j相同的,所以覆盖也没事
                // 如果 i = j+1 ,那么就是 自己替换自己, 所以也不会有影响
                j += 1
                nums[j] = nums[i]
            }
        }
        
        // j是下标, j+1 才是元素的个数
        return j + 1
    }
    
    // 用swift方法,简单容易理解
    func removeDuplicates2(_ nums: inout [Int]) -> Int {
        
        if nums.count < 2 {
            return nums.count
        }
        
        var index = 1
        while index < nums.count {
            
            if nums[index] == nums[index-1] {
                // 直接用swift方法remove掉.
                nums.remove(at: index)
            } else {
                index += 1
            }
        }
        
        
        return index
    }
}



// MARK: - 测试代码:
func removeDuplicatesFromSortedArray() {
    
    var array = [1,2,3,4,4,5,6,6,6]
    
    print("改变前的数组 \(array)")
    let count = Solution().removeDuplicates(&array)
    print("改变后的的数组的长度为 \(count) \(array)") // [1,2,3,4,5,6]
    
}


