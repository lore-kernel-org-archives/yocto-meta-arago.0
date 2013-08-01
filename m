Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 43C2752A38
	for <meta-arago@arago-project.org>;
	Thu,  1 Aug 2013 00:07:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7107FbZ002106
	for <meta-arago@arago-project.org>; Wed, 31 Jul 2013 19:07:15 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7107FDt010103
	for <meta-arago@arago-project.org>; Wed, 31 Jul 2013 19:07:15 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 31 Jul 2013 19:07:15 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r71079R8032028;
	Wed, 31 Jul 2013 19:07:13 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 31 Jul 2013 19:31:47 -0500
Message-ID: <1375317112-1690-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1375317112-1690-1-git-send-email-fcooper@ti.com>
References: <1375317112-1690-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [master & danny][PATCH 2/7] arago.conf: Set machines to use linux-libc-headers version 2.6.33
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
X-List-Received-Date: Thu, 01 Aug 2013 00:07:16 -0000
Content-Type: text/plain

* Set machines to use linux-libc-headers version 2.6.33 if they are using
  an older kernel.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 42bb769..eec8115 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -22,6 +22,7 @@ PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
 
+PREFERRED_VERSION_linux-libc-headers_am180x-evm = "2.6.33"
 PREFERRED_PROVIDER_virtual/kernel_am180x-evm = "linux-omapl138-psp"
 PREFERRED_VERSION_linux-omapl138-psp = "2.6.37"
 PREFERRED_PROVIDER_ltp-ddt_am180x-evm = "ltp-ddt-legacy"
@@ -29,6 +30,7 @@ PREFERRED_PROVIDER_virtual/bootloader_am180x-evm = "u-boot-am180x"
 PREFERRED_PROVIDER_u-boot_am180x-evm = "u-boot-am180x"
 PREFERRED_VERSION_u-boot-am180x = "2010.12"
 
+PREFERRED_VERSION_linux-libc-headers_am37x-evm = "2.6.33"
 PREFERRED_PROVIDER_virtual/kernel_am37x-evm = "linux-omap-psp"
 PREFERRED_VERSION_linux-omap-psp = "2.6.37"
 PREFERRED_PROVIDER_ltp-ddt_am37x-evm = "ltp-ddt-legacy"
@@ -36,6 +38,7 @@ PREFERRED_PROVIDER_virtual/bootloader_am37x-evm = "u-boot-am37x"
 PREFERRED_PROVIDER_u-boot_am37x-evm = "u-boot-am37x"
 PREFERRED_VERSION_u-boot-am37x_am37x-evm = "2012.04.01"
 
+PREFERRED_VERSION_linux-libc-headers_am3517-evm = "2.6.33"
 PREFERRED_PROVIDER_virtual/kernel_am3517-evm = "linux-omap-psp"
 PREFERRED_VERSION_linux-omap-psp_am3517-evm = "2.6.37"
 PREFERRED_PROVIDER_ltp-ddt_am3517-evm = "ltp-ddt-legacy"
-- 
1.7.0.4


