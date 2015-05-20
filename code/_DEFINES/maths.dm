//Defines for usefull procs, using defines to lower CPU usage at runtime.

//Clamps x between y and z, where y is the lower bound and z the upper.
#define clamp(x, y, z) (x <= y ? y : x >= z ? z : x)
