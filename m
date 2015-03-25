Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8D56E52A5A
	for <meta-arago@arago-project.org>;
	Wed, 25 Mar 2015 19:28:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2PJSPNd021059
	for <meta-arago@arago-project.org>; Wed, 25 Mar 2015 14:28:25 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2PJSOUw024589
	for <meta-arago@arago-project.org>; Wed, 25 Mar 2015 14:28:24 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Mar 2015 14:28:24 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2PJSOQG031251;
	Wed, 25 Mar 2015 14:28:24 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YaqyW-0005RC-3X;
	Wed, 25 Mar 2015 15:28:24 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Mar 2015 15:28:20 -0400
Message-ID: <1427311700-20869-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1427311700-20869-1-git-send-email-j-stiffler@ti.com>
References: <1427311700-20869-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] packagegroup-arago-tisdk-graphics-sdk-host: Create for graphics modules.
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
X-List-Received-Date: Wed, 25 Mar 2015 19:28:26 -0000
Content-Type: text/plain

* Provides sources for out-of-tree graphics drivers.
* Add to arago-core-tisdk-image.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-image.inc |    1 +
 .../packagegroup-arago-tisdk-graphics-sdk-host.bb  |   16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 649ef97..efd45e9 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -44,6 +44,7 @@ IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-addons-sdk-host \
     packagegroup-arago-tisdk-connectivity-sdk-host \
     packagegroup-arago-tisdk-crypto-sdk-host \
+    packagegroup-arago-tisdk-graphics-sdk-host \
     packagegroup-arago-tisdk-matrix-sdk-host \
     packagegroup-arago-tisdk-multimedia-sdk-host \
     packagegroup-arago-tisdk-amsdk-sdk-host \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
new file mode 100644
index 0000000..1ea3cf6
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Task to install graphics sources in SDK"
+LICENSE = "MIT"
+PR = "r0"
+
+inherit packagegroup
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+GRAPHICS_RDEPENDS = ""
+
+GRAPHICS_RDEPENDS_append_ti33x = " omap3-sgx-modules-src"
+GRAPHICS_RDEPENDS_append_ti43x = " omap3-sgx-modules-src"
+
+RDEPENDS_${PN} = "\
+    ${GRAPHICS_RDEPENDS} \
+"
-- 
1.7.9.5


