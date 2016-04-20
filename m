Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 1019452A5B
	for <meta-arago@arago-project.org>;
	Wed, 20 Apr 2016 19:33:47 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.152])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y002DL6BXH090@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 Apr 2016 14:33:34 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=e5mUnYsNAAAA:8
	a=5bmTNTjk3WUXKG1Vrx0A:9
Received: by 100.15.86.14 with SMTP id 5d6cfaa6; Wed, 20 Apr 2016 19:33:34 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BD26F161FBA;	Wed,
	20 Apr 2016 15:33:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 Apr 2016 15:33:16 -0400
Message-id: <1461180805-25733-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1461180805-25733-1-git-send-email-denis@denix.org>
References: <1461180805-25733-1-git-send-email-denis@denix.org>
Subject: [PATCH 07/16] libevdev: available from oe-core, drop locally
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
 .../recipes-devtools/libevdev/libevdev_git.bb            | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/libevdev/libevdev_git.bb

diff --git a/meta-arago-extras/recipes-devtools/libevdev/libevdev_git.bb b/meta-arago-extras/recipes-devtools/libevdev/libevdev_git.bb
deleted file mode 100644
index 508beb3..0000000
--- a/meta-arago-extras/recipes-devtools/libevdev/libevdev_git.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "libevdev is a wrapper library for evdev devices"
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libevdev/"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb"
-
-inherit autotools pkgconfig
-
-PR = "r0"
-
-BRANCH = "master"
-SRCREV = "a5f150ef57a1a5c67e94163f6f5a60687049413f"
-PV = "1.2.99.901"
-SRC_URI = "git://anongit.freedesktop.org/libevdev;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-- 
2.2.0


