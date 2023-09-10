#if !defined(BINARY_SEARCH_H)
#define BINARY_SEARCH_H

#include <vector>
#include <stdexcept>
#include <cstddef>

namespace binary_search {
    inline size_t binsearch(const std::vector<int>& data, int low,
                     int high, int mid, int value) {
        if (low > high) throw std::domain_error("Domain Error.");

        if (value < data.at(low) || value > data.at(high)) {
            throw std::domain_error("Domain Error.");
        }

        auto item = data.at(mid);
        
        if (item == value) {
            return mid;
        }
        else if (item > value) {
            return binsearch(data, low, mid - 1, ((mid + low - 1) / 2), value);
        }
        else if (item < value) {
            return binsearch(data, mid + 1, high, ((high + mid + 1) / 2), value);
        }

        throw std::domain_error("Domain Error.");
    }

    inline size_t find(const std::vector<int>& data, int value) {
        if (data.empty()) throw std::domain_error("Domain Error."); 

        size_t count = data.size() - 1;
        size_t mid = count / 2;
    
        return binsearch(data, 0, count, mid, value);
    }
}

#endif
