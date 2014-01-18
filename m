Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C29A9529A5
	for <meta-arago@arago-project.org>;
	Sat, 18 Jan 2014 00:01:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0I01jGg027928
	for <meta-arago@arago-project.org>; Fri, 17 Jan 2014 18:01:45 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0I01inU028855
	for <meta-arago@arago-project.org>; Fri, 17 Jan 2014 18:01:45 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 17 Jan 2014 18:01:44 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0I01f7o024292;
	Fri, 17 Jan 2014 18:01:43 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 17 Jan 2014 19:23:32 -0600
Message-ID: <1390008213-5559-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/2] arago-prefs.inc: Use the latest Graphics SDK
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
X-List-Received-Date: Sat, 18 Jan 2014 00:01:46 -0000
Content-Type: text/plain

* Older OMAP3 based devices may be stuck with an older version of the Graphics
  SDK but all other devices should use the latest and greatest.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index f6daeae..d5176fd 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -15,14 +15,8 @@ PREFERRED_VERSION_nativesdk-qt4-tools = "4.8.4"
 PREFERRED_VERSION_linux-libc-headers = "3.8"
 
 # Use v4.09.00.01 of the Graphics SDK
-PREFERRED_VERSION_omap3-sgx-modules = "4.09.00.01"
-PREFERRED_VERSION_libgles-omap3 = "4.09.00.01"
-
-# Use v5.00.00.01 of the Graphics SDK
-PREFERRED_VERSION_omap3-sgx-modules_ti33x = "5.00.00.01"
-PREFERRED_VERSION_omap3-sgx-modules_ti43x = "5.00.00.01"
-PREFERRED_VERSION_libgles-omap3_ti43x = "5.00.00.01"
-PREFERRED_VERSION_libgles-omap3_ti33x = "5.00.00.01"
+PREFERRED_VERSION_omap3-sgx-modules_omap3 = "4.09.00.01"
+PREFERRED_VERSION_libgles-omap3_omap3 = "4.09.00.01"
 
 PREFERRED_PROVIDER_omap3-sgx-modules = "omap3-sgx-modules"
 PREFERRED_PROVIDER_libgles-omap3 = "libgles-omap3"
-- 
1.7.0.4


