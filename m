Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 24E6D52A38
	for <meta-arago@arago-project.org>;
	Thu,  1 Aug 2013 00:07:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7107KBS030621
	for <meta-arago@arago-project.org>; Wed, 31 Jul 2013 19:07:20 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7107KAL010174
	for <meta-arago@arago-project.org>; Wed, 31 Jul 2013 19:07:20 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 31 Jul 2013 19:07:20 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r71079RA032028;
	Wed, 31 Jul 2013 19:07:18 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 31 Jul 2013 19:31:49 -0500
Message-ID: <1375317112-1690-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1375317112-1690-1-git-send-email-fcooper@ti.com>
References: <1375317112-1690-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [master & danny][PATCH 4/7] arago-perfs.inc: Set linux-libc-header version to 3.2 for beagleboard
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
X-List-Received-Date: Thu, 01 Aug 2013 00:07:21 -0000
Content-Type: text/plain

* Set linux-libc-header version that is compatible with the 3.3 beagleboard
  kernel.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index eec8115..f2bed55 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -48,6 +48,7 @@ PREFERRED_PROVIDER_u-boot_am3517-evm = "u-boot-am3517"
 PREFERRED_PROVIDER_virtual/kernel_beagleboard = "linux"
 PREFERRED_VERSION_linux_beagleboard = "3.3.7"
 PREFERRED_PROVIDER_ltp-ddt_beagleboard = "ltp-ddt-legacy"
+PREFERRED_VERSION_linux-libc-headers_beagleboard = "3.2"
 PREFERRED_PROVIDER_virtual/bootloader_beagleboard = "u-boot-am37x"
 PREFERRED_PROVIDER_u-boot_beagleboard = "u-boot-am37x"
 PREFERRED_VERSION_u-boot-am37x_beagleboard = "2012.04.01"
-- 
1.7.0.4


