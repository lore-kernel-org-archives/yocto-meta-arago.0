Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC588C5473D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 19:16:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.61243.1724699780828859897
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Aug 2024 12:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 356CD40CB8;
	Mon, 26 Aug 2024 19:16:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqxqSyQm9TFq; Mon, 26 Aug 2024 19:16:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3145F40CCA;
	Mon, 26 Aug 2024 19:16:18 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 015DB16406C;
	Mon, 26 Aug 2024 15:16:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 12/16] gstreamer1.0-plugins-dsp66: deprecate
Date: Mon, 26 Aug 2024 15:16:01 -0400
Message-Id: <20240826191605.8190-12-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826191605.8190-1-denis@denix.org>
References: <20240826191605.8190-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Aug 2024 19:16:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15522

From: Denys Dmytriyenko <denys@konsulko.com>

Remove gstreamer1.0-plugins-dsp66 component as deprecated and not maintai=
ned.

This component was offloading processing tasks to DSP using heavily
modified OpenCL/OpenCV forks of old versions of corresponding upstream
projects on legacy platforms.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroup-arago-gst-sdk-target.bb      |  5 -
 .../packagegroups/packagegroup-arago-gst.bb   |  5 -
 ...-use-of-CPP-CXX-and-other-standard-v.patch | 91 -------------------
 ...e.ac-stop-using-export-symbols-regex.patch | 32 -------
 .../gstreamer1.0-plugins-dsp66_git.bb         | 50 ----------
 5 files changed, 183 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/g=
streamer1.0-plugins-dsp66/0001-Makefile-correct-use-of-CPP-CXX-and-other-=
standard-v.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/g=
streamer1.0-plugins-dsp66/0001-configure.ac-stop-using-export-symbols-reg=
ex.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/g=
streamer1.0-plugins-dsp66_git.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-gst-sdk-target.bb
index 845cc7ff..fd749711 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
-sdk-target.bb
@@ -14,13 +14,8 @@ GSTREAMER_DEPS =3D " \
     gstreamer1.0-libav-dev \
 "
=20
-GSTREAMER_DSP =3D " \
-    ${@['','gstreamer1.0-plugins-dsp66-dev'][oe.utils.all_distro_feature=
s(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'ds=
p', True, False, d)]} \
-"
-
 #    gstreamer1.0-plugins-hevc-dev=20
 GSTREAMER_DEPS:append:dra7xx =3D " \
-    ${GSTREAMER_DSP} \
 "
=20
 RDEPENDS:${PN} =3D " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-gst.bb
index e8a639bd..3bc3bfc1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
.bb
@@ -17,13 +17,8 @@ GSTREAMER_DEPS =3D " \
     gstreamer1.0-libav \
 "
=20
-GSTREAMER_DSP =3D " \
-    ${@['','gstreamer1.0-plugins-dsp66'][oe.utils.all_distro_features(d,=
 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', =
True, False, d)]} \
-"
-
 #    gstreamer1.0-plugins-hevc=20
 GSTREAMER_DEPS:append:dra7xx =3D " \
-    ${GSTREAMER_DSP} \
 "
