Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 9717852A7D
	for <meta-arago@arago-project.org>;
	Mon, 10 Aug 2015 19:46:11 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSV009AVTKEQXB0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 10 Aug 2015 14:45:51 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=q4hFtEO_7M6LmI5-h-0A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C71BC161B6B;	Mon,
	10 Aug 2015 15:45:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 10 Aug 2015 15:45:50 -0400
Message-id: <1439235950-25851-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [master/fido][PATCH] hostap-daemon-wl18xx: update license checksum
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
X-List-Received-Date: Mon, 10 Aug 2015 19:46:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
index bcd3c9f..0348cb0 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
@@ -4,7 +4,7 @@
 require hostap.inc
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=36b27801447e0662ee0138d17fe93880"
 
 PR_append = "d"
 
-- 
2.2.0


