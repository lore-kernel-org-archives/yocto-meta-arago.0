Return-Path: <yan-liu@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 54CCC529C0
	for <meta-arago@arago-project.org>;
	Tue,  5 Mar 2019 19:58:01 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x25JvsSq106720
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 13:57:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551815874;
	bh=18SfYp0FQ+YFdauVCpG1DNPx4CibtX6iVhPwyiRBrgI=;
	h=From:To:CC:Subject:Date;
	b=aKzVKYtce5RBkMSYvK/9tD7bsukxQmJLYUZjo7VjbWqjaRmfd/J2WYBVdxo4JVpCa
	FwPL6NZWq5t5QO8TVohmyrrn/tw92cjyC/v4Cxe9LpCNLewRIhQT7nCOLgLczHx9pl
	ko0kdtA5Fw7SkM9GvaLs7ev3E5+wF3hTeO3aVdGc=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x25Jvscm026446
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 13:57:54 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 5 Mar 2019 13:57:54 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 5 Mar 2019 13:57:54 -0600
Received: from yan-ubuntu-1204.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x25JvpZT013413;
	Tue, 5 Mar 2019 13:57:52 -0600
From: <yan-liu@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 5 Mar 2019 15:01:54 -0500
Message-ID: <1551816114-11226-1-git-send-email-yan-liu@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v1] ltp-ddt: Update to latest
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
X-List-Received-Date: Tue, 05 Mar 2019 19:58:02 -0000
Content-Type: text/plain

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb   |   94 --------------------
 .../recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb   |   94 ++++++++++++++++++++
 2 files changed, 94 insertions(+), 94 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
