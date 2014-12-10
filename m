Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id B68BA529DD
	for <meta-arago@arago-project.org>;
	Wed, 10 Dec 2014 03:50:47 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NGC00LNELBZFSF0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 09 Dec 2014 21:50:24 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=bOKh+06c c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=A92cGCtB03wA:10
	a=sozttTNsAAAA:8	a=IMDOysM4zu81-RDrYXoA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CD87520086;	Tue,
	9 Dec 2014 22:50:23 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 09 Dec 2014 22:50:23 -0500
Message-id: <1418183423-18863-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH] arago.conf: bump version, update qt
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
X-List-Received-Date: Wed, 10 Dec 2014 03:50:47 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 5965ceb..70072d7 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -1,6 +1,6 @@
 # Name and version of the distribution
 DISTRO_NAME = "Arago"
-DISTRO_VERSION = "2014.10"
+DISTRO_VERSION = "2014.12"
 
 # SDK paths and names
 SDK_NAME_PREFIX = "arago"
@@ -24,7 +24,7 @@ DISTRO_FEATURES += "pam"
 
 # Set preferred Qt version
 QT_PROVIDER = "qt5"
-QT5_VERSION = "5.3.99+5.4.0-beta1+git%"
+QT5_VERSION = "5.3.99+5.4.0-%"
 
 # Distro-specific package configuration
 # Weston - use fbdev compositor and provide launcher
-- 
2.1.2


