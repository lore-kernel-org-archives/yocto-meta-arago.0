Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28EDC3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 14:07:45 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.14013.1747404457434344485
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 May 2025 07:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DpkBt3Nn;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54GE7aAi4044917
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 09:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747404456;
	bh=oOM7viGrPTgDfN0d57us/0Xs1DUY7QN5K7YEMuO3/wY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=DpkBt3NnaSS+zV8nYKxu8YR7J9NnAIJa95DmacMuV/3vBSk8e1uUEQ3Aj6btgYA9i
	 ymjZMNXX6dMhffBS/2vAvGbW8UAaxLB4rPuyPkTGENrLxNNKlg6glmmLuKEd4Ege3W
	 r/ImnuFuCiUy8Cr7iJd+royYcsxEOOSiHhT9YCk8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54GE7aNa104293
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 May 2025 09:07:36 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 May 2025 09:07:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 May 2025 09:07:36 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54GE7aaR040023;
	Fri, 16 May 2025 09:07:36 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uFviq-00088i-0L; Fri, 16 May 2025 09:07:36 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 2/3] xdp-tools-arago: Add version v1.5.4
Date: Fri, 16 May 2025 09:07:34 -0500
Message-ID: <20250516140735.31243-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250516140735.31243-1-reatmon@ti.com>
References: <20250516140735.31243-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 May 2025 14:07:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16204

This is a sideport and update from a recipe in meta-dpdk [1].  There are
no other version of this recipe in any of the standard locations
(oe-core, meta-oe), so we will carry this here for the time being.

There is a big "hack" fix with this recipe to get around an oe-core
multilib issue.  On arm and aarch64 some of the /usr/include/asm headers
are renamed and wrapped in the multilib system that uses the wordsize
for the platform (based on defines in the compiler), it chooses the
renamed file.  The issue is that the original file is renamed to either
-32.h or -64.h based on the target architecture, but only one of them is
created.  Usually this is ok, but for this package it presents a
problem.

Some of the files are built using clang with the -target bpf option to
build BPF programs.  In this case all of the defines are changed from
arm/aarch64 to just bpf, and this short circuits the multilib setup as
bpf is not checked in the wordsize.h that is installed by the multilib
flow.  The fallback wordsize is 32 bits in this case.  Since aarch64 is
64 bit, but the bpf is looking for the 32 bit headers we get compile
errors.

The hack solution is to copy the needed files from the sysroot into the
source for the program that the needed xx-32.h files are found.  There
is likely a better way to handle this in the long run, but for now this
allows us to build the package.

[1] https://git.yoctoproject.org/meta-dpdk/tree/dynamic-layers/clang-layer/recipes-support/xdp-tools?id=3493058e7dcf00c78517ec5efb6457ebb1e85089

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...0001-configure-skip-toolchain-checks.patch | 44 ++++++++++++++++
 ...issing-prefix-map-settings-for-OE-bu.patch | 40 ++++++++++++++
 ...-not-detect-libbpf-header-from-sysro.patch | 44 ++++++++++++++++
 .../0003-Makefile-fix-KeyError-failure.patch  | 31 +++++++++++
 .../0004-Makefile-fix-libxdp.pc-error.patch   | 34 ++++++++++++
 .../xdp-tools/xdp-tools-arago_1.5.4.bb        | 52 +++++++++++++++++++
 6 files changed, 245 insertions(+)
 create mode 100644 meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0001-configure-skip-toolchain-checks.patch
 create mode 100644 meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0001-defines.mk-Add-missing-prefix-map-settings-for-OE-bu.patch
 create mode 100644 meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch
 create mode 100644 meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0003-Makefile-fix-KeyError-failure.patch
 create mode 100644 meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0004-Makefile-fix-libxdp.pc-error.patch
 create mode 100644 meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.5.4.bb

