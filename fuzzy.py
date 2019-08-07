
s = "I like to drink milk"

db = ['why you should drink milk', 'i like potatoes', 'what is the meaning of this?',
      'I wonder how quick I can write this code', 'milk is the best drink']
e = ['the', 'and']
"""
    Heuristics
        the more sequential letters between the two strings, the higher the value
        filter out works like 'the' or 'and' unless they are part of a longer match
            also do not consider whitespace for actual matches
"""

from typing import List, Tuple

def longest_match(s1: str, s2: str):
    if len(s1) <= 0 or len(s2) <= 0:
        return ''

    if s1[0] == s2[0]:
        return s1[0] + longest_match(s1[1:], s2[1:])

    return ''

#return true if the seoncd index starts somewhere inside the first
within_range = lambda i1, i2: i2[0] >= i1[0] and i2[0] < i1[1] or      \
                              i1[0] >= i2[0] and i1[0] < i2[1]

def remove_overlapping(L: List[Tuple[str, Tuple[int, int], Tuple[int, int]]]):
    """
        Remove string matches that involve the same indicies as another string match and
        are shorter

        Returns a list of just the strings
    """
    non_dups = []
    for s1, i11, i12 in L:
        found = False
        for ii, (s2, i21, i22) in enumerate(non_dups):
            if within_range(i22, i12) or within_range(i11, i21):
                found = True

                #could do this more intelligently with the indexes
                if len(s1) > len(s2):
                    non_dups[ii] = (s1, i11, i12)
        if not found:
            non_dups.append((s1, i11, i12))

    return [s for s, i1, i2 in non_dups]

def value(s1: str, s2: str, exclude: List[str]):
    vals = []
    for ii, c1 in enumerate(s1):
        for jj, c2 in enumerate(s2):
            if c1 == c2 and c1 not in [' ', '\n', '\t']:
                match = longest_match(s1[ii:], s2[jj:])
                if match not in exclude + ['', ' ', '\n', '\t']:
                    match = match.strip()
                    l = len(match)
                    vals.append((match, (ii, ii + l), (jj, jj+l)))

    filtered = remove_overlapping(vals)

    return sum([len(s)**2 for s in filtered])

def compute_best_value(s1: str, db: List[str], exclude: List[str]):
    values = {}
    for s2 in db:
        values[(value(s1, s2, exclude))] = s2

    max = sorted(values.keys())[-1]
    return (max, values[max])

if __name__ == '__main__':
    inp = input("Give me a search term >    ")
    print(compute_best_value(inp, db, e))
