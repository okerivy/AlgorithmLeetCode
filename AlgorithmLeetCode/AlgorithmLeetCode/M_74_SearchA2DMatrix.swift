//
//  M_74_SearchA2DMatrix.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/9.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/search-a-2d-matrix

import Foundation




// MARK: - 题目名称: 74. Search a 2D Matrix

/* MARK: - 所属类别:
 标签: Array, Binary Search
 
 相关题目:
  (M) Search a 2D Matrix II
 
 */

/* MARK: - 题目英文:
 
 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
 
 Integers in each row are sorted from left to right.
 The first integer of each row is greater than the last integer of the previous row.
 For example,
 
 Consider the following matrix:
 
 [
 [1,   3,  5,  7],
 [10, 11, 16, 20],
 [23, 30, 34, 50]
 ]
 Given target = 3, return true.
 
 */


/* MARK: - 题目翻译:
 
 给定一个矩阵和一个特定值，要求写出一个高效的算法在这个矩阵中快速的找出是否这个给定的值存在. 但是这个矩阵有以下特征.
 
 对于每一行，数值是从左到右从小到大排列的.
 对于每一列，数值是从上到下从小到大排列的.
 [
 [1,   3,  5,  7],
 [10, 11, 16, 20],
 [23, 30, 34, 50]
 ]
 给定 target = 3, 返回 true.
 
 
 */



/* MARK: - 解题思路:
 
 对于这个给定的矩阵，我们如果用brute force解法，用两个嵌套循环，O(n2)便可以得到答案.
 但是我们需要注意的是这道题已经给定了这个矩阵的两个特性，这两个特性对于提高我们算法的时间复杂度有很大帮助，
 首先我们给出一个O(n)的解法，也就是说我们可以固定住右上角的元素，根据递增或者递减的规律，我们可以判断这个给定的数值是否存在于这个矩阵当中.
 
 */

// FIXME: 没有完成
/* MARK: - 复杂度分析:
 时间复杂度：O(n) 

 
 */


// MARK: - 代码:
private class Solution {
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        // 判断 (矩阵)数组 是否为空
        // 如果不为空, 再判断 第一行是否为空
        if matrix.isEmpty || matrix[0].isEmpty {
            return false
        }
        
        // 从右上角开始遍历
        // 行号
        var rowNumber = 0;
        // 列号
        var colNumber = matrix[0].count - 1;
        
        // 如果 没有遍历到左下角 就继续遍历
        while rowNumber < matrix.count && colNumber >= 0 {
            
            // 如果数字 比 右上角的数字小, 就在这一行 向左寻找
            if target < matrix[rowNumber][colNumber] {
                colNumber -= 1
                
                // 如果数字 比 右上角的数字大, 就向下一行寻找
            } else if target > matrix[rowNumber][colNumber] {
                rowNumber += 1
            } else {
                // 相等,直接返回
                return true
            }
        }
        
         return false
    }
}



// MARK: - 测试代码:
func searchA2DMatrix() {
    var nums1 = [[Int]]()
    nums1 = [
        [1,   3,  5,  7],
        [10, 11, 16, 20],
        [23, 30, 34, 50]
    ]

    
    
    print(Solution().searchMatrix(nums1, 16))
    print(Solution().searchMatrix(nums1, 33))

    
}


