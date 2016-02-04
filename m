Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id AC55D52A95
	for <meta-arago@arago-project.org>;
	Thu,  4 Feb 2016 18:25:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u14IPbKO001399
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 12:25:37 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14IPbMN005868
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 12:25:37 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 4 Feb 2016 12:25:37 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14IPb1o005538;
	Thu, 4 Feb 2016 12:25:37 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aROb2-0006ak-Um; Thu, 04 Feb 2016 13:25:37 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 Feb 2016 13:25:34 -0500
Message-ID: <1454610334-25304-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] tisdk-server-rootfs-image, packagegroup-arago-test-addons: Remove gdb
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
X-List-Received-Date: Thu, 04 Feb 2016 18:25:41 -0000
Content-Type: text/plain

* Including gdb in these places is redundant since
  packagegroup-core-tools-debug has been added to
  packagegroup-arago-tisdk-addons.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb     | 1 -
 .../recipes-core/packagegroups/packagegroup-arago-test-addons.bb       | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
index 6ddebe1..d0c3f54 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
@@ -12,7 +12,6 @@ IMAGE_INSTALL += "\
     packagegroup-arago-base-tisdk-server-extra \
     packagegroup-arago-test \
     packagegroup-arago-test-addons \
-    gdb \
 "
 
 BAD_RECOMMENDATIONS += " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index 9131a37..35d9c96 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install additional utilities/demos for test image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r5"
+PR = "r6"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -12,7 +12,6 @@ TEST_ADDONS = " \
     linuxptp \
     openntpd \
     strongswan \
-    gdb \
     "
 
 TEST_ADDONS_TI = " \
-- 
1.9.1


