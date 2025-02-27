Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E95C19F32
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 22:50:14 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.3288.1740696608671218043
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Feb 2025 14:50:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=a/yDxANr;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51RMo4ft1987214
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Feb 2025 16:50:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740696605;
	bh=4VhsdW9sJ9Gjc7OYzVhGsdP4EabaNHNRXNuUx4uXM4Q=;
	h=From:To:CC:Subject:Date;
	b=a/yDxANrqozwG6rzLG0oqUZZnD38slp/Dosbz0FFZ3SAULLje9UhZXT87ExZCCkeQ
	 QtxKc9cotIEoRxLkntHkCu/9Wrf40N+zi6Qg0MCigzruY6KrTJZ8MXyGOaWvaM42P1
	 0jIMAmSlAD/gD7eElbvUgiOwo57LtiqR1W48fnV0=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51RMo4s3045669
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Feb 2025 16:50:04 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Feb 2025 16:50:04 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Feb 2025 16:50:04 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51RMo4UR014354;
	Thu, 27 Feb 2025 16:50:04 -0600
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>, <vijayp@ti.com>
Subject: [meta-arago][scarthgap/master][PATCHv3] packagegroups: opencl and vulkan utilities
Date: Thu, 27 Feb 2025 16:50:01 -0600
Message-ID: <20250227225001.412870-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Feb 2025 22:50:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15930

From: Randolph Sapp <rs@ti.com>

Add package groups for OpenCL and Vulkan related utilities.
Conditionally install them in tisdk-default-image if we enable the
required distro features.

Currently these package groups consist of clinfo and vulkaninfo
respectively. These are useful tools for checking device extension
compatibility and ICD loader functionality.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

v2: Remove LICENSE and PR. Add a SUMMARY.
v3: Remove PACKAGE_ARCH.

 .../recipes-core/images/tisdk-default-image.bb         |  2 ++
 .../packagegroups/packagegroup-arago-opencl.bb         | 10 ++++++++++
 .../packagegroups/packagegroup-arago-vulkan.bb         | 10 ++++++++++
 3 files changed, 22 insertions(+)
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
index 00000000..dd5b0f1e
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Useful OpenCL packages for Arago"
+DESCRIPTION = "Packages we recommend for working with OpenCL"
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
index 00000000..c2e69921
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-vulkan.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Useful Vulkan packages for Arago"
+DESCRIPTION = "Packages we recommend for working with Vulkan"
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


