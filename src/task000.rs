use vstd::prelude::*;
fn main() {
    
    // Given an implementation of binary search, prove its correctness.
    // Assume the element is in the array.
    
}

verus!{
fn binary_search(v: &Vec<u64>, k: u64) -> (r: usize)
{
    let mut i1: usize = 0;
    let mut i2: usize = v.len() - 1;
    while i1 != i2
    {
        let ix = i1 + (i2 - i1) / 2;
        if v[ix] < k {
            i1 = ix + 1;
        } else {
            i2 = ix;
        }
    }
    i1
}
}