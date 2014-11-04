Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 8674052A31
	for <meta-arago@arago-project.org>;
	Tue,  4 Nov 2014 01:43:19 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NEH00I8ZRFPOY80@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 03 Nov 2014 19:43:03 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=GLe/yVJP c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=sozttTNsAAAA:8
	a=pGLkceISAAAA:8 a=b01i9L7eAAAA:8	a=NEAV23lmAAAA:8
	a=3rf9BAvIa8nnJ6Olf8IA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 42E1A201AD;	Mon,
	3 Nov 2014 20:43:00 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 03 Nov 2014 20:42:46 -0500
Message-id: <1415065371-27167-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
In-reply-to: <1415065371-27167-1-git-send-email-denis@denix.org>
References: <1415065371-27167-1-git-send-email-denis@denix.org>
Subject: [PATCH 1/6] leveldb: import from meta-oe
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
X-List-Received-Date: Tue, 04 Nov 2014 01:43:20 -0000

* Overlay from meta-oe/master since it's not available in daisy
* It's needed for newer qtwebkit-5.4

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../leveldb/0001-Explicitly-disable-tcmalloc.patch | 48 ++++++++++++++++++++++
 .../recipes-extended/leveldb/leveldb_git.bb        | 27 ++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta-arago-distro/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch
 create mode 100644 meta-arago-distro/recipes-extended/leveldb/leveldb_git.bb

diff --git a/meta-arago-distro/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch b/meta-arago-distro/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch
new file mode 100644
index 0000000..4b76dd0
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch
@@ -0,0 +1,48 @@
+From d6daac04dab4b3acf4b88f16742d1b402cdc3d83 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 1 Oct 2014 18:54:04 +0200
+Subject: [PATCH] Explicitly disable tcmalloc
+
+Without this change leveldb autodetects tcmalloc from sysroot and
+sometimes became dependant on gperftools
+
+Disable autodetection without TCMALLOC_ENABLED=true pased to make
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ build_detect_platform | 16 +++++++++-------
+ 1 file changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/build_detect_platform b/build_detect_platform
+index bb76c4f..a586364 100755
+--- a/build_detect_platform
++++ b/build_detect_platform
+@@ -201,15 +201,17 @@ EOF
+         PLATFORM_LIBS="$PLATFORM_LIBS -lsnappy"
+     fi
+ 
+-    # Test whether tcmalloc is available
+-    $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -ltcmalloc 2>/dev/null  <<EOF
+-      int main() {}
++    if [ "$TCMALLOC_ENABLED" = "true" ]; then
++        # Test whether tcmalloc is available
++        $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -ltcmalloc 2>/dev/null  <<EOF
++          int main() {}
+ EOF
+-    if [ "$?" = 0 ]; then
+-        PLATFORM_LIBS="$PLATFORM_LIBS -ltcmalloc"
+-    fi
++        if [ "$?" = 0 ]; then
++            PLATFORM_LIBS="$PLATFORM_LIBS -ltcmalloc"
++        fi
+ 
+-    rm -f $CXXOUTPUT 2>/dev/null
++        rm -f $CXXOUTPUT 2>/dev/null
++    fi
+ fi
+ 
+ PLATFORM_CCFLAGS="$PLATFORM_CCFLAGS $COMMON_FLAGS"
+-- 
+2.1.1
+
diff --git a/meta-arago-distro/recipes-extended/leveldb/leveldb_git.bb b/meta-arago-distro/recipes-extended/leveldb/leveldb_git.bb
new file mode 100644
index 0000000..a6a3024
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/leveldb/leveldb_git.bb
@@ -0,0 +1,27 @@
+SUMMARY = "LevelDB is a fast key-value storage library"
+DESCRIPTION = "LevelDB is a fast key-value storage library that provides an ordered mapping from string keys to string values"
+HOMEPAGE = "http://leveldb.googlecode.com"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=92d1b128950b11ba8495b64938fc164d"
+
+SRCREV = "803d69203a62faf50f1b77897310a3a1fcae712b"
+PV = "1.18+git${SRCPV}"
+
+SRC_URI = "git://github.com/google/${BPN}.git \
+    file://0001-Explicitly-disable-tcmalloc.patch \
+"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    # do not use oe_runmake. oe_runmake pass to make compilation arguments and override
+    # leveldb makefile variable CFLAGS and broke leveldb build.
+    CFLAGS="${CFLAGS}" make || die
+}
+
+do_install() {
+    install -d ${D}${libdir}
+    oe_libinstall -C ${S} -so libleveldb ${D}${libdir}
+    install -d ${D}${includedir}/leveldb
+    install -m 644 ${S}/include/leveldb/*.h ${D}${includedir}/leveldb/
+}
-- 
2.1.2


