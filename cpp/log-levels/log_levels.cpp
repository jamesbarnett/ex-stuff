#include <string>
#include <regex>
#include <iostream>
#include <sstream>

namespace log_line {
    const int LOG_LEVEL_POSITION = 1;
    const int MESSAGE_POSITION = 3;

    [[nodiscard]] std::string extract_log_line_component(
            const std::string& line, int position) {

        std::regex re_message{R"(\[([^\]]+)\]:(\s+)([^\b]*))"};
        std::smatch sm{};

        if (std::regex_search(line, sm, re_message)) {
            return sm[position];
        } else {
            return "";
        }
    }

    [[nodiscard]] std::string message(const std::string& line) {
        return extract_log_line_component(line, MESSAGE_POSITION);
    }

    [[nodiscard]] std::string log_level(const std::string& line) {
        return extract_log_line_component(line, LOG_LEVEL_POSITION);
    }

    [[nodiscard]] std::string reformat(const std::string& line) {
        auto level{log_level(line)};
        auto msg{message(line)};
        std::stringstream str{};

        str << msg << " (" << level << ")";

        return str.str();
    }
} // namespace log_line
