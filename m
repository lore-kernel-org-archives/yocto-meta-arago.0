Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BB7E05298D
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2013 17:00:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62H0sKa032188
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 12:00:54 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62H0s9S023545
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 12:00:54 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 2 Jul 2013 12:00:53 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r62H0ooA021236;
	Tue, 2 Jul 2013 12:00:52 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Jul 2013 12:15:49 -0500
Message-ID: <1372785354-1920-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [master & danny][PATCH 1/6] u-boot-am33x: Update to latest u-boot versoin for 3.2 kernel
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
X-List-Received-Date: Tue, 02 Jul 2013 17:00:59 -0000
Content-Type: text/plain

* Update to latest u-boot included in AMSDK 6.0.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../u-boot/u-boot-am33x_2013.01.01.bbappend        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bbappend
index e62018b..d849fb5 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bbappend
@@ -1,5 +1,5 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 # PSPREL and UVER are used by arago-source-ipk.conf
-PSPREL = "05.07.00.00"
+PSPREL = "06.00.00.00"
 UVER = "2013.01.01"
-- 
1.7.0.4


