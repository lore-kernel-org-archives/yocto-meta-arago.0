Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 72169529FF
	for <meta-arago@arago-project.org>;
	Fri, 31 Jul 2015 17:27:20 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSD00MV54GVB750@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 31 Jul 2015 12:27:05 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=P1C4r-quXNr_uYgWacEA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 276A4161B22;	Fri,
	31 Jul 2015 13:26:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 31 Jul 2015 13:26:54 -0400
Message-id: <1438363614-7975-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] HACK: disable SGX modules on am3/am4 for now until fixed against 4.1
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
X-List-Received-Date: Fri, 31 Jul 2015 17:27:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb    | 7 ++++---
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb             | 4 ++--
 meta-arago-distro/recipes-graphics/libgl/libgles-omap3_%.bbappend  | 1 +
 3 files changed, 7 insertions(+), 5 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/libgl/libgles-omap3_%.bbappend

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
index 1b0fc85..a0cbc5c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install graphics sources in SDK"
 LICENSE = "MIT"
-PR = "r1"
+PR = "r2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -8,8 +8,9 @@ inherit packagegroup
 
 GRAPHICS_RDEPENDS = ""
 
-GRAPHICS_RDEPENDS_append_ti33x = " omap3-sgx-modules-src"
-GRAPHICS_RDEPENDS_append_ti43x = " omap3-sgx-modules-src"
+# SGX modules fail against 4.1
+#GRAPHICS_RDEPENDS_append_ti33x = " omap3-sgx-modules-src"
+#GRAPHICS_RDEPENDS_append_ti43x = " omap3-sgx-modules-src"
 
 RDEPENDS_${PN} = "\
     ${GRAPHICS_RDEPENDS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 7e3bc82..449a113 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install graphics binaries"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -12,6 +12,7 @@ GRAPHICS_WESTON = "\
     weston-examples \
 "
 
+# Until SGX is fixed with 4.1 - omap3-sgx-modules
 GRAPHICS_SDK = "\
     libgles-omap3 \
     libgles-omap3-blitwsegl \
@@ -19,7 +20,6 @@ GRAPHICS_SDK = "\
     libgles-omap3-frontwsegl \
     libgles-omap3-linuxfbwsegl \
     libgles-omap3-rawdemos \
-    omap3-sgx-modules \
 "
 
 GRAPHICS_RDEPENDS = ""
diff --git a/meta-arago-distro/recipes-graphics/libgl/libgles-omap3_%.bbappend b/meta-arago-distro/recipes-graphics/libgl/libgles-omap3_%.bbappend
new file mode 100644
index 0000000..e0c105c
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/libgl/libgles-omap3_%.bbappend
@@ -0,0 +1 @@
+RRECOMMENDS_${PN}_remove = "omap3-sgx-modules"
-- 
2.2.0


