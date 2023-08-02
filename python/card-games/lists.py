"""Functions for tracking poker hands and assorted card tasks.

Python list documentation: https://docs.python.org/3/tutorial/datastructures.html
"""
import math

def get_rounds(number):
    """Create a list containing the current and next two round numbers.

    :param number: int - current round number.
    :return: list - current round and the two that follow.
    """
    return [number, number + 1, number + 2]

def concatenate_rounds(rounds_1, rounds_2):
    """Concatenate two lists of round numbers.

    :param rounds_1: list - first rounds played.
    :param rounds_2: list - second set of rounds played.
    :return: list - all rounds played.
    """
    return rounds_1 + rounds_2

def list_contains_round(rounds, number):
    """Check if the list of rounds contains the specified number.

    :param rounds: list - rounds played.
    :param number: int - round number.
    :return: bool - was the round played?
    """
    return number in rounds


def card_average(hand):
    """Calculate and returns the average card value from the list.

    :param hand: list - cards in hand.
    :return: float - average value of the cards in the hand.
    """
    return sum(hand) / len(hand)

def approx_average_is_average(hand):
    """Return if an average is using (first + last index values ) OR ('middle' card) == calculated average.

    :param hand: list - cards in hand.
    :return: bool - does one of the approximate averages equal the `true average`?
    """
    real_average = card_average(hand)
    average1 = (hand[0] + hand[-1]) / 2.0
    average2 = hand[int(len(hand) / 2)]
    return real_average in [average1, average2]

def average_even_is_average_odd(hand):
    """Return if the (average of even indexed card values) == (average of odd indexed card values).

    :param hand: list - cards in hand.
    :return: bool - are even and odd averages equal?
    """
    indices = list(range(len(hand)))
    even_indices = [index for index in indices if index % 2 == 0]
    odd_indices = [index for index in indices if index % 2 == 1]

    def avg(hand, indices):
        total = 0
        for index in indices:
            total += hand[index]
        return total / len(indices)
    
    return avg(hand, even_indices) == avg(hand, odd_indices)

def maybe_double_last(hand):
    """Multiply a Jack card value in the last index position by 2.

    :param hand: list - cards in hand.
    :return: list - hand with Jacks (if present) value doubled.
    """
    hand[-1] = hand[-1] * 2 if hand[-1] == 11 else hand[-1]
    return hand
