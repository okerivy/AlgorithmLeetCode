//
//  E_9_PalindromeNumber.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/9.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/palindrome-number

import Foundation




// MARK: - 题目名称: 9. Palindrome Number 

/* MARK: - 所属类别:
 标签: Math
 
 相关题目:
  (E) Palindrome Linked List
 
 */

/* MARK: - 题目英文:
 Determine whether an integer is a palindrome. Do this without extra space.
 
 
 Some hints:
 Could negative integers be palindromes? (ie, -1)
 
 If you are thinking of converting the integer to string, note the restriction of using extra space.
 
 You could also try reversing an integer. However, if you have solved the problem "Reverse Integer", you know that the reversed integer might overflow. How would you handle such case?
 
 There is a more generic way of solving this problem.
 
 */


/* MARK: - 题目翻译:
 
 判断一个整数是不是回文数。不要用到而外的空间来解决这道题目（通常意味着空间复杂度为O(1)）。
 
 一些提示：
 负整数会是回文数吗？（例如－1）
 
 如果你在考虑将整数转换为字符串，注意不要使用额外空间的限制条件。
 
 你也可以尝试反转一个整数。然而，如果你已经解决了 "反转整数" 这个问题，你会知道反转整数可能会导致溢出。你会如何处理这些情况?
 
 */



/* MARK: - 解题思路:
 
 负数不是回文 0 是回文
 
 为了防止溢出，我们只需要计算整数右半部分的值，和左半部分进行对比即可判断是否是回文数。

 循环结束的时候会有两种情况：
 
 若原先的整数长度为奇数的时候，需要判断 num == rightHalf / 10 。例如对于整数12121，循环结束的时候，num == 12，rightHalf == 121。
 若原先的整数长度为偶数的时候，需要判断 num == rightHalf 。例如对于整数1221，循环结束的时候，num == 12，rightHalf == 121。
 
 */


/* MARK: - 复杂度分析:
 时间复杂度: logN
 
 */


// MARK: - 代码:
private class Solution {
    
    func isPalindrome(_ x: Int) -> Bool {
        
        // 如果是负数 直接返回
        if x < 0 {
            return false
        }
        
        // 需要处理的数据
        var num = x
        // 右边的数据
        var rightHalf = 0
        
        // 判断 是否已经把右边数据处理完成了
        while num > rightHalf {
            // 通过对num 右边的数据进行翻转 
            // 将来可以和左边的数据进行比较
            rightHalf = rightHalf * 10 + num % 10
            // 指向下一位
            num /= 10
        }
        
        // 判断左右两边是否相等 主要是奇数和偶数的差别
        return num == rightHalf || (num == rightHalf / 10)
        
       
    }
}



// MARK: - 测试代码:
func palindromeNumber() {
    
    print(Solution().isPalindrome(-2))
    print(Solution().isPalindrome(0))
    print(Solution().isPalindrome(2))
    print(Solution().isPalindrome(12321))
    print(Solution().isPalindrome(123321))
    
}



