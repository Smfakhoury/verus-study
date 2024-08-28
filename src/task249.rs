use vstd::prelude::*;

fn main() {

    // Given a function in Rust that finds the intersection of two arrays, prove its correctness.

    // Sample cases
    // input: [1, 2, 3, 5, 7, 8, 9, 10] and [1, 2, 4, 8, 9], output: [1, 2, 8, 9]
    // input: [1, 2, 3, 5, 7, 8, 9, 10] and [3,5,7,9], output: [3,5,7,9]
    // input: [1, 2, 3, 5, 7, 8, 9, 10] and [10,20,30,40], output: [10]
    // input: [] and [], output: []
    // input: [1,2,1] and [3,1,1,2], output: [1,2]


}

verus!{


fn contains(arr: &Vec<i32>, key:i32) -> bool
{
    let mut i = 0;
    while i < arr.len()
        {
            if (arr[i] == key) 
            {
                return true;
            }
        i+=1;
        }
    false
}


fn intersection(arr1: &Vec<i32>, arr2: &Vec<i32>)->(result: Vec<i32>)
        {

        let mut output_arr = Vec::new();

        for index in 0..arr1.len()
        {   
            if (contains(arr2, arr1[index]) && !contains(&output_arr, arr1[index])){
                output_arr.push(arr1[index]);
            }
        }
        output_arr
    }
}