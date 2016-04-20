Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 3BD0152A81
	for <meta-arago@arago-project.org>;
	Wed, 20 Apr 2016 19:33:48 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y00AM76BXJU20@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 Apr 2016 14:33:34 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=VwQbUJbxAAAA:8
	a=M0MY8R-vP_qWGsyUNCgA:9
Received: by 100.15.86.14 with SMTP id 6a74d675; Wed, 20 Apr 2016 19:33:34 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BEC51161FBB;	Wed,
	20 Apr 2016 15:33:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 Apr 2016 15:33:17 -0400
Message-id: <1461180805-25733-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1461180805-25733-1-git-send-email-denis@denix.org>
References: <1461180805-25733-1-git-send-email-denis@denix.org>
Subject: [PATCH 08/16] mmc-utils: was upstreamed to oe-core, drop locally
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
X-List-Received-Date: Wed, 20 Apr 2016 19:33:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-devtools/mmc/mmc-utils_git.bb | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/mmc/mmc-utils_git.bb

diff --git a/meta-arago-extras/recipes-devtools/mmc/mmc-utils_git.bb b/meta-arago-extras/recipes-devtools/mmc/mmc-utils_git.bb
deleted file mode 100644
index 4747307..0000000
--- a/meta-arago-extras/recipes-devtools/mmc/mmc-utils_git.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Userspace tools for MMC/SD devices"
-HOMEPAGE = "http://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=17;md5=d7747fc87f1eb22b946ef819969503f0"
-
-BRANCH ?= "master"
-SRCREV = "11f2ceabc4ad3f0dd568e0ce68166e4803e0615b"
-
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;protocol=git;branch=${BRANCH}"
-PV = "1.0"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 mmc ${D}${bindir}
-}
-- 
2.2.0


