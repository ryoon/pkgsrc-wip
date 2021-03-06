$NetBSD$

--- test/asan/TestCases/Posix/stack-use-after-return.cc.orig	2018-06-01 09:39:33.000000000 +0000
+++ test/asan/TestCases/Posix/stack-use-after-return.cc
@@ -76,9 +76,11 @@ int main(int argc, char **argv) {
   pthread_attr_init(&attr);
   if (kStackSize > 0) {
     size_t desired_stack_size = kStackSize;
+#ifdef PTHREAD_STACK_MIN
     if (desired_stack_size < PTHREAD_STACK_MIN) {
       desired_stack_size = PTHREAD_STACK_MIN;
     }
+#endif
 
     int ret = pthread_attr_setstacksize(&attr, desired_stack_size);
     if (ret != 0) {
