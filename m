Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id B00F65208B
	for <meta-arago@arago-project.org>;
	Wed, 17 Feb 2016 22:40:22 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.152])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O2P00LHMQXUQD10@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 17 Feb 2016 16:39:35 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=BKnvCB8l_7Tj7Oe19xwA:9
Received: by 100.15.86.14 with SMTP id 16725b9c; Wed, 17 Feb 2016 22:39:35 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0BCAE161E90;	Wed,
	17 Feb 2016 17:39:30 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 17 Feb 2016 17:39:29 -0500
Message-id: <1455748769-14277-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] external-linaro-toolchain: strip libraries and binaries normally
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
X-List-Received-Date: Wed, 17 Feb 2016 22:40:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Latest Linaro binary toolchains are now shipped unstripped,
so INHIBIT_PACKAGE_STRIP is no longer needed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-linaro-toolchain.bbappend              | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index 479a006..19e7617 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -1,10 +1,12 @@
+INHIBIT_PACKAGE_STRIP = "0"
+
 ALLOW_EMPTY_${PN}-utils = "1"
 ALLOW_EMPTY_ldd = "1"
 
 ALLOW_EMPTY_libstdc++ = "1"
 ALLOW_EMPTY_libgomp = "1"
 
-PR_append = "-arago28"
+PR_append = "-arago29"
 
 PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
 PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
-- 
2.2.0


