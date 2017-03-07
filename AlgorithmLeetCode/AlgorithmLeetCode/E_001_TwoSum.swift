//
//  E_001_TwoSum.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/6.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/two-sum


import Foundation

// MARK: - 题目名称: 1. Two Sum

/* MARK: - 所属类别:
 标签: Array, Hash Table
 
 相关题目:
  (M) 3Sum
  (M) 4Sum
  (E) Two Sum II - Input array is sorted
  (E) Two Sum III - Data structure design
 */

/* MARK: - 题目英文:
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */


/* MARK: - 题目翻译:
 给定一个整数的数组，要求返回两个整数的下标（这两个整数相加得到一个给定的目标值）。
 你可以假设对于每一组输入有且仅有一个特定的解决方案。
 
 */



/* MARK: - 解题思路:
 
 两数之和是否为target, 如果是找数组中一个值为target该多好啊！遍历一次就知道了，我只想说，too naive... 难道要将数组中所有元素的两两组合都求出来与target比较吗？
 时间复杂度显然为 O(n2), 显然不符题目要求。找一个数时直接遍历即可，那么可不可以将两个数之和转换为找一个数呢？
 我们先来看看两数之和为target所对应的判断条件—— xi+xj=target, 可进一步转化为 xi=target−xj​​, 其中 ii 和 jj 为数组中的下标。一段神奇的数学推理就将找两数之和转化为了找一个数是否在数组中了！可见数学是多么的重要...
 
 基本思路有了，现在就来看看怎么实现，
 显然我们需要额外的空间(也就是哈希表)来保存已经处理过的 x​j​​(注意这里并不能先初始化哈希表，否则无法排除两个相同的元素相加为 target 的情况), 
 如果不满足等式条件，那么我们就往后遍历，并把之前的元素加入到哈希表中，
 如果target减去当前索引后的值在哈希表中找到了，那么就将哈希表中相应的索引返回，大功告成！
 
 很简单的 hash。一个小技巧是，对于每个数先看和为 target 所需的数是否已经在 dict 里，如果已经在则直接返回，否则才把自身放进 dict 里。
 这样只需循环一次，不用先构建 hash、再遍历，循环两次。
 
 */


/* MARK: - 复杂度分析:
 
 哈希表用了和数组等长的空间，空间复杂度为O(n), 遍历一次数组，时间复杂度为O(n).
 */


// MARK: - 代码:
private class Solution {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        // 构建hash表
        var numberIndexDict = [Int: Int]()
        // 对数组进行遍历
        for (index, num) in nums.enumerated() {
            // 判断这个以(target - num)为key对应的Value 是否在 hash表中
            guard let pairedIndex = numberIndexDict[target - num] else {
                // 如果不在, 就把这个元组添加到hash表中
                numberIndexDict[num] = index
                // 找不到就继续遍历
                continue
            }
            
            // 来到这里是肯定找到了,就直接返回
            return [pairedIndex, index]
        }
        
        // 没找到 返回错误
        return [-1, -1]
    }
}


// MARK: - 测试代码:
func twoSum() {
    
    let nums1 = [2, 7, 11, 15]
    let target = 9
    // nums[0] + nums[1] = 2 + 7 = 9,

    let nums2 = Solution().twoSum(nums1, target)
    
    print(nums2)

}

