Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2288DEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 13:43:44 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.8156.1687787022540907038
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 06:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=p6a4u5LW;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35QDhfZn064111
	for <meta-arago@lists.yoctoproject.org>; Mon, 26 Jun 2023 08:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687787021;
	bh=50DUPL/ArTp0iNrO3Qhn6CFBYGyyHXXvBHzNxsSUdHM=;
	h=From:To:CC:Subject:Date;
	b=p6a4u5LWoEsjLsJv9+LEEOe++Zz9CMLR8JfJjl7BFHCxLFMLwjFCvBKf2bfdMzE7N
	 6V+S5Ee3tJUMZ1rMnQcb6g+Ls4LIwlrxXOHUHVHaNalWmm60aFU4ruHYX3YgLJMkf6
	 tRhhGknkGI5XtpDfsol3ymnlFqnNU5mXC26i69rE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35QDhfj8071497
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 26 Jun 2023 08:43:41 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 Jun 2023 08:43:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 Jun 2023 08:43:41 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35QDhdvh054642;
	Mon, 26 Jun 2023 08:43:40 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <l-weaver@ti.com>, <reatmon@ti.com>, <c-shilwant@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] classes: tisdk-bundle: Move the licenses directory out of docs/
Date: Mon, 26 Jun 2023 19:13:36 +0530
Message-ID: <20230626134336.1169017-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Jun 2023 13:43:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14686

We plan on not having docs populated in the intaller, to allow for
easier doc updates on the release pages without having to update the
installer.
So move the licenses directory out of the docs directory

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-arago-distro/classes/tisdk-bundle.bbclass | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
index b92ca0c0..4e613c6f 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
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
@@ -876,11 +876,7 @@ tisdk_image_build () {
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
-- 
2.34.1


