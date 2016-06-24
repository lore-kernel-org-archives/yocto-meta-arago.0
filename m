Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 84B6F52A13
	for <meta-arago@arago-project.org>;
	Fri, 24 Jun 2016 18:47:47 +0000 (UTC)
Received: from vz-proxy-m001.mx.aol.com ([64.236.83.14])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O9A001POHJ8RA70@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 24 Jun 2016 13:47:32 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=MJxOpqxZADbEbEImuSX/mw==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=obb7yfXgMWawALIhHC0A:9
Received: by 100.15.86.14 with SMTP id 0cd27a0b; Fri, 24 Jun 2016 18:47:32 GMT
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B4AE8162030;	Fri,
	24 Jun 2016 14:47:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 24 Jun 2016 14:47:31 -0400
Message-id: <20160624184731.19217-1-denis@denix.org>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH][daisy] ltp-ddt: lock at the known good commit
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
X-List-Received-Date: Fri, 24 Jun 2016 18:47:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc     | 2 +-
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index b759469..3a8b328 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -8,4 +8,4 @@
 # Auto rev important packages to pick up latest
 SRCREV_pn-linux-ti-staging = "${AUTOREV}"
 SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
-SRCREV_pn-ltp-ddt = "${AUTOREV}"
+#SRCREV_pn-ltp-ddt = "${AUTOREV}"
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
index c9dcbb4..5fe8838 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-PR = "r4"
+PR = "r5"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -16,7 +16,7 @@ inherit autotools module-base kernel-module-split
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "aa4fe3c6f6c1cd2dc8aeabd042f2226b78c7f1bf"
+SRCREV = "bd7bc9eea597808d0b98616c657bfbf7fa7e8ee3"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-- 
2.9.0


