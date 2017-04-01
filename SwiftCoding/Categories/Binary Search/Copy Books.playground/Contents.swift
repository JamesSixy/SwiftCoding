
/// Copy Books
/// http://www.lintcode.com/en/problem/copy-books/
/// - Parameters:
///   - pages: i's book with page[i] pages
///   - k: k people
/// - Returns: min time to finish all
/// What are some constraints?
/// min minutes depends on the longest book (at least) since speed same

func copyBooks(_ pages: [Int], _ k: Int) -> Int {
    guard pages.count > 0, k > 0 else { return 0 }
    var maxPages = 0, sum = 0
    for i in pages {
        maxPages = max(i, maxPages)
        sum += i
    }
    var start = maxPages, end = sum
    while start + 1 < end {
        let mid = start + (end - start) / 2
        if countCopier(mid, pages) > k {
            start = mid
        } else {
            end = mid
        }
    }
    if countCopier(start, pages) <= k {
        return start
    } else {
        return end
    }
}

private func countCopier(_ minTime: Int, _ pages: [Int]) -> Int {
    var copier = 1, sum = 0
    for i in pages {
        if sum + i > minTime {
            copier += 1
            sum = 0
        }
        sum += i
    }
    return copier
}

//minTime = 10, [10, 8, 1, 4, 9]
//sum = 10
