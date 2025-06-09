Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC9BC5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 15:29:17 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.62156.1749482951739383512
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Jun 2025 08:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XhXJPHQ2;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 559FTBPO2032061
	for <meta-arago@lists.yoctoproject.org>; Mon, 9 Jun 2025 10:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749482951;
	bh=oNpWzHGuFHkyoEnY1OxxwxXe39dVItZngIN++BfjJVw=;
	h=From:To:Subject:Date;
	b=XhXJPHQ2e82ErvE6KQtKajl1CxI/IAWYGPiiuiWuLVs9DCCD5U9ChgTRqtkD+qGnS
	 GTzz8ooylZ0AhgqdvtNmCq9Tu74tb9XvYIL3JdRlMDd595ogPA7685jlL89ARQSEHi
	 Pc/qKc/5wxBzKS2wj7LxIQWojKDKH7Cw/G6fivYM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 559FTB1p3783325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 9 Jun 2025 10:29:11 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Jun 2025 10:29:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Jun 2025 10:29:10 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 559FTAZP1610182;
	Mon, 9 Jun 2025 10:29:10 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] configs/arago-scarthgap-*: Chromium v130 -> 132
Date: Mon, 9 Jun 2025 10:29:10 -0500
Message-ID: <20250609152910.1722292-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Jun 2025 15:29:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16260

From: Antonios Christidis <a-christidis@ti.com>

The last time chromium versions changed from v123 -> v130, the shas
regarding meta-browser were changed even for configs that had the layer
commented out.

Similar to the above, this updates the shas for configs that have the
layer commented out.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 configs/arago-scarthgap-config.txt             | 2 +-
 configs/arago-scarthgap-next-config.txt        | 2 +-
 configs/arago-scarthgap-selinux-config.txt     | 2 +-
 configs/arago-scarthgap-wip-config.txt         | 2 +-
 src/configs/arago-scarthgap-config.xml         | 2 +-
 src/configs/arago-scarthgap-next-config.xml    | 2 +-
 src/configs/arago-scarthgap-selinux-config.xml | 2 +-
 src/configs/arago-scarthgap-wip-config.xml     | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
index 1474e02..9f688c9 100644
--- a/configs/arago-scarthgap-config.txt
+++ b/configs/arago-scarthgap-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f635a31f5f9762813a8527dd31323549b7,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
index cbd03ce..c6b20d6 100644
--- a/configs/arago-scarthgap-next-config.txt
+++ b/configs/arago-scarthgap-next-config.txt
@@ -11,7 +11,7 @@ MOTD: NOTE:
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f635a31f5f9762813a8527dd31323549b7,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-selinux-config.txt b/configs/arago-scarthgap-selinux-config.txt
index 198df7c..a82f733 100644
--- a/configs/arago-scarthgap-selinux-config.txt
+++ b/configs/arago-scarthgap-selinux-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f635a31f5f9762813a8527dd31323549b7,layers=meta-chromium
 meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
index 4036320..f69d272 100644
--- a/configs/arago-scarthgap-wip-config.txt
+++ b/configs/arago-scarthgap-wip-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f635a31f5f9762813a8527dd31323549b7,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
diff --git a/src/configs/arago-scarthgap-config.xml b/src/configs/arago-scarthgap-config.xml
index ee9425f..fb1d07f 100644
--- a/src/configs/arago-scarthgap-config.xml
+++ b/src/configs/arago-scarthgap-config.xml
@@ -16,7 +16,7 @@
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
-        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4' disabled='true'>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='27ca52f635a31f5f9762813a8527dd31323549b7' disabled='true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-scarthgap-next-config.xml b/src/configs/arago-scarthgap-next-config.xml
index d1cfdad..e9e21d7 100644
--- a/src/configs/arago-scarthgap-next-config.xml
+++ b/src/configs/arago-scarthgap-next-config.xml
@@ -17,7 +17,7 @@
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
-        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4' disabled='true'>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='27ca52f635a31f5f9762813a8527dd31323549b7' disabled='true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-scarthgap-selinux-config.xml b/src/configs/arago-scarthgap-selinux-config.xml
index 990cb2a..6ac6e66 100644
--- a/src/configs/arago-scarthgap-selinux-config.xml
+++ b/src/configs/arago-scarthgap-selinux-config.xml
@@ -16,7 +16,7 @@
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
-        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4' disabled='true'>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='27ca52f635a31f5f9762813a8527dd31323549b7' disabled='true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-scarthgap-wip-config.xml b/src/configs/arago-scarthgap-wip-config.xml
index 9339bd8..d546b89 100644
--- a/src/configs/arago-scarthgap-wip-config.xml
+++ b/src/configs/arago-scarthgap-wip-config.xml
@@ -16,7 +16,7 @@
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
-        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4' disabled='true'>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='27ca52f635a31f5f9762813a8527dd31323549b7' disabled='true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
-- 
2.34.1


