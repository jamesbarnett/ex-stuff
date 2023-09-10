#include "vehicle_purchase.h"
#include <algorithm>
#include <vector>


namespace vehicle_purchase {
    [[nodiscard]]
    bool needs_license(std::string kind) {
        if ("car" == kind || "truck" == kind) return true;
        else return false;
    }

    [[nodiscard]]
    std::string choose_vehicle(std::string option1
            , std::string option2) {
        std::vector<std::string> vehicles{option1, option2};
        std::sort(vehicles.begin(), vehicles.end());

        return vehicles.at(0) + " is clearly the better choice.";
    }

    [[nodiscard]]
    double calculate_resell_price(double original_price, double age) {
        if (0 < age && 3 >= age) return original_price * 0.8;
        if (3 < age && 10 > age) return original_price * 0.7;
        else return original_price * 0.5;
    }
}  // namespace vehicle_purchase
