Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 58BB852ADB
	for <meta-arago@arago-project.org>;
	Fri, 13 Jun 2014 22:02:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5DM2JZF027398
	for <meta-arago@arago-project.org>; Fri, 13 Jun 2014 17:02:19 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5DM2JBE022806
	for <meta-arago@arago-project.org>; Fri, 13 Jun 2014 17:02:19 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Jun 2014 17:02:18 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s5DM2Dfo009769;	Fri, 13 Jun 2014 17:02:17 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Jun 2014 17:02:08 -0500
Message-ID: <1402696932-21888-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1402696932-21888-1-git-send-email-Chase.Maupin@ti.com>
References: <1402696932-21888-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] branding-amsdk: set u-boot preferred provider
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
X-List-Received-Date: Fri, 13 Jun 2014 22:02:21 -0000
Content-Type: text/plain

* Set the u-boot PREFERRED_PROVIDER to u-boot-ti-staging since
  this is the current default of arago, but that default is
  going to change to the u-boot mainline.  The AMSDK will
  generally release from the u-boot-ti-staging tree so keep the
  default for this SDK pointed there.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../conf/distro/include/branding-amsdk.inc         |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
index d8ae307..11634a8 100644
--- a/meta-arago-distro/conf/distro/include/branding-amsdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
@@ -6,9 +6,12 @@ PREFERRED_VERSION_linux-am335x-psp = "3.2"
 PREFERRED_VERSION_linux-libc-headers_am335x-evm = "3.2"
 
 PREFERRED_PROVIDER_ltp-ddt_am335x-evm = "ltp-ddt-legacy"
-PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-am33x"
-PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-am33x"
-PREFERRED_VERSION_u-boot-am33x = "2013.01.01"
+
+PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
+
+PREFERRED_PROVIDER_virtual/bootloader_am437x-evm = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
 
 # Use v4.09.00.01 of the Graphics SDK
 PREFERRED_VERSION_omap3-sgx-modules = "4.09.00.01"
-- 
1.7.9.5


