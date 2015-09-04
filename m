Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 47875529F0
	for <meta-arago@arago-project.org>;
	Fri,  4 Sep 2015 05:04:04 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NU4000EUZEC6K71@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 04 Sep 2015 00:03:48 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=Uj4eBOPBpkZvjyhUGX8A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EEA69161BD1;	Fri,
	4 Sep 2015 01:03:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 04 Sep 2015 01:03:47 -0400
Message-id: <1441343027-4481-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] external-linaro-toolchain: keep compatible with 2015.02, where libstdc++ shared libs are missing
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
X-List-Received-Date: Fri, 04 Sep 2015 05:04:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-linaro-toolchain.bbappend             | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index 8e88506..1830d77 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -1,7 +1,10 @@
 ALLOW_EMPTY_${PN}-utils = "1"
 ALLOW_EMPTY_ldd = "1"
 
-PR_append = "-arago15"
+ALLOW_EMPTY_libstdc++ = "1"
+ALLOW_EMPTY_libgomp = "1"
+
+PR_append = "-arago16"
 
 PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
 PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
-- 
2.2.0


