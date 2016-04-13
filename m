Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 4D93652092
	for <meta-arago@arago-project.org>;
	Wed, 13 Apr 2016 20:52:44 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.153])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5L00DP4BBBGRA0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 13 Apr 2016 15:52:29 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=S2e5frwPAAAA:8 a=NEAV23lmAAAA:8
	a=Y8pdBdaF8fjxrtnRHAwA:9
Received: by 100.15.86.14 with SMTP id 1be87696; Wed, 13 Apr 2016 20:52:28 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1CE5E161F9B;	Wed,
	13 Apr 2016 16:52:23 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 13 Apr 2016 16:52:22 -0400
Message-id: <1460580742-21424-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] opencv: 3.1 is in meta-oe, drop locally and use bbappend for qtwayland
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
X-List-Received-Date: Wed, 13 Apr 2016 20:52:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-support/opencv/opencv_%.bbappend       |   7 ++
 .../recipes-support/opencv/opencv_3.0.bb           | 135 ---------------------
 .../recipes-support/opencv/opencv_3.1.bb           | 135 ---------------------
 3 files changed, 7 insertions(+), 270 deletions(-)
 create mode 100644 meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
 delete mode 100644 meta-arago-extras/recipes-support/opencv/opencv_3.0.bb
 delete mode 100644 meta-arago-extras/recipes-support/opencv/opencv_3.1.bb

