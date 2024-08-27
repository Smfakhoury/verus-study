use vstd::prelude::*;

fn main() {

    // Given a function in Rust that checks whether a list is 
    // a contiguous sublist of another or not, prove its correctness.

    assert!(!is_sub_array(&vec![1,4,3,5],&vec![1,2])); 
    assert!(is_sub_array(&vec![1,2,1],&vec![1,2,1]));
    assert!(!is_sub_array(&vec![1,0,2,2],&vec![2,2,0]));
}

verus! {


fn sub_array_at_index(main:&Vec<i32>, sub:&Vec<i32>, idx:usize)->(result:bool)
{
    for i in 0..sub.len()
    {
        if (main[idx + i] != sub[i])
        {
            return false;

        }
    }
    true
}


fn is_sub_array(main:&Vec<i32>, sub:&Vec<i32>)->(result:bool)
{
    
    if sub.len()> main.len(){
        return false;
    }

    let mut index=0;
    while index <= (main.len()-sub.len())
    {
        if(sub_array_at_index(&main, &sub, index))
        {
            return true;
        }
        index+=1;
    }
    false
}

}