=20
 GSTREAMER_ACCEL_MM =3D ""
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-dsp66/0001-Makefile-correct-use-of-CPP-CXX-and-other-standar=
d-v.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer=
1.0-plugins-dsp66/0001-Makefile-correct-use-of-CPP-CXX-and-other-standard=
-v.patch
deleted file mode 100644
index 8048de93..00000000
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-dsp66/0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.pat=
ch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 145964aa34bc2cbf1499de6e14de80a7c2d7e935 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Sun, 26 Mar 2017 15:12:44 -0400
-Subject: [PATCH] Makefile: correct use of CPP/CXX and other standard var=
iables
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- src/kernels/make.inc         | 16 +++++++---------
- src/kernels/oclconv/Makefile |  7 +++----
- 2 files changed, 10 insertions(+), 13 deletions(-)
-
-diff --git a/src/kernels/make.inc b/src/kernels/make.inc
-index 797e64b..f1475a3 100644
---- a/src/kernels/make.inc
-+++ b/src/kernels/make.inc
-@@ -4,7 +4,6 @@ DSP_INCLUDE +=3D -I$(TARGET_ROOTDIR)/usr/share/ti/opencl
- TI_IMGLIB_DIR=3D${TARGET_ROOTDIR}/usr/share/ti/ti-imglib-c66x-tree
- TI_VLIB_DIR=3D${TARGET_ROOTDIR}/usr/share/ti/ti-vlib-c66x-tree
-=20
--CPP   =3D g++=20
- CL6X  =3D cl6x -mv6600 --abi=3Deabi $(DSP_INCLUDE)
- CLOCL =3D clocl
-=20
-@@ -16,9 +15,9 @@ UNAME_M :=3D$(shell uname -m)
- # If TI_OCL_INSTALL is set, setup make from that location
- # ---------------------------------------------------------------------=
-------
- ifneq ($(TI_OCL_INSTALL),)
--    CPP        =3D g++
--    CPP_FLAGS +=3D -I$(TI_OCL_INSTALL)/usr/include
--    LD_FLAGS  +=3D -L$(TI_OCL_INSTALL)/usr/lib=20
-+    CXX        =3D g++
-+    CXXFLAGS +=3D -I$(TI_OCL_INSTALL)/usr/include
-+    LDFLAGS  +=3D -L$(TI_OCL_INSTALL)/usr/lib
-     LIBS      +=3D -lbfd
-=20
- # ---------------------------------------------------------------------=
-------
-@@ -38,20 +37,19 @@ else ifneq (,$(findstring 86, $(UNAME_M)))
-=20
-     # gcc ARM cross compiler will not, by default, search the host's
-     # /usr/include.  Explicitly specify here to find dependent vendor h=
eaders
--    cross: override CPP =3D arm-linux-gnueabihf-g++=20
--    cross: CPP_FLAGS +=3D -I$(TARGET_ROOTDIR)/usr/include -idirafter /u=
sr/include
-+    cross: CXXFLAGS +=3D -I$(TARGET_ROOTDIR)/usr/include -idirafter /us=
r/include
-=20
-     # If cross-compilineg, provide path to dependent ARM libraries on t=
he=20
-     # target filesystem
--    cross: LD_FLAGS =3D -L$(TARGET_ROOTDIR)/lib -L$(TARGET_ROOTDIR)/usr=
/lib -Wl,-rpath-link,$(TARGET_ROOTDIR)/lib -Wl,-rpath-link,$(TARGET_ROOTD=
IR)/usr/lib=20
-+    cross: LDFLAGS =3D -L$(TARGET_ROOTDIR)/lib -L$(TARGET_ROOTDIR)/usr/=
lib -Wl,-rpath-link,$(TARGET_ROOTDIR)/lib -Wl,-rpath-link,$(TARGET_ROOTDI=
R)/usr/lib
- endif
-=20
- %.o: %.cpp
--	@$(CPP) -c $(CPP_FLAGS) $<
-+	@$(CXX) -c $(CXXFLAGS) $<
- 	@echo Compiling $<
-=20
- %.o: %.c
--	@$(CPP) -c $(CPP_FLAGS) $<
-+	@$(CXX) -c $(CXXFLAGS) $<
- 	@echo Compiling $<
-=20
- %.obj: %.c
-diff --git a/src/kernels/oclconv/Makefile b/src/kernels/oclconv/Makefile
-index e271670..c3774f8 100644
---- a/src/kernels/oclconv/Makefile
-+++ b/src/kernels/oclconv/Makefile
-@@ -1,12 +1,12 @@
- EXE         =3D liboclconv.so
--CPP_FLAGS   =3D -O3 -shared -fPIC -L.
-+CXXFLAGS   =3D -O3 -shared -fPIC -L.
- CLOCL_FLAGS =3D=20
- include ../make.inc
-=20
- all: ${EXE}
-=20
--$(EXE): oclconv.o=20
--	@$(CPP) $(CPP_FLAGS) oclconv.o $(LD_FLAGS) $(LIBS) -o $@
-+$(EXE): oclconv.o
-+	@$(CXX) $(CXXFLAGS) oclconv.o $(LDFLAGS) $(LIBS) -o $@
-=20
- oclconv.o: conv.dsp_h
-=20
-@@ -16,4 +16,3 @@ conv.dsp_h: conv.cl ${TI_IMGLIB_DIR}/lib/imglib.ae66 $=
{TI_VLIB_DIR}/packages/ti/
-=20
- install:
- 	  mkdir -p  ${DESTDIR}/usr/lib && install -m 755 ${EXE} ${DESTDIR}/usr=
/lib/.
--
---=20
-2.7.4
-
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-dsp66/0001-configure.ac-stop-using-export-symbols-regex.patc=
h b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plug=
ins-dsp66/0001-configure.ac-stop-using-export-symbols-regex.patch
deleted file mode 100644
index e3df61ac..00000000
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-dsp66/0001-configure.ac-stop-using-export-symbols-regex.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 0fcda9d85c96d5c39dffe21d3bdf01a038b911c9 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 22 Jan 2019 20:39:15 -0500
-Subject: [PATCH] configure.ac: stop using -export-symbols-regex
-
-The old regex is no longer correct for GStreamer 1.14.
-
-Bug-Debian: https://bugs.debian.org/894642
-
-Upstream-Status: Inappropriate [arago specific]
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index fee3161..8159c60 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -81,7 +81,7 @@ fi
- AC_SUBST(plugindir)
-=20
- dnl set proper LDFLAGS for plugins
--GST_PLUGIN_LDFLAGS=3D"-module -avoid-version -export-symbols-regex '^[_=
]*gst_plugin_desc\$\$' $GST_ALL_LDFLAGS"
-+GST_PLUGIN_LDFLAGS=3D"-module -avoid-version $GST_ALL_LDFLAGS"
- AC_SUBST(GST_PLUGIN_LDFLAGS)
-=20
- AC_CONFIG_FILES([Makefile src/Makefile])
---=20
-2.7.4
-
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-dsp66_git.bb b/meta-arago-extras/recipes-multimedia/gst-plug=
ins-ti/gstreamer1.0-plugins-dsp66_git.bb
deleted file mode 100644
index d92efb9b..00000000
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-dsp66_git.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-DESCRIPTION =3D "GStreamer elements to use the TI DSP C66 in multimedia =
applications"
-HOMEPAGE =3D "https://git.ti.com/processor-sdk/gst-plugin-dsp66"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2827f94fc0a1adeff4d9702e97ce2=
979"
-
-SRC_URI =3D "git://git.ti.com/git/processor-sdk/gst-plugin-dsp66.git;pro=
tocol=3Dhttps;branch=3Dmaster \
-	file://0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patch =
\
-	file://0001-configure.ac-stop-using-export-symbols-regex.patch \
-"
-SRCREV =3D "0abedafadbed693592804f23482a9447d81b2dbf"
-
-S =3D "${WORKDIR}/git"
-
-COMPATIBLE_MACHINE =3D "dra7xx"
-
-DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base opencl ti-cgt6x-nati=
ve clocl-native imglib-c66x vlib-c66x gettext-native"
-
-inherit autotools-brokensep pkgconfig gettext
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES =3D "dsp"
-REQUIRED_DISTRO_FEATURES =3D "opencl"
-
-PR =3D "r1"
-
-RDEPENDS:${PN} +=3D "opencl-runtime"
-
-EXTRA_OEMAKE =3D " TARGET_ROOTDIR=3D${STAGING_DIR_HOST} \
-                 TI_OCL_CGT_INSTALL=3D${STAGING_DIR_NATIVE}/usr/share/ti=
/cgt-c6x \
-"
-
-do_configure() {
-	cd ${S}
-	chmod +x autogen.sh
-	./autogen.sh --host=3Darm-linux --with-libtool-sysroot=3D${STAGING_DIR_=
TARGET} --prefix=3D/usr
-}
-
-EXTRA_OECONF +=3D "--enable-maintainer-mode"
-EXTRA_OEMAKE +=3D "'ERROR_CFLAGS=3D-Wno-deprecated-declarations'"
-
-FILES:${PN} +=3D "${libdir}/gstreamer-1.0/*.so"
-FILES:${PN}-dbg +=3D "${libdir}/gstreamer-1.0/.debug"
-FILES:${PN}-dev +=3D "${libdir}/gstreamer-1.0/*.la"
-
-FILES:${PN} +=3D "${libdir}/*.so"
-FILES:${PN}-dbg +=3D "${libdir}/.debug"
-FILES:${PN}-dev +=3D "${libdir}/*.la"
-FILES_SOLIBSDEV =3D ""
-
-INSANE_SKIP:${PN} =3D "ldflags"
--=20
2.25.1


