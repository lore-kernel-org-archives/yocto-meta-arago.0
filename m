Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 4816E52A53
	for <meta-arago@arago-project.org>;
	Tue,  9 May 2017 18:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7B54B208FB;
	Tue,  9 May 2017 18:07:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id IYcuw00uf1yu; Tue,  9 May 2017 18:07:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5719A20BF2;
	Tue,  9 May 2017 18:07:00 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C1BEB1624B8;
	Tue,  9 May 2017 14:06:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  9 May 2017 14:06:55 -0400
Message-Id: <1494353215-51061-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494353215-51061-1-git-send-email-denis@denix.org>
References: <1494353215-51061-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 6/6] opencv: overlay 3.1 locally, needed for TI customizations and HW acceleration
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
X-List-Received-Date: Tue, 09 May 2017 18:07:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...01-3rdparty-ippicv-Use-pre-downloaded-ipp.patch |  28 ++++
 .../recipes-support/opencv/opencv/fixgcc60.patch   |  30 ++++
 .../opencv/opencv/fixpkgconfig.patch               |  29 ++++
 .../recipes-support/opencv/opencv_3.1.bb           | 161 +++++++++++++++++++++
 4 files changed, 248 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
 create mode 100644 meta-arago-extras/recipes-support/opencv/opencv/fixgcc60.patch
 create mode 100644 meta-arago-extras/recipes-support/opencv/opencv/fixpkgconfig.patch
 create mode 100644 meta-arago-extras/recipes-support/opencv/opencv_3.1.bb

