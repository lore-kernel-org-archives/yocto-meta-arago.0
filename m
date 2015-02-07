Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1E7C952093
	for <meta-arago@arago-project.org>;
	Sat,  7 Feb 2015 23:53:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t17NrDjW004125
	for <meta-arago@arago-project.org>; Sat, 7 Feb 2015 17:53:13 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t17NrBtG015505
	for <meta-arago@arago-project.org>; Sat, 7 Feb 2015 17:53:12 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Sat, 7 Feb 2015 17:53:11 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t17NrAhv008118;	Sat, 7 Feb 2015 17:53:11 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t17NqxIh010769;	Sun, 8 Feb 2015 05:23:09 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 7 Feb 2015 17:52:56 -0600
Message-ID: <1423353177-8325-8-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1423353177-8325-1-git-send-email-fcooper@ti.com>
References: <1423353177-8325-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 8/9] packagegroup-arago-tisdk-amsdk-sdk-host: Remove pinmux tool and oe layer setup
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
X-List-Received-Date: Sat, 07 Feb 2015 23:53:14 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* New pinmux utility will be used going forward and it won't be bundled with the
  SDK.
* Also remove oe-layer-setup script since no one really updates it for it to be
  accurate within the SDK. Plus all documentation will simply tell users to
  clone it from the git repository.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 5f021d3..514ccd5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r18"
+PR = "r19"
 
 inherit packagegroup
 
@@ -11,7 +11,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 U-BOOT_SRC = "${PREFERRED_PROVIDER_virtual/bootloader}-src"
 KERNEL_SRC = "${PREFERRED_PROVIDER_virtual/kernel}-src"
 
-TOOLS = "pinmux-utility"
+TOOLS = ""
 TOOLS_omap-a15 = ""
 TOOLS_ti43x = ""
 TOOLS_keystone = ""
@@ -27,7 +27,6 @@ RDEPENDS_${PN} = "\
     ${TOOLS} \
     ti-tisdk-setup \
     ${EXTRA_FILES} \
-    oe-layersetup-src \
     ti-tisdk-makefile \
     ${U-BOOT_SRC} \
     ${KERNEL_SRC} \
-- 
1.7.9.5


