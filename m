Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 72B1F52AD0
	for <meta-arago@arago-project.org>;
	Tue, 30 Jan 2018 17:58:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0UHwQU6005822
	for <meta-arago@arago-project.org>; Tue, 30 Jan 2018 11:58:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1517335106;
	bh=o9nINPrRud0NN3ocmE82q6dYoowPs7EDsfQThT+k8s4=;
	h=From:To:CC:Subject:Date;
	b=e+8bcQLXjB1VB5wprPu80lAjHojTmMBtwBHWhYpXRQWGZOAuxknPxyItLQRGB8idn
	35Bat5y+ugvJHLEUOVPffr9Lu8/OGB4VcYesFVoYQI6Bp+tvvYBvXwrpXG9yOT67oH
	V6c8GZ9/lRz95PojasEfP1X7Vwhyo5M5FZ9pHU6I=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0UHwQZh023931
	for <meta-arago@arago-project.org>; Tue, 30 Jan 2018 11:58:26 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 30 Jan 2018 11:58:26 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 30 Jan 2018 11:58:26 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0UHwPSd011266;
	Tue, 30 Jan 2018 11:58:25 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 30 Jan 2018 12:58:21 -0500
Message-ID: <1517335101-10299-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] linux-ti-staging*: add am574x-idk-jailhouse.dtb to KERNEL_DEVICETREE
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
X-List-Received-Date: Tue, 30 Jan 2018 17:58:57 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend | 3 ++-
 recipes-kernel/linux/linux-ti-staging_4.9.bbappend    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend
index 039752b..f65e25f 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk18"
+PR_append = ".tisdk19"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:${THISDIR}/files:"
 
@@ -17,6 +17,7 @@ KERNEL_DEVICETREE_append_am57xx-evm = " \
     am572x-idk-jailhouse.dtb \
     am572x-idk-lcd-osd101t2045-jh.dtb \
     am572x-idk-lcd-osd101t2587-jh.dtb \
+    am574x-idk-jailhouse.dtb \
 "
 
 RDEPENDS_kernel-base_append_am57xx-evm = " pruhsr-fw pruprp-fw"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bbappend b/recipes-kernel/linux/linux-ti-staging_4.9.bbappend
index e97d7c3..c361547 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bbappend
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk18"
+PR_append = ".tisdk19"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:${THISDIR}/files:"
 
@@ -17,6 +17,7 @@ KERNEL_DEVICETREE_append_am57xx-evm = " \
     am572x-idk-jailhouse.dtb \
     am572x-idk-lcd-osd101t2045-jh.dtb \
     am572x-idk-lcd-osd101t2587-jh.dtb \
+    am574x-idk-jailhouse.dtb \
 "
 
 RDEPENDS_kernel-base_append_am57xx-evm = " pruhsr-fw pruprp-fw"
-- 
1.9.1


