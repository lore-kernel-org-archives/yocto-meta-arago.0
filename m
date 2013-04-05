Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BA2B352A98
	for <meta-arago@arago-project.org>;
	Fri,  5 Apr 2013 18:30:54 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r35IUpk0008029
	for <meta-arago@arago-project.org>; Fri, 5 Apr 2013 13:30:52 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r35IUncs019425
	for <meta-arago@arago-project.org>; Sat, 6 Apr 2013 00:00:50 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 6 Apr 2013 00:00:49 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r35IUlrU017329;
	Sat, 6 Apr 2013 00:00:48 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 5 Apr 2013 13:30:45 -0500
Message-ID: <1365186645-29898-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] arago-prefs: update graphics preferred version
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
X-List-Received-Date: Fri, 05 Apr 2013 18:30:55 -0000
Content-Type: text/plain

* Update the preferred version of the TI graphics components to
  the version that will support the later v3.8 kernels as well.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index d858a52..853844a 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -7,8 +7,10 @@ PREFERRED_VERSION_wpa-supplicant = "2.0-devel-ti"
 PREFERRED_VERSION_hostap-daemon = "2.0-devel-ti"
 
 # Use v4.08.00.01 of the Graphics SDK
-PREFERRED_VERSION_omap3-sgx-modules = "4.08.00.01"
-PREFERRED_VERSION_libgles-omap3 = "4.08.00.01"
+#PREFERRED_VERSION_omap3-sgx-modules = "4.08.00.01"
+#PREFERRED_VERSION_libgles-omap3 = "4.08.00.01"
+PREFERRED_VERSION_omap3-sgx-modules = "4.09.00.01"
+PREFERRED_VERSION_libgles-omap3 = "4.09.00.01"
 
 ARAGO_QT_PROVIDER = "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d)}"
 
-- 
1.7.0.4


