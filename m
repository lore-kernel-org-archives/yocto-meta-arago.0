Return-Path: <heroor@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id DE326529EA
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2013 15:47:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61FlxFV008878
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 10:47:59 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61Flxuw012549
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 10:47:59 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 10:47:58 -0500
Received: from ti.com (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with SMTP id r61FlvYi018569;
	Mon, 1 Jul 2013 10:47:58 -0500
Date: Mon, 1 Jul 2013 21:17:57 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20130701154756.GA1772@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH 1/2] packagegroups: Add new packagegroup for glsdk console
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
X-List-Received-Date: Mon, 01 Jul 2013 15:48:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* GLSDK supports a virtual console using KMS and GBM. This
  packagegroup builds on top of the arago-console packagegroup.
* For OMAP5, we append ABE firmware.
* KMSCube is used as demonstration application

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 .../packagegroup-arago-glsdk-console.bb            |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-glsdk-console.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-glsdk-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-glsdk-console.bb
new file mode 100644
index 0000000..da16db7
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-glsdk-console.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "Extended task to get more basic and console apps in GLSDK"
+LICENSE = "MIT"
+PR = "r1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+ARAGO_GLSDK_CONSOLE = "\
+    libdrm \
+    libdrm-kms \
+    libgbm-glsdk \
+    cairo \
+    pixman \
+    expat \
+    omap5-sgx-ddk-um-linux \
+    omapdrm-pvr \
+    "
+
+ARAGO_GLSDK_CONSOLE_append_omap5-evm = "\
+    abefw \
+    "
+
+ARAGO_GLSDK_CONSOLE_DEMOS = "\
+    kmscube \
+    "
+
+RDEPENDS_${PN} = "\
+    ${ARAGO_GLSDK_CONSOLE} \
+    ${ARAGO_GLSDK_CONSOLE_DEMOS} \
+    "
+
+RRECOMMENDS_${PN} = "\
+    kernel-modules \
+    "
-- 
1.7.0.4


