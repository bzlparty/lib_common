"Common functions for Bazel rules."

def filter(f, arr):
    """
    Filter a list `arr` by applying a function `f` to each item.

    filter(lambda i: i.endswith(".js"), ["app.ts", "app.js", "lib.ts", "lib.js"]) // ["app.js", "lib.js"]
    """
    res = []
    for a in arr:
        if f(a):
            res.append(a)
    return res

def map(f, arr):
    """
    Apply a function `f` with each item of `arr` and return a list
    with all items where said funtion returns truthy.

    map(lambda i: i*2, [1, 2, 3]) // [2, 4, 6]
    """
    return [f(a) for a in arr]
