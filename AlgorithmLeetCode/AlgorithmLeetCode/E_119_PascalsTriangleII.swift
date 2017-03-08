//
//  E_119_PascalsTriangleII.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/8.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/pascals-triangle-ii

import Foundation




// MARK: - 题目名称: 119. Pascal's Triangle II

/* MARK: - 所属类别:
 标签: Array
 
 相关题目:
  (E) Pascal's Triangle
 
 */

/* MARK: - 题目英文:
 Given an index k, return the kth row of the Pascal's triangle.
 
 For example, given k = 3,
 Return [1,3,3,1].
 
 Note:
 Could you optimize your algorithm to use only O(k) extra space?
 
 */


/* MARK: - 题目翻译:
 给定一个数字,生成一个帕斯卡三角形第k行的 数组
 例如 给定 k = 3
 返回  [1,3,3,1].
 
 注意:
 你能优化你的算法只使用O（k）的额外空间？
 
 */



/* MARK: - 解题思路:
 
 不同于上一题，这里我们仅仅需要得到的第k层的集合，但只能使用O(k)的空间。所以不能用前面二维数组的方式，只能使用一位数组滚动计算。
 
 在第一题里面，我们知道，帕斯卡三角的计算公式是这样的，A[k][n] = A[k-1][n-1] + A[k-1][n]。
 
 假设现在数组存放的第3层的数据，[1, 3, 3, 1]，如果我们需要计算第4层的数据，如果我们从前往后计算，
 譬如A[4][2]= A[3][1] + A[3][2]，也就是4，但是因为只有一个数组，所以需要将4这个值覆盖到2这个位置，那么我们计算A[4][3]的时候就会出现问题了，因为这时候A[3][2]不是3，而是4了。
 
 为了解决这个问题，我们只能从后往前计算，仍然是上面那个例子，我们实现计算A[4][3] = A[3][2] + A[3][3]，也就是6，我们将6直接覆盖到3这个位置，但不会影响我们计算A[4][2]，因为A[4][2] = A[3][1] + A[3][2]，已经不会涉及到3这个位置了。
 
 理解了如何计算，代码就很简单了：
 
 */


/* MARK: - 复杂度分析:
 
 
 */


// MARK: - 代码:
private class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        
        // 这个数组 有在 rowIndex + 1 个元素
        var rowArr = [Int](repeating: 1, count: (rowIndex + 1))
        
        // 其实就是按照以前计算杨辉三角的方法来计算的, 从第一行计算到最后一行
        // 不同之处在于,计算好一行以后,就直接覆盖以前的元素
        // 遍历 第一个到 倒数第二个元素 最后一个元素 不需要计算
        for i in 0 ..< rowIndex {
            // 第一个元素 不需要计算 所以 k 从 1 开始 
            // i+1 代表最后一个元素:  < (i+1) 表示最后一个元素不用计算
            for j in (1 ..< (i+1)).reversed() {
                // 从后往前计算, 防止覆盖
                rowArr[j] = rowArr[j] + rowArr[j-1]
            }
        }
        
        return rowArr
    }
    
    
}



// MARK: - 测试代码:

func pascalsTriangleII()  {
    
    let numRows = 3
    let array = Solution().getRow(numRows)
    
    // 按照要求 打印输出 非代码的部分
    print(array)

}


