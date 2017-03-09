//
//  E_35_SearchInsertPosition.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/9.
//  Copyright © 2017年 okerivy. All rights reserved.
//

import Foundation



// MARK: - 题目名称: 35. Search Insert Position

/* MARK: - 所属类别:
 标签: Array, Binary Search
 
 相关题目:
  (E) First Bad Version
 
 */

/* MARK: - 题目英文:
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 
 You may assume no duplicates in the array.
 
 Here are few examples.
 [1,3,5,6], 5 → 2
 [1,3,5,6], 2 → 1
 [1,3,5,6], 7 → 4
 [1,3,5,6], 0 → 0
 
 */


/* MARK: - 题目翻译:
 给定排序的数组和目标值，如果找到目标，则返回索引。如果没有，返回索引，如果它被插入顺序。
 您可以假定数组中没有重复。
 
 这里有几个例子。
 [1,3,5,6], 5 → 2
 [1,3,5,6], 2 → 1
 [1,3,5,6], 7 → 4
 [1,3,5,6], 0 → 0
 
 */



/* MARK: - 解题思路:
 
 这题要求在一个排好序的数组查找某值value，如果存在则返回对应index，不存在则返回能插入到数组中的index（保证数组有序）。
 
 对于不存在的情况，我们只需要在数组里面找到最小的一个值大于value的index，这个index就是我们可以插入的位置。譬如[1, 3, 5, 6]，查找2，我们知道3是最小的一个大于2的数值，而3的index为1，所以我们需要在1这个位置插入2。如果数组里面没有值大于value，则插入到数组末尾。
 
 我们采用二分法解决
 
 典型的二分查找算法。二分查找算法是在有序数组中用到的较为频繁的一种算法，
 在未接触二分查找算法时，最通用的一种做法是，对数组进行遍历，跟每个元素进行比较，其时间为O(n)。
 但二分查找算法则更优，可在最坏的情况下用 O(log n) 完成搜索任务。
 譬如数组 {1，2，3，4，5，6，7，8，9}，查找元素6，用二分查找的算法执行的话，其顺序为：
 
 第一步查找中间元素，即5，由于 5 < 6 ，则6必然在5之后的数组元素中，那么就在{6，7，8，9}中查找，
 寻找 {6, 7, 8, 9} 的中位数，为7，7 > 6，则6应该在7左边的数组元素中，那么只剩下6，即找到了。
 二分查找算法就是不断将数组进行对半分割，每次拿中间元素和 target 进行比较。

 
 */


/* MARK: - 复杂度分析:
 
 
 */


// MARK: - 代码:
private class Solution {
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        var low = 0
        var high = nums.count - 1
        
        
        // 二分查找 查找第一个出现的元素
        // low = high = nums.count - 1  的时候 证明没有找到
        while low < high {
            
            // 直接使用(high + low)/2 可能导致溢出
            let mid = (high - low) / 2 + low
            if nums[mid] < target {
                low = mid + 1
            } else {
                high = mid
            }
        }
        
        // 对边界进行判断
        
        // 走出while 循环 row = high 需要的是让 target <= nums[row] 这样才能插入
        // 但是 对于需要插入一个大于数组中最大的数 来说 这个时候 nums[row] 依然小于 target
        // 需要插入到最后面
        if nums[low] < target {
            low += 1
        }
        
        // 如果 while low <= high { 那么上面这个if 判断就不需要了
        
        return low
    }
    
}



// MARK: - 测试代码:
func searchInsertPosition() {
    let nums1  = [1,2,3,5,6,6,6,8]
    
    print(Solution().searchInsert(nums1, 8)) // 7
    print(Solution().searchInsert(nums1, 2)) // 1
    print(Solution().searchInsert(nums1, 6)) // 4
    print(Solution().searchInsert(nums1, 7)) // 7
    print(Solution().searchInsert(nums1, 0)) // 0
}






