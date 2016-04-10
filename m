Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTPS id BB3DE52996
	for <meta-arago@arago-project.org>;
	Sun, 10 Apr 2016 22:34:32 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.154])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5F00CHBW0VWO00@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 10 Apr 2016 17:34:17 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=Ut/DdBcw22SB5hFy08yqCQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=Xn0StHyKTWdlnsvdIekA:9
Received: by 100.15.86.14 with SMTP id 5a9e2de5; Sun, 10 Apr 2016 22:34:17 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E7159161F78;	Sun,
	10 Apr 2016 18:34:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 10 Apr 2016 18:34:06 -0400
Message-id: <1460327646-2687-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] packagegroup-*-addons-sdk-target: libbz2-dev and libbz2-staticdev no longer exist
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
X-List-Received-Date: Sun, 10 Apr 2016 22:34:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 9222c06..b2a0c44 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r26"
+PR = "r27"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -16,8 +16,8 @@ UTILS_append_keystone = "\
 	binutils-staticdev \
 	elfutils-dev \
 	elfutils-staticdev \
-	libbz2-dev \
-	libbz2-staticdev \
+	bzip2-dev \
+	bzip2-staticdev \
 	boost-dev \
 	libsdl-dev \
 	"
-- 
2.2.0


