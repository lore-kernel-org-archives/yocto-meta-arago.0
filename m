Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 73C6D52987
	for <meta-arago@arago-project.org>;
	Tue, 18 Aug 2015 21:06:22 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTA00IBBQLVOT60@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 18 Aug 2015 16:06:00 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=f8ui1ZM_Kt4u0ylS2OgA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5824C161B76;	Tue,
	18 Aug 2015 17:05:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 18 Aug 2015 17:05:54 -0400
Message-id: <1439931954-21458-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [master/fido][PATCH] serialcheck: Makefile lacks clean target, suppress it from configure
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
X-List-Received-Date: Tue, 18 Aug 2015 21:06:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb b/meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
index 5f0530f..9cfb6da 100644
--- a/meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
+++ b/meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
@@ -10,6 +10,8 @@ SRC_URI_append = " file://0001-Add-option-to-enable-internal-loopback.patch \
 
 SRCREV = "63854a2d0c0129efab132ec328a75279e013fb84"
 
+CLEANBROKEN = "1"
+
 S = "${WORKDIR}/git"
 
 CFLAGS_prepend = "-Wall -Wextra -Wno-sign-compare -Wno-pointer-sign "
-- 
2.2.0


