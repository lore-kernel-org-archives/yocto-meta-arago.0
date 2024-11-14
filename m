Return-Path: <a-shenai@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B86D65C42
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 05:47:27 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.31578.1731563238599726162
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 21:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WEoNHKTh;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-shenai@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AE5lIas033772
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Nov 2024 23:47:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731563238;
	bh=XYhcMsj/YPHIxQIKD3a7mFvOEGlCJibbJCoaoeSvj2M=;
	h=From:To:CC:Subject:Date;
	b=WEoNHKThhBkM2dT4LIGoPyI/djNK7hvZHxh0KhSmDLbe8CS0m37KsJUMJdWiI63zf
	 jk74tFYuY2/ukRoWolyw+BPy8GaS5BP0BI3wQlYuE1LInMInxcsDeUY6wOd4TKNGvw
	 K8f/AMo9+w72fLpjn7pVZtD9ase3M6aaVRUA51nU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AE5lI8b014404
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Nov 2024 23:47:18 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Nov 2024 23:47:17 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Nov 2024 23:47:17 -0600
Received: from aashvij.dhcp.ti.com (aashvij.dhcp.ti.com [172.24.227.252])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AE5lFgr047241;
	Wed, 13 Nov 2024 23:47:16 -0600
From: Aashvij Shenai <a-shenai@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <c-shilwant@ti.com>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <kamlesh@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH v1] meta-arago: Enable SELinux packages for recipe
Date: Thu, 14 Nov 2024 11:17:07 +0530
Message-ID: <20241114054707.2945853-1-a-shenai@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 14 Nov 2024 05:47:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15610

This patch adds SELinux packages for platforms building tisdk-default-image

However, this does not mean that SELinux will be enabled by default.
Additional boot time parameters are required to enable SELinux.

Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                     | 1 +
 meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 8e094e02..3fc8252e 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -52,6 +52,7 @@ DISTRO_FEATURES:remove = "x11"
 DISTRO_FEATURES:append = " vulkan"
 DISTRO_FEATURES:append = " opencv"
 DISTRO_FEATURES:append = " openmp"
+DISTRO_FEATURES:append =" acl xattr pam selinux"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index faae53d3..ff603b19 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -27,6 +27,7 @@ IMAGE_INSTALL += "\
     ti-demos \
     ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
     packagegroup-arago-tisdk-sysrepo \
+    ${@bb.utils.contains('DISTRO_FEATURES','selinux','packagegroup-core-selinux','',d)} \
 "
 
 export IMAGE_BASENAME = "tisdk-default-image${ARAGO_IMAGE_SUFFIX}"
-- 
2.34.1


