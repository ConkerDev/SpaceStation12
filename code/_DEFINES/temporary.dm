// These defines are things like being able to use qdel() instead of del without having qdel defined, so switching to a GC when we have one later isn't a PAIN.

// GC stuff, once we have a GC remove these and define the procs, voila!
#define Destroy Del
#define qdel del
