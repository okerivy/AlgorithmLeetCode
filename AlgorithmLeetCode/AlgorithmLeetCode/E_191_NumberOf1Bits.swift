//
//  E_191_NumberOf1Bits.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/9.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/number-of-1-bits

import Foundation



// MARK: - 题目名称: 191. Number of 1 Bits

/* MARK: - 所属类别:
 标签: Bit Manipulation
 
 相关题目:
  (E) Reverse Bits
  (E) Power of Two
  (M) Counting Bits
  (E) Binary Watch
  (E) Hamming Distance
 
 */

/* MARK: - 题目英文:
 Write a function that takes an unsigned integer and returns the number of ’1' bits it has (also known as the Hamming weight).
 
 For example, the 32-bit integer ’11' has binary representation 00000000000000000000000000001011, so the function should return 3.
 
 */


/* MARK: - 题目翻译:
 编写一个函数，它接收一个无符号整数并返回它二进制形式中 '1'的个数(也称为Hamming weight)。
 
 例如，整数 ‘11’ 的32位二进制表示形式为 00000000000000000000000000001011 ，所以函数应当返回3。
 
 */



/* MARK: - 解题思路:
 考虑位运算
 
 设输入的数为n，把n与1做二进制的与&(AND)运算，即可判断它的最低位是否为1。
 如果是的话，把计数变量加一。然后把n向右移动一位，重复上述操作。
 当n变为0时，终止算法，输出结果。
 

 
 
 */


/* MARK: - 复杂度分析:
  时间复杂度：O(n) 空间复杂度：O(1)
 
 */


// MARK: - 代码:
private class Solution {
    
    // 取模 整除
    func hammingWeight(_ n: UInt32) -> Int {
        
        // 传进来n为let类型 不能改变,所以搞个num变量
        var  num = n
        
        // 计数器
        var count = 0
        
        while num > 0 {
            // 把num与1做二进制的与(AND)运算，即可判断它的最低位是否为1
            if num & 1 == 1 {
                count += 1
            }
            
            // 右移一位 相当于 / 2  public func >>=(lhs: inout UInt32, rhs: UInt32)
            num >>= 1
        }
    
        return count;
    }

    // 取模 整除
    func hammingWeight2(_ n: UInt32) -> Int {
        
        // 传进来n为let类型 不能改变,所以搞个num变量
        var  num = n
        
        // 计数器
        var count = 0
        
        while num > 0 {
            count += 1
            
            // x & (x - 1) 它会把整数x的二进制的最后一个1去掉。
            num &= (num - 1)
        }
        
        return count;
    }
    
}



// MARK: - 测试代码:
func numberOf1Bits() {
    
    print(Solution().hammingWeight(0))
    print(Solution().hammingWeight(1))
    print(Solution().hammingWeight(2))
    print(Solution().hammingWeight(8))
    print(Solution().hammingWeight(11))
    print(Solution().hammingWeight(7))
}






