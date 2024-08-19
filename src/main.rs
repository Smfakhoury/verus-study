use vstd::prelude::*;

fn main() {

    // Write a function in Rust to find smallest number in a list.
    
    assert_eq!(smallest_num(&vec![10, 20, 1, 45, 99]),1);
    assert_eq!(smallest_num(&vec![1, 2, 3]),1);
    assert_eq!(smallest_num(&vec![45, 46, 50, 60]),45);

}

verus! {
fn smallest_num(nums: &Vec<i32>) -> (min: i32)
{
    let mut min = nums[0];
    for index in 1..nums.len()
    {
        if nums[index] < min {
            min = nums[index];
        }
    }
    min
}
}
