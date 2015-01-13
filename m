Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2EF1E529DD
	for <meta-arago@arago-project.org>;
	Tue, 13 Jan 2015 21:26:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0DLQVln013336
	for <meta-arago@arago-project.org>; Tue, 13 Jan 2015 15:26:31 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0DLQVsi001346
	for <meta-arago@arago-project.org>; Tue, 13 Jan 2015 15:26:31 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 13 Jan 2015 15:26:30 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0DLQTTH011809;	Tue, 13 Jan 2015 15:26:30 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0DLQRbj027265;	Wed, 14 Jan 2015 02:56:28 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 13 Jan 2015 15:26:22 -0600
Message-ID: <1421184385-21751-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/4] branding-amsdk: Clear AMSDK branding and include Qt 4 for AM335x and AM437x
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
X-List-Received-Date: Tue, 13 Jan 2015 21:26:32 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Since SOC_FAMILY/MACHINE overrides have issues working in conf files use
  python based commands to only use Qt 5 on AM57x. All other devices (am335x and
  am437x) will  use Qt 4.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/include/branding-amsdk.inc         |   19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
index 11634a8..0d2a601 100644
--- a/meta-arago-distro/conf/distro/include/branding-amsdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
@@ -1,18 +1,3 @@
-# AM-SDK branding configuration
+require branding-core.inc
+QT_PROVIDER := "${@bb.utils.contains('SOC_FAMILY','omap-a15:dra7xx','qt5','qt4e',d)}"
 
-# Use the SDK supported kernel and kernel version
-PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-am335x-psp"
-PREFERRED_VERSION_linux-am335x-psp = "3.2"
-PREFERRED_VERSION_linux-libc-headers_am335x-evm = "3.2"
-
-PREFERRED_PROVIDER_ltp-ddt_am335x-evm = "ltp-ddt-legacy"
-
-PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
-
-PREFERRED_PROVIDER_virtual/bootloader_am437x-evm = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
-
-# Use v4.09.00.01 of the Graphics SDK
-PREFERRED_VERSION_omap3-sgx-modules = "4.09.00.01"
-PREFERRED_VERSION_libgles-omap3 = "4.09.00.01"
-- 
1.7.9.5