diff --git a/meta-arago-extras/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch b/meta-arago-extras/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
new file mode 100644
index 0000000..d568018
--- /dev/null
+++ b/meta-arago-extras/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
@@ -0,0 +1,28 @@
+From 049f931207631aa54af55a2917318d032b2ef3fa Mon Sep 17 00:00:00 2001
+From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+Date: Thu, 31 Mar 2016 00:20:15 +0200
+Subject: [PATCH] 3rdparty/ippicv: Use pre-downloaded ipp
+
+Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+---
+ 3rdparty/ippicv/downloader.cmake | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/3rdparty/ippicv/downloader.cmake b/3rdparty/ippicv/downloader.cmake
+index a6016dbe10bc..af4062c8e95e 100644
+--- a/3rdparty/ippicv/downloader.cmake
++++ b/3rdparty/ippicv/downloader.cmake
+@@ -31,8 +31,10 @@ function(_icv_downloader)
+     return() # Not supported
+   endif()
+ 
++  if(NOT DEFINED OPENCV_ICV_PATH)
+   set(OPENCV_ICV_UNPACK_PATH "${CMAKE_CURRENT_LIST_DIR}/unpack")
+   set(OPENCV_ICV_PATH "${OPENCV_ICV_UNPACK_PATH}${OPENCV_ICV_PACKAGE_SUBDIR}")
++  endif()
+ 
+   if(DEFINED OPENCV_ICV_PACKAGE_DOWNLOADED
+        AND OPENCV_ICV_PACKAGE_DOWNLOADED STREQUAL OPENCV_ICV_PACKAGE_HASH
+-- 
+2.8.0.rc3
+
diff --git a/meta-arago-extras/recipes-support/opencv/opencv/fixgcc60.patch b/meta-arago-extras/recipes-support/opencv/opencv/fixgcc60.patch
new file mode 100644
index 0000000..5d0bf97
--- /dev/null
+++ b/meta-arago-extras/recipes-support/opencv/opencv/fixgcc60.patch
@@ -0,0 +1,30 @@
+diff --git a/cmake/OpenCVPCHSupport.cmake b/cmake/OpenCVPCHSupport.cmake
+index 28ccc1c6be4f..b0e1cbf77287 100644
+--- a/cmake/OpenCVPCHSupport.cmake
++++ b/cmake/OpenCVPCHSupport.cmake
+@@ -19,7 +19,7 @@ IF(CMAKE_COMPILER_IS_GNUCXX)
+         ARGS ${CMAKE_CXX_COMPILER_ARG1} -dumpversion
+         OUTPUT_VARIABLE gcc_compiler_version)
+     #MESSAGE("GCC Version: ${gcc_compiler_version}")
+-    IF(gcc_compiler_version VERSION_GREATER "4.2.-1")
++    IF(gcc_compiler_version VERSION_GREATER "4.2.-1" AND gcc_compiler_version VERSION_LESS "6.0.0")
+         SET(PCHSupport_FOUND TRUE)
+     ENDIF()
+ 
+diff --git a/cmake/OpenCVUtils.cmake b/cmake/OpenCVUtils.cmake
+index 3a23cd73633d..1fea1578b1d9 100644
+--- a/cmake/OpenCVUtils.cmake
++++ b/cmake/OpenCVUtils.cmake
+@@ -76,7 +76,11 @@ function(ocv_include_directories)
+     if("${__abs_dir}" MATCHES "^${OpenCV_SOURCE_DIR}" OR "${__abs_dir}" MATCHES "^${OpenCV_BINARY_DIR}")
+       list(APPEND __add_before "${dir}")
+     else()
+-      include_directories(AFTER SYSTEM "${dir}")
++	    if (gcc_compiler_version VERSION_LESS "6.0.0")
++		    include_directories(AFTER SYSTEM "${dir}")
++	    else()
++		    include_directories(AFTER "${dir}")
++	    endif()
+     endif()
+   endforeach()
+   include_directories(BEFORE ${__add_before})
diff --git a/meta-arago-extras/recipes-support/opencv/opencv/fixpkgconfig.patch b/meta-arago-extras/recipes-support/opencv/opencv/fixpkgconfig.patch
new file mode 100644
index 0000000..3aeda7d
--- /dev/null
+++ b/meta-arago-extras/recipes-support/opencv/opencv/fixpkgconfig.patch
@@ -0,0 +1,29 @@
+diff --git a/cmake/OpenCVGenPkgconfig.cmake b/cmake/OpenCVGenPkgconfig.cmake
+index b8cb8777c06b..75281ee964fd 100644
+--- a/cmake/OpenCVGenPkgconfig.cmake
++++ b/cmake/OpenCVGenPkgconfig.cmake
+@@ -27,7 +27,7 @@ macro(fix_prefix lst isown)
+       get_filename_component(libdir "${item}" PATH)
+       get_filename_component(libname "${item}" NAME_WE)
+       string(REGEX REPLACE "^lib(.*)" "\\1" libname "${libname}")
+-      list(APPEND _lst "-L${libdir}" "-l${libname}")
++      list(APPEND _lst "-l${libname}")
+     else()
+       list(APPEND _lst "-l${item}")
+     endif()
+@@ -66,10 +66,14 @@ ocv_list_unique(_3rdparty)
+ 
+ set(OPENCV_PC_LIBS
+   "-L\${exec_prefix}/${OPENCV_LIB_INSTALL_PATH}"
++  "-L\${exec_prefix}/${OPENCV_3P_LIB_INSTALL_PATH}"
+   "${_modules}"
+ )
+ if (BUILD_SHARED_LIBS)
+-  set(OPENCV_PC_LIBS_PRIVATE "${_extra}")
++  set(OPENCV_PC_LIBS_PRIVATE
++    "-L\${exec_prefix}/${OPENCV_LIB_INSTALL_PATH}"
++    "${_extra}"
++  )
+ else()
+   set(OPENCV_PC_LIBS_PRIVATE
+     "-L\${exec_prefix}/${OPENCV_3P_LIB_INSTALL_PATH}"
diff --git a/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb b/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
new file mode 100644
index 0000000..2851233
--- /dev/null
+++ b/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
@@ -0,0 +1,161 @@
+SUMMARY = "Opencv : The Open Computer Vision Library"
+HOMEPAGE = "http://opencv.org/"
+SECTION = "libs"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0ea90d28b4de883d7af5e6711f14f7bf"
+
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+
+DEPENDS = "libtool swig swig-native python bzip2 zlib glib-2.0 libwebp protobuf protobuf-native"
+
+SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
+SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
+SRCREV_party3 = "81a676001ca8075ada498583e4166079e5744668"
+IPP_MD5 = "808b791a6eac9ed78d32a7666804320e"
+
+SRCREV_FORMAT = "opencv"
+SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
+    git://github.com/opencv/opencv_contrib.git;destsuffix=contrib;name=contrib \
+    git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20151201;destsuffix=party3;name=party3 \
+    file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
+    file://fixgcc60.patch \
+    file://fixpkgconfig.patch \
+"
+
+PV = "3.1+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+do_unpack_extra() {
+    tar xzf ${WORKDIR}/party3/ippicv/ippicv_linux_20151201.tgz -C ${WORKDIR}
+}
+addtask unpack_extra after do_unpack before do_patch
+
+EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
+    -DWITH_1394=OFF \
+    -DCMAKE_SKIP_RPATH=ON \
+    -DOPENCV_ICV_PACKAGE_DOWNLOADED=${IPP_MD5} \
+    -DOPENCV_ICV_PATH=${WORKDIR}/ippicv_lnx \
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
+    ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
+    ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
+"
+EXTRA_OECMAKE_append_x86 = " -DX86=ON"
+
+PACKAGECONFIG ??= "python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb  gphoto2 \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
+
+PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
+PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
+PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON,-DBUILD_opencv_dnn=OFF,lapack,"
+PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen gflags glog,"
+PACKAGECONFIG[gphoto2] = "-DWITH_GPHOTO2=ON,-DWITH_GPHOTO2=OFF,libgphoto2,"
+PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base,"
+PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
+PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
+PACKAGECONFIG[java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native fastjar-native openjdk-8-native,"
+PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
+PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
+PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
+PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtual/opencl-icd,"
+PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
+PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
+PACKAGECONFIG[python2] = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python-numpy,"
+PACKAGECONFIG[python3] = "-DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python3-numpy,"
+PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
+PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
+PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
+PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
+
+inherit pkgconfig cmake
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'distutils3-base', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python2', 'distutils-base', '', d)}
+
+export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
+export PYTHON="${STAGING_BINDIR_NATIVE}/${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3', 'python', d)}"
+export ORACLE_JAVA_HOME="${STAGING_DIR_NATIVE}/usr/bin/java"
+export JAVA_HOME="${STAGING_DIR_NATIVE}/usr/lib/jvm/openjdk-8-native"
+export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
+
+TARGET_CC_ARCH += "-I${S}/include "
+
+PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'samples', '${PN}-samples', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'java', '${PN}-java', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'python2', 'python-${PN}', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-${PN}', '', d)} \
+    ${PN}-apps"
+
+python populate_packages_prepend () {
+    cv_libdir = d.expand('${libdir}')
+    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
+    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
+
+    pn = d.getVar('PN')
+    metapkg =  pn + '-dev'
+    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
+    blacklist = [ metapkg ]
+    metapkg_rdepends = [ ]
+    packages = d.getVar('PACKAGES').split()
+    for pkg in packages[1:]:
+        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
+            metapkg_rdepends.append(pkg)
+    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
+
+    metapkg =  pn
+    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
+    blacklist = [ metapkg ]
+    metapkg_rdepends = [ ]
+    for pkg in packages[1:]:
+        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale') and not pkg.endswith('-staticdev'):
+            metapkg_rdepends.append(pkg)
+    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
+
+}
+
+PACKAGES_DYNAMIC += "^libopencv-.*"
+
+FILES_${PN} = ""
+FILES_${PN}-dbg += "${datadir}/OpenCV/java/.debug/* ${datadir}/OpenCV/samples/bin/.debug/*"
+FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig ${datadir}/OpenCV/*.cmake"
+FILES_${PN}-staticdev += "${datadir}/OpenCV/3rdparty/lib/*.a"
+FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
+FILES_${PN}-java = "${datadir}/OpenCV/java"
+FILES_${PN}-samples = "${datadir}/OpenCV/samples/"
+
+INSANE_SKIP_${PN}-java = "libdir"
+INSANE_SKIP_${PN}-dbg = "libdir"
+
+ALLOW_EMPTY_${PN} = "1"
+
+SUMMARY_python-opencv = "Python bindings to opencv"
+FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
+RDEPENDS_python-opencv = "python-core python-numpy"
+
+SUMMARY_python3-opencv = "Python bindings to opencv"
+FILES_python3-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
+RDEPENDS_python3-opencv = "python3-core python3-numpy"
+
+do_install_append() {
+    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
+    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
+
+    # Move Python files into correct library folder (for multilib build)
+    if [ "$libdir" != "/usr/lib" -a -d ${D}/usr/lib ]; then
+        mv ${D}/usr/lib/* ${D}/${libdir}/
+        rm -rf ${D}/usr/lib
+    fi
+
+    if ${@bb.utils.contains("PACKAGECONFIG", "samples", "true", "false", d)}; then
+        install -d ${D}${datadir}/OpenCV/samples/bin/
+        cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
+    fi
+}
-- 
2.7.4


