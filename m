Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A303C5B552
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 18:22:03 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.14977.1749147715480561175
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Jun 2025 11:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XG/8AtpC;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 555ILs2p4150840
	for <meta-arago@lists.yoctoproject.org>; Thu, 5 Jun 2025 13:21:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749147714;
	bh=89LCWlV8xQF70Xt1fCiTLy/v52AfaGVrzZI+OYiRGf8=;
	h=From:To:CC:Subject:Date;
	b=XG/8AtpCKrrUiaVHsBsoLpl7tfV9zt+hlr9syIsTdldp2VaMVyZtgfT7oZTH4Mgnf
	 MGo4Ekjj0Yj50XgpL8tK++GfD1NHui1hzb/RSBntJ7iUhxXow7GITa3sLs6MouDZph
	 e6fccELTBrHn/Sd7hyuhnsxhEXNET2dgiWp4G2qA=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 555ILspZ1091843
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 5 Jun 2025 13:21:54 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Jun 2025 13:21:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Jun 2025 13:21:53 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 555ILseJ3968626;
	Thu, 5 Jun 2025 13:21:54 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>
Subject: [oe-layersetup][master] configs/arago-scarthgap-chromium-*: Chromium v130 -> 132
Date: Thu, 5 Jun 2025 13:21:54 -0500
Message-ID: <20250605182154.42513-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Jun 2025 18:22:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16255

From: Antonios Christidis <a-christidis@ti.com>

Update all scarthgap-chromium configs to point to a new commit sha. Now
building version 132.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 configs/arago-scarthgap-chromium-config.txt     | 2 +-
 kas/arago-scarthgap-chromium-config.yml         | 2 +-
 src/configs/arago-scarthgap-chromium-config.xml | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/arago-scarthgap-chromium-config.txt b/configs/arago-scarthgap-chromium-config.txt
index ae873e8..00982c0 100644
--- a/configs/arago-scarthgap-chromium-config.txt
+++ b/configs/arago-scarthgap-chromium-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
-meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f635a31f5f9762813a8527dd31323549b7,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
diff --git a/kas/arago-scarthgap-chromium-config.yml b/kas/arago-scarthgap-chromium-config.yml
index a929eda..fb10504 100644
--- a/kas/arago-scarthgap-chromium-config.yml
+++ b/kas/arago-scarthgap-chromium-config.yml
@@ -18,7 +18,7 @@ repos:
   meta-browser:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
-    commit: "68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4"
+    commit: "27ca52f635a31f5f9762813a8527dd31323549b7"
     layers:
       meta-chromium:
 
diff --git a/src/configs/arago-scarthgap-chromium-config.xml b/src/configs/arago-scarthgap-chromium-config.xml
index ba7c95e..faebe57 100644
--- a/src/configs/arago-scarthgap-chromium-config.xml
+++ b/src/configs/arago-scarthgap-chromium-config.xml
@@ -16,7 +16,7 @@
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
-        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4'>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='27ca52f635a31f5f9762813a8527dd31323549b7'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
-- 
2.34.1


