Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2A7EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 05:02:34 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6302.1687842151316060205
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 22:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YCvdQUm5;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35R52UeP001354
	for <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 00:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687842150;
	bh=qlpPgxHgizvZrO3s/XTkUdEaxHA4dy2n1pGs0bbn08k=;
	h=From:To:CC:Subject:Date;
	b=YCvdQUm5bn5z/cOSg46RpvaEvBSwi0j5xzujDQ2zUJvy+4YWJYZlIUOqw9sHdY8s5
	 5cxVKmQOR81lImgLyfkhcJ9KYfIIM3aDRjZn2HKXxCfGMzC8q3ZsVCiRkQq1TRceVZ
	 2Fra2w1dEuJHdQq9joXKISUv60ooIO9Zn7znO3uc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35R52Usr075677
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 00:02:30 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 00:02:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 00:02:30 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35R52SiF013705;
	Tue, 27 Jun 2023 00:02:28 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <l-weaver@ti.com>, <reatmon@ti.com>, <c-shilwant@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH v2] classes: tisdk-bundle: Move the licenses and manifests out of docs
Date: Tue, 27 Jun 2023 10:32:25 +0530
Message-ID: <20230627050225.1895839-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 05:02:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14691

We plan on not having docs populated in the intaller, to allow for
easier doc updates on the release pages without having to update the
installer. So move the licenses directory out of the docs directory.

Also, update manifest file location to a new directory for the same.
"docs/" directory will not be generated.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-arago-distro/classes/tisdk-bundle.bbclass | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
index b92ca0c0..dbdc9a5a 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -65,8 +65,8 @@ DEPLOY_TISCI_FW_NAME ?= ""
 # process.
 # This manifest follows the TI manifest format requirements which is why
 # it differs from some of the default manifest code in oe-core.
-SW_MANIFEST_FILE ?= "${IMAGE_ROOTFS}/docs/software_manifest.htm"
-SW_MANIFEST_TEXT ?= "${IMAGE_ROOTFS}/docs/software_manifest.txt"
+SW_MANIFEST_FILE ?= "${IMAGE_ROOTFS}/manifest/software_manifest.htm"
+SW_MANIFEST_TEXT ?= "${IMAGE_ROOTFS}/manifest/software_manifest.txt"
 
 # helper function for generating a set of strings based on a list.  Taken
 # from the image.bbclass.
@@ -240,7 +240,7 @@ echo "
 <h2>Credits</h2>
 
 <h2>Licenses</h2>
-<p>Licenses can be found in the \"docs/licenses\" directory of the SDK install directory</p>
+<p>Licenses can be found in the \"licenses\" directory of the SDK install directory</p>
 
 <h2><u><b>GCC RUNTIME LIBRARY EXCEPTION</b></u></h2>
 <p>Version 3.1, 31 March 2009</p>
@@ -287,7 +287,7 @@ cat >> ${SW_MANIFEST_TEXT} << 'EOF'
 
 <Licenses>
 
-Licenses can be found in the "docs/licenses" directory of the SDK install directory
+Licenses can be found in the "licenses/" directory of the SDK install directory
 GCC RUNTIME LIBRARY EXCEPTION
 
 Version 3.1, 31 March 2009
@@ -876,14 +876,14 @@ tisdk_image_build () {
     # the licenses that were used in the build.
     if [ -d ${DEPLOY_DIR}/licenses ]
     then
-        if [ ! -d ${IMAGE_ROOTFS}/docs ]
-        then
-            mkdir -p ${IMAGE_ROOTFS}/docs
-        fi
-        cp -rf ${DEPLOY_DIR}/licenses ${IMAGE_ROOTFS}/docs/
+        cp -rf ${DEPLOY_DIR}/licenses ${IMAGE_ROOTFS}/
     fi
 
     # Create the TI software manifest
+    if [ ! -d ${IMAGE_ROOTFS}/manifest ]
+    then
+        mkdir -p ${IMAGE_ROOTFS}/manifest
+    fi
     generate_sw_manifest
 
     # Delete installed toolchain sdk since we need the toolchain sdk installer
-- 
2.34.1


