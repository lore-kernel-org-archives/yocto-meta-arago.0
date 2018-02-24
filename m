Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 3F1A652985
	for <meta-arago@arago-project.org>;
	Sat, 24 Feb 2018 03:09:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1O39C22011837
	for <meta-arago@arago-project.org>; Fri, 23 Feb 2018 21:09:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519441752;
	bh=zISq14AbOZR0ZbB9C2xm2WnJVl+XKdsd9cca6RV+Bbo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=bQQG7HLQi15ktYCxsF/yk1+Lhm49UeuBQcvnuhHIgBJEsIScBoYalshFNwTsWzyCC
	Sq9MXM0ekFpKBzE0fWYt+tIqRjLUVHaxdbT42DRVXvD5gjg2/liYdYJHmDC/g/Jniu
	nCCe4uhOLod8NQWzyWr2oCxtohGLQQlIoX/wey5M=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1O39CCr010252
	for <meta-arago@arago-project.org>; Fri, 23 Feb 2018 21:09:12 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 23 Feb 2018 21:09:11 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 23 Feb 2018 21:09:12 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1O398u7007400
	for <meta-arago@arago-project.org>; Fri, 23 Feb 2018 21:09:11 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 23 Feb 2018 22:08:45 -0500
Message-ID: <1519441725-30002-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1519441725-30002-1-git-send-email-e-ruei1@ti.com>
References: <1519441725-30002-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 2/2] linux-ti-staging*: add am571(2)x-idk-pps.dtb to KERNEL_DIVICETREE
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
X-List-Received-Date: Sat, 24 Feb 2018 03:09:41 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend | 4 +++-
 recipes-kernel/linux/linux-ti-staging_4.9.bbappend    | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend
index f65e25f..30506aa 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk19"
+PR_append = ".tisdk20"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:${THISDIR}/files:"
 
@@ -18,6 +18,8 @@ KERNEL_DEVICETREE_append_am57xx-evm = " \
     am572x-idk-lcd-osd101t2045-jh.dtb \
     am572x-idk-lcd-osd101t2587-jh.dtb \
     am574x-idk-jailhouse.dtb \
+    am571x-idk-pps.dtb \
+    am572x-idk-pps.dtb \
 "
 
 RDEPENDS_kernel-base_append_am57xx-evm = " pruhsr-fw pruprp-fw"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bbappend b/recipes-kernel/linux/linux-ti-staging_4.9.bbappend
index c361547..0555284 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bbappend
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk19"
+PR_append = ".tisdk20"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:${THISDIR}/files:"
 
@@ -18,6 +18,8 @@ KERNEL_DEVICETREE_append_am57xx-evm = " \
     am572x-idk-lcd-osd101t2045-jh.dtb \
     am572x-idk-lcd-osd101t2587-jh.dtb \
     am574x-idk-jailhouse.dtb \
+    am571x-idk-pps.dtb \
+    am572x-idk-pps.dtb \
 "
 
 RDEPENDS_kernel-base_append_am57xx-evm = " pruhsr-fw pruprp-fw"
-- 
1.9.1


