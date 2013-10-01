Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id D274A52AB8
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 07:11:47 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTZ00HK3AMSE2T0@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 01 Oct 2013 02:11:32 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BFE70214E7; Tue,
	01 Oct 2013 03:11:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 01 Oct 2013 03:11:02 -0400
Message-id: <1380611472-23600-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1380611472-23600-1-git-send-email-denis@denix.org>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
Subject: [PATCH 03/13] icu: overlay the latest version from oe-core/master
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
X-List-Received-Date: Tue, 01 Oct 2013 07:11:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../icu/icu-51.2/icu-pkgdata-large-cmd.patch       | 29 ++++++++++++
 meta-arago-distro/recipes-support/icu/icu.inc      | 55 ++++++++++++++++++++++
 meta-arago-distro/recipes-support/icu/icu_51.2.bb  | 13 +++++
 3 files changed, 97 insertions(+)
 create mode 100644 meta-arago-distro/recipes-support/icu/icu-51.2/icu-pkgdata-large-cmd.patch
 create mode 100644 meta-arago-distro/recipes-support/icu/icu.inc
 create mode 100644 meta-arago-distro/recipes-support/icu/icu_51.2.bb

diff --git a/meta-arago-distro/recipes-support/icu/icu-51.2/icu-pkgdata-large-cmd.patch b/meta-arago-distro/recipes-support/icu/icu-51.2/icu-pkgdata-large-cmd.patch
new file mode 100644
index 0000000..6e40659
--- /dev/null
+++ b/meta-arago-distro/recipes-support/icu/icu-51.2/icu-pkgdata-large-cmd.patch
@@ -0,0 +1,29 @@
+pkgdata.cpp: use LARGE_BUFFER_MAX_SIZE for cmd
+
+Use LARGE_BUFFER_MAX_SIZE for cmd rather than SMALL_BUFFER_MAX_SIZE,
+otherwise there was a Segmentation fault error when the command line is
+long, this should be a misplay since other cmd uses
+LARGE_BUFFER_MAX_SIZE.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ tools/pkgdata/pkgdata.cpp |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/pkgdata/pkgdata.cpp b/tools/pkgdata/pkgdata.cpp
+--- a/tools/pkgdata/pkgdata.cpp
++++ b/tools/pkgdata/pkgdata.cpp
+@@ -1019,7 +1019,7 @@ normal_symlink_mode:
+ 
+ static int32_t pkg_installLibrary(const char *installDir, const char *targetDir, UBool noVersion) {
+     int32_t result = 0;
+-    char cmd[SMALL_BUFFER_MAX_SIZE];
++    char cmd[LARGE_BUFFER_MAX_SIZE];
+ 
+     sprintf(cmd, "cd %s && %s %s %s%s%s",
+             targetDir,
+-- 
+1.7.10.4
+
diff --git a/meta-arago-distro/recipes-support/icu/icu.inc b/meta-arago-distro/recipes-support/icu/icu.inc
new file mode 100644
index 0000000..e3944cd
--- /dev/null
+++ b/meta-arago-distro/recipes-support/icu/icu.inc
@@ -0,0 +1,55 @@
+SUMMARY = "International Component for Unicode libraries"
+DESCRIPTION = "The International Component for Unicode (ICU) is a mature, portable set of C/C++ and Java libraries for Unicode support, software internationalization (I18N) and globalization (G11N), giving applications the same results on all platforms."
+HOMEPAGE = "http://site.icu-project.org/"
+
+LICENSE = "ICU"
+DEPENDS = "icu-native"
+DEPENDS_class-native = ""
+
+S = "${WORKDIR}/icu/source"
+STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
+
+PARALLEL_MAKE = ""
+CPPFLAGS_append_libc-uclibc = " -DU_TIMEZONE=0"
+
+inherit autotools pkgconfig binconfig
+
+# ICU needs the native build directory as an argument to its --with-cross-build option when
+# cross-compiling. Taken the situation that different builds may share a common sstate-cache
+# into consideration, the native build directory needs to be staged.
+EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
+EXTRA_OECONF_class-native = ""
+
+# ICU puts custom m4 autoconf functions in aclocal.m4.
+# However, this file is deleted in our build system. 
+# To make it work, we copy aclocal.m4 to acinclude.m4.
+# This is a bug of ICU. See bug reference:
+# http://bugs.icu-project.org/trac/ticket/9790
+do_configure_prepend() {
+    [ -f ${S}/acinclude.m4 ] || cp ${S}/aclocal.m4 ${S}/acinclude.m4
+}
+
+do_install_append_class-native() {
+	mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
+	cp -r ${B}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
+        cp -r ${B}/config/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config
+	cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
+	cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
+	cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
+
+}
+
+PACKAGES =+ "libicudata libicuuc libicui18n libicule libiculx libicutu libicuio"
+
+FILES_${PN}-dev += "${libdir}/${BPN}/"
+
+FILES_libicudata = "${libdir}/libicudata.so.*"
+FILES_libicuuc = "${libdir}/libicuuc.so.*"
+FILES_libicui18n = "${libdir}/libicui18n.so.*"
+FILES_libicule = "${libdir}/libicule.so.*"
+FILES_libiculx = "${libdir}/libiculx.so.*"
+FILES_libicutu = "${libdir}/libicutu.so.*"
+FILES_libicuio = "${libdir}/libicuio.so.*"
+
+BBCLASSEXTEND = "native"
+
diff --git a/meta-arago-distro/recipes-support/icu/icu_51.2.bb b/meta-arago-distro/recipes-support/icu/icu_51.2.bb
new file mode 100644
index 0000000..1278d22
--- /dev/null
+++ b/meta-arago-distro/recipes-support/icu/icu_51.2.bb
@@ -0,0 +1,13 @@
+require icu.inc
+
+LIC_FILES_CHKSUM = "file://../license.html;md5=443a74288a72fad9069a74e7637192c1"
+
+PR = "r0"
+
+BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-51_2-src.tgz"
+SRC_URI = "${BASE_SRC_URI} \
+           file://icu-pkgdata-large-cmd.patch \
+          "
+
+SRC_URI[md5sum] = "072e501b87065f3a0ca888f1b5165709"
+SRC_URI[sha256sum] = "deb027a05f1b3bec03298b96fb93b28c84e9683c22e6f94effa67fdc7bd704cc"
-- 
1.8.3.2


