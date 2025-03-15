use std::ops::Range;

pub fn mins(a: &[u32], ranges: &[Range<u32>]) -> Vec<u32> {
    ranges
        .into_iter()
        .filter_map(|range| a.iter().filter(|v| range.contains(v)).min())
        .cloned()
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_mins() {
        let a = vec![1, 5, 8, 13, 17, 24, 30, 35, 40];
        let result = mins(&a, &[0..5, 10..20, 20..40]);
        assert_eq!(result, vec![1, 13, 24]);
    }
}
