Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8058F529B0
	for <meta-arago@arago-project.org>;
	Wed,  3 Jun 2020 22:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9C5A240BCC;
	Wed,  3 Jun 2020 22:22:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8vtRP0mZo_Bo; Wed,  3 Jun 2020 22:22:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A192440ADE;
	Wed,  3 Jun 2020 22:22:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9BAB31731FF;
	Wed,  3 Jun 2020 18:22:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  3 Jun 2020 18:22:02 -0400
Message-Id: <1591222922-19303-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] voxelsdk: deprecated, remove
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Jun 2020 22:24:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  |   9 +-
 .../recipes-core/packagegroups/ti-demos.bb         |   9 -
 .../voxelsdk/0001-PLSDK-AM437x-update.patch        |  73 -----
 .../voxelsdk/voxelsdk/0002-Fix-SWIG-support.patch  |  37 ---
 ...mmand-line-options-and-move-OpenCV-render.patch | 324 ---------------------
 ...004-Platform-specific-op_clk_freq-setting.patch |  41 ---
 ...window-touch-mouse-even-left-button-click.patch |  56 ----
 ...people-count-report-in-stdout-for-testing.patch |  25 --
 .../recipes-apps/voxelsdk/voxelsdk_git.bb          |  67 -----
 9 files changed, 3 insertions(+), 638 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0001-PLSDK-AM437x-update.patch
 delete mode 100644 meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0002-Fix-SWIG-support.patch
 delete mode 100644 meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0003-Add-more-command-line-options-and-move-OpenCV-render.patch
 delete mode 100644 meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0004-Platform-specific-op_clk_freq-setting.patch
 delete mode 100644 meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0005-Exit-on-window-touch-mouse-even-left-button-click.patch
 delete mode 100644 meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0006-Include-people-count-report-in-stdout-for-testing.patch
 delete mode 100644 meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 851f481..4f35c35 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -163,23 +163,20 @@ EXTRA_LIBS_append_k2e = " libulm-staticdev \
                               gdbserver-c6x-dev \
 "
 
-VOXEL_PACKAGES = ""
-#VOXEL_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'voxelsdk-dev', '', d)}"
-
 EXTRA_PACKAGES = ""
-EXTRA_PACKAGES_append_ti33x = " ${VOXEL_PACKAGES} \
+EXTRA_PACKAGES_append_ti33x = " \
                                 arm-compute-library-dev \
                                 tensorflow-lite-dev \
                                 tensorflow-lite-staticdev \
                                 pdm-anomaly-detection-dev \
 "
-EXTRA_PACKAGES_append_ti43x = " ${VOXEL_PACKAGES} \
+EXTRA_PACKAGES_append_ti43x = " \
                                 arm-compute-library-dev \
                                 tensorflow-lite-dev \
                                 tensorflow-lite-staticdev \
                                 pdm-anomaly-detection-dev \
 "
-EXTRA_PACKAGES_append_omap-a15 = " ${VOXEL_PACKAGES} \
+EXTRA_PACKAGES_append_omap-a15 = " \
                                 arm-compute-library-dev \
                                 tensorflow-lite-dev \
                                 tensorflow-lite-staticdev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
index 07c0b92..054c2f5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
@@ -5,14 +5,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-VOXEL_PKG = ""
-#VOXEL_PKG = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'voxelsdk', '', d)}"
-
-VOXELSDK = ""
-VOXELSDK_ti33x = "${VOXEL_PKG}"
-VOXELSDK_ti43x = "${VOXEL_PKG}"
-VOXELSDK_omap-a15 = "${VOXEL_PKG}"
-
 PDM_ANOMALY = ""
 PDM_ANOMALY_ti33x = "pdm-anomaly-detection"
 PDM_ANOMALY_ti43x = "pdm-anomaly-detection"
@@ -20,6 +12,5 @@ PDM_ANOMALY_omap-a15 = "pdm-anomaly-detection"
 PDM_ANOMALY_am65xx = "pdm-anomaly-detection"
 
 RDEPENDS_${PN} = "\
-    ${VOXELSDK} \
     ${PDM_ANOMALY} \
 "
