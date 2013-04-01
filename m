Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3894C52AB1
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 14:55:11 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31Et8Aq028601
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 09:55:09 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31Et89X011638
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 20:25:08 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 1 Apr 2013 20:25:08 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EsxCe020052;
	Mon, 1 Apr 2013 20:25:07 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Apr 2013 09:54:43 -0500
Message-ID: <1364828095-28755-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1364828095-28755-1-git-send-email-fcooper@ti.com>
References: <1364828095-28755-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 05/17 v2] ti-compat-wireless-wl12xx: Rename recipe
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
X-List-Received-Date: Mon, 01 Apr 2013 14:55:11 -0000
Content-Type: text/plain

* Rename recipe so that PV matches the release version of
  compat-wireless-wl12xx.
---
Version 2 changes:
None. Apart of new patchset.

 ...5.bb => ti-compat-wireless-wl12xx_r5.sp4.01.bb} |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)
 rename meta-arago-extras/recipes-bsp/ti-compat-wireless/{ti-compat-wireless-wl12xx_r5.bb => ti-compat-wireless-wl12xx_r5.sp4.01.bb} (99%)

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


