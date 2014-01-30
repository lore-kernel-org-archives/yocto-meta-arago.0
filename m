Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E4FCC52AB4
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 18:34:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UIYac7015990
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:36 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UIYZ0I002464
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:35 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 12:34:35 -0600
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0UIYJOM003617;	Thu, 30 Jan 2014 12:34:34 -0600
From: Chase Maupin <chase.maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Jan 2014 12:34:11 -0600
Message-ID: <1391106857-17112-6-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
References: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 05/11] arago-prefs: update linux-libc-headers version
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
X-List-Received-Date: Thu, 30 Jan 2014 18:34:37 -0000
Content-Type: text/plain

* Update the linux-libc-headers version to the latest 3.10

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 4b021a8..ac20985 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
 PREFERRED_VERSION_qt4-embedded = "4.8.5"
 PREFERRED_VERSION_qt4-native = "4.8.5"
 PREFERRED_VERSION_nativesdk-qt4-tools = "4.8.5"
-PREFERRED_VERSION_linux-libc-headers = "3.8"
+PREFERRED_VERSION_linux-libc-headers = "3.10"
 
 # Use v4.09.00.01 of the Graphics SDK
 PREFERRED_VERSION_omap3-sgx-modules_omap3 = "4.09.00.01"
@@ -27,12 +27,12 @@ PREFERRED_PROVIDER_virtual/libgles1 = "libgles-omap3"
 PREFERRED_PROVIDER_virtual/libgles2 = "libgles-omap3"
 
 # Use latest TI staging kernel and u-boot trees
-PREFERRED_VERSION_linux-libc-headers_am335x-evm = "3.8"
+PREFERRED_VERSION_linux-libc-headers_am335x-evm = "3.10"
 PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
 
-PREFERRED_VERSION_linux-libc-headers_am437x-evm = "3.8"
+PREFERRED_VERSION_linux-libc-headers_am437x-evm = "3.10"
 PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader_am437x-evm = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
-- 
1.7.9.5


