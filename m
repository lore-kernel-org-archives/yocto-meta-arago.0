Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E64ED52A96
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 02:05:51 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2K25nhe023814
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 21:05:50 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25nL1022946
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 07:35:49 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Mar 2013 07:35:49 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25epI026167;
	Wed, 20 Mar 2013 07:35:48 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 21:05:26 -0500
Message-ID: <1363745138-10288-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363745138-10288-1-git-send-email-fcooper@ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 05/17] ti-compat-wireless-wl12xx: Rename recipe
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
X-List-Received-Date: Wed, 20 Mar 2013 02:05:52 -0000
Content-Type: text/plain

* Rename recipe so that PV matches the release version of
  compat-wireless-wl12xx.
---
 ...wl12xx-Decrease-number-of-TX-transactions.patch |    0
 ...5.bb => ti-compat-wireless-wl12xx_r5.sp4.01.bb} |    2 --
 2 files changed, 0 insertions(+), 2 deletions(-)
 rename meta-arago-extras/recipes-bsp/ti-compat-wireless/{files => ti-compat-wireless-wl12xx-r5.sp4.01}/0002-wl12xx-Decrease-number-of-TX-transactions.patch (100%)
 rename meta-arago-extras/recipes-bsp/ti-compat-wireless/{ti-compat-wireless-wl12xx_r5.bb => ti-compat-wireless-wl12xx_r5.sp4.01.bb} (99%)

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-wl12xx-Decrease-number-of-TX-transactions.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.sp4.01/0002-wl12xx-Decrease-number-of-TX-transactions.patch
similarity index 100%
rename from meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-wl12xx-Decrease-number-of-TX-transactions.patch
rename to meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.sp4.01/0002-wl12xx-Decrease-number-of-TX-transactions.patch
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.sp4.01.bb
similarity index 99%
rename from meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.bb
rename to meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.sp4.01.bb
index 1886e00..afbfa9c 100644
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.bb
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.sp4.01.bb
@@ -9,8 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 RDEPENDS_${PN} = "wireless-tools"
 
-PV = "r5.sp4.01"
-
 inherit module
 
 PR = "${MACHINE_KERNEL_PR}"
-- 
1.7.0.4


