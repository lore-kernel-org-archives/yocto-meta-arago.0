Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C3EC021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 20:22:33 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.15606.1740601352231385546
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Feb 2025 12:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dQp45WaQ;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51QKMRow1567130
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 26 Feb 2025 14:22:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740601347;
	bh=RBsXEbD86ttmY46uXJuN+bI0LQtmIPd0MZ2z1N4GKdo=;
	h=From:To:CC:Subject:Date;
	b=dQp45WaQFTHYXTf6Ietrcxw/XilJsEGxkHC3ESyd1Xj6wBxTLV61n7RIgSoG3Rhc0
	 4uX1mhxzCorulKRBo+esoEPF69q6UEm2vkmHcvsRduqb0vnBRsnwyFmY4ZRbar5M2/
	 882UpUI/nOesw4rhK0p+j3N3tshDrgQ0JcyeeMLo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QKMRfl067009;
	Wed, 26 Feb 2025 14:22:27 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 14:22:26 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 14:22:26 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QKMQcR100075;
	Wed, 26 Feb 2025 14:22:26 -0600
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>, <vijayp@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] packagegroups: opencl and vulkan utilities
Date: Wed, 26 Feb 2025 14:13:34 -0600
Message-ID: <20250226201334.3807093-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 26 Feb 2025 20:22:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15921

From: Randolph Sapp <rs@ti.com>

Add package groups for OpenCL and Vulkan related utilities.
Conditionally install them in tisdk-default-image if we enable the
required distro features.

Currently these package groups consist of clinfo and vulkaninfo
respectively. These are useful tools for checking device extension
compatibility and ICD loader functionality.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-core/images/tisdk-default-image.bb      |  2 ++
 .../packagegroups/packagegroup-arago-opencl.bb      | 13 +++++++++++++
 .../packagegroups/packagegroup-arago-vulkan.bb      | 13 +++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-vulkan.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index aace490b..bc067857 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -17,6 +17,8 @@ IMAGE_INSTALL += "\
     ti-test-extras \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opencl','packagegroup-arago-opencl','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','vulkan','packagegroup-arago-vulkan','',d)} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
     packagegroup-arago-tisdk-multimedia \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl.bb
new file mode 100644
index 00000000..49b6efc8
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Group containing various useful 0penCL packages"
+LICENSE = "MIT"
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup features_check
+
+REQUIRED_DISTRO_FEATURES = "opencl"
+
+RDEPENDS:${PN} = "\
+    clinfo \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-vulkan.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-vulkan.bb
new file mode 100644
index 00000000..36ee4b7b
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-vulkan.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Group containing various useful Vulkan packages"
+LICENSE = "MIT"
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup features_check
+
+REQUIRED_DISTRO_FEATURES = "vulkan"
+
+RDEPENDS:${PN} = "\
+    vulkan-tools \
+"
-- 
2.48.1


