Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTPS id 9EC1852ABB
	for <meta-arago@arago-project.org>;
	Tue,  3 May 2016 18:41:41 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.155])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6M005JU6KMIM10@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 03 May 2016 13:41:10 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=i+tV1o3iWEoTTvx3QNPGxA==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=BN1Y_I30iAO_SwW2KI0A:9
Received: by 100.15.86.14 with SMTP id 0cd75654; Tue, 03 May 2016 18:41:10 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0D475161FCE;	Tue,
	3 May 2016 14:41:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 03 May 2016 14:41:09 -0400
Message-id: <1462300869-29770-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago.conf: don't disable sysvinit distro feature to get old initscripts
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
X-List-Received-Date: Tue, 03 May 2016 18:41:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Not all sysvinit initscripts have been converted to systemd units, so in
order to still get them packaged, we need sysvinit distro feature enabled.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 0d35afe..6c92514 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -30,7 +30,7 @@ DISTRO_FEATURES = "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
 
 # Remove some unwanted features
 DISTRO_FEATURES_remove = "x11"
-DISTRO_FEATURES_BACKFILL_CONSIDERED = "bluez5 sysvinit"
+DISTRO_FEATURES_BACKFILL_CONSIDERED = "bluez5"
 
 # Add additional distro features
 DISTRO_FEATURES_append = " pam wayland opengl systemd"
-- 
2.2.0


