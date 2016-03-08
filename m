Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTPS id A712A52AF3
	for <meta-arago@arago-project.org>;
	Tue,  8 Mar 2016 01:26:11 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.148])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O3P008WE5B1EG20@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 07 Mar 2016 19:25:50 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=pRKgWKOXhPrAVY49P3cA:9
Received: by 100.15.86.14 with SMTP id 21e57955; Tue, 08 Mar 2016 01:25:50 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 78194161EF9;	Mon,
	7 Mar 2016 20:25:49 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 07 Mar 2016 20:25:49 -0500
Message-id: <1457400349-32292-1-git-send-email-denis@denix.org>
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
X-List-Received-Date: Tue, 08 Mar 2016 01:26:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 0c40ad1..d175de3 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -1,6 +1,6 @@
 # Name and version of the distribution
 DISTRO_NAME = "Arago"
-DISTRO_VERSION = "2016.02"
+DISTRO_VERSION = "2016.03"
 DISTRO_FEED_URI ?= "http://gtautoftp.gt.design.ti.com"
 FEEDURIPREFIX ?= "lcpd/core-sdk/nightly/deploy/ipk/"
 
-- 
2.2.0


