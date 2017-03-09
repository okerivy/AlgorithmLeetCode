//
//  E_268_MissingNumber.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/9.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/missing-number

import Foundation




// MARK: - 题目名称: 268. Missing Number

/* MARK: - 所属类别:
 标签: Array, Math, Bit Manipulation
 
 相关题目:
  (H) First Missing Positive
  (E) Single Number
  (M) Find the Duplicate Number
 
 */

/* MARK: - 题目英文:
 
 Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.
 
 For example,
 Given nums = [0, 1, 3] return 2.
 
 Note:
 Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?
 
 Credits:
 Special thanks to @jianchao.li.fighter for adding this problem and creating all test cases.
 
 */


/* MARK: - 题目翻译:
 
 给定一个数组，数组包含 n 个取自 0, 1, 2, ..., n 的不同的数字，从数组中找到丢失的那个数字。
 
 例如：给定 nums = [0, 1, 3] 返回 2.
 
 注意：
 你的算法应当使用线性的时间复杂度（即时间复杂度为O(n)）。你能够只使用常量的额外空间来解决这题吗？
 
 */



/* MARK: - 解题思路:
 
 1.
 从 0, 1, 2, ..., n 中取 n 个不同的数字组成数组 nums，寻找丢失的那个数字，非常自然的想法就是将 0, 1, 2, ..., n 加和之后，减去数组 nums 的和就得到了丢失的那个数字。
 
 思路非常简单。但是为了避免加和造成的溢出，
 这里有一个小技巧：即不需要将两个数组先加起来之后再做减法，可以边加边减。
 例如 数组
 数字     0   1   3   4   5   6   7   8   // 缺失的是 2
 下标     0   1   2   3   4   5   6   7   // 8个元素
 
 进行相加相减运算 上下全部进行 (i - nums[i])
 0-0+1-1+3-2+4-3+5-4+6-5+7-6+8-7 = 0-0 1-1 3-3 4-4 5-5 6-6 7-7 2-8 = 2-8
 
 (i - nums[i]) = 2-8
 
 可以看到 2 已经出来了 因为 nums.count = 8 所以再次相加一次 ans + (i - nums[i])
 nums.count + 2-8 = 8 + 2-8 = 2
 
 
 2.
 其基本思想是利用异或XOR运算。我们都知道一个a^b^b =a，这意味着相同数量的两异或操作将消除数量和揭示原数。
 在这个解决方案中，我运用异或XOR操作的指标和数组的值。
 在一个没有缺数字完整的阵列，指标值应完全对应（nums[index] = index），所以在丢失数组，剩下的最后是失踪数字。
 
 例如 数组
 数字     0   1   3   4   5   6   7   8   // 缺失的是 2
 下标     0   1   2   3   4   5   6   7   // 0..7 有8个元素
 
 进行异或运算 上下全部进行 (i ^ nums[i])
 0^0^1^1^3^2^4^3^5^4^6^5^7^6^8^7 = 0^0^1^1^3^3^4^4^5^5^6^6^7^7^8^2 = 8^2
 
 (i ^ nums[i]) = 8^2
 
 可以看到 2 已经出来了 因为 xor = nums.count = 8 所以再次异或一次 xor ^ (i ^ nums[i])
 8^2^nums.count = 8^2^8 = 2
 
 
 ---------------------------------
 异或是一种基于二进制的位运算，用符号XOR或者 ^ 表示，
 
 其运算法则是对运算符两侧数的每一个二进制位，同值取0，异值取1。
 
 异或的性质
 交换律：a ^ b = b ^ a
 结合律：a ^ b ^ c = a ^ (b ^ c) = (a ^ b) ^ c
        d = a ^ b ^ c 可以推出 a = d ^ b ^ c
 自反性：a ^ b ^ a = b
 
 
 
 算法题目
 
 ①1-1000放在含有1001个元素的数组中，只有唯一的一个元素值重复，其它均只出现一次。每个数组元素只能访问一次，设计一个算法，将它找出来；不用辅助存储空间，能否设计一个算法实现？
 
 前面提到异或具有交换律和结合律，所以1^2^...^n^...^n^...^1000，无论这两个n出现在什么位置，都可以转换成为1^2^...^1000^(n^n)的形式。
 
 其次，对于任何数x，都有x^x=0，x^0=x。
 
 所以1^2^...^n^...^n^...^1000 = 1^2^...^1000^(n^n)= 1^2^...^1000^0 = 1^2^...^1000（即序列中除了n的所有数的异或）。
 
 令，1^2^...^n^..^1000（序列中包含一个n）的结果为T
 则1^2^..^n^..^n^..^1000（序列中包含2个n）的结果就是T^n。
 T^(T^n)=n。
 
 所以，将所有的数全部异或，得到的结果与1^2^3^...^1000的结果进行异或，得到的结果就是重复数。
 
 */


/* MARK: - 复杂度分析:
 间复杂度是O(n)，空间复杂度为O(1)
 
 */


// MARK: - 代码:
private class Solution {
    
    // 加法求和
    func missingNumber(_ nums: [Int]) -> Int {
        var ans = 0
        for i in 0..<nums.count {
            ans = ans + i - nums[i]
        }
        ans += nums.count
        return ans
    }
    
    // 异或运算
    func missingNumber2(_ nums: [Int]) -> Int {
        var xor = nums.count
        for i in 0..<nums.count {
            xor = xor ^ i ^ nums[i];
        }
        return xor;
    }

}



// MARK: - 测试代码:
func missingNumber() {
  
    print(Solution().missingNumber([0, 1, 3, 4, 5, 6, 7]))
    print(Solution().missingNumber([1, 2, 3, 4, 5]))
    print(Solution().missingNumber([0, 1, 2, 4, 5]))
    print(Solution().missingNumber([5, 1, 2, 0, 4]))

}


