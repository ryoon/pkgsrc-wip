$NetBSD$

Stolen from https://github.com/nrTQgc/druntime/tree/netbsd

--- runtime/druntime/src/core/sys/posix/sys/select.d.orig	2016-02-13 20:02:16.000000000 +0000
+++ runtime/druntime/src/core/sys/posix/sys/select.d
@@ -218,6 +218,55 @@ else version( FreeBSD )
     int pselect(int, fd_set*, fd_set*, fd_set*, in timespec*, in sigset_t*);
     int select(int, fd_set*, fd_set*, fd_set*, timeval*);
 }
+else version( NetBSD )
+{
+    private
+    {
+        alias c_ulong __fd_mask;
+        enum _NFDBITS = __fd_mask.sizeof * 8;
+    }
+
+    enum uint FD_SETSIZE = 256;
+
+    struct fd_set
+    {
+        __fd_mask[(FD_SETSIZE + (_NFDBITS - 1)) / _NFDBITS] __fds_bits;
+    }
+
+    extern (D) __fd_mask __fdset_mask(uint n)
+    {
+        return cast(__fd_mask) 1 << (n % _NFDBITS);
+    }
+
+    extern (D) void FD_CLR( int n, fd_set* p )
+    {
+        p.__fds_bits[n / _NFDBITS] &= ~__fdset_mask(n);
+    }
+
+    extern (D) bool FD_ISSET( int n, const(fd_set)* p )
+    {
+        return (p.__fds_bits[n / _NFDBITS] & __fdset_mask(n)) != 0;
+    }
+
+    extern (D) void FD_SET( int n, fd_set* p )
+    {
+        p.__fds_bits[n / _NFDBITS] |= __fdset_mask(n);
+    }
+
+    extern (D) void FD_ZERO( fd_set* p )
+    {
+        fd_set *_p;
+        size_t _n;
+
+        _p = p;
+        _n = (FD_SETSIZE + (_NFDBITS - 1)) / _NFDBITS;
+        while (_n > 0)
+            _p.__fds_bits[--_n] = 0;
+    }
+
+    int pselect(int, fd_set*, fd_set*, fd_set*, in timespec*, in sigset_t*);
+    int select(int, fd_set*, fd_set*, fd_set*, timeval*);
+}
 else version (Solaris)
 {
     private