diff --git a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0001-configure-skip-toolchain-checks.patch b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0001-configure-skip-toolchain-checks.patch
new file mode 100644
index 00000000..b5f2780e
--- /dev/null
+++ b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0001-configure-skip-toolchain-checks.patch
@@ -0,0 +1,44 @@
+From 9c9dce2e5f04de65b7b00321f96fff6071546ea1 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Mon, 17 Oct 2022 15:44:16 +0800
+Subject: [PATCH] configure: skip toolchain checks
+
+Current logic fetch full command line along with the tool. i.e
+gcc -m64 -march=skylake -mtune=generic ...
+
+Which throws ERROR: Cannot find tool -m64
+
+So need to re-write for loop, so it can work in cross-compilation
+environment too.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+
+---
+ configure | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/configure b/configure
+index b4e824f..10618fc 100755
+--- a/configure
++++ b/configure
+@@ -70,12 +70,12 @@ check_toolchain()
+
+     CLANG=$(find_tool clang "$CLANG")
+ 
+-    for TOOL in $PKG_CONFIG $CC $OBJCOPY $CLANG $M4 $READELF; do
+-        if [ ! $(command -v ${TOOL} 2>/dev/null) ]; then
+-            echo "*** ERROR: Cannot find tool ${TOOL}" ;
+-            exit 1;
+-        fi;
+-    done
++    #for TOOL in $PKG_CONFIG $CC $OBJCOPY $CLANG $M4 $READELF; do
++    #    if [ ! $(command -v ${TOOL} 2>/dev/null) ]; then
++    #        echo "*** ERROR: Cannot find tool ${TOOL}" ;
++    #        exit 1;
++    #    fi;
++    #done
+ 
+     ARCH_NAME=$($CC -print-multiarch 2>/dev/null)
+ 
diff --git a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0001-defines.mk-Add-missing-prefix-map-settings-for-OE-bu.patch b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0001-defines.mk-Add-missing-prefix-map-settings-for-OE-bu.patch
new file mode 100644
index 00000000..b76f2e62
--- /dev/null
+++ b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0001-defines.mk-Add-missing-prefix-map-settings-for-OE-bu.patch
@@ -0,0 +1,40 @@
+From a7698c7172a8a178efd73bdc0ce31d4aa3646f6e Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Mon, 5 May 2025 14:30:10 -0500
+Subject: [PATCH] defines.mk: Add missing prefix-map settings for OE builds
+
+The defines was only pulling in one of the four *-prefix-map options
+from CFLAGS.
+
+Upstream-Status: OE-Specific
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ lib/defines.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/defines.mk b/lib/defines.mk
+index 411a97e..6061e81 100644
+--- a/lib/defines.mk
++++ b/lib/defines.mk
+@@ -26,7 +26,7 @@ TEST_DIR = $(LIB_DIR)/testing
+ LIBXDP_DIR := $(LIB_DIR)/libxdp
+ LIBBPF_DIR := $(LIB_DIR)/libbpf
+ 
+-DEFINES := -DBPF_DIR_MNT=\"$(BPF_DIR_MNT)\" -DBPF_OBJECT_PATH=\"$(BPF_OBJECT_DIR)\" \
++DEFINES := -DBPF_DIR_MNT=\"$(BPF_DIR_MNT)\" -DBPF_OBJECT_PATH=\"$(OE_BPF_OBJECT_DIR)\" \
+ 	-DMAX_DISPATCHER_ACTIONS=$(MAX_DISPATCHER_ACTIONS) -DTOOLS_VERSION=\"$(TOOLS_VERSION)\" \
+ 	-DLIBBPF_VERSION=\"$(LIBBPF_VERSION)\" -DRUNDIR=\"$(RUNDIR)\"
+ 
+@@ -43,7 +43,7 @@ endif
+ DEFINES += -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+ 
+ CFLAGS += -std=gnu11 -Wextra -Werror $(DEFINES) $(ARCH_INCLUDES)
+-BPF_CFLAGS += $(DEFINES) $(filter -ffile-prefix-map=%,$(CFLAGS)) $(filter -I%,$(CFLAGS)) $(ARCH_INCLUDES)
++BPF_CFLAGS += $(DEFINES) $(filter -fcoverage-prefix-map=%,$(CFLAGS)) $(filter -fdebug-prefix-map=%,$(CFLAGS)) $(filter -ffile-prefix-map=%,$(CFLAGS)) $(filter -fmacro-prefix-map=%,$(CFLAGS)) $(filter -I%,$(CFLAGS)) $(ARCH_INCLUDES)
+ 
+ CONFIGMK := $(LIB_DIR)/../config.mk
+ LIBMK := Makefile $(CONFIGMK) $(LIB_DIR)/defines.mk $(LIB_DIR)/common.mk $(LIB_DIR)/../version.mk
+-- 
+2.17.1
+
diff --git a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch
new file mode 100644
index 00000000..51bdbcdd
--- /dev/null
+++ b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch
@@ -0,0 +1,44 @@
+From 2840cf0b89497f545fae2eed7ece3f3c5fc558e3 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Mon, 17 Oct 2022 15:50:34 +0800
+Subject: [PATCH 2/4] Makefile: It does not detect libbpf header from sysroot
+
+So adding sysroot headers path.
+
+Upstream-Status: OE-Specific
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ lib/common.mk       | 2 +-
+ lib/libxdp/Makefile | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/common.mk b/lib/common.mk
+index 56c0406..ab0bad8 100644
+--- a/lib/common.mk
++++ b/lib/common.mk
+@@ -55,7 +55,7 @@ LIBXDP_SOURCES := $(wildcard $(LIBXDP_DIR)/*.[ch] $(LIBXDP_DIR)/*.in)
+ KERN_USER_H ?= $(wildcard common_kern_user.h)
+ 
+ CFLAGS += -I$(HEADER_DIR) -I$(LIB_DIR)/util $(ARCH_INCLUDES)
+-BPF_CFLAGS += -I$(HEADER_DIR) $(ARCH_INCLUDES)
++BPF_CFLAGS += -I$(HEADER_DIR) $(ARCH_INCLUDES) -I${STAGING_INCDIR}/
+ 
+ BPF_HEADERS := $(wildcard $(HEADER_DIR)/bpf/*.h) $(wildcard $(HEADER_DIR)/xdp/*.h)
+ 
+diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
+index 358b751..8f459d8 100644
+--- a/lib/libxdp/Makefile
++++ b/lib/libxdp/Makefile
+@@ -28,7 +28,7 @@ PC_FILE := $(OBJDIR)/libxdp.pc
+ TEMPLATED_SOURCES := xdp-dispatcher.c
+ 
+ CFLAGS += -I$(HEADER_DIR)
+-BPF_CFLAGS += -I$(HEADER_DIR) $(ARCH_INCLUDES)
++BPF_CFLAGS += -I$(HEADER_DIR) $(ARCH_INCLUDES) -I${STAGING_INCDIR}/
+ 
+ 
+ ifndef BUILD_STATIC_ONLY
+-- 
+2.25.1
+
diff --git a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0003-Makefile-fix-KeyError-failure.patch b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0003-Makefile-fix-KeyError-failure.patch
new file mode 100644
index 00000000..d0133bcb
--- /dev/null
+++ b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0003-Makefile-fix-KeyError-failure.patch
@@ -0,0 +1,31 @@
+From 157546fbc4f18751c52b3c8788879c05cf253331 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Mon, 17 Oct 2022 16:02:46 +0800
+Subject: [PATCH 3/4] Makefile: fix KeyError failure
+
+Error:
+Exception: KeyError: 'getpwuid(): uid not found: 11857215'
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ lib/libxdp/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
+index 8f459d8..9a340a3 100644
+--- a/lib/libxdp/Makefile
++++ b/lib/libxdp/Makefile
+@@ -54,7 +54,7 @@ install: all
+ 	$(Q)install -d -m 0755 $(DESTDIR)$(BPF_OBJECT_DIR)
+ 	$(Q)install -m 0644 $(LIB_HEADERS) $(DESTDIR)$(HDRDIR)/
+ 	$(Q)install -m 0644 $(PC_FILE) $(DESTDIR)$(LIBDIR)/pkgconfig/
+-	$(Q)cp -fpR $(SHARED_LIBS) $(STATIC_LIBS) $(DESTDIR)$(LIBDIR)
++	$(Q)cp -fpR --no-preserve=ownership $(SHARED_LIBS) $(STATIC_LIBS) $(DESTDIR)$(LIBDIR)
+ 	$(Q)install -m 0644 $(XDP_OBJS) $(DESTDIR)$(BPF_OBJECT_DIR)
+ 	$(if $(MAN_FILES),$(Q)install -m 0755 -d $(DESTDIR)$(MANDIR)/man3)
+ 	$(if $(MAN_FILES),$(Q)install -m 0644 $(MAN_FILES) $(DESTDIR)$(MANDIR)/man3)
+-- 
+2.25.1
+
diff --git a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0004-Makefile-fix-libxdp.pc-error.patch b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0004-Makefile-fix-libxdp.pc-error.patch
new file mode 100644
index 00000000..b1e15e52
--- /dev/null
+++ b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0004-Makefile-fix-libxdp.pc-error.patch
@@ -0,0 +1,34 @@
+From 46b3ff797135574aa0ee42f633a281d44f48da95 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Mon, 17 Oct 2022 16:05:15 +0800
+Subject: [PATCH 4/4] Makefile: fix libxdp.pc error
+
+Error:
+do_populate_sysroot: QA Issue: libxdp.pc failed sanity test (tmpdir) in
+path ... xdp-tools/1.2.8-r0/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ lib/libxdp/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
+index 9a340a3..bc39177 100644
+--- a/lib/libxdp/Makefile
++++ b/lib/libxdp/Makefile
+@@ -76,8 +76,8 @@ $(OBJDIR)/libxdp.so.$(LIBXDP_VERSION): $(SHARED_OBJS)
+ 		      $^ $(LDFLAGS) $(LDLIBS) -o $@
+ 
+ $(OBJDIR)/libxdp.pc:
+-	$(Q)sed -e "s|@PREFIX@|$(PREFIX)|" \
+-			-e "s|@LIBDIR@|$(LIBDIR)|" \
++	$(Q)sed -e "s|@PREFIX@|$(prefix)|" \
++			-e "s|@LIBDIR@|$(libdir)|" \
+ 			-e "s|@VERSION@|$(TOOLS_VERSION)|" \
+ 			< libxdp.pc.template > $@
+ 
+-- 
+2.25.1
+
diff --git a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.5.4.bb b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.5.4.bb
new file mode 100644
index 00000000..d2e07bea
--- /dev/null
+++ b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.5.4.bb
@@ -0,0 +1,52 @@
+SUMMARY = "Utilities and example programs for use with XDP"
+HOMEPAGE = "https://github.com/xdp-project/xdp-tools"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9ee53f8d06bbdb4c11b1557ecc4f8cd5 \
+                    file://LICENSES/GPL-2.0;md5=994331978b428511800bfbd17eea3001 \
+                    file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd \
+                    file://LICENSES/BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927"
+
+DEPENDS += " libbpf zlib elfutils libpcap"
+DEPENDS += " clang-cross-${TARGET_ARCH} bpftool-native"
+
+SRC_URI = "git://github.com/xdp-project/xdp-tools.git;protocol=https;branch=main \
+            file://0001-configure-skip-toolchain-checks.patch \
+            file://0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch \
+            file://0003-Makefile-fix-KeyError-failure.patch \
+            file://0004-Makefile-fix-libxdp.pc-error.patch \
+            file://0001-defines.mk-Add-missing-prefix-map-settings-for-OE-bu.patch \
+          "
+
+SRCREV = "e78d8d23bb80f221dd6b6970ff5a44aaf4717114"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+EXTRA_OEMAKE += " PREFIX=${D}${prefix} LIBDIR=${D}${libdir} BUILD_STATIC_ONLY=1 PRODUCTION=1 V=1"
+EXTRA_OEMAKE += " OE_BPF_OBJECT_DIR=${libdir}/bpf"
+EXTRA_OEMAKE += " CLANG="${TARGET_PREFIX}clang --sysroot=${RECIPE_SYSROOT}""
+
+CFLAGS += "-fPIC"
+
+export STAGING_INCDIR
+
+do_compile:prepend:aarch64 () {
+    mkdir -p ${S}/headers/asm
+    cp ${RECIPE_SYSROOT}/usr/include/asm/bitsperlong-64.h ${S}/headers/asm/bitsperlong-32.h
+    cp ${RECIPE_SYSROOT}/usr/include/asm/byteorder-64.h ${S}/headers/asm/byteorder-32.h
+    cp ${RECIPE_SYSROOT}/usr/include/asm/posix_types-64.h ${S}/headers/asm/posix_types-32.h
+    cp ${RECIPE_SYSROOT}/usr/include/asm/swab-64.h ${S}/headers/asm/swab-32.h
+    cp ${RECIPE_SYSROOT}/usr/include/asm/types-64.h ${S}/headers/asm/types-32.h
+}
+
+do_install() {
+    oe_runmake install
+}
+
+FILES:${PN} += "${datadir}/xdp-tools/* \
+                ${nonarch_base_libdir}/bpf/* \
+               "
+
+RDEPENDS:${PN} += "bash"
+
-- 
2.17.1


