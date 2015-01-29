Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B468A529A4
	for <meta-arago@arago-project.org>;
	Thu, 29 Jan 2015 22:26:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0TMQXBP028256
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 16:26:33 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0TMQWop019727
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 16:26:32 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Jan 2015 16:26:31 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0TMQQm1019749;	Thu, 29 Jan 2015 16:26:28 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 29 Jan 2015 17:26:24 -0500
Message-ID: <1422570384-13640-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] busybox: Update default configuration of busybox
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
X-List-Received-Date: Thu, 29 Jan 2015 22:26:33 -0000
Content-Type: text/plain

- Add ARP and ARPING to default configuration

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Does the PR need to be incremented for this?
---
---
 .../recipes-core/busybox/busybox/defconfig         |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index 69d7e5f..c3aa413 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -729,8 +729,8 @@ CONFIG_FEATURE_IPV6=y
 # CONFIG_FEATURE_UNIX_LOCAL is not set
 CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
 # CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
-# CONFIG_ARP is not set
-# CONFIG_ARPING is not set
+CONFIG_ARP=y
+CONFIG_ARPING=y
 CONFIG_BRCTL=y
 CONFIG_FEATURE_BRCTL_FANCY=y
 CONFIG_FEATURE_BRCTL_SHOW=y
-- 
1.7.9.5