deleted file mode 100644
index 2f491ad..0000000
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
+++ /dev/null
@@ -1,94 +0,0 @@
-SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
-HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-PR = "r22"
-PV_append = "+git${SRCPV}"
-
-PROVIDES += "ltp"
-DEPENDS = "alsa-lib attr libaio libcap acl openssl zip-native"
-
-RDEPENDS_${PN} = "\
-    acl \
-    at \
-    attr \
-    bash \
-    cpio \
-    cronie \
-    curl \
-    e2fsprogs-mke2fs \
-    expect \
-    gawk \
-    gzip \
-    iproute2 \
-    ldd \
-    libaio \
-    logrotate \
-    perl \
-    pm-qa \
-    python-core \
-    serialcheck \
-    unzip \
-    util-linux \
-    which \
-    libgcc\
-    memtester\
-"
-
-inherit autotools-brokensep
-
-SRCREV = "cc77bda07ecfc3bc7c42a559ec17d7a7736d1e9f"
-BRANCH ?= "master"
-
-SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-    file://0003-Add-knob-to-control-tirpc-support.patch \
-"
-
-S = "${WORKDIR}/git"
-
-LTPROOT = "/opt/ltp"
-
-# disable TI RPC (Transport-Independent RPC) due to missing dependency
-EXTRA_OECONF += " --without-tirpc"
-
-EXTRA_OEMAKE_append = " \
-    prefix=${LTPROOT} \
-    CROSS_COMPILE=${HOST_PREFIX} \
-    SKIP_IDCHECK=1 \
-    KERNEL_USR_INC=${STAGING_INCDIR} \
-    ALSA_INCPATH=${STAGING_INCDIR} \
-    ALSA_LIBPATH=${STAGING_LIBDIR} \
-    RANLIB=${RANLIB} \
-    DESTDIR=${D} \
-    CC='${CC}' \
-"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-FILES_${PN}-dbg += " \
-    ${LTPROOT}/.debug \
-    ${LTPROOT}/bin/.debug \
-    ${LTPROOT}/runtest/.debug \
-    ${LTPROOT}/testcases/bin/.debug \
-    ${LTPROOT}/testcases/bin/*/bin/.debug \
-    ${LTPROOT}/testcases/bin/*/test/.debug \
-    ${LTPROOT}/testcases/bin/ddt/.debug \
-    ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \
-    ${LTPROOT}/testcases/bin/ddt/*/test/.debug \
-    ${LTPROOT}/testcases/realtime/*/*/.debug \
-"
-
-FILES_${PN}-staticdev += "${LTPROOT}/lib ${LTPROOT}/lib/libmem.a ${LTPROOT}/testcases/data/nm01/lib.a"
-FILES_${PN} += "${LTPROOT}/*"
-
-do_install() {
-    oe_runmake install
-}
-
-# Avoid file dependency scans, as LTP checks for things that may or may not
-# exist on the running system.  For instance it has specific checks for
-# csh and ksh which are not typically part of OpenEmbedded systems (but
-# can be added via additional layers.)
-SKIP_FILEDEPS_${PN} = '1'
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
new file mode 100644
index 0000000..9ff582f
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
@@ -0,0 +1,94 @@
+SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
+HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+PR = "r1"
+PV_append = "+git${SRCPV}"
+
+PROVIDES += "ltp"
+DEPENDS = "alsa-lib attr libaio libcap acl openssl zip-native"
+
+RDEPENDS_${PN} = "\
+    acl \
+    at \
+    attr \
+    bash \
+    cpio \
+    cronie \
+    curl \
+    e2fsprogs-mke2fs \
+    expect \
+    gawk \
+    gzip \
+    iproute2 \
+    ldd \
+    libaio \
+    logrotate \
+    perl \
+    pm-qa \
+    python-core \
+    serialcheck \
+    unzip \
+    util-linux \
+    which \
+    libgcc\
+    memtester\
+"
+
+inherit autotools-brokensep
+
+SRCREV = "22e65405811dc47a4254a52aaaf09a5a83387bdd"
+BRANCH ?= "master"
+
+SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
+    file://0003-Add-knob-to-control-tirpc-support.patch \
+"
+
+S = "${WORKDIR}/git"
+
+LTPROOT = "/opt/ltp"
+
+# disable TI RPC (Transport-Independent RPC) due to missing dependency
+EXTRA_OECONF += " --without-tirpc"
+
+EXTRA_OEMAKE_append = " \
+    prefix=${LTPROOT} \
+    CROSS_COMPILE=${HOST_PREFIX} \
+    SKIP_IDCHECK=1 \
+    KERNEL_USR_INC=${STAGING_INCDIR} \
+    ALSA_INCPATH=${STAGING_INCDIR} \
+    ALSA_LIBPATH=${STAGING_LIBDIR} \
+    RANLIB=${RANLIB} \
+    DESTDIR=${D} \
+    CC='${CC}' \
+"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+FILES_${PN}-dbg += " \
+    ${LTPROOT}/.debug \
+    ${LTPROOT}/bin/.debug \
+    ${LTPROOT}/runtest/.debug \
+    ${LTPROOT}/testcases/bin/.debug \
+    ${LTPROOT}/testcases/bin/*/bin/.debug \
+    ${LTPROOT}/testcases/bin/*/test/.debug \
+    ${LTPROOT}/testcases/bin/ddt/.debug \
+    ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \
+    ${LTPROOT}/testcases/bin/ddt/*/test/.debug \
+    ${LTPROOT}/testcases/realtime/*/*/.debug \
+"
+
+FILES_${PN}-staticdev += "${LTPROOT}/lib ${LTPROOT}/lib/libmem.a ${LTPROOT}/testcases/data/nm01/lib.a"
+FILES_${PN} += "${LTPROOT}/*"
+
+do_install() {
+    oe_runmake install
+}
+
+# Avoid file dependency scans, as LTP checks for things that may or may not
+# exist on the running system.  For instance it has specific checks for
+# csh and ksh which are not typically part of OpenEmbedded systems (but
+# can be added via additional layers.)
+SKIP_FILEDEPS_${PN} = '1'
-- 
1.7.9.5


