"Common functions for Bazel rules."

def every(f, arr):
    """Check if every item of `arr` passes function `f`.

    Args:
      f: function to execute on every item,
      arr: list to iterate over,

    Returns:
      True or False

    Example:
      every(lambda i: i.endswith(".js"), ["app.js", "lib.js"]) // True
    """
    return len(filter(f, arr)) == len(arr)

def filter(f, arr):
    """Filter a list `arr` by applying a function `f` to each item.

    Args:
      f: function to execute on every item,
      arr: list to iterate over,

    Returns:
      A new list containing items that passed the filter function.

    Example:
      filter(lambda i: i.endswith(".js"), ["app.ts", "app.js", "lib.ts", "lib.js"]) // ["app.js", "lib.js"]
    """
    res = []
    for a in arr:
        if f(a):
            res.append(a)
    return res

def map(f, arr):
    """Apply a function `f` with each item of `arr` and return a list with all items where said funtion returns truthy.

    Args:
      f: function to execute on every item.
      arr: list to iterate over.

    Returns:
      A new list with all mapped items.

    Example:
      map(lambda i: i*2, [1, 2, 3]) // [2, 4, 6]
    """
    return [f(a) for a in arr]

def occurs(i, arr):
    """Know, if an item `i` occurs in a list `arr`.

    Args:
      i: item to search for
      arr: list to search

    Returns:
      True or False

    Example:
      occurs(2, [1, 2, 3]) // True
      occurs("foo", ["bar", "baz"]) // False
    """
    for a in arr:
        if a == i:
            return True
    return False

def some(f, arr):
    """Check if at least one item of `arr` passes function `f`.

    Args:
      f: function to execute on every item,
      arr: list to iterate over,

    Returns:
      True or False

    Example:
      some(lambda i: i.endswith(".js"), ["app.js", "lib.ts"]) // True
    """
    return len(filter(f, arr)) > 0
