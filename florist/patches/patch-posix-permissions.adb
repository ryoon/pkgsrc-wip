$NetBSD: patch-posix-permissions.adb,v 1.1 2004/01/08 23:28:54 johnrshannon Exp $

--- posix-permissions.adb.orig	2002-10-24 02:03:52.000000000 -0600
+++ posix-permissions.adb
@@ -105,7 +105,7 @@ package body POSIX.Permissions is
    procedure Set_Allowed_Process_Permissions
      (Permissions : in Permission_Set;
       Old_Perms   : out Permission_Set) is
-      Mask : mode_t :=
+      Mask : constant mode_t :=
         not (Form_C_Permission (Permissions) and File_Access_Permission_Bits);
    begin
       Cached_Umask := Mask;
