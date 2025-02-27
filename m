Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163C1C19776
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 00:26:25 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.20890.1740615982417467491
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Feb 2025 16:26:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QzUOnpzP;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51R0QISC1609274
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 18:26:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740615978;
	bh=W+f6D8JixBN5j6D8rLYVLn1oONy6eCYaEo53Q6rzKgQ=;
	h=From:To:CC:Subject:Date;
	b=QzUOnpzPQ8SvcGmLaJ0jbk+kXZjinbcDWlV8QIVwRccdVUs2747tCPczRKDbztmA/
	 U5B8b1Lbp33QgkPlezPdq6hwelMEAbToO/a8YqaCccXN1RGRF6iRT95NyXEWdhsyiZ
	 t90+E2v01l3md0+1q5Kh3v7JE5P5H/cm3q3xrQ0s=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51R0QIVr108379
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Feb 2025 18:26:18 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 18:26:17 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 18:26:17 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51R0QHEB054884;
	Wed, 26 Feb 2025 18:26:17 -0600
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>, <vijayp@ti.com>
Subject: [meta-arago][scarthgap/master][PATCHv2] packagegroups: opencl and vulkan utilities
Date: Wed, 26 Feb 2025 18:24:59 -0600
Message-ID: <20250227002458.49808-2-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Feb 2025 00:26:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15925

From: Randolph Sapp <rs@ti.com>

Add package groups for OpenCL and Vulkan related utilities.
Conditionally install them in tisdk-default-image if we enable the
required distro features.

Currently these package groups consist of clinfo and vulkaninfo
respectively. These are useful tools for checking device extension
compatibility and ICD loader functionality.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Sending this version anyway. I'll do a v3 if people are upset about the license
removal, but logically it doesn't make much sense for package groups to have a
license anyway. OE-Core doesn't set them.

v2: Remove LICENSE and PR. Add a SUMMARY.

 .../recipes-core/images/tisdk-default-image.bb       |  2 ++
 .../packagegroups/packagegroup-arago-opencl.bb       | 12 ++++++++++++
 .../packagegroups/packagegroup-arago-vulkan.bb       | 12 ++++++++++++
 3 files changed, 26 insertions(+)
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
index 00000000..443849b1
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Useful OpenCL packages for Arago"
+DESCRIPTION = "Packages we recommend for working with OpenCL"
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
index 00000000..f5d08288
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-vulkan.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Useful Vulkan packages for Arago"
+DESCRIPTION = "Packages we recommend for working with Vulkan"
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


