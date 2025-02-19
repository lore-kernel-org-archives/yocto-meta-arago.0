Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9837C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 21:39:17 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.34931.1740001152737193775
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Feb 2025 13:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CTWwO04r;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51JLdAOW2084748
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 15:39:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740001150;
	bh=bleWaYdpk5JbXEWC+XeSm/+SAm0kLaOEua5w20fm5As=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CTWwO04rQ8jrIPgLYCd9cSVnhG3XXdNO4PfPqbejYHvds6WLOtXiK3gsrXum3R3Sz
	 XuqZ9LKTxzDgkWjJohiDiNZXtStaE5799MSbr6mqc9PrqP0uost+A2JcqN2wpugPqJ
	 yS+iFgmloorNVDGijk0pKUABWodCQdkzc/0mmNH4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51JLdAse023548
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Feb 2025 15:39:10 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Feb 2025 15:39:09 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Feb 2025 15:39:10 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51JLd9gs116844;
	Wed, 19 Feb 2025 15:39:09 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCHv2 3/3] meta-arago-test: dynamic layer for qt6 support
Date: Wed, 19 Feb 2025 15:39:06 -0600
Message-ID: <20250219213906.2561811-4-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219213906.2561811-1-rs@ti.com>
References: <20250219213906.2561811-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Feb 2025 21:39:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15864

From: Randolph Sapp <rs@ti.com>

Add a dynamic layer for Qt6 example applications so we can run a quick
test and see if things are configured correctly.

This is being introduced into test as opposed to the distro layer as
there will soon be automated tests for Qt6, there are no explicit
dependencies for Qt in meta-arago-distro anymore, and the example
applications are currently only necessary for testing.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/conf/layer.conf                            | 4 ++++
 .../qt6-layer/recipes-core/packagegroups/ti-test.bbappend  | 7 +++++++
 .../qt6-layer/recipes-qt/qt6/qtbase_%.bbappend             | 3 +++
 3 files changed, 14 insertions(+)
 create mode 100644 meta-arago-test/dynamic-layers/qt6-layer/recipes-core/packagegroups/ti-test.bbappend
 create mode 100644 meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend

diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer.conf
index ad939dce..0b0874fc 100644
--- a/meta-arago-test/conf/layer.conf
+++ b/meta-arago-test/conf/layer.conf
@@ -22,3 +22,7 @@ LAYERDEPENDS_meta-arago-test = " \
     filesystems-layer \
     meta-python \
 "
+
+BBFILES_DYNAMIC += " \
+    qt6-layer:${LAYERDIR}/dynamic-layers/qt6-layer/recipes*/*/*.bbappend \
+"
diff --git a/meta-arago-test/dynamic-layers/qt6-layer/recipes-core/packagegroups/ti-test.bbappend b/meta-arago-test/dynamic-layers/qt6-layer/recipes-core/packagegroups/ti-test.bbappend
new file mode 100644
index 00000000..8d1f95f7
--- /dev/null
+++ b/meta-arago-test/dynamic-layers/qt6-layer/recipes-core/packagegroups/ti-test.bbappend
@@ -0,0 +1,7 @@
+# Include the examples for Qt6 related tests
+# Include qtwayland for wayland support if the distro enables it
+
+TI_TEST_EXTRAS:append = " \
+    qtbase-examples \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland', '', d)} \
+"
diff --git a/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend b/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend
new file mode 100644
index 00000000..e2799572
--- /dev/null
+++ b/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend
@@ -0,0 +1,3 @@
+# Include the examples for Qt6 related tests
+
+PACKAGECONFIG:append = " examples"
-- 
2.48.1


