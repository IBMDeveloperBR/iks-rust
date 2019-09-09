/*
extern crate hwloc;

use hwloc::Topology;
use std::thread;
use std::time::Duration;

fn main() {
    let topo = Topology::new();

    for i in 0..topo.depth() {
        println!("*** Objects at level {}", i);

        for (idx, object) in topo.objects_at_depth(i).iter().enumerate() {
            println!("{}: {}", idx, object);
        }
    }
}
*/

fn main() {
    println!("Hello World!")
}