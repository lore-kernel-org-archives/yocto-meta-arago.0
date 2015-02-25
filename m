Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4DB71529CB
	for <meta-arago@arago-project.org>;
	Wed, 25 Feb 2015 21:05:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1PL5cO2029832
	for <meta-arago@arago-project.org>; Wed, 25 Feb 2015 15:05:38 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1PL5bD0011668
	for <meta-arago@arago-project.org>; Wed, 25 Feb 2015 15:05:37 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Feb 2015 15:05:37 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1PL5a5r024762;	Wed, 25 Feb 2015 15:05:37 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Feb 2015 16:05:35 -0500
Message-ID: <1424898335-24940-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] branding-mcsdk: Add opengl to mcsdk DISTRO_FEATURES
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
X-List-Received-Date: Wed, 25 Feb 2015 21:05:39 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../conf/distro/include/branding-mcsdk.inc         |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
index 9fca5af..238b803 100644
--- a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
@@ -3,7 +3,7 @@
 # Use the MCSDK supported versions
 PREFERRED_VERSION_libnl = "3.2.24"
 
-DISTRO_FEATURES += "x11"
+DISTRO_FEATURES += "x11 opengl"
 
 # Java preferences.
 PREFERRED_VERSION_icedtea7-native = "2.1.3"
-- 
1.7.9.5