diff --git a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0001-PLSDK-AM437x-update.patch b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0001-PLSDK-AM437x-update.patch
deleted file mode 100644
index 2e1e740..0000000
--- a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0001-PLSDK-AM437x-update.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 9ef95f0defcd7215b3d514e7fb7321cd299882cd Mon Sep 17 00:00:00 2001
-From: Djordje Senicic <d-senicic1@ti.com>
-Date: Wed, 22 Feb 2017 12:21:07 -0500
-Subject: [PATCH] PLSDK AM437x update
-
-Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
----
- CMakeLists.txt                  | 11 ++++++++++-
- Voxel/CMakeLists.txt            |  2 +-
- Voxel/SWIG/standard_container.i |  5 +++--
- 3 files changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ed7a015..a187c96 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -26,9 +26,18 @@ if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
-   SET(ARM_PLATFORM 1)
-   
-   if(ARM_PLATFORM)
--    add_definitions(-mtune=arm7 -mfpu=neon-vfpv4 -mfloat-abi=hard -pthread -std=c++11 -fPIC -ffast-math)
-+#    add_definitions(-mtune=arm7 -mfpu=neon-vfpv4 -mfloat-abi=hard -pthread -std=c++11 -fPIC -ffast-math)
-     #-DARM_OPT to enable arm optimizaions
-     ADD_DEFINITIONS(-DARM_OPT)
-+#OK:
-+#add_definitions(-mtune=arm7 -mfloat-abi=hard -pthread -std=c++11 -fPIC -ffast-math)
-+#OK:
-+#add_definitions(-ffast-math -mcpu=cortex-a9 -mfloat-abi=hard -mfpu=neon-fp16 -fPIC -pthread -std=c++11)
-+#OK:
-+#add_definitions(-ffast-math -mcpu=cortex-a9 -mfloat-abi=hard -mfpu=neon -fPIC -pthread -std=c++11)
-+
-+add_definitions(-mtune=arm7 -mfpu=neon -mfloat-abi=hard -pthread -std=c++11 -fPIC -ffast-math)
-+
-     ADD_DEFINITIONS(-DCOMMON_OPT)
- 
-   else()
-diff --git a/Voxel/CMakeLists.txt b/Voxel/CMakeLists.txt
-index ae98e81..74528d8 100644
---- a/Voxel/CMakeLists.txt
-+++ b/Voxel/CMakeLists.txt
-@@ -149,7 +149,7 @@ install(FILES
-   COMPONENT voxel_dev
- )
- 
--#add_subdirectory(SWIG)
-+add_subdirectory(SWIG)
- 
- IF(LINUX)
-   set(CPACK_COMPONENTS_ALL voxel)
-diff --git a/Voxel/SWIG/standard_container.i b/Voxel/SWIG/standard_container.i
-index f61e342..1d2cb66 100644
---- a/Voxel/SWIG/standard_container.i
-+++ b/Voxel/SWIG/standard_container.i
-@@ -113,7 +113,7 @@
-   
- %enddef
- 
--
-+#if SWIG_VERSION < 0x030008
- //
- // Ignore member methods for Type with no default constructor
- //
-@@ -124,4 +124,5 @@
- %feature("ignore") std::deque<Type >::resize(size_type size);
- %feature("ignore") std::list<Type >::list(size_type size);
- %feature("ignore") std::list<Type >::resize(size_type size);
--%enddef
-\ No newline at end of file
-+%enddef
-+#endif
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0002-Fix-SWIG-support.patch b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0002-Fix-SWIG-support.patch
deleted file mode 100644
index 77a6de1..0000000
--- a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0002-Fix-SWIG-support.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a800f446d9c976f6fb11f4d601cc386bbdce59e1 Mon Sep 17 00:00:00 2001
-From: Djordje Senicic <d-senicic1@ti.com>
-Date: Wed, 22 Feb 2017 14:14:52 -0500
-Subject: [PATCH] Fix SWIG support
-
-Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
----
- Voxel/SWIG/CMakeLists.txt | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/Voxel/SWIG/CMakeLists.txt b/Voxel/SWIG/CMakeLists.txt
-index a4f6d53..f4070ac 100644
---- a/Voxel/SWIG/CMakeLists.txt
-+++ b/Voxel/SWIG/CMakeLists.txt
-@@ -1,10 +1,11 @@
--SET(GENERATE_PYTHON_BINDINGS "FALSE" CACHE BOOL "Controls generation of Python bindings")
-+SET(GENERATE_PYTHON_BINDINGS "TRUE" CACHE BOOL "Controls generation of Python bindings")
- 
- IF(${GENERATE_PYTHON_BINDINGS})
- 
- FIND_PACKAGE(SWIG REQUIRED)
- INCLUDE(${SWIG_USE_FILE})
- 
-+SET(Python_ADDITIONAL_VERSIONS 2.7)
- FIND_PACKAGE(PythonLibs)
- INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_PATH})
- 
-@@ -46,4 +47,4 @@ install(FILES
-   DESTINATION lib/python2.7
-   COMPONENT voxel_python
- )
--ENDIF()
-\ No newline at end of file
-+ENDIF()
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0003-Add-more-command-line-options-and-move-OpenCV-render.patch b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0003-Add-more-command-line-options-and-move-OpenCV-render.patch
deleted file mode 100644
index 4ab74e6..0000000
--- a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0003-Add-more-command-line-options-and-move-OpenCV-render.patch
+++ /dev/null
@@ -1,324 +0,0 @@
-From 29cc2430579eb257d9e1ac1caf0b4515278fd375 Mon Sep 17 00:00:00 2001
-From: Djordje Senicic <d-senicic1@ti.com>
-Date: Mon, 13 Mar 2017 19:51:30 -0400
-Subject: [PATCH] Add more command line options and move OpenCV rendering to
- main thread
-
-Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
----
- Demos/Horus.cpp                | 98 +++++++++++++++++++++++++-----------------
- Demos/SimplePeopleTracking.cpp | 91 ++++++++++++++++++++++++++++++++-------
- Demos/TOFApp.cpp               | 14 +++---
- 3 files changed, 139 insertions(+), 64 deletions(-)
-
-diff --git a/Demos/Horus.cpp b/Demos/Horus.cpp
-index e0181af..de1837e 100644
---- a/Demos/Horus.cpp
-+++ b/Demos/Horus.cpp
-@@ -24,6 +24,12 @@
- #include <stdlib.h>
- 
- extern int skipped_frames;
-+extern pthread_mutex_t main_thread_image_mtx;
-+extern Mat app_image[];
-+extern int main_thread_image_rd;
-+extern int main_thread_image_wr;
-+extern int main_thread_image_cnt;
-+extern char show_image;
- 
- Horus::Horus(int w, int h) : TOFApp(w, h)
- {
-@@ -126,10 +132,9 @@ bool Horus::isPerson(vector<cv::Point> &contour, Mat dMat)
-    return rc;
- }
- 
--static int draw_throttle = 0;
--
- void Horus::update(Frame *frame)
- {
-+   Mat drawing;
-    vector< vector<cv::Point> > contours;
-    vector<Vec4i> hierarchy;
-    RNG rng(12345);
-@@ -147,51 +152,66 @@ void Horus::update(Frame *frame)
- 
-       // Apply amplitude gain
-       _iMat = (float)_ampGain*_iMat;
-+      if(show_image == 'p')
-+      { //Skip below processing if we are not detecting people!
-+        // Update background as required
-+        if (!_setBackground) {
-+           _dMat.copyTo(_bkgndMat);
-+           _setBackground = true;
-+           cout << endl << "Updated background" << endl;
-+        }
- 
--      // Update background as required
--      if (!_setBackground) {
--         _dMat.copyTo(_bkgndMat);
--         _setBackground = true;
--         cout << endl << "Updated background" << endl;
--      }
--
--      // Find foreground by subtraction 
--      Mat fMat = _bkgndMat-_dMat;
-+        // Find foreground by subtraction 
-+        Mat fMat = _bkgndMat-_dMat;
- 
--      // Convert to binary image based on amplitude and depth thresholds
--      clipBackground(fMat, _iMat, (float)_depthThresh/100.0, (float)_ampThresh/100.0);
--      fMat.convertTo(_bMat, CV_8U, 255.0);
-+        // Convert to binary image based on amplitude and depth thresholds
-+        clipBackground(fMat, _iMat, (float)_depthThresh/100.0, (float)_ampThresh/100.0);
-+        fMat.convertTo(_bMat, CV_8U, 255.0);
- 
--      // Apply morphological open to clean up image
--      Mat morphMat = _bMat.clone();
--      Mat element = getStructuringElement( 0, Size(3,3), cv::Point(1,1) );
--      morphologyEx(_bMat, morphMat, 2, element);
-+        // Apply morphological open to clean up image
-+        Mat morphMat = _bMat.clone();
-+        Mat element = getStructuringElement( 0, Size(3,3), cv::Point(1,1) );
-+        morphologyEx(_bMat, morphMat, 2, element);
- 
--      // Find all contours
--      findContours(morphMat, contours, hierarchy, CV_RETR_TREE, 
--                             CV_CHAIN_APPROX_SIMPLE, cv::Point(0,0));
-+        // Find all contours
-+        findContours(morphMat, contours, hierarchy, CV_RETR_TREE, 
-+                               CV_CHAIN_APPROX_SIMPLE, cv::Point(0,0));
- 
--      // Draw contours that meet a "person" requirement
--      Mat drawing = Mat::zeros(_iMat.size(), CV_8UC3);
--      cvtColor(_iMat, drawing, CV_GRAY2RGB);
-+        // Draw contours that meet a "person" requirement
-+        drawing = Mat::zeros(_iMat.size(), CV_8UC3);
-+        cvtColor(_iMat, drawing, CV_GRAY2RGB);
-       
--      int peopleCount = 0;
--      for ( int i = 0; i < contours.size(); i++ ) { 
--         if (isPerson(contours[i], _dMat)) {  
--            peopleCount++;
--            drawContours( drawing, contours, i, Scalar(0, 0, 255), 2, 8, vector<Vec4i>(), 0, cv::Point() ); 
--         }
-+        int peopleCount = 0;
-+        for ( int i = 0; i < contours.size(); i++ ) { 
-+           if (isPerson(contours[i], _dMat)) {  
-+              peopleCount++;
-+              drawContours( drawing, contours, i, Scalar(0, 0, 255), 2, 8, vector<Vec4i>(), 0, cv::Point() ); 
-+           }
-+        }
-+        putText(drawing, "Cnt="+to_string(peopleCount), cv::Point(40, 30), FONT_HERSHEY_PLAIN, 1, Scalar(255, 0, 0));
-       }
--      putText(drawing, "Cnt="+to_string(peopleCount), cv::Point(40, 30), FONT_HERSHEY_PLAIN, 1, Scalar(255, 0, 0));
--      if(skipped_frames == 0) {
--        imshow("Draw", drawing);
--      } else {
--        if((draw_throttle % skipped_frames) == 0) {
--          char file_name[80];
--          sprintf (file_name, "draw%03d.png", draw_throttle / skipped_frames);
--          imwrite (file_name, drawing);
-+
-+      if(main_thread_image_cnt < 2)
-+      {
-+        switch (show_image) 
-+        {
-+          case 'i':
-+            _iMat.copyTo(app_image[main_thread_image_wr]);
-+            putText(app_image[main_thread_image_wr], "Ampl Map", cv::Point(30, 20), FONT_HERSHEY_PLAIN, 1, Scalar(255, 0, 0));
-+            break;
-+          case 'd':
-+            _dMat.copyTo(app_image[main_thread_image_wr]);
-+            putText(app_image[main_thread_image_wr], "Dist Map", cv::Point(30, 20), FONT_HERSHEY_PLAIN, 1, Scalar(255, 0, 0));
-+            break;
-+          default:
-+            drawing.copyTo(app_image[main_thread_image_wr]);
-+            break;
-         }
--        draw_throttle ++;
-+        pthread_mutex_lock(&main_thread_image_mtx);
-+          main_thread_image_wr ++;
-+          main_thread_image_wr %= 2;
-+          main_thread_image_cnt ++;
-+        pthread_mutex_unlock(&main_thread_image_mtx);
-       }
-    }
- }
-diff --git a/Demos/SimplePeopleTracking.cpp b/Demos/SimplePeopleTracking.cpp
-index 8c6e9d4..1eb8e16 100644
---- a/Demos/SimplePeopleTracking.cpp
-+++ b/Demos/SimplePeopleTracking.cpp
-@@ -1,6 +1,18 @@
- #include "Horus.h"
-+#include <getopt.h>
- 
- int skipped_frames = 0;
-+int resolution_width = 160, resolution_height = 120;
-+//Variables for communication between main and application thread
-+pthread_mutex_t main_thread_image_mtx;
-+int main_thread_image_rd = 0;
-+int main_thread_image_wr = 0;
-+int main_thread_image_cnt = 0;
-+int acq_fps = 30;
-+char show_image = 'p'; //By default, detect people
-+int fps = 30;
-+
-+Mat app_image[2];
- 
- int getkey() {
-     int character;
-@@ -27,29 +39,58 @@ int getkey() {
- 
- #define TOF_FRAME_TYPE		DepthCamera::FRAME_XYZI_POINT_CLOUD_FRAME
- 
-+void print_usage(void)
-+{
-+  printf ("\nFollwoing command line options available:");
-+  printf ("\n  -s <decimal value>");
-+  printf ("\n   If you want to run demo without keyboard, provide 'skipped_frames' as argument (e.g. SimplePeopleTracking -s 30)!");
-+  printf ("\n   Images with the result of processing are saved in PNG files. This test always stops after 10 image files recorded\n");
-+  printf ("\n -w <resolution witdh,  default is 160, another resolution possible is 320x240>");
-+  printf ("\n -h <resolution height, default is 120, another respolution possible is 320x240>");
-+  printf ("\n -i <present image of amplitudes, grey-scale like image - default is detection of people>");
-+  printf ("\n -d <present distance map - default is detection of people>");
-+  printf ("\n -f <set fps with integer value, 30 is default, 10, 15, 25 are another options to try>"); 
-+  printf ("\n-----------\n");
-+}
-+
- int main(int argc, char *argv[])
- {
--int ii = 0;
--   int key;
-+   int ii = 0, draw_throttle = 0;
-+   int key, c_opt;
-    bool done = false;
--   Mat bImg;
--
--   if(argc > 1) skipped_frames = atoi(argv[1]);
--   else {
--     printf ("\nIf you want to run demo without keyboard, provide 'skipped_frames' as argument (e.g. SimplePeopleTracking 30)!");
--     printf ("\nImages with the result of processing are saved in PNG files. This test always stops after 15 seconds\n");
-+   Mat bImg, locImg;
-+  
-+   while ((c_opt = getopt(argc, argv,"s:w:h:f:id")) != -1) {
-+        switch (c_opt) {
-+             case 's' : skipped_frames = atoi(optarg); 
-+                 break;
-+             case 'w' : resolution_width = atoi(optarg);
-+                 break;
-+             case 'h' : resolution_height = atoi(optarg);
-+                 break;
-+             case 'f' : acq_fps = atoi(optarg);
-+                 break;
-+             case 'i' : show_image = 'i';
-+                 break;
-+             case 'd' : show_image = 'd';
-+                 break;
-+             default: print_usage(); 
-+                 exit(EXIT_FAILURE);
-+        }
-    }
-+   printf ("\nUsing following parameters: skipped_frames=%d width=%d height=%d mode=%c fps=%d. Use '-?' to get help.\n", 
-+           skipped_frames, resolution_width, resolution_height, show_image, acq_fps);
- 
--   //Horus eye(320, 240);
--   Horus eye(160, 120);
--   //Horus eye(80, 60);
-+   Horus eye(resolution_width, resolution_height);
-    
-    if (!eye.connect(TOF_FRAME_TYPE)) {
-       cout << "Cannot connect" << endl;
-       return -1;
-    }
-    eye.start();
--   while (!done) {
-+   
-+   while (!done)
-+   {
-      if(skipped_frames == 0)
-      {
-        char key = getkey();
-@@ -57,11 +98,29 @@ int ii = 0;
-           done = true;
-        else if (key == 'b') 
-           eye.resetBackground();
--     } else {    
--       usleep(100000);
--       ii ++;
--       if(ii == 150) done = true;
-      }
-+     //Exchange data with the applicaiton thread
-+     if(main_thread_image_cnt > 0)
-+     { //imshow() does not work reliable if being ran from non-main thread
-+       locImg = app_image[main_thread_image_rd];
-+       if(skipped_frames)
-+       {
-+         if((draw_throttle % skipped_frames) == 0) {
-+           char file_name[80];
-+           sprintf (file_name, "draw%03d.png", draw_throttle / skipped_frames);
-+           imwrite (file_name, locImg);
-+           std::cout << "Write file:" << file_name << std::endl << std::flush;
-+         }
-+         draw_throttle ++;
-+         if(draw_throttle >= (10 * skipped_frames)) done = true; //Collect 10 image files only in batch mode
-+       } else imshow ("Draw", locImg);
-+       pthread_mutex_lock(&main_thread_image_mtx);
-+         main_thread_image_rd ++;
-+         main_thread_image_rd %= 2;
-+         main_thread_image_cnt --;
-+       pthread_mutex_unlock(&main_thread_image_mtx);
-+     }  
-+     waitKey(20);
-    }
- 
- err_exit:
-diff --git a/Demos/TOFApp.cpp b/Demos/TOFApp.cpp
-index 1c9c0cd..cb41286 100644
---- a/Demos/TOFApp.cpp
-+++ b/Demos/TOFApp.cpp
-@@ -22,7 +22,7 @@
- #define FRAME_QUEUE_SZ		3
- 
- extern int skipped_frames;
--
-+extern int acq_fps;
- // Frame callback
- static deque<Voxel::Frame *> qFrame; 
- static pthread_mutex_t gmtx;
-@@ -166,11 +166,7 @@ void *TOFApp::eventLoop(void *p)
-       }
- 
-       done = !app->_isRunning;   
--      if(skipped_frames == 0) {
--        waitKey(app->_loopDelay);
--      } else {
--        usleep(10000);
--      }
-+      usleep(10000);
-    }
-    
-    app->disconnect();
-@@ -196,9 +192,9 @@ void TOFApp::Init(int w, int h)
-    _isConnected = false;
-    _dimen.width = w;
-    _dimen.height = h;
--   _frate.numerator = 30;
-+   _frate.numerator = acq_fps; //30
-    _frate.denominator = 1;
--   _loopDelay = 66;
-+   _loopDelay = (int)(1000 / acq_fps);
-    _illum_power = 60;
-    _intg = 20;
-    _profile = "MetrilusLongRange";
-@@ -219,7 +215,7 @@ bool TOFApp::connect(DepthCamera::FrameType frmType)
-    else 
-       return false;
- 
--   #if 0   //Enable this to list all the profiles that are supported by the camera
-+   #if 1   //Enable this to list all the profiles that are supported by the camera
-    cout << "List of Profiles:" << endl;
-    auto &names = _depthCamera->configFile.getCameraProfileNames();
-   
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0004-Platform-specific-op_clk_freq-setting.patch b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0004-Platform-specific-op_clk_freq-setting.patch
deleted file mode 100644
index ae2155e..0000000
--- a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0004-Platform-specific-op_clk_freq-setting.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 63e830023a77749cb6ec78f5ada1d94c9713f935 Mon Sep 17 00:00:00 2001
-From: Djordje Senicic <d-senicic1@ti.com>
-Date: Tue, 21 Mar 2017 21:05:42 -0400
-Subject: [PATCH] Platform specific op_clk_freq setting
-
-Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
----
- Demos/TOFApp.cpp | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/Demos/TOFApp.cpp b/Demos/TOFApp.cpp
-index cb41286..e6ff8fe 100644
---- a/Demos/TOFApp.cpp
-+++ b/Demos/TOFApp.cpp
-@@ -215,7 +215,7 @@ bool TOFApp::connect(DepthCamera::FrameType frmType)
-    else 
-       return false;
- 
--   #if 1   //Enable this to list all the profiles that are supported by the camera
-+   #if 0   //Enable this to list all the profiles that are supported by the camera
-    cout << "List of Profiles:" << endl;
-    auto &names = _depthCamera->configFile.getCameraProfileNames();
-   
-@@ -248,6 +248,14 @@ bool TOFApp::connect(DepthCamera::FrameType frmType)
-    _depthCamera->registerCallback(_frameType, frameCallback);
-    _depthCamera->setFrameSize(_dimen);
-    _depthCamera->setFrameRate(_frate);
-+#ifdef SET_OPCLK 
-+   _depthCamera->set("op_clk_freq", 1);
-+   cout << endl << "Set op_clk_freq!" << endl;
-+#endif
-+#ifdef RESET_OPCLK 
-+   _depthCamera->set("op_clk_freq", 0);
-+   cout << endl << "Reset op_clk_freq!" << endl;
-+#endif
- 
-    VideoMode m;
-   
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0005-Exit-on-window-touch-mouse-even-left-button-click.patch b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0005-Exit-on-window-touch-mouse-even-left-button-click.patch
deleted file mode 100644
index 88f3886..0000000
--- a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0005-Exit-on-window-touch-mouse-even-left-button-click.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 1cd1dcb71beb151fe0ae1cbd0a037d4b8b035973 Mon Sep 17 00:00:00 2001
-From: Djordje Senicic <d-senicic1@ti.com>
-Date: Mon, 27 Mar 2017 20:39:26 -0400
-Subject: [PATCH] Add exit on screen touch - using left mouse button click
- event
-
----
- Demos/SimplePeopleTracking.cpp | 18 ++++++++++++++++--
- 1 file changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/Demos/SimplePeopleTracking.cpp b/Demos/SimplePeopleTracking.cpp
-index 1eb8e16..2ea6240 100644
---- a/Demos/SimplePeopleTracking.cpp
-+++ b/Demos/SimplePeopleTracking.cpp
-@@ -37,6 +37,20 @@ int getkey() {
-     return character;
- }
- 
-+void cbmouse (int event, int x, int y, int flags, void *userdata)
-+{
-+    if(event == EVENT_LBUTTONDOWN) 
-+    {
-+       cout << "Left mouse button click detected. Exit application!" << endl << flush;
-+       exit (0);
-+    }
-+    if(event == EVENT_RBUTTONDOWN) 
-+    {
-+       cout << "Right mouse button click detected. Exit application!" << endl << flush;
-+       exit (0);
-+    }
-+}
-+
- #define TOF_FRAME_TYPE		DepthCamera::FRAME_XYZI_POINT_CLOUD_FRAME
- 
- void print_usage(void)
-@@ -88,7 +102,7 @@ int main(int argc, char *argv[])
-       return -1;
-    }
-    eye.start();
--   
-+   setMouseCallback ("Draw", cbmouse, NULL); //Set mouse click callback to allow exit with no keyboard attached    
-    while (!done)
-    {
-      if(skipped_frames == 0)
-@@ -120,7 +134,7 @@ int main(int argc, char *argv[])
-          main_thread_image_cnt --;
-        pthread_mutex_unlock(&main_thread_image_mtx);
-      }  
--     waitKey(20);
-+     waitKey(10);
-    }
- 
- err_exit:
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0006-Include-people-count-report-in-stdout-for-testing.patch b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0006-Include-people-count-report-in-stdout-for-testing.patch
deleted file mode 100644
index 5fd163e..0000000
--- a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0006-Include-people-count-report-in-stdout-for-testing.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 05d08ba8e4559024852b3d4b5187d2c4d9c496bc Mon Sep 17 00:00:00 2001
-From: Djordje Senicic <x0157990@ti.com>
-Date: Tue, 5 Feb 2019 09:56:47 -0500
-Subject: [PATCH] Include people count report in stdout, for testing
-
-Signed-off-by: Djordje Senicic <x0157990@ti.com>
----
- Demos/Horus.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Demos/Horus.cpp b/Demos/Horus.cpp
-index de1837e..7ee3e88 100644
---- a/Demos/Horus.cpp
-+++ b/Demos/Horus.cpp
-@@ -189,6 +189,7 @@ void Horus::update(Frame *frame)
-            }
-         }
-         putText(drawing, "Cnt="+to_string(peopleCount), cv::Point(40, 30), FONT_HERSHEY_PLAIN, 1, Scalar(255, 0, 0));
-+        cout << endl << "Cnt=" << peopleCount << endl;
-       }
- 
-       if(main_thread_image_cnt < 2)
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
deleted file mode 100644
index c83b41e..0000000
--- a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
+++ /dev/null
@@ -1,67 +0,0 @@
-SUMMARY = "VOXELSDK and 3D scanning application"
-HOMEPAGE = "https://github.com/3dtof/voxelsdk"
-SECTION = "multimedia"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e69c599445026ffeae140a21181dfa88"
-
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES = "dsp"
-REQUIRED_DISTRO_FEATURES = "opencv"
-
-PV = "0.6.8"
-PR = "r1"
-BRANCH = "plsdk-devel"
-SRC_URI = "git://github.com/3dtof/voxelsdk.git;branch=${BRANCH}"
-SRCREV  = "7337ac265a1542f22ccffe592762c226b23b2dbd"
-
-SRC_URI += " \
-            file://0001-PLSDK-AM437x-update.patch;patchdir=${S} \
-            file://0002-Fix-SWIG-support.patch;patchdir=${S} \
-            file://0003-Add-more-command-line-options-and-move-OpenCV-render.patch;patchdir=${S} \
-            file://0004-Platform-specific-op_clk_freq-setting.patch;patchdir=${S} \
-            file://0005-Exit-on-window-touch-mouse-even-left-button-click.patch;patchdir=${S} \
-            file://0006-Include-people-count-report-in-stdout-for-testing.patch;patchdir=${S} \
-           "
-
-S = "${WORKDIR}/git"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-export CMAKE_PREFIX_PATH="${WORKDIR}/build"
-
-OPCLK = "SET_OPCLK"
-OPCLK_ti43x = "RESET_OPCLK"
-CXXFLAGS_append = " -I${STAGING_INCDIR}/libusb-1.0 -D${OPCLK}"
-EXTRA_OECMAKE += "-DDISTROFEATURE=ExcludePCL -DCMAKE_BUILD_TYPE=Debug -DPYTHON_INCLUDE_DIRS=${STAGING_INCDIR}/include/python2.7"
-
-inherit pkgconfig cmake
-inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "pythonnative python-dir", "", d)}
-
-DEPENDS = "libusb1 udev opencv boost python swig swig-native"
-
-RDEPENDS_${PN} = "libusb1 udev opencv"
-
-do_install_append () {
-    install -d ${D}${bindir}
-    install -m 0775 ${S}/Test/CameraSystemTest.py ${D}${bindir}
-    install -m 0775 ${S}/Test/CameraSystemIQFrameTest.py ${D}${bindir}
-    install -m 0775 ${S}/Test/LensCalibrationTest.py ${D}${bindir}
-}
-
-FILES_${PN} += "${datadir}"
-FILES_${PN} += "${sysconfdir}/udev/rules.d/*"
-FILES_${PN} += "${libdir}/voxel/*.so.*"
-FILES_${PN} += "${libdir}/python2.7/_*.so"
-FILES_${PN} += "${libdir}/python2.7/*.py"
-
-FILES_${PN}-dev += "${libdir}/cmake ${libdir}/cmake/Voxel ${libdir}/cmake/TI3DToF"
-FILES_${PN}-dev += "${libdir}/cmake/Voxel/*.cmake"
-FILES_${PN}-dev += "${libdir}/cmake/TI3DToF/*.cmake"
-FILES_${PN}-dev += "${libdir}/voxel/*.so"
-
-python() {
-    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
-        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
-}
-- 
2.7.4


