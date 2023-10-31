Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E16C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 14:04:41 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.187189.1698761076211839096
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 07:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HlZtRKJp;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39VE4Y9s032685;
	Tue, 31 Oct 2023 09:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698761074;
	bh=b2349a9G2fNWpTEIX+4PFhoSWYY5g4q+L4ZiTds/3dA=;
	h=From:To:Subject:Date;
	b=HlZtRKJpX31vTpaDHW204Bjd0CQkrdn1WHYu7m2eK5LQuDBlP9lhklPdqjkv7+cWR
	 5XsZejTu3Mpogm0R2et5ZcguN8mxY+kMdeogjVBwmhTSQxvPLHAeXCbm82O+BgrwX7
	 8GldPeWg6RIPZWUU2gaJO6oqjgogTMJV/qf/kND0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39VE4YWo004809
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 31 Oct 2023 09:04:34 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 31
 Oct 2023 09:04:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 31 Oct 2023 09:04:34 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39VE4XjE076056;
	Tue, 31 Oct 2023 09:04:33 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qxpM9-0003t2-KT; Tue, 31 Oct 2023 09:04:33 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH 1/2] tisdk-sw-manifest: Add code to not fail on tar error
Date: Tue, 31 Oct 2023 09:04:32 -0500
Message-ID: <20231031140433.14899-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 31 Oct 2023 14:04:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14978

We want to add an image into the core bundle, but that image does not
have any opkg .control files.  tar apparently errors out if you ask it
to extract out files but the files are not in the archive, and the
recipes are setup that if any of the commands in the shell error out,
then the entire recipe fails.

Simple fix, add an || (or) condition to the tar command to print a
message that there were not any control files instead of erroring out.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/classes/tisdk-sw-manifest.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
index 14d14f08..b9c63610 100644
--- a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
+++ b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
@@ -405,10 +405,10 @@ sw_manifest_target() {
         # Only extract tar.gz or tar.bz2 types
         if [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz ]
         then
-            tar xJf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
+            tar xJf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No control files found in ${image}"
         elif [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz ]
         then
-            tar xzf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
+            tar xzf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No control files found in ${image}"
         fi
     done
 
-- 
2.17.1


