Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86686C04A6A
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 00:20:43 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.22561.1690503636922902846
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Jul 2023 17:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bhdM7YO/;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36S0KYQF025652;
	Thu, 27 Jul 2023 19:20:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1690503634;
	bh=75D6mru8juS/+On8oniJonsJTfhZdP8mEGZvuWSj/wI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bhdM7YO/skRcTV80yxAaYd3bh+Td6kC3tWixImZnHF9HPJKwbMarKr0xaAzAhmhPL
	 +0fivheqFws4ihvqyGt/KXJaDx1bC7KLx5XYorlweu3V2i2anQcBHvxDe8pRP/J4Pr
	 6TV5OmMBRWXdbPkVLDrKqOaV6Gp51VAhQjBY/gq4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36S0KY8d097814
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jul 2023 19:20:34 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jul 2023 19:20:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jul 2023 19:20:34 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36S0KYfG025363;
	Thu, 27 Jul 2023 19:20:34 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <afd@ti.com>, <nm@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Randolph
 Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH 4/5] packagegroup-arago-boot: add a new group for all-around useful packages
Date: Thu, 27 Jul 2023 19:20:31 -0500
Message-ID: <20230728002032.853330-5-rs@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728002032.853330-1-rs@ti.com>
References: <20230728002032.853330-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Jul 2023 00:20:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14813

From: Randolph Sapp <rs@ti.com>

Add a new package group for performance or QoL tools that all images
should inherit and add the first example of a package that should belong
here.

Irqbalance is a good example. It helps reduce irq response delays on
most if not all of our platforms and is only problematic for users
attempting to reduce jitter specifically through the use of irq pinning,
in which case it can be easily disabled.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-core/images/arago-image.inc         |  1 +
 .../packagegroups/packagegroup-arago-boot.bb    | 17 +++++++++++++++++
 .../packagegroup-arago-tisdk-addons.bb          |  1 -
 3 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-boot.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index d00c1f70..0421dca3 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -11,6 +11,7 @@ EXTRA_IMAGECMD:ext2.gz += "-i 4096"
 
 IMAGE_INSTALL = " \
 	packagegroup-core-boot \
+	packagegroup-arago-boot \
 	${VIRTUAL-RUNTIME_initramfs} \
 	${CORE_IMAGE_EXTRA_INSTALL} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-boot.bb
new file mode 100644
index 00000000..c9b87a45
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-boot.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Tools or utilities that all images should inherit"
+DESCRIPTION = "These are packages that lead to general performance or QoL improvements on our platforms that should be inherited by all images. The idea is to keep this group as small as possible moving forward for compatibility with things like the tisdk-tiny-image build target."
+LICENSE = "MIT"
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+# packages that lead to general performance improvements
+PERFORMANCE_UTILS = " \
+    irqbalance \
+"
+
+RDEPENDS:${PN} = "\
+    ${PERFORMANCE_UTILS} \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index c678460d..a9b71fd1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -50,7 +50,6 @@ UTILS:append:omap-a15 = " mmc-utils \
 
 UTILS:append:k3 = " mmc-utils \
                     switch-config \
-                    irqbalance \
                     ti-rpmsg-char \
                     ti-rpmsg-char-examples \
                     statcol \
-- 
2.41.0


