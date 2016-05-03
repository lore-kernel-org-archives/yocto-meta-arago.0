Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTPS id 364D7529A4
	for <meta-arago@arago-project.org>;
	Tue,  3 May 2016 00:09:51 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6K00KKFR3ZBA50@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 May 2016 19:09:36 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=1KZm-vpw7oycfJLtQi0A:9
Received: by 100.15.86.14 with SMTP id 776cab3a; Tue, 03 May 2016 00:09:36 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9049B161FD2;	Mon,
	2 May 2016 20:09:35 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 02 May 2016 20:09:34 -0400
Message-id: <1462234175-16230-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] packagegroup: remove unused file
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
X-List-Received-Date: Tue, 03 May 2016 00:09:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-linaro-tc-test.bb   | 25 ----------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc-test.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc-test.bb
deleted file mode 100644
index 68e7ab0..0000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc-test.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "Group of packages to build with Linaro toolchain for testing"
-LICENSE = "MIT"
-
-PR = "r1"
-
-inherit packagegroup
-
-RDEPENDS_${PN} = "\
-    virtual/kernel \
-    u-boot \
-    busybox \
-    bash \
-    coreutils \
-    apache \
-    ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland weston', '', d)} \
-    gstreamer \
-    openssl \
-    openssh \
-    perl \
-    python \
-    php \
-    qt4-embedded \
-    qtbase \
-    qtwebkit \
-    "
-- 
2.2.0


