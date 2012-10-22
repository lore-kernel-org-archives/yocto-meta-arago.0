Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B3B5A529AA
	for <meta-arago@arago-project.org>;
	Mon, 22 Oct 2012 21:45:45 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9MLjhIA014373
	for <meta-arago@arago-project.org>; Mon, 22 Oct 2012 16:45:44 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9MLjhSP016753
	for <meta-arago@arago-project.org>;
	Tue, 23 Oct 2012 03:15:43 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 23 Oct 2012 03:15:42 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9MLjd5x027942;
	Tue, 23 Oct 2012 03:15:42 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 22 Oct 2012 16:45:37 -0500
Message-ID: <1350942337-26956-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1350942337-26956-1-git-send-email-Chase.Maupin@ti.com>
References: <1350942337-26956-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] arago-amsdk-image: Add TI AMSDK image recipe
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
X-List-Received-Date: Mon, 22 Oct 2012 21:45:46 -0000
Content-Type: text/plain

* This recipe will build a tarball image representing the TISDK
  installer contents.  This tarball can be extracted and used
  stand-alone or packaged inside of an InstallJammer installer
* This recipe will pull in target images to build as well as
  the meta toolchain image to be used.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/images/arago-amsdk-image.bb       |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-amsdk-image.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
new file mode 100644
index 0000000..82e0527
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
@@ -0,0 +1,21 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+IMAGE_FSTYPES = "tar.bz2"
+
+inherit tisdk-image
+
+COMPATIBLE_MACHINE = "omap3|omapl138|ti33x"
+
+# List of packages to remove from the host package.  This is usually due to
+# licensing issues and unneeded dependencies.
+HOST_CLEANUP_PACKAGES = ""
+TOOLCHAIN_CLEANUP_PACKAGES = ""
+
+# List of target side images to build for the SDK
+TARGET_IMAGES = "arago-base-tisdk-image"
+
+IMAGE_INSTALL = "task-arago-tisdk-addons-sdk-host"
+
+export IMAGE_BASENAME = "arago-amsdk-image"
+
-- 
1.7.0.4


