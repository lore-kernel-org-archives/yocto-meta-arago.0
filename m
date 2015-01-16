Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 79039529DD
	for <meta-arago@arago-project.org>;
	Fri, 16 Jan 2015 22:49:49 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NIA0042NKQKE3V1@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 16 Jan 2015 16:49:33 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=PYxIXZlY c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10
	a=sozttTNsAAAA:8	a=Bju0OBmfPkKlRGU5-JUA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A75A7200DD;	Fri,
	16 Jan 2015 17:49:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 16 Jan 2015 17:49:27 -0500
Message-id: <1421448569-27179-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/3] ltp-ddt: set a specific commit ID
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
X-List-Received-Date: Fri, 16 Jan 2015 22:49:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
index 8e49900..43660ae 100644
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
@@ -1,9 +1,11 @@
-PR_append = "-arago9+gitr${SRCPV}"
+PR_append = "-arago10+gitr${SRCPV}"
 
 RDEPENDS_${PN} += "linaro-pm-qa-utils"
 
 SRC_URI_remove = "file://0001-KERNEL_INC-in-modern-kernel-should-point-at-toplevel.patch"
 
+SRCREV = "ee4e3d31ff7a45682cabe19d9cf645eb457325e9"
+
 EXTRA_OEMAKE += "KERNEL_PATH="${STAGING_KERNEL_DIR}""
 
 KERNEL_MODULES_META_PACKAGE = "${PN}"
-- 
2.2.0


