Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0ED33529C3
	for <meta-arago@arago-project.org>;
	Fri,  5 Jul 2019 18:53:12 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x65IqQAC107464
	for <meta-arago@arago-project.org>; Fri, 5 Jul 2019 13:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562352746;
	bh=vK/DKTqbHQgkArOoizDsTo8nym1sFpvQ++XEbo6/Le4=;
	h=From:To:CC:Subject:Date;
	b=v8OVyFJNKeXO/o36gc/3WwqCTEPHlD7uDGrzlrNsWowdhoppsxj+6d3DJnm6BSVZ5
	o7Dt/GxRk4k0LGIJwtRTBp1vu8ZVWo9NN+a0n9sQ92QhZsFnbhvGIovXC4bjSNZEnQ
	ZcHz55uIlKqN9O0/VQPfc1ChmmmxCCYb9jfsh474=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x65IqQNM016306
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 5 Jul 2019 13:52:26 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 5 Jul 2019 13:52:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 5 Jul 2019 13:52:26 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x65IqQXd095207;
	Fri, 5 Jul 2019 13:52:26 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 5 Jul 2019 14:35:46 -0400
Message-ID: <1562351746-27116-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud/ti2019.01][PATH] ti-tisdk-makefile: correct internal toolchain path
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
X-List-Received-Date: Fri, 05 Jul 2019 18:53:13 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Rules.make            |  2 +-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb  | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
index bfee2fc..dcdd75f 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
@@ -21,7 +21,7 @@ DESTDIR=__DESTDIR__
 export LINUX_DEVKIT_PATH=$(TI_SDK_PATH)/linux-devkit
 
 #Cross compiler prefix
-export CROSS_COMPILE=$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-linux/usr/bin/__TOOLCHAIN_PREFIX__
+export CROSS_COMPILE=$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-linux__TOOLCHAIN_BINDIR__/__TOOLCHAIN_PREFIX__
 
 #Default CC value to be used when cross compiling.  This is so that the
 #GNU Make default of "cc" is not used to point to the host compiler
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 2601f80..2d10f4c 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -54,7 +54,7 @@ SRC_URI = "\
     file://Makefile_pdm-anomaly-detection \
 "
 
-PR = "r97"
+PR = "r98"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -228,6 +228,9 @@ AMSDK_DEFCONFIG = "singlecore-omap2plus_defconfig"
 
 DEFCONFIG := "${@oe.utils.conditional('ARAGO_BRAND','amsdk','${AMSDK_DEFCONFIG}','${DEFCONFIG}',d)}"
 
+EXTERNAL_TOOLCHAIN_BINDIR = "/usr/bin"
+INTERNAL_TOOLCHAIN_BINDIR = "/usr/bin/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
+
 # This step will stitch together the final Makefile based on the supported
 # make targets.
 do_install () {
@@ -302,6 +305,12 @@ do_install () {
     sed -i -e "s/__CFLAGS__/${TARGET_CC_ARCH}/" ${D}/Rules.make
     sed -i -e "s/__SDKMACHINE__/${SDKMACHINE}/" ${D}/Rules.make
 
+    if [ "${TOOLCHAIN_TYPE}" = "internal" ]; then
+        sed -i -e "s|__TOOLCHAIN_BINDIR__|${INTERNAL_TOOLCHAIN_BINDIR}|" ${D}/Rules.make
+    else
+        sed -i -e "s|__TOOLCHAIN_BINDIR__|${EXTERNAL_TOOLCHAIN_BINDIR}|" ${D}/Rules.make
+    fi
+
 }
 
 K3_UBOOT_MACHINE_R5 = ""
-- 
2.7.4


