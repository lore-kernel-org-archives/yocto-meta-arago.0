Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 2AC2352961
	for <meta-arago@arago-project.org>;
	Tue, 28 Nov 2017 21:37:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vASLbWq9003145
	for <meta-arago@arago-project.org>; Tue, 28 Nov 2017 15:37:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1511905052;
	bh=ff95yBAjfs7DI7K/6FsFVdC2ksEV+hLv8Xo0BZlti+s=;
	h=From:To:CC:Subject:Date;
	b=HTMFsDN+A8T5pkdPks/6mOwtz6GIyYyVpVtkgyca1ccMlMmZcdd+hvg6PJhlc1dn0
	EJADp/C9aRu7bVOYSm/Rky+8g3rZKn/ZZ86fAb2n8GWUd9QDlmtvfjkKY94FLNSh7e
	XbjfJrlyr2d5lorMU4yhp7ceQ6mqT2ka2YSmdR9E=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vASLbWrB006893
	for <meta-arago@arago-project.org>; Tue, 28 Nov 2017 15:37:32 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 28 Nov 2017 15:37:31 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 28 Nov 2017 15:37:31 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vASLbVGF014569;
	Tue, 28 Nov 2017 15:37:31 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Nov 2017 16:37:30 -0500
Message-ID: <1511905050-19303-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH v2] linux-ti-staging*: add cmem memory carveout via device tree for am574x
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
X-List-Received-Date: Tue, 28 Nov 2017 21:37:33 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
v2 changes: 
Instead of copying and modifying cmem.inc, add the necessary variables
to enable cmem memory carveout for am574x in kernel bbappend files.


 recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend | 5 ++++-
 recipes-kernel/linux/linux-ti-staging_4.9.bbappend    | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend
index 2067fd6..9e92aae 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk10"
+PR_append = ".tisdk11"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:${THISDIR}/files:"
 
@@ -19,5 +19,8 @@ KERNEL_DEVICETREE_append_am57xx-evm = " \
     am572x-idk-lcd-osd101t2587-jh.dtb \
 "
 
+CMEM_MACHINE_am57xx-evm = "am571x am572x am574x"
+CMEM_DEVICETREE_am574x = "am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb"
+
 RDEPENDS_kernel-base_append_am57xx-evm = " pruhsr-fw pruprp-fw"
 RDEPENDS_kernel-base_append_keystone = " netcp-sa-fw"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bbappend b/recipes-kernel/linux/linux-ti-staging_4.9.bbappend
index 32d20e6..38c7a8d 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bbappend
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk10"
+PR_append = ".tisdk11"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:${THISDIR}/files:"
 
@@ -19,5 +19,8 @@ KERNEL_DEVICETREE_append_am57xx-evm = " \
     am572x-idk-lcd-osd101t2587-jh.dtb \
 "
 
+CMEM_MACHINE_am57xx-evm = "am571x am572x am574x"
+CMEM_DEVICETREE_am574x = "am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb"
+
 RDEPENDS_kernel-base_append_am57xx-evm = " pruhsr-fw pruprp-fw"
 RDEPENDS_kernel-base_append_keystone = " netcp-sa-fw"
-- 
1.9.1


