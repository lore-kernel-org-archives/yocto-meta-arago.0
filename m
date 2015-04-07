Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id C6277529C6
	for <meta-arago@arago-project.org>;
	Tue,  7 Apr 2015 17:54:55 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NMG00LDX72UIGB0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 07 Apr 2015 12:54:43 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=A7bb5BSD c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=e9J7MTPGsLIA:10
	a=sozttTNsAAAA:8	a=BKnvCB8l_7Tj7Oe19xwA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 28F8E200F4;	Tue,
	7 Apr 2015 13:54:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 07 Apr 2015 13:54:30 -0400
Message-id: <1428429270-29521-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] external-linaro-toolchain: clean up QA warnings due to prebuilt binaries
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
X-List-Received-Date: Tue, 07 Apr 2015 17:54:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-linaro-toolchain.bbappend         | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index 0ecbab8..de4c43c 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -1,9 +1,16 @@
 INSANE_SKIP_libstdc++-dev += "staticdev"
+INSANE_SKIP_libgcc-dev += "staticdev"
+INSANE_SKIP_libmudflap-dev += "staticdev"
+INSANE_SKIP_${PN}-dev += "staticdev"
+INSANE_SKIP_libmudflap += "ldflags"
+INSANE_SKIP_libssp += "ldflags"
+INSANE_SKIP_libgomp += "ldflags"
+INSANE_SKIP_libitm += "ldflags textrel"
 
 ALLOW_EMPTY_${PN}-utils = "1"
 ALLOW_EMPTY_ldd = "1"
 
-PR_append = "-arago8"
+PR_append = "-arago9"
 
 PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
 PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
-- 
2.2.0


