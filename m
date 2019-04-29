Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 0EB82529EF
	for <meta-arago@arago-project.org>;
	Mon, 29 Apr 2019 20:42:13 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3TKfmbP090192
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 15:41:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556570508;
	bh=vHcmIzYwolRountJGze31ATibYZH61TMlAs1/S8HneQ=;
	h=From:To:CC:Subject:Date;
	b=MY9EPExXCdfBVHkEmRorNLsd6ZPYTS4wqTaECaN6XUnjM7MfIaqWMZlbzg42T8VYJ
	5F4ubZ8CzyH92mWYt5wiHYHGTbI74aER34+jPvRdt2qrUlw4RbU0eKk8LgnE+eGJ+T
	jD++/5Du6I3xiXC6mER9PLsA0WYQ0+dUFwJT+6BQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3TKflHu105306
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 15:41:48 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 29 Apr 2019 15:41:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 29 Apr 2019 15:41:47 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3TKflgm102719;
	Mon, 29 Apr 2019 15:41:47 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 29 Apr 2019 20:30:43 +0000
Message-ID: <20190429203043.23625-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2] optee: update os/client/test to 3.5.0 final
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
X-List-Received-Date: Mon, 29 Apr 2019 20:42:14 -0000
Content-Type: text/plain

optee-client has changed where exported files are deployed, but upstream
meta-optee hasn't caught up to that, so override do_install() locally.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Andrew F. Davis <afd@ti.com>
Cc: Dan Murphy <dmurphy@ti.com>
---
v2 - include optee-os update, fix optee-client do_install()

 .../optee/optee-client.bbappend               | 27 ++++++++++++++++---
 .../optee/optee-os_git.bbappend               |  6 ++---
 .../optee/optee-test_git.bbappend             |  8 +++---
 3 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
index 0641bde6..a203bda0 100644
--- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
@@ -1,11 +1,30 @@
-PR_append = ".arago2"
+PR_append = ".arago0"
 
 SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
            file://tee-supplicant.service"
 
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
 
-PV = "3.2.0+git${SRCPV}"
+PV = "3.5.0+git${SRCPV}"
 
-BRANCH = "ti_optee_client"
-SRCREV = "08428734c67fb559e420d87fa52fd74a955ea1bd"
+BRANCH = "ti-optee-client"
+SRCREV = "1f8f9abe4a31abd7b7490a7ddd9bbe812c92d5af"
+
+do_install() {
+    oe_runmake install
+
+    install -D -p -m0755 ${S}/out/export${sbindir}/tee-supplicant ${D}${sbindir}/tee-supplicant
+
+    install -D -p -m0644 ${S}/out/export${libdir}/libteec.so.1.0 ${D}${libdir}/libteec.so.1.0
+    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
+    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
+
+    install -d ${D}${includedir}
+    install -p -m0644 ${S}/out/export${includedir}/*.h ${D}${includedir}
+
+    sed -i -e s:/etc:${sysconfdir}:g \
+           -e s:/usr/bin:${bindir}:g \
+              ${WORKDIR}/tee-supplicant.service
+
+    install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_unitdir}/tee-supplicant.service
+}
diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 3b58ac15..dd6c9c62 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
 
-PR_append = ".arago1"
+PR_append = ".arago2"
 
 PV = "3.5.0+git${SRCPV}"
 
@@ -12,8 +12,8 @@ is_armv7_aarch64 = "0"
 SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
-BRANCH = "ti_optee_os"
-SRCREV = "b38f935200f67f9408d7c5d99fe703e5cc806c65"
+BRANCH = "ti-optee-os"
+SRCREV = "251f7c6325856a056e326f368c0b44ce277a5a36"
 
 ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
 ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
index d0a1ac57..001f04f2 100644
--- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
@@ -1,12 +1,12 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = ".arago2"
+PR_append = ".arago0"
 
 SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
 
 SRC_URI += "file://0001-host-xtest-Makefile-fix-COMPILE_NS_USER-not-being-se.patch"
 
-PV = "3.2.0+git${SRCPV}"
+PV = "3.5.0+git${SRCPV}"
 
-BRANCH = "ti_optee_test"
-SRCREV = "274d3c55dfa2f4726109dc9773c82fe8d5a44dae"
+BRANCH = "ti-optee-test"
+SRCREV = "e4f6f76b4cb5763112f4722981f84a26f4ac7e55"
-- 
2.17.1


