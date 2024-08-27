use vstd::prelude::*;

fn main() {

    // Given a function in Rust that finds the difference between 
    // the largest and smallest value in a given list, prove its correctness.
    
    assert_eq!(difference_max_min(&vec![1,2,3,4]),3);
    assert_eq!(difference_max_min(&vec![4,5,12]),8);
    assert_eq!(difference_max_min(&vec![9,2,3]),7);

}

verus!{

fn difference_max_min(arr: &Vec<i32>) -> (diff: i32)
{
    let mut min_val = arr[0];
    let mut max_val = arr[0];
    let mut index=1;
    
    while index < arr.len()
    {
        if(arr[index] <= min_val){
            min_val=arr[index];
        }else if (arr[index]>max_val){
            max_val=arr[index];
        }
        index+=1;
    }
    max_val-min_val
}
}
