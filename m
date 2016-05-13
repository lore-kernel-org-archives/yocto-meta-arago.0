Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 61E8152092
	for <meta-arago@arago-project.org>;
	Fri, 13 May 2016 19:30:37 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O7400JC3RILSJ30@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 13 May 2016 14:30:22 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=hPB188JXhM0RP_5nJEYA:9
Received: by 100.15.86.14 with SMTP id 3fb3d098; Fri, 13 May 2016 19:30:22 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B1060161FF9;	Fri,
	13 May 2016 15:30:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 13 May 2016 15:30:17 -0400
Message-id: <1463167817-30049-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [fido][PATCH] libgbm: drop locally, moved to meta-ti
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
X-List-Received-Date: Fri, 13 May 2016 19:30:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-graphics/gbm/libgbm_10.0.0.bb | 17 -----------------
 meta-arago-extras/recipes-graphics/gbm/libgbm_9.0.0.bb  | 13 -------------
 2 files changed, 30 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/gbm/libgbm_10.0.0.bb
 delete mode 100644 meta-arago-extras/recipes-graphics/gbm/libgbm_9.0.0.bb

diff --git a/meta-arago-extras/recipes-graphics/gbm/libgbm_10.0.0.bb b/meta-arago-extras/recipes-graphics/gbm/libgbm_10.0.0.bb
deleted file mode 100644
index 303f245..0000000
--- a/meta-arago-extras/recipes-graphics/gbm/libgbm_10.0.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Userspace interface for the kernel GBM services."
-HOMEPAGE = "http://git.ti.com"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://gbm.c;beginline=1;endline=26;md5=b871c7f2f477df29ee4c0ec437b187f7"
-DEPENDS = "libdrm"
-
-inherit autotools pkgconfig
-
-BRANCH = "next"
-
-SRCREV = "96f37555c7e82a417b02051661377b10e6b3966e"
-
-SRC_URI = "git://git.ti.com/glsdk/libgbm.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-PR = "r0"
diff --git a/meta-arago-extras/recipes-graphics/gbm/libgbm_9.0.0.bb b/meta-arago-extras/recipes-graphics/gbm/libgbm_9.0.0.bb
deleted file mode 100644
index 3905738..0000000
--- a/meta-arago-extras/recipes-graphics/gbm/libgbm_9.0.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Userspace interface for the kernel GBM services."
-HOMEPAGE = "http://git.ti.com"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://gbm.c;beginline=1;endline=26;md5=b871c7f2f477df29ee4c0ec437b187f7"
-DEPENDS = "libdrm"
-
-inherit autotools pkgconfig
-
-SRCREV = "cb86a2f2cecd41023bf1bf12fbcf11be11220f31"
-
-SRC_URI = "git://git.ti.com/glsdk/libgbm.git;protocol=git"
-
-S = "${WORKDIR}/git"
-- 
2.2.0


