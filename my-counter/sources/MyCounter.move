module MyCounterAddr::MyCounter {
    use StarcoinFramework::Signer;
    struct Counter has key{
        value : u64,
    }

    public fun init(account : &signer) {
        let c = Counter{value : 0};
        move_to(account, c);
    }

    public fun incr(account : &signer) acquires Counter{
        let counter = borrow_global_mut<Counter>(Signer::address_of(account));
        counter.value = counter.value + 1;
    }

    public(script) fun init_counter(account: signer){
        Self::init(&account);
    }

    public(script) fun incr_counter(account: signer) acquires Counter {
        Self::incr(&account);
    }
}