Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACDEEB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 21:46:46 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.7670.1688593602451690282
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 14:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZNEfkf9A;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 365LkdXb111002;
	Wed, 5 Jul 2023 16:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688593599;
	bh=L9rhpjesOrGfu1uo1MCu2spyp/5rJECage6uQOls4ec=;
	h=From:To:CC:Subject:Date;
	b=ZNEfkf9AN/NHv/McpTp8O1eLRKNDRsvFewMTxc4oZOIjUx3aKScsHsymViIhXyIBQ
	 WWBfT8/LzzdVCom/1HUAKjEnBJd2kAfvZJYMnNcFPXlc6ouPpz7n8j4LOQwhnfUphi
	 ei9X9WSZatZpJKtfuYzTaP7hR28HS9cXZu6u7XXM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 365LkdYq022513
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jul 2023 16:46:39 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 16:46:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jul 2023 16:46:39 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 365LkdDF010357;
	Wed, 5 Jul 2023 16:46:39 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH] arago-image.inc: remove IMAGE_FEATURES append weston
Date: Wed, 5 Jul 2023 16:46:37 -0500
Message-ID: <20230705214637.1376739-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Jul 2023 21:46:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14751

From: Randolph Sapp <rs@ti.com>

Remove the IMAGE_FEATURES append line I was using to automatically
configure some options from the core image we inherit. Instead
explicitly set the systemd target based on the opengl distro feature and
what image you are building for.

This reverts commit f21a29344aebc86910b73d1adffe356113442506.
---
 meta-arago-distro/recipes-core/images/arago-image.inc        | 5 -----
 meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 5 +++++
 .../recipes-core/images/tisdk-thinlinux-image.bb             | 5 +++++
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index 8e8eb114..d00c1f70 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -6,11 +6,6 @@ COMPATIBLE_MACHINE = "ti-soc"
 
 IMAGE_FEATURES += "package-management splash"
 
-# this is required to make sure the proper systemd default target gets set
-IMAGE_FEATURES += " \
-	${@bb.utils.contains("DISTRO_FEATURES", "wayland", "weston", "", d)} \
-"
-
 # 4KB per 1 inode should be enough
 EXTRA_IMAGECMD:ext2.gz += "-i 4096"
 
diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 7769c97c..787fac95 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -7,6 +7,11 @@ require arago-image.inc
 
 ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL ?= ""
 
+# we're assuming some display manager is being installed with opengl
+SYSTEMD_DEFAULT_TARGET = " \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','graphical.target','multi-user.target',d)} \
+"
+
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
index a61e6881..a840b7a0 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
@@ -8,6 +8,11 @@ require arago-image.inc
 # Allow users to tack on additional packages as interesting.
 ARAGO_THIN_IMAGE_EXTRA_INSTALL ?= ""
 
+# we're assuming some display manager is being installed with opengl
+SYSTEMD_DEFAULT_TARGET = " \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','graphical.target','multi-user.target',d)} \
+"
+
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
-- 
2.41.0


