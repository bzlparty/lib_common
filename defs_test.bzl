"Test suite for defs.bzl"

load("@bazel_skylib//lib:unittest.bzl", "asserts", "unittest")
load("//:defs.bzl", "every", "filter", "find", "map", "occurs", "once", "pick", "some")

def every_test_impl(ctx):
    env = unittest.begin(ctx)
    asserts.equals(env, every(lambda i: i.endswith(".js"), ["app.js", "lib.js"]), True)
    asserts.equals(env, every(lambda i: i.endswith(".ts"), ["app.js", "lib.ts"]), False)
    return unittest.end(env)

def find_test_impl(ctx):
    env = unittest.begin(ctx)
    asserts.equals(env, find(lambda i: i.endswith(".js"), ["app.ts", "app.js", "lib.ts", "lib.js"]), (1, "app.js"))
    asserts.equals(env, find(lambda i: i.endswith(".exe"), ["app.ts", "app.js", "lib.ts", "lib.js"]), (-1, None))
    return unittest.end(env)

def filter_test_impl(ctx):
    env = unittest.begin(ctx)
    asserts.equals(env, filter(lambda i: i.endswith(".js"), ["app.ts", "app.js", "lib.ts", "lib.js"]), ["app.js", "lib.js"])
    return unittest.end(env)

def map_test_impl(ctx):
    env = unittest.begin(ctx)
    asserts.equals(env, map(lambda i: i * 2, [1, 2, 3]), [2, 4, 6])
    return unittest.end(env)

def occurs_test_impl(ctx):
    env = unittest.begin(ctx)
    asserts.equals(env, occurs(2, [1, 2, 3]), True)
    asserts.equals(env, occurs("foo", ["bar", "baz"]), False)
    return unittest.end(env)

def once_test_impl(ctx):
    env = unittest.begin(ctx)
    asserts.equals(env, once(lambda i: i == 1, [1, 2, 3]), True)
    asserts.equals(env, once(lambda i: i > 1, [1, 2, 3]), False)
    return unittest.end(env)

def pick_test_impl(ctx):
    env = unittest.begin(ctx)
    asserts.equals(env, pick(lambda i: i > 1, [1, 2, 3]), 2)
    return unittest.end(env)

def some_test_impl(ctx):
    env = unittest.begin(ctx)
    asserts.equals(env, some(lambda i: i.endswith(".js"), ["app.ts", "app.js"]), True)
    asserts.equals(env, some(lambda i: i.endswith(".js"), ["app.ts", "lib.ts"]), False)
    return unittest.end(env)

_every_test = unittest.make(every_test_impl)
_find_test = unittest.make(find_test_impl)
_filter_test = unittest.make(filter_test_impl)
_map_test = unittest.make(map_test_impl)
_occurs_test = unittest.make(occurs_test_impl)
_once_test = unittest.make(once_test_impl)
_pick_test = unittest.make(pick_test_impl)
_some_test = unittest.make(some_test_impl)

def defs_test_suite(name):
    unittest.suite(name, _every_test, _find_test, _filter_test, _map_test, _occurs_test, _once_test, _pick_test, _some_test)
