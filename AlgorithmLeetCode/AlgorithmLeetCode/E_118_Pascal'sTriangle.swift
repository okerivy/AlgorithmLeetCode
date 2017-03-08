//
//  E_118_Pascal'sTriangle.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/8.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/pascals-triangle

import Foundation




// MARK: - 题目名称: 118. Pascal's Triangle

/* MARK: - 所属类别:
 标签: Array
 
 相关题目:
  (E) Pascal's Triangle II
 
 */

/* MARK: - 题目英文:
 Given numRows, generate the first numRows of Pascal's triangle.
 
 For example, given numRows = 5,
 Return
 
 [
     [1],
    [1,1],
   [1,2,1],
  [1,3,3,1],
 [1,4,6,4,1]
 ]
 
 */


/* MARK: - 题目翻译:
 给定一个数字,生成一个帕斯卡三角形（杨辉三角）
 例如给定一个数字5 ,返回下面的数组
 [
     [1],
    [1,1],
   [1,2,1],
  [1,3,3,1],
 [1,4,6,4,1]
 ]
 
 */



/* MARK: - 解题思路:
 
 要得到一个帕斯卡三角，我们只需要找到规律即可。
 
 第k层有k个元素
 每层第一个以及最后一个元素值为1
 对于第k（k > 2）层第n（n > 1 && n < k）个元素A[k][n]，A[k][n] = A[k-1][n-1] + A[k-1][n]
 知道了上面的规律，就很好做了，我们使用一个二维数组来存储整个三角
 
 */


/* MARK: - 复杂度分析:
 时间复杂度 O(n^2), 空间复杂度在最后一位有进位时恶化为 O(n)
 
 */


// MARK: - 代码:
private class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        
        // 初始化一个二维数组
        var arrays = [[Int]]()
        
        //大于等于1 进行数组的遍历
        if numRows >= 1 {
            // 二维数组 拼接第一个元素(长度为1的,元素为1 一维数组)
            arrays.append([Int](repeating: 1, count: 1))
        
            for i in 1 ..< numRows {
                // 二维数组 拼接其余的元素(长度为i+1的 初始值 为0 的一维数组)
                arrays.append([Int](repeating: 0, count: i+1))
                // 第一个元素设置为1
                arrays[i][0] = 1
                // 最后一个元素设置为1
                arrays[i][i] = 1
                for j in 1 ..< i {
                    // 中间元素 根据规则 进行计算
                    arrays[i][j] = arrays[i - 1][j - 1] + arrays[i - 1][j];
                }
            }
        }

        return arrays
    }
    
    // 递归算法
    // 求杨辉三角中第i行第j列的值
    private func calcTriVal(_ dwRow: Int, _ dwCol: Int) -> Int {
        if 0 == dwCol || dwCol == dwRow {
            return 1
        } else {
            return calcTriVal(dwRow - 1, dwCol - 1) + calcTriVal(dwRow - 1, dwCol)
        }
        
    }
    
    func generate2(_ numRows: Int) -> [[Int]] {
        
        // 初始化一个二维数组
        var arrays = [[Int]]()
        for dwRow in 0 ..< numRows {
            arrays.append([Int](repeating: 0, count: dwRow+1))
            for dwCol in 0 ... dwRow {
                // 对数组进行赋值
                arrays[dwRow][dwCol] =  calcTriVal(dwRow, dwCol)
            }
        }
        
        return arrays
    }
}



// MARK: - 测试代码:

func pascalsTriangle()  {
    
    let numRows = 6
    var arrays = Solution().generate(numRows)
    
    // 按照要求 打印输出 非代码的部分
    print("[")
    for i in 0..<numRows {
        var output = ""
        
        // 拼接空格的个数
        for _ in 0..<numRows-i-1 {
            output.append(" ")
        }
        
        // 拼接数组的其实标志
        output.append("[")
        // 打印不换行
        print("\(output)" ,terminator:"")
        for j in 0...i {
            if j == 0 {
                // 第一个元素打印
                print("\(arrays[i][j])" ,terminator:"")
            } else {
                // 其余元素打印, 前面加逗号
                print(",\(arrays[i][j])" ,terminator:"")
            }
            
        }
        // 打印数组末尾, 换行
        print("]")
        
    }
    print("]")
}

