#include "say.h"
#include <iostream>
#include <stdexcept>
#include <cmath>
#include <map>

namespace say {
  const std::map<int, std::string> _names{
    { 0, "zero" },
    { 1, "one" },
    { 2, "two" },
    { 3, "three" },
    { 4, "four" },
    { 5, "five" },
    { 6, "six" }, 
    { 7, "seven" },
    { 8, "eight" }, 
    { 9, "nine" },
    { 10, "ten" }, 
    { 11, "eleven" },
    { 12, "twelve" },
    { 13, "thirteen" },
    { 14, "fourteen" },
    { 15, "fifteen" },
    { 16, "sixteen" },
    { 17, "seventeen" },
    { 18, "eighteen" },
    { 19, "nineteen" },
    { 20, "twenty" },
    { 30, "thirty" },
    { 40, "forty" },
    { 50, "fifty" },
    { 60, "sixty" },
    { 70, "seventy" },
    { 80, "eighty" },
    { 90, "ninety" },
    { 100, "hundred " }, 
    { 1000, "thousand " },
    { 1000000, "million " },
    { 1000000000, "billion " }};

  std::string in_english(unsigned long long x) {
    if (static_cast<long long>(x) == -1) throw std::domain_error("you fucked up!");
    if (x >= 1000ULL * 1000ULL * 1000ULL * 1000ULL) throw std::domain_error("too big, fucker!");

    int e = (power(x) / 3) * 3;
    return under_n(e, x);
  }

  unsigned long long pow_(unsigned long long x) {
    return static_cast<unsigned long long>(std::pow(10ULL, x));
  }

  std::string under_n(int e, unsigned long long x) {
    std::string str("");
    if (x > 999) {
      if (x / pow_(e) > 0) {
        str.append(process_hundreds(x / pow_(e)));
        if (e > 0) {
          str.append(" ");
          str.append(_names.at(pow_(e)));
          if (x % pow_(e) > 0) str.append(under_n(e - 3, x % pow_(e)));
        }
      } else {
        str.append(under_n(e - 3, x % pow_(e)));
      }
    } else {
      str.append(under1000(x));
    }

    return chomp(str);
  }

  std::string under1000(int n) {
    std::string str("");
    if (n < 20) {
      str.append(_names.at(n));
    } else if (n < 100) {
      str = dash_join(_names.at(n / 10 * 10), _names.at(n % 10));
    } else if (n < 1000) {
      str.append(process_hundreds(n));
    }

    return str;
  }

  int power(unsigned long long x) {
    int e = 0;

    while((x / static_cast<unsigned long long>(std::pow(10, e))) > 0) {
      ++e;
    }

    return e - 1;
  }

  std::string process_tens(int n) {
    std::string str;
    size_t ones_value = n / 10;
    bool addDash = false;
    if (ones_value != 0) {
      str.append(_names.at((n / 10) * 10));
      addDash = true;
    }

    if (n % 10 > 0)
    {
      if (addDash) str.append("-");
      str.append(_names.at(n % 10));
    }
    return str;
  }

  std::string process_hundreds(int n) {
    std::string str("");

    if (n < 100) return process_tens(n % 100);

    if (n / 100 > 0) {
      str.append(process_tens(n / 100));
      str.append(" hundred ");
    }

    if (n % 100 == 0) {
      str = str.substr(0, str.size() - 1);
    }

    str.append(process_tens(n % 100));

    return chomp(str);
  }

  std::string chomp(std::string str) {
    if (str.substr(str.size() - 1, str.size() - 1) == " ") {
      return str.substr(0, str.size() - 1);
    } else {
      return str;
    }
  }

  std::string dash_join(std::string sa, std::string sb) {
    std::string str(sa);

    if (sb.empty() || sb == "zero") {
      return str;
    } else {
      str.append("-");
      str.append(sb);
    }

    return str;
  }
}

