Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D2C5C52A0B
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2013 14:43:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAMEhMjR013291
	for <meta-arago@arago-project.org>; Fri, 22 Nov 2013 08:43:22 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMEhLSC012616
	for <meta-arago@arago-project.org>; Fri, 22 Nov 2013 08:43:22 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 22 Nov 2013 08:43:21 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMEhFBK030461;
	Fri, 22 Nov 2013 08:43:20 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Nov 2013 09:45:17 -0600
Message-ID: <1385135121-14345-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1385135121-14345-1-git-send-email-fcooper@ti.com>
References: <1385135121-14345-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/6] arago-prefs.inc Use version 05.00.00.01 of the Graphics SDK for am335 and am43x
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
X-List-Received-Date: Fri, 22 Nov 2013 14:43:23 -0000
Content-Type: text/plain

* The latest version of the Graphics SDK in meta-ti is an early alpha release
  and has only been validated on am335x and am43x.
* Until it has been properly validated across all platforms don't use this
  version by default on other platforms.
---
 .../conf/distro/include/arago-prefs.inc            |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 24f3785..7d9afe7 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -17,6 +17,13 @@ PREFERRED_VERSION_linux-libc-headers = "3.8"
 # Use v4.09.00.01 of the Graphics SDK
 PREFERRED_VERSION_omap3-sgx-modules = "4.09.00.01"
 PREFERRED_VERSION_libgles-omap3 = "4.09.00.01"
+
+# Use v5.00.00.01 of the Graphics SDK
+PREFERRED_VERSION_omap3-sgx-modules_ti33x = "5.00.00.01"
+PREFERRED_VERSION_omap3-sgx-modules_ti43x = "5.00.00.01"
+PREFERRED_VERSION_libgles-omap3_ti43x = "5.00.00.01"
+PREFERRED_VERSION_libgles-omap3_ti33x = "5.00.00.01"
+
 PREFERRED_PROVIDER_omap3-sgx-modules = "omap3-sgx-modules"
 PREFERRED_PROVIDER_libgles-omap3 = "libgles-omap3"
 PREFERRED_PROVIDER_libgles-omap3-dev = "libgles-omap3-dev"
-- 
1.7.0.4


