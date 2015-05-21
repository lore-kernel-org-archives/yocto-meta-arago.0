Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id C655C5297F
	for <meta-arago@arago-project.org>;
	Thu, 21 May 2015 01:57:19 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NOO00IPUG33UN81@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 May 2015 20:57:04 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=B/MOC1ok c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=r9wjbc810bVpXJD6548A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6B9E4200F0;	Wed,
	20 May 2015 21:57:03 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 May 2015 21:56:59 -0400
Message-id: <1432173422-9519-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1432173422-9519-1-git-send-email-denis@denix.org>
References: <1432173422-9519-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/5] arago-prefs: eglibc-2.19 is not fetchable from Linaro, use upstream
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
X-List-Received-Date: Thu, 21 May 2015 01:57:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 4f2c854..aa7814e 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -2,7 +2,7 @@
 # Cross and SDK toolchain preferences are set in toolchain-*.inc files
 GCCVERSION ?= "linaro-4.7%"
 BINUVERSION ?= "linaro-2.24%"
-EGLIBCVERSION ?= "linaro-2.19%"
+EGLIBCVERSION ?= "2.19%"
 EGLIBCINITVERSION ?= "2.19%"
 LINUXLIBCVERSION ?= "3.14"
 
-- 
2.2.0


