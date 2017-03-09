//
//  E_231_PowerOfTwo.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/9.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/power-of-two

import Foundation




// MARK: - 题目名称: 231. Power of Two

/* MARK: - 所属类别:
 标签: Math, Bit Manipulation
 
 相关题目:
  (E) Number of 1 Bits
  (E) Power of Three
  (E) Power of Four
 
 */

/* MARK: - 题目英文:
 Given an integer, write a function to determine if it is a power of two.
 
 */


/* MARK: - 题目翻译:
 给定一个整数，写一个函数判断给定的整数是不是2的幂次方。
 
 */



/* MARK: - 解题思路:
 
 1.
 这题非常简单，不断的循环的做下面两步操作：
 
 将整数余2看结果是否为0，如果不为0则不是2的幂次方，直接返回false；如果是则说明是2的倍数，继续第二步
 
 如果是2的倍数，直接将整数除以2，减少一半。继续第一步。
 
 循环结束的条件为，看整数是否等于1，因为2的幂次方不断的除以2，最终结果都是1。
 
 2.
 2的整数次幂对应的二进制数只含有0个或者1个1，所以我们要做的就是判断输入的数的二进制表达形式里是否符合这一条件。 有一种corner case需要注意，当输入的数为负数的时候，一定不是2的幂。
 
 n = 2^3 = 8 = 1000
 n-1 =     7   0111
 
 n^(n-1) = 0
 
 */


/* MARK: - 复杂度分析:
  时间复杂度：O(n) 空间复杂度：O(1)
 
 */


// MARK: - 代码:
private class Solution {
    
    // 取模 整除
    func isPowerOfTwo(_ n: Int) -> Bool {
        
        // 如果数字小于0 直接返回
        if n <= 0 { return false }
        
        // 记录数字
        var num = n
        
        // 其实无论 num 怎么除以2 都不可能为 0的, 相当于无限循环
        while num != 0 {
            
            // 如果 num = 1 证明 被2整除 (因为下一步的取模运算 可以排除)
            if num == 1 { return true }
            
            // 如果 取模 不等于 0 证明 不能被2 整除
            if num % 2 != 0 { return false }
            
            num /= 2
        }

        // 这一步好像永远来不了
        return true
    }
    
    // 按位运算
    func isPowerOfTwo2(_ n: Int) -> Bool {
        return ((n & (n - 1)) == 0) && (n > 0)
    }
    
    // 按位运算
    func isPowerOfTwo3(_ n: Int) -> Bool {
        return ((n | (n - 1)) == (2*n - 1)) && (n > 0)
    }
}



// MARK: - 测试代码:
func powerOfTwo() {
    
    print(Solution().isPowerOfTwo(-2))
    print(Solution().isPowerOfTwo(0))
    print(Solution().isPowerOfTwo(1))
    print(Solution().isPowerOfTwo(2))
    print(Solution().isPowerOfTwo(8))
    print(Solution().isPowerOfTwo(16))
    print(Solution().isPowerOfTwo(17))
}



