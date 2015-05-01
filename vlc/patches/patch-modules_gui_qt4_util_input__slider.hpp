$NetBSD: patch-modules_gui_qt4_util_input__slider.hpp,v 1.1 2015/05/01 06:24:13 idleroux Exp $

--- modules/gui/qt4/util/input_slider.hpp.orig	2014-11-16 18:57:59.000000000 +0000
+++ modules/gui/qt4/util/input_slider.hpp
@@ -48,6 +48,8 @@ class QPropertyAnimation;
 class QStyleOption;
 class QCommonStyle;
 
+typedef int64_t putime_t;
+
 /* Input Slider derived from QSlider */
 class SeekSlider : public QSlider
 {
@@ -107,7 +109,7 @@ private:
     QTimer *hideHandleTimer;
 
 public slots:
-    void setPosition( float, int64_t, int );
+    void setPosition( float, putime_t, int );
     void setSeekable( bool b ) { b_seekable = b ; }
     void updateBuffering( float );
     void hideHandle();
