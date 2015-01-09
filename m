Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id B3A4152A09
	for <meta-arago@arago-project.org>;
	Fri,  9 Jan 2015 18:58:53 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NHX006GGBE034A0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 09 Jan 2015 12:58:48 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=b6gFOWC0 c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10
	a=sozttTNsAAAA:8	a=OPodzSFVYTQ3z0U48DIA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0595D20154;	Fri,
	9 Jan 2015 13:58:48 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 09 Jan 2015 13:58:47 -0500
Message-id: <1420829927-28218-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] libgbm: remove COMPATIBLE_MACHINE line
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
X-List-Received-Date: Fri, 09 Jan 2015 18:58:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-graphics/gbm/libgbm_9.0.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/gbm/libgbm_9.0.0.bb b/meta-arago-extras/recipes-graphics/gbm/libgbm_9.0.0.bb
index 8b20dbb..3905738 100644
--- a/meta-arago-extras/recipes-graphics/gbm/libgbm_9.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/gbm/libgbm_9.0.0.bb
@@ -4,8 +4,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://gbm.c;beginline=1;endline=26;md5=b871c7f2f477df29ee4c0ec437b187f7"
 DEPENDS = "libdrm"
 
-COMPATIBLE_MACHINE = "omap-a15"
-
 inherit autotools pkgconfig
 
 SRCREV = "cb86a2f2cecd41023bf1bf12fbcf11be11220f31"
-- 
2.2.0


