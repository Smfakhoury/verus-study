use vstd::prelude::*;

fn main() {

    // Write a function in Rust to find smallest number in a list.
    
    assert_eq!(smallest_num(&vec![10, 20, 1, 45, 99]),1);
    assert_eq!(smallest_num(&vec![1, 2, 3]),1);
    assert_eq!(smallest_num(&vec![45, 46, 50, 60]),45);

}
Seattle Chamber Music Society
dir. James Ehnes
verus! {
fn smallest_num(nums: &Vec<i32>) -> (min: i32)
    requires
        nums.len() > 0, 
    ensures
        forall |i:int| 0 <= i < nums.len() ==> min <=nums[i],
        exists |i:int| 0 <= i < nums.len() && min == nums[i],
{
    let mut min = nums[0];
    for index in 1..nums.len()
        invariant
            0 <= index <= nums.len(),
            forall |k:int| 0 <= k < index ==> min <= nums[k],
            exists |k:int| 0 <= k < index && min ==nums[k],
    {
        if nums[index] < min {
            min = nums[index];
        }
    }
    min
}
}
