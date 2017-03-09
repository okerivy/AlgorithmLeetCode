//
//  E_7_ReverseInteger.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/9.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/reverse-integer

import Foundation



// MARK: - 题目名称: 7. Reverse Integer

/* MARK: - 所属类别:
 标签: Math
 
 相关题目:
  (M) String to Integer (atoi)
 
 */

/* MARK: - 题目英文:
 Reverse digits of an integer.
 
 Example1: x = 123, return 321
 Example2: x = -123, return -321
 
 Note:
 The input is assumed to be a 32-bit signed integer. Your function should return 0 when the reversed integer overflows.
 
 */


/* MARK: - 题目翻译:
 
 反转整数的数字。
 
 例1: x = 123, 返回 321
 
 例2: x = -123, 返回 -321
 
 在写代码之前，你考虑过下面的这些问题吗？
 
 假如数字的最后一位是0，应该输出什么呢？例如10，100。
 
 你注意到反转整数可能会导致溢出吗？假设输入是32位的整数（范围是-2147483648到2147483647），反转整数1000000003得到的结果3000000001会导致溢出。你应该如何处理这种情况呢？
 
 对于上面的情况，当反转整数发生溢出的时候，你的函数应该返回0。
 
 */



/* MARK: - 解题思路:
 
 反转正整数难度不大，我们很快就会有思路。
 
 先拿一个简单的例子分析一下，例如反转123，计算过程为
 
 （（3 ＊ 10 ＋ 2）＊10 ＋ 1） ＝ 321
 
 即计算过程为不断的乘10再加上剩余的数字余10得到的数字。
 
 其实上面的这种思路对于负数来说，其实同样适用。例如反转－123的计算过程如下：
 
 （－3 ＊ 10 ＋（－2）） ＊ 10 ＋ （－1） ＝ －321
 
 不要忘记了题目中提到的整数溢出的问题，其实有一个很巧妙的方式来实现。
 
 下面是代码中得到newResult的计算方式： result = result * 10 + num % 10
 
 为了不发生溢出，我们可以对临界条件进行判断，发生溢出的情况如下
 
 while循环里 result = result * 10 + num % 10
 result 每次都乘以10，可能会导致整数溢出
 while循环里会先判断 result > (Int(Int32.max) - num % 10) / 10 是否会导致溢出
 如果会的话直接就返回0了
 
 
 */


/* MARK: - 复杂度分析:
 时间复杂度：O(lgn) 空间复杂度：O(1)
 
 */


// MARK: - 代码:
private class Solution {
    func reverse(_ x: Int) -> Int {
        // 以前的数字
        var num = x
        // 结果
        var result = 0
        
        // 判断num 是否 等于 0  代表已经计算完毕
        while num != 0 {
            // 如果结果 溢出 直接返回 0
            // 这个公式是根据这个 result = result * 10 + num % 10 公式推导的
            if result > (Int(Int32.max) - num % 10) / 10 {
                return 0
            }
            // 如果不会溢出, 继续计算
            result = result * 10 + num % 10
            // 计算下一位
            num = num / 10
        }
        
        return result
    }
    
}



// MARK: - 测试代码:
func reverseInteger() {
    

    print(Solution().reverse(123))
    print(Solution().reverse(-123))

    
    print(Solution().reverse(1534236469))
    
}