diff --git a/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
new file mode 100644
index 0000000..6d60a2f
--- /dev/null
+++ b/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
@@ -0,0 +1,7 @@
+PACKAGECONFIG_append= " ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "qtwayland", "", d)}"
+
+PACKAGECONFIG[qtwayland] = "-DWITH_QT=ON,-DWITH_QT=OFF,qtwayland,"
+
+inherit cmake_qt5
+
+ALLOW_EMPTY_${PN}-java = "1"
diff --git a/meta-arago-extras/recipes-support/opencv/opencv_3.0.bb b/meta-arago-extras/recipes-support/opencv/opencv_3.0.bb
deleted file mode 100644
index ef56a78..0000000
--- a/meta-arago-extras/recipes-support/opencv/opencv_3.0.bb
+++ /dev/null
@@ -1,135 +0,0 @@
-SUMMARY = "Opencv : The Open Computer Vision Library"
-HOMEPAGE = "http://opencv.org/"
-SECTION = "libs"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0ea90d28b4de883d7af5e6711f14f7bf"
-
-ARM_INSTRUCTION_SET = "arm"
-
-DEFAULT_PREFERENCE = "-1"
-
-DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
-
-SRCREV_opencv = "b3ac274617beb8e54c8bfebcb141090a57165ea2"
-SRCREV_contrib = "c8053da4f2621169746ef8670dc6145ee5958e9c"
-SRCREV_FORMAT = "opencv"
-SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
-           git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib"
-
-PV = "3.0+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
-		 -DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
-                 -DWITH_1394=OFF \
-                 -DCMAKE_SKIP_RPATH=ON \
-                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
-                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
-                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
-"
-
-PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb libav jasper webp openexr\
-                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
-                   ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "qtwayland", "", d)} \
-		   ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
-PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
-PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
-PACKAGECONFIG[qtwayland] = "-DWITH_QT=ON,-DWITH_QT=OFF,qtwayland,"
-PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
-PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
-PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
-PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
-PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
-PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
-PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
-PACKAGECONFIG[webp] = "-DWITH_WEBP=ON,-DWITH_WEBP=OFF,libwebp,"
-PACKAGECONFIG[openexr] = "-DWITH_OPENEXR=ON,-DWITH_OPENEXR=OFF,,"
-PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
-PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
-PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers,"
-PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base,"
-PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
-PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
-PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
-
-inherit distutils-base pkgconfig cmake cmake_qt5
-#PARALLEL_MAKE = ""
-
-export BUILD_SYS
-export HOST_SYS
-export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
-export PYTHON="${STAGING_BINDIR_NATIVE}/python"
-export JAVA_HOME="${STAGING_DIR_NATIVE}/usr/bin/java"
-export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
-
-TARGET_CC_ARCH += "-I${S}/include "
-
-PACKAGES += "${PN}-java-dbg ${PN}-java ${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv"
-
-python populate_packages_prepend () {
-    cv_libdir = d.expand('${libdir}')
-    cv_libdir_dbg = d.expand('${libdir}/.debug')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
-    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
-
-    pn = d.getVar('PN', 1)
-    metapkg =  pn + '-dev'
-    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
-    blacklist = [ metapkg ]
-    metapkg_rdepends = [ ]
-    packages = d.getVar('PACKAGES', 1).split()
-    for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
-            metapkg_rdepends.append(pkg)
-    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
-
-    blacklist = [ metapkg ]
-    metapkg =  pn
-    metapkg_rdepends = [ ]
-    for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') :
-            metapkg_rdepends.append(pkg)
-    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
-
-}
-
-PACKAGES_DYNAMIC += "^libopencv-.*"
-
-FILES_${PN} = ""
-FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
-FILES_${PN}-dbg += "${libdir}/.debug"
-FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
-FILES_${PN}-doc = "${datadir}/OpenCV/doc"
-FILES_${PN}-java = "${datadir}/OpenCV/java"
-FILES_${PN}-java-dbg = "${datadir}/OpenCV/java/.debug/"
-FILES_${PN}-samples = "${datadir}/OpenCV/samples/"
-FILES_${PN}-samples-dbg = "${datadir}/OpenCV/samples/bin/.debug"
-
-INSANE_SKIP_${PN}-apps = "staticdev"
-INSANE_SKIP_${PN}-java = "libdir"
-INSANE_SKIP_${PN}-java-dbg = "libdir"
-
-ALLOW_EMPTY_${PN} = "1"
-ALLOW_EMPTY_${PN}-java = "1"
-
-SUMMARY_python-opencv = "Python bindings to opencv"
-FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
-RDEPENDS_python-opencv = "python-core python-numpy"
-
-do_install_append() {
-    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
-    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
-
-    # Move Python files into correct library folder (for multilib build)
-    if [ "$libdir" != "/usr/lib" ]; then
-        mv ${D}/usr/lib/* ${D}/${libdir}/
-        rm -rf ${D}/usr/lib
-    fi
-
-    install -d ${D}${datadir}/OpenCV/samples/bin/
-    cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
-}
diff --git a/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb b/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
deleted file mode 100644
index 54ddee8..0000000
--- a/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
+++ /dev/null
@@ -1,135 +0,0 @@
-SUMMARY = "Opencv : The Open Computer Vision Library"
-HOMEPAGE = "http://opencv.org/"
-SECTION = "libs"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0ea90d28b4de883d7af5e6711f14f7bf"
-
-ARM_INSTRUCTION_SET = "arm"
-
-DEFAULT_PREFERENCE = "-1"
-
-DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
-
-SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
-SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
-SRCREV_FORMAT = "opencv"
-SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
-           git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib"
-
-PV = "3.1+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
-		 -DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
-                 -DWITH_1394=OFF \
-                 -DCMAKE_SKIP_RPATH=ON \
-                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
-                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
-                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
-"
-
-PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb libav jasper webp openexr\
-                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
-                   ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "qtwayland", "", d)} \
-		   ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
-PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
-PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
-PACKAGECONFIG[qtwayland] = "-DWITH_QT=ON,-DWITH_QT=OFF,qtwayland,"
-PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
-PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
-PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
-PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
-PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
-PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
-PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
-PACKAGECONFIG[webp] = "-DWITH_WEBP=ON,-DWITH_WEBP=OFF,libwebp,"
-PACKAGECONFIG[openexr] = "-DWITH_OPENEXR=ON,-DWITH_OPENEXR=OFF,,"
-PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
-PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
-PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers,"
-PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base,"
-PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
-PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
-PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
-
-inherit distutils-base pkgconfig cmake cmake_qt5
-#PARALLEL_MAKE = ""
-
-export BUILD_SYS
-export HOST_SYS
-export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
-export PYTHON="${STAGING_BINDIR_NATIVE}/python"
-export JAVA_HOME="${STAGING_DIR_NATIVE}/usr/bin/java"
-export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
-
-TARGET_CC_ARCH += "-I${S}/include "
-
-PACKAGES += "${PN}-java-dbg ${PN}-java ${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv"
-
-python populate_packages_prepend () {
-    cv_libdir = d.expand('${libdir}')
-    cv_libdir_dbg = d.expand('${libdir}/.debug')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
-    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
-
-    pn = d.getVar('PN', 1)
-    metapkg =  pn + '-dev'
-    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
-    blacklist = [ metapkg ]
-    metapkg_rdepends = [ ]
-    packages = d.getVar('PACKAGES', 1).split()
-    for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
-            metapkg_rdepends.append(pkg)
-    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
-
-    blacklist = [ metapkg ]
-    metapkg =  pn
-    metapkg_rdepends = [ ]
-    for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') :
-            metapkg_rdepends.append(pkg)
-    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
-
-}
-
-PACKAGES_DYNAMIC += "^libopencv-.*"
-
-FILES_${PN} = ""
-FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
-FILES_${PN}-dbg += "${libdir}/.debug"
-FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
-FILES_${PN}-doc = "${datadir}/OpenCV/doc"
-FILES_${PN}-java = "${datadir}/OpenCV/java"
-FILES_${PN}-java-dbg = "${datadir}/OpenCV/java/.debug/"
-FILES_${PN}-samples = "${datadir}/OpenCV/samples/"
-FILES_${PN}-samples-dbg = "${datadir}/OpenCV/samples/bin/.debug"
-
-INSANE_SKIP_${PN}-apps = "staticdev"
-INSANE_SKIP_${PN}-java = "libdir"
-INSANE_SKIP_${PN}-java-dbg = "libdir"
-
-ALLOW_EMPTY_${PN} = "1"
-ALLOW_EMPTY_${PN}-java = "1"
-
-SUMMARY_python-opencv = "Python bindings to opencv"
-FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
-RDEPENDS_python-opencv = "python-core python-numpy"
-
-do_install_append() {
-    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
-    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
-
-    # Move Python files into correct library folder (for multilib build)
-    if [ "$libdir" != "/usr/lib" ]; then
-        mv ${D}/usr/lib/* ${D}/${libdir}/
-        rm -rf ${D}/usr/lib
-    fi
-
-    install -d ${D}${datadir}/OpenCV/samples/bin/
-    cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
-}
-- 
2.2.0


