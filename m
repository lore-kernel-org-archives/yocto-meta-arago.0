Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id 94447529E7
	for <meta-arago@arago-project.org>;
	Wed, 20 Apr 2016 18:34:17 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y00MO63KQIHA0@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 Apr 2016 13:34:02 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=hPB188JXhM0RP_5nJEYA:9
Received: by 100.15.86.14 with SMTP id 5199aa8f; Wed, 20 Apr 2016 18:34:02 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 91E46161FB3;	Wed,
	20 Apr 2016 14:34:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 Apr 2016 14:34:01 -0400
Message-id: <1461177241-21326-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1461177241-21326-1-git-send-email-denis@denix.org>
References: <1461177241-21326-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] libgbm: drop locally, moved to meta-ti
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
X-List-Received-Date: Wed, 20 Apr 2016 18:34:17 -0000

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


