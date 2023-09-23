#include <iostream>

namespace targets {
class Alien {
public:
    [[nodiscard]]
    Alien(int x, int y)
        : x_coordinate{x}
        , y_coordinate{y}
        , health_{3} {}

    int x_coordinate;
    int y_coordinate;

    [[nodiscard]]
    auto get_health() const -> int { return this->health_; }

    auto hit() -> bool {
        if (0 < this->health_) {
            this->health_--;
        } else {
            std::cerr << "Error: already dead\n";
        }

        return (0 < this->health_);
    }

    [[nodiscard]]
    auto is_alive() const -> bool {
        return (0 < this->health_);
    }

    auto teleport(const int new_x, const int new_y) -> bool {
        this->x_coordinate = new_x;
        this->y_coordinate = new_y;
        return true;
    }

    [[nodiscard]]
    auto collision_detection(const Alien& other) const -> bool {
        return collision_detection(other.x_coordinate, other.y_coordinate);
    }

    [[nodiscard]]
    auto collision_detection(const int x, const int y) const -> bool {
      return x == this->x_coordinate && y == this->y_coordinate;
    }

private:
    int health_;
};

}  // namespace targets
