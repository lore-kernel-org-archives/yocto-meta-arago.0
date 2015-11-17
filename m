Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 192AD52976
	for <meta-arago@arago-project.org>;
	Tue, 17 Nov 2015 06:27:03 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NXY0088D4KLRQ50@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 17 Nov 2015 00:26:45 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=pRKgWKOXhPrAVY49P3cA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 02F99161D25;	Tue,
	17 Nov 2015 01:26:45 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 17 Nov 2015 01:26:44 -0500
Message-id: <1447741604-8825-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago.conf: bump distro version
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
X-List-Received-Date: Tue, 17 Nov 2015 06:27:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index c7a2909..14af8c4 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -1,6 +1,6 @@
 # Name and version of the distribution
 DISTRO_NAME = "Arago"
-DISTRO_VERSION = "2015.09"
+DISTRO_VERSION = "2015.11"
 DISTRO_FEED_URI ?= "http://gtautoftp.gt.design.ti.com"
 FEEDURIPREFIX ?= "lcpd/core-sdk/nightly/deploy/ipk/"
 
-- 
2.2.0


