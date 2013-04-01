Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id F14E252A39
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 16:25:39 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31GPbcb026633
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 11:25:38 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31GPbTt024358
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 21:55:37 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 1 Apr 2013 21:55:37 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31GPTU3024449;
	Mon, 1 Apr 2013 21:55:36 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Apr 2013 11:25:27 -0500
Message-ID: <1364833527-8440-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1364833527-8440-1-git-send-email-Chase.Maupin@ti.com>
References: <1364833527-8440-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] arago-prefs: make the ti staging kernel and bootloader default
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
X-List-Received-Date: Mon, 01 Apr 2013 16:25:40 -0000
Content-Type: text/plain

* Make the ti-staging kernel and bootloader the defaults for
  arago based distributions.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 7a0cc24..d858a52 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -15,11 +15,9 @@ ARAGO_QT_PROVIDER = "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gle
 PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
 
 # Use the SDK supported kernel and kernel version
-PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-am335x"
-PREFERRED_VERSION_linux-am335x = "3.2.0-psp05.06.00.00"
-PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-am33x"
-PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-am33x"
-PREFERRED_VERSION_u-boot-am33x = "2012.10"
+PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
 
 PREFERRED_PROVIDER_virtual/kernel_am180x-evm = "linux-omapl138-psp"
 PREFERRED_VERSION_linux-omapl138-psp = "2.6.37"
-- 
1.7.0.4


