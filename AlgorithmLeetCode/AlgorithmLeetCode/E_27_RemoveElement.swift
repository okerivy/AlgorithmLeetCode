//
//  E_27_RemoveElement.swift
//  AlgorithmLeetCode
//
//  Created by okerivy on 2017/3/7.
//  Copyright © 2017年 okerivy. All rights reserved.
//  https://leetcode.com/problems/remove-element

import Foundation



// MARK: - 题目名称: 27. Remove Element

/* MARK: - 所属类别:
 标签: Array, Two Pointers
 
 相关题目:
  (E) Remove Duplicates from Sorted Array
  (E) Remove Linked List Elements
  (E) Move Zeroes
 
 */

/* MARK: - 题目英文:
 
 Given an array and a value, remove all instances of that value in place and return the new length.
 
 Do not allocate extra space for another array, you must do this in place with constant memory.
 
 The order of elements can be changed. It doesn't matter what you leave beyond the new length.
 
 Example:
 Given input array nums = [3,2,2,3], val = 3
 
 Your function should return length = 2, with the first two elements of nums being 2.
 
 Hint:
 
 Try two pointers.
 Did you use the property of "the order of elements can be changed"?
 What happens when the elements to remove are rare?
 
 */


/* MARK: - 题目翻译:
 
 给定一个数组和一个值，删除所有这个值的元素并返回新的长度。
 不要为另一个数组分配额外的空间，你必须使用常量的内存空间。
 元素的顺序可以改变。数组新的长度以外的元素是什么没关系。
 
 例如：
 给定数组 nums = [3,2,2,3], val = 3
 你的函数应当返回长度 length = 2, 并且数组 nums 的前两个元素应当是2 。
 
 提示：
 1. 尝试使用2个指针。
 2. 你使用了"元素的顺序可以改变这个属性吗" ?
 3. 当需要删除的元素很少时会发生什么呢？
 
 */



/* MARK: - 解题思路:
 1. 两根指针
 在一个数组里面移除指定value，并且返回新的数组长度。这题唯一需要注意的地方在于in place，不能新建另一个数组。
 
 方法很简单，使用两个游标readIndex，writeIndex，遍历数组，如果碰到了value，使用writeIndex记录位置，同时递增readIndex，直到下一个非value出现，将此时i对应的值复制到writeIndex的位置上，增加writeIndex，重复上述过程直到遍历结束。这时候writeIndex就是新的数组长度。
 
 2.
 Swift 自带删除 index 位置的函数 removeAtIndex 。
 思路很简单，从头到尾遍历数组。
 如果当前元素的值为 val ，则删除当前元素。
 否则，继续循环判断下一个元素。
 
 
 */


/* MARK: - 复杂度分析:
 
 
 */

/* MARK: - Swift语法:
 <T> 表示泛型
 func swapMe<T>( a: T, b: T){
 
 inout 使用inout关键字可以修改传入的数值的原始值。
 func swapMe<T>(a: inout T, b: inout T) {
 
 */





// MARK: - 代码:
private class Solution {
    
    // 这个方法可以保证数组的原始顺序不变
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        var writeIndex = 0
        for readIndex in 0..<nums.count {
            
            // 依次 找到 第一个 与 val 不同的 元素
            if nums[readIndex] != val {
                // 找到不同的元素后, 把这个位置为readIndex的元素 赋值给 待删除位置为writeIndex的元素
                nums[writeIndex] = nums[readIndex]
                
                // 因为以前writeIndex的位置已经被一个需要保留的元素填充, 所以writeIndex需要指向下一个位置
                writeIndex += 1
            }
        }
        return writeIndex
    }
    
    // 这个方法可以保证数组的原始顺序不变
    func removeElement2(_ nums: inout [Int], _ val: Int) -> Int {
        
        var  i = 0
        while  i < nums.count {
            
            if nums[i] == val {
                // 找到相同的元素 并删除 ,但是 下标i 不变
                nums.remove(at: i)
                continue
            }
            
            // 如果不相同, i 指向下一个元素
            i += 1
        }
        return nums.count
    }
}



// MARK: - 测试代码:
func removeElement() {
    
    var array = [1,2,3,2,4,2,7,9,8]

    print("改变前的数组 \(array)")
    let count = Solution().removeElement(&array, 2)
    print("改变后的的数组的长度为 \(count) \(array)") // [1, 3, 4, 7, 9, 8, 7, 9, 8]

}

