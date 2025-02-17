script;
use get_storage_key_abi::TestContract;
use std::assert::assert;

fn main() -> u64 {
    let caller = abi(TestContract, 0xde1fc5ef591759ed30d7ec21256339b11937d3b8d84229ca12915cc3637acdf9);

    // Get the storage keys directly by calling the contract methods from_f1,
    // from_f2, from_f3, from_f4. The keys correspond to different entries in
    // the storage block so they should return different values.
    let f1 = caller.from_f1();
    assert(f1 == caller.from_f1());

    let f2 = caller.from_f2();
    assert(f2 == caller.from_f2());

    let f3 = caller.from_f3();
    assert(f3 == caller.from_f3());

    let f4 = caller.from_f4();
    assert(f4 == caller.from_f4());

    assert(f1 != f2);
    assert(f1 != f3);
    assert(f1 != f4);

    assert(f2 != f3);
    assert(f2 != f4);

    assert(f3 != f4);

    // Get the storage keys but using from_callers. This should work and the
    // same keys as above should be returned. This checks that inlining is
    // working as intended.
    let(caller_f1, caller_f2, caller_f3, caller_f4) = caller.from_callers();
    assert(f1 == caller_f1);
    assert(f2 == caller_f2);
    assert(f3 == caller_f3);
    assert(f4 == caller_f4);

    1
}
