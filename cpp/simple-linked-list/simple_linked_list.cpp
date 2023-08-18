#include "simple_linked_list.h"

#include <stdexcept>

namespace simple_linked_list {

std::size_t List::size() const {
    return current_size;
}

void List::push(int entry) {
    Element* elem = new Element{entry};

    elem->next = head;
    head = elem;
    ++current_size;
}

int List::pop() {
    if (head != nullptr) {
        Element* ptr = head;
        head = head->next;
        int value = ptr->data;
        delete ptr;
        current_size--;
        return value;
    } else {
        throw std::out_of_range("Can't pop empty list.");
    }
}

void List::reverse() {
    Element* current = head;
    Element* prev = nullptr;
    Element* next = nullptr;

    while (current != nullptr) {
        next = current->next;
        current->next = prev;
        prev = current;
        current = next;
    }
    head = prev;
}

List::~List() {
    while (head != nullptr) {
        Element* e = head;
        head = e->next;
        delete e;
    }
}

}

