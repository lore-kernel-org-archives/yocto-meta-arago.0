Return-Path: <yanivma@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C7977529E3
	for <meta-arago@arago-project.org>;
	Thu, 28 Nov 2013 11:40:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rASBeefp023818
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:40:40 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rASBee6R018068
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:40:40 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 28 Nov 2013 05:40:39 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rASBecip021685;	Thu, 28 Nov 2013 05:40:39 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Nov 2013 13:38:48 +0200
Message-ID: <1385638728-12135-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 13/14] crda: Update recipe to 1.1.3 version.
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
X-List-Received-Date: Thu, 28 Nov 2013 11:40:40 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Added missing libnl3 flag.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    2 +-
 .../crda/{crda_1.1.1.bb => crda_1.1.3.bb}          |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 copy meta-arago-extras/recipes-connectivity/crda/{crda_1.1.1.bb => crda_1.1.3.bb} (97%)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 5c20a0f..e9dc865 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -85,7 +85,7 @@ PREFERRED_VERSION_readline-native = "5.2"
 PREFERRED_VERSION_readline-nativesdk = "5.2"
 
 PREFERRED_VERSION_libnl = "3.2.21"
-PREFERRED_VERSION_crda = "1.1.1"
+PREFERRED_VERSION_crda = "1.1.3"
 PREFERRED_VERSION_obex = "0.34"
 PREFERRED_VERSION_bluez4 = "4.101"
 PREFERRED_VERSION_bluez-hcidump = "2.2"
diff --git a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bb
similarity index 97%
copy from meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb
copy to meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bb
index e3880a1..9c1e0c2 100644
--- a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb
+++ b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=crda \
            http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2011.04.28-regulatory.bin;name=reg \
 "
 
-CFLAGS += " -DCONFIG_LIBNL20"
+CFLAGS += " -DCONFIG_LIBNL32"
 
 EXTRA_OEMAKE = "MAKEFLAGS="
 do_compile() {
-- 
1.7.9


