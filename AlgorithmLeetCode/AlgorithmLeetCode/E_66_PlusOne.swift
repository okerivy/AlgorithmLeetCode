//
//  E_66_PlusOne.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/7.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/plus-one

import Foundation




// MARK: - 题目名称: 66. Plus One

/* MARK: - 所属类别:
 标签: Array, Math
 
 相关题目:
  (M) Multiply Strings
  (E) Add Binary
  (M) Plus One Linked List
 
 */

/* MARK: - 题目英文:
 
 Given a non-negative integer represented as a non-empty array of digits, plus one to the integer.
 
 You may assume the integer do not contain any leading zero, except the number 0 itself.
 
 The digits are stored such that the most significant digit is at the head of the list.
 
 */


/* MARK: - 题目翻译:
 
 给定一个整数数组代表一个非负整数，将这个整数加1。
 您可以假定这个整数 第一位不会是0,除了数字0本身。
 数字在存储的时候将最重要的数字（即整数的最高位）放在数组的开头。
 */



/* MARK: - 解题思路:
 
 这是一道非常常规的整数加1的题目。根据题目意思整数123在数组中是这样存储的[1，2，3]。
 
 所以，进行加1操作的时候，需要倒着遍历数组。
 
 需要注意的一个地方就是要考虑进位的问题。如果循环结束之后，产生了进位，则数组需要在开头插入1个值为1的新元素。
 */


/* MARK: - 复杂度分析:
 分析
 
 Java 中需要返回数组，而这个数组在处理之前是不知道大小的，故需要对最后一个进位单独处理。
 时间复杂度 O(n), 空间复杂度在最后一位有进位时恶化为 O(n), 当然也可以通过两次循环使得空间复杂度为 O(1).
 
 */



// MARK: - 代码:
private class Solution {
    
    func plusOne(_ digits: [Int]) -> [Int] {

        return plusDigit(digits, 1)
    }
    
    private func plusDigit(_ digits: [Int], _ digit: Int) -> [Int] {
        
        if digits.count == 0 {
            return []
        }
        
        // 用carry表示进位
        var carry = digit
        // 初始化为0的数组
//        var numArr = [Int](repeating: 0, count: digits.count)
        // 直接赋值
        var numArr = digits
        
        // 从末尾开始遍历
        var index = digits.count - 1
        
        while index >= 0 {
            
            // 和 = 当前数字 + 进位
            let sum = digits[index] + carry
            // 重新赋值
            numArr[index] = sum % 10
            // 获取进位
            carry = sum / 10
            
            // 这个判断可以 减少循环次数
            if carry == 0 {
                break
            }
            index -= 1
        }
        
        // 循环结束 如果还有进位 就在数组前面添加一个元素
        if carry == 1 {
            // 在以前的0位前面插入一个数据
            numArr.insert(1, at: 0)
        }
        
        return numArr;
    }
    
}



// MARK: - 测试代码:
func plusOne() {
    
    let array = [1,2,3,4,5]
    
    print("改变前的数组 \(array)")
    let numArr = Solution().plusOne(array)
    print("改变后的的数组为  \(numArr)") // [1,2,3,4,5,6]
    
}


