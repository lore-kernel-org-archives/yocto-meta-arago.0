Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63372CAC594
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 16:35:13 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.2133.1757608509046521953
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Sep 2025 09:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kKALBBUD;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BGZ7jG787728;
	Thu, 11 Sep 2025 11:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757608507;
	bh=Gdpt2775SNQMoxRqbGlpBBjyMfjl/W7D1w2WSExvZEI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=kKALBBUDw3nKnP/YSg2HudHSWyduv9iGdIBAbVB5eUGvWA3s9bvBRos3xB6dEFRJv
	 dEjzLHnvL5SkahJ1EFwzxfRyrBOuAEwtfYE71l5G2HyKRsKktEFjwURI9togAG2USF
	 4YNGWU3rUCq2RzkCZmWnvxl8XTHVuz+mSEaydXIs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BGZ7bi1289117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 11:35:07 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 11:35:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 11:35:06 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BGZ6S22416682;
	Thu, 11 Sep 2025 11:35:06 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uwkGI-0005KH-K1; Thu, 11 Sep 2025 11:35:06 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 3/5] src/configs: Update all of the configs
Date: Thu, 11 Sep 2025 11:35:04 -0500
Message-ID: <20250911163506.20414-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250911163506.20414-1-reatmon@ti.com>
References: <20250911163506.20414-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Sep 2025 16:35:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16562

Update all of the config XML files to add in the machine list include
and change the name of the targets to distro.

Update the local.conf template XML files to include a summary and
description.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 src/configs/arago-kirkstone-chromium-config.xml                | 3 ++-
 src/configs/arago-kirkstone-config.xml                         | 3 ++-
 src/configs/arago-kirkstone-next-config.xml                    | 3 ++-
 src/configs/arago-kirkstone-wip-config.xml                     | 3 ++-
 src/configs/arago-master-chromium-config.xml                   | 3 ++-
 src/configs/arago-master-config.xml                            | 3 ++-
 src/configs/arago-master-flutter-config.xml                    | 3 ++-
 src/configs/arago-master-next-config.xml                       | 3 ++-
 src/configs/arago-master-selinux-config.xml                    | 3 ++-
 src/configs/arago-master-wip-config.xml                        | 3 ++-
 src/configs/arago-scarthgap-10x-config.xml                     | 3 ++-
 src/configs/arago-scarthgap-10x-next-config.xml                | 3 ++-
 src/configs/arago-scarthgap-chromium-config.xml                | 3 ++-
 src/configs/arago-scarthgap-config.xml                         | 3 ++-
 src/configs/arago-scarthgap-flutter-config.xml                 | 3 ++-
 src/configs/arago-scarthgap-next-config.xml                    | 3 ++-
 src/configs/arago-scarthgap-selinux-config.xml                 | 3 ++-
 src/configs/arago-scarthgap-wip-config.xml                     | 3 ++-
 src/configs/coresdk/coresdk-09.00.00.006-config.xml            | 3 ++-
 src/configs/coresdk/coresdk-09.00.00.007-config.xml            | 3 ++-
 src/configs/coresdk/coresdk-09.00.00.011-config.xml            | 3 ++-
 src/configs/coresdk/coresdk-09.01.00.001-config.xml            | 3 ++-
 src/configs/coresdk/coresdk-09.01.00.003-config.xml            | 3 ++-
 src/configs/coresdk/coresdk-09.01.00.007-config.xml            | 3 ++-
 src/configs/coresdk/coresdk-09.01.00.008-config.xml            | 3 ++-
 src/configs/coresdk/coresdk-09.02.00.008-config.xml            | 3 ++-
 src/configs/coresdk/coresdk-09.02.00.009-config.xml            | 3 ++-
 src/configs/coresdk/coresdk-09.02.00.010-config.xml            | 3 ++-
 src/configs/coresdk/coresdk-09.03.05-config.xml                | 3 ++-
 src/configs/coresdk/coresdk-10.00.07-config.xml                | 3 ++-
 src/configs/coresdk/coresdk-10.01.08-config.xml                | 3 ++-
 src/configs/coresdk/coresdk-10.01.10-config.xml                | 3 ++-
 src/configs/coresdk/coresdk-10.01.10-selinux-config.xml        | 3 ++-
 src/configs/coresdk/coresdk-11.00.09-config.xml                | 3 ++-
 src/configs/coresdk/coresdk-11.00.15-config.xml                | 3 ++-
 src/configs/coresdk/coresdk-11.01.05-config.xml                | 3 ++-
 src/configs/coresdk/coresdk-11.01.08-config.xml                | 3 ++-
 src/configs/distroless-kirkstone-config.xml                    | 1 +
 src/configs/distroless-master-config.xml                       | 1 +
 src/configs/distroless-scarthgap-config.xml                    | 1 +
 src/configs/poky-kirkstone-config.xml                          | 3 ++-
 src/configs/poky-master-config.xml                             | 3 ++-
 src/configs/poky-master-wip-config.xml                         | 3 ++-
 src/configs/poky-scarthgap-config.xml                          | 3 ++-
 src/configs/poky-scarthgap-wip-config.xml                      | 3 ++-
 .../processor-sdk-analytics-09.00.00-config.xml                | 3 ++-
 .../processor-sdk-analytics-09.00.01-config.xml                | 3 ++-
 .../processor-sdk-analytics-09.01.00-config.xml                | 3 ++-
 .../processor-sdk-analytics-09.02.00-config.xml                | 3 ++-
 .../processor-sdk-analytics-10.00.00-config.xml                | 3 ++-
 .../processor-sdk-analytics-10.01.00-config.xml                | 3 ++-
 .../processor-sdk-analytics-11.00.00-config.xml                | 3 ++-
 .../processor-sdk-analytics-11.01.07.05-config.xml             | 3 ++-
 .../processor-sdk-analytics-selinux-11.01.07.05-config.xml     | 3 ++-
 .../processor-sdk-linux/processor-sdk-gateway-10_00.xml        | 3 ++-
 .../processor-sdk-linux/processor-sdk-linux-09_00_00_06.xml    | 3 ++-
 .../processor-sdk-linux/processor-sdk-linux-09_00_00_07.xml    | 3 ++-
 .../processor-sdk-linux/processor-sdk-linux-09_01_00_06.xml    | 3 ++-
 .../processor-sdk-linux/processor-sdk-linux-09_01_00_07.xml    | 3 ++-
 .../processor-sdk-linux/processor-sdk-linux-09_02_00_04.xml    | 3 ++-
 .../processor-sdk-linux/processor-sdk-linux-09_02_00_05.xml    | 3 ++-
 .../processor-sdk-linux/processor-sdk-linux-09_03_06_05.xml    | 3 ++-
 .../processor-sdk-linux/processor-sdk-linux-10_00_07_06.xml    | 3 ++-
 .../processor-sdk-linux/processor-sdk-linux-10_00_08_06.xml    | 3 ++-
 .../processor-sdk-linux/processor-sdk-linux-10_01_08_01.xml    | 3 ++-
 .../processor-sdk-linux/processor-sdk-linux-11_00_10_01.xml    | 3 ++-
 .../processor-sdk/processor-sdk-09.00.00-am62xxsip-config.xml  | 3 ++-
 src/configs/processor-sdk/processor-sdk-09.00.00-config.xml    | 3 ++-
 .../processor-sdk/processor-sdk-09.01.00-am65xx-config.xml     | 3 ++-
 src/configs/processor-sdk/processor-sdk-09.01.00-config.xml    | 3 ++-
 .../processor-sdk/processor-sdk-09.01.00-legacy-config.xml     | 3 ++-
 .../processor-sdk/processor-sdk-09.02.00.08-am64x-config.xml   | 3 ++-
 .../processor-sdk/processor-sdk-09.03.05.02-legacy-config.xml  | 3 ++-
 .../processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.xml | 3 ++-
 .../processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.xml | 3 ++-
 .../processor-sdk-kirkstone-09.02.01.09-config.xml             | 3 ++-
 .../processor-sdk-kirkstone-09.02.01.10-config.xml             | 3 ++-
 .../processor-sdk-kirkstone-chromium-09.02.01.09-config.xml    | 3 ++-
 .../processor-sdk-kirkstone-chromium-09.02.01.10-config.xml    | 3 ++-
 .../processor-sdk-scarthgap-10.00.07.04-config.xml             | 3 ++-
 .../processor-sdk-scarthgap-10.01.10.04-config.xml             | 3 ++-
 .../processor-sdk-scarthgap-11.00.09.04-config.xml             | 3 ++-
 .../processor-sdk-scarthgap-11.01.05.03-config.xml             | 3 ++-
 .../processor-sdk-scarthgap-chromium-10.00.07.04-config.xml    | 3 ++-
 .../processor-sdk-scarthgap-chromium-10.01.10.04-config.xml    | 3 ++-
 .../processor-sdk-scarthgap-chromium-11.00.09.04-config.xml    | 3 ++-
 .../processor-sdk-scarthgap-chromium-11.01.05.03-config.xml    | 3 ++-
 .../processor-sdk-scarthgap-chromium-11.01.12.10-config.xml    | 3 ++-
 .../processor-sdk-scarthgap-nonqt-11.01.05.03-config.xml       | 3 ++-
 .../processor-sdk-scarthgap-selinux-11.00.09.04-config.xml     | 3 ++-
 .../processor-sdk-scarthgap-selinux-11.01.05.03-config.xml     | 3 ++-
 src/templates/local-arago64-v2.conf.xml                        | 2 ++
 src/templates/local-arago64-v3.conf.xml                        | 2 ++
 src/templates/local-poky-v2.conf.xml                           | 2 ++
 src/templates/local-poky-v3.conf.xml                           | 2 ++
 src/templates/local-v2.conf.xml                                | 2 ++
 src/templates/local-v3.conf.xml                                | 2 ++
 97 files changed, 191 insertions(+), 88 deletions(-)

diff --git a/src/configs/arago-kirkstone-chromium-config.xml b/src/configs/arago-kirkstone-chromium-config.xml
index 4ab973c..df49027 100644
--- a/src/configs/arago-kirkstone-chromium-config.xml
+++ b/src/configs/arago-kirkstone-chromium-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Arago reference distribution for kirkstone-chromium</description>
 
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/arago-kirkstone-config.xml b/src/configs/arago-kirkstone-config.xml
index d568956..cc8e1d5 100644
--- a/src/configs/arago-kirkstone-config.xml
+++ b/src/configs/arago-kirkstone-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Arago reference distribution for kirkstone</description>
 
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/arago-kirkstone-next-config.xml b/src/configs/arago-kirkstone-next-config.xml
index 7d6ffde..dd6815f 100644
--- a/src/configs/arago-kirkstone-next-config.xml
+++ b/src/configs/arago-kirkstone-next-config.xml
@@ -3,7 +3,8 @@
     <description>Arago reference distribution for kirkstone-next (CICD)</description>
 
     <xi:include href='../common/motd_cicd.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/arago-kirkstone-wip-config.xml b/src/configs/arago-kirkstone-wip-config.xml
index 5d672f1..f08ac6f 100644
--- a/src/configs/arago-kirkstone-wip-config.xml
+++ b/src/configs/arago-kirkstone-wip-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Arago reference distribution for kirkstone-wip</description>
 
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/arago-master-chromium-config.xml
index 5ac01ba..d59c579 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-master-chromium-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Arago reference distribution for master-chromium</description>
 
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master-config.xml
index a7eeb4d..1f3bb4e 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Arago reference distribution for master</description>
 
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/arago-master-flutter-config.xml b/src/configs/arago-master-flutter-config.xml
index 3fdcbe7..0bb8972 100644
--- a/src/configs/arago-master-flutter-config.xml
+++ b/src/configs/arago-master-flutter-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Arago reference distribution for master-flutter</description>
 
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-master-next-config.xml
index c4ec0f5..2f3c78a 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-master-next-config.xml
@@ -3,7 +3,8 @@
     <description>Arago reference distribution for master-next (CICD)</description>
 
     <xi:include href='../common/motd_cicd.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arago-master-selinux-config.xml
index 59d05d7..e3018bd 100644
--- a/src/configs/arago-master-selinux-config.xml
+++ b/src/configs/arago-master-selinux-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Arago reference distribution for master</description>
 
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-master-wip-config.xml
index e8a8407..fe52c8c 100644
--- a/src/configs/arago-master-wip-config.xml
+++ b/src/configs/arago-master-wip-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Arago reference distribution for master-wip</description>
 
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/arago-scarthgap-10x-config.xml b/src/configs/arago-scarthgap-10x-config.xml
index ead78e2..505245f 100644
--- a/src/configs/arago-scarthgap-10x-config.xml
+++ b/src/configs/arago-scarthgap-10x-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Arago reference distribution for scarthgap</description>
 
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/arago-scarthgap-10x-next-config.xml b/src/configs/arago-scarthgap-10x-next-config.xml
index 1d55f7e..727cef6 100644
--- a/src/configs/arago-scarthgap-10x-next-config.xml
+++ b/src/configs/arago-scarthgap-10x-next-config.xml
@@ -3,7 +3,8 @@
     <description>Arago reference distribution for scarthgap-next (CICD)</description>
 
     <xi:include href='../common/motd_cicd.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/arago-scarthgap-chromium-config.xml b/src/configs/arago-scarthgap-chromium-config.xml
index 5ed35b4..ca960cd 100644
--- a/src/configs/arago-scarthgap-chromium-config.xml
+++ b/src/configs/arago-scarthgap-chromium-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Arago reference distribution for scarthgap-chromium</description>
 
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/arago-scarthgap-config.xml b/src/configs/arago-scarthgap-config.xml
index d5c571e..3a3302a 100644
--- a/src/configs/arago-scarthgap-config.xml
+++ b/src/configs/arago-scarthgap-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Arago reference distribution for scarthgap</description>
 
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/arago-scarthgap-flutter-config.xml b/src/configs/arago-scarthgap-flutter-config.xml
index 8686025..eb3920c 100644
--- a/src/configs/arago-scarthgap-flutter-config.xml
+++ b/src/configs/arago-scarthgap-flutter-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Arago reference distribution for scarthgap</description>
 
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/arago-scarthgap-next-config.xml b/src/configs/arago-scarthgap-next-config.xml
index df77559..85a4326 100644
--- a/src/configs/arago-scarthgap-next-config.xml
+++ b/src/configs/arago-scarthgap-next-config.xml
@@ -3,7 +3,8 @@
     <description>Arago reference distribution for scarthgap-next (CICD)</description>
 
     <xi:include href='../common/motd_cicd.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/arago-scarthgap-selinux-config.xml b/src/configs/arago-scarthgap-selinux-config.xml
index 1096683..cfc2217 100644
--- a/src/configs/arago-scarthgap-selinux-config.xml
+++ b/src/configs/arago-scarthgap-selinux-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Arago reference distribution for scarthgap</description>
 
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/arago-scarthgap-wip-config.xml b/src/configs/arago-scarthgap-wip-config.xml
index cdb4a29..e5a1596 100644
--- a/src/configs/arago-scarthgap-wip-config.xml
+++ b/src/configs/arago-scarthgap-wip-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Arago reference distribution for scarthgap-wip</description>
 
-    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-09.00.00.006-config.xml b/src/configs/coresdk/coresdk-09.00.00.006-config.xml
index fcd933d..2eebcb1 100644
--- a/src/configs/coresdk/coresdk-09.00.00.006-config.xml
+++ b/src/configs/coresdk/coresdk-09.00.00.006-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v09.00.00.006</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-09.00.00.007-config.xml b/src/configs/coresdk/coresdk-09.00.00.007-config.xml
index 9cf9601..0a8d7e3 100644
--- a/src/configs/coresdk/coresdk-09.00.00.007-config.xml
+++ b/src/configs/coresdk/coresdk-09.00.00.007-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v09.00.00.007</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-09.00.00.011-config.xml b/src/configs/coresdk/coresdk-09.00.00.011-config.xml
index 3906414..2534264 100644
--- a/src/configs/coresdk/coresdk-09.00.00.011-config.xml
+++ b/src/configs/coresdk/coresdk-09.00.00.011-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v09.00.00.011</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-09.01.00.001-config.xml b/src/configs/coresdk/coresdk-09.01.00.001-config.xml
index 67ad2fd..1942bcc 100644
--- a/src/configs/coresdk/coresdk-09.01.00.001-config.xml
+++ b/src/configs/coresdk/coresdk-09.01.00.001-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v09.01.00.001</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-09.01.00.003-config.xml b/src/configs/coresdk/coresdk-09.01.00.003-config.xml
index 006ed07..297e447 100644
--- a/src/configs/coresdk/coresdk-09.01.00.003-config.xml
+++ b/src/configs/coresdk/coresdk-09.01.00.003-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v09.01.00.003</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-09.01.00.007-config.xml b/src/configs/coresdk/coresdk-09.01.00.007-config.xml
index a0f0872..4e9d77a 100644
--- a/src/configs/coresdk/coresdk-09.01.00.007-config.xml
+++ b/src/configs/coresdk/coresdk-09.01.00.007-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v09.01.00.007</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-09.01.00.008-config.xml b/src/configs/coresdk/coresdk-09.01.00.008-config.xml
index 4278823..7a8cb6e 100644
--- a/src/configs/coresdk/coresdk-09.01.00.008-config.xml
+++ b/src/configs/coresdk/coresdk-09.01.00.008-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v09.01.00.008</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-09.02.00.008-config.xml b/src/configs/coresdk/coresdk-09.02.00.008-config.xml
index 17da7f2..3131288 100644
--- a/src/configs/coresdk/coresdk-09.02.00.008-config.xml
+++ b/src/configs/coresdk/coresdk-09.02.00.008-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v09.02.00.008</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-09.02.00.009-config.xml b/src/configs/coresdk/coresdk-09.02.00.009-config.xml
index 2320051..6187b6f 100644
--- a/src/configs/coresdk/coresdk-09.02.00.009-config.xml
+++ b/src/configs/coresdk/coresdk-09.02.00.009-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v09.02.00.009</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-09.02.00.010-config.xml b/src/configs/coresdk/coresdk-09.02.00.010-config.xml
index 1182413..edd24d5 100644
--- a/src/configs/coresdk/coresdk-09.02.00.010-config.xml
+++ b/src/configs/coresdk/coresdk-09.02.00.010-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v09.02.00.010</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-09.03.05-config.xml b/src/configs/coresdk/coresdk-09.03.05-config.xml
index 4cb5d1f..ff6a24f 100644
--- a/src/configs/coresdk/coresdk-09.03.05-config.xml
+++ b/src/configs/coresdk/coresdk-09.03.05-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v09.03.05</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-10.00.07-config.xml b/src/configs/coresdk/coresdk-10.00.07-config.xml
index f244fd4..6791de3 100644
--- a/src/configs/coresdk/coresdk-10.00.07-config.xml
+++ b/src/configs/coresdk/coresdk-10.00.07-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v10.00.07</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-10.01.08-config.xml b/src/configs/coresdk/coresdk-10.01.08-config.xml
index 32b15b1..b7ddf05 100644
--- a/src/configs/coresdk/coresdk-10.01.08-config.xml
+++ b/src/configs/coresdk/coresdk-10.01.08-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v10.01.08</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-10.01.10-config.xml b/src/configs/coresdk/coresdk-10.01.10-config.xml
index 419ff7f..bf9fb4f 100644
--- a/src/configs/coresdk/coresdk-10.01.10-config.xml
+++ b/src/configs/coresdk/coresdk-10.01.10-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v10.01.10</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-10.01.10-selinux-config.xml b/src/configs/coresdk/coresdk-10.01.10-selinux-config.xml
index 2dc488c..303a1b5 100644
--- a/src/configs/coresdk/coresdk-10.01.10-selinux-config.xml
+++ b/src/configs/coresdk/coresdk-10.01.10-selinux-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v10.01.10-selinux</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-11.00.09-config.xml b/src/configs/coresdk/coresdk-11.00.09-config.xml
index e1732cc..0d3b62d 100644
--- a/src/configs/coresdk/coresdk-11.00.09-config.xml
+++ b/src/configs/coresdk/coresdk-11.00.09-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v11.00.09</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-11.00.15-config.xml b/src/configs/coresdk/coresdk-11.00.15-config.xml
index 0629135..1b6879f 100644
--- a/src/configs/coresdk/coresdk-11.00.15-config.xml
+++ b/src/configs/coresdk/coresdk-11.00.15-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v11.00.15</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-11.01.05-config.xml b/src/configs/coresdk/coresdk-11.01.05-config.xml
index 6085a9f..62212f9 100644
--- a/src/configs/coresdk/coresdk-11.01.05-config.xml
+++ b/src/configs/coresdk/coresdk-11.01.05-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v11.01.05</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/coresdk/coresdk-11.01.08-config.xml b/src/configs/coresdk/coresdk-11.01.08-config.xml
index 554477e..3c8c562 100644
--- a/src/configs/coresdk/coresdk-11.01.08-config.xml
+++ b/src/configs/coresdk/coresdk-11.01.08-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI CoreSDK v11.01.08</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/distroless-kirkstone-config.xml b/src/configs/distroless-kirkstone-config.xml
index 844571c..6992b77 100644
--- a/src/configs/distroless-kirkstone-config.xml
+++ b/src/configs/distroless-kirkstone-config.xml
@@ -2,6 +2,7 @@
 <config>
     <description>Distroless reference for kirkstone</description>
 
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/distroless-master-config.xml b/src/configs/distroless-master-config.xml
index 14b0d4e..1e134df 100644
--- a/src/configs/distroless-master-config.xml
+++ b/src/configs/distroless-master-config.xml
@@ -2,6 +2,7 @@
 <config>
     <description>Distroless reference for master</description>
 
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/distroless-scarthgap-config.xml b/src/configs/distroless-scarthgap-config.xml
index 5bb6433..293a68d 100644
--- a/src/configs/distroless-scarthgap-config.xml
+++ b/src/configs/distroless-scarthgap-config.xml
@@ -2,6 +2,7 @@
 <config>
     <description>Distroless reference for scarthgap</description>
 
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/poky-kirkstone-config.xml b/src/configs/poky-kirkstone-config.xml
index 6826d19..fbd5de9 100644
--- a/src/configs/poky-kirkstone-config.xml
+++ b/src/configs/poky-kirkstone-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Poky reference distribution for kirkstone</description>
 
-    <xi:include href='../common/targets_poky.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_poky.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-poky-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/poky-master-config.xml b/src/configs/poky-master-config.xml
index b1fdfb8..f8fff75 100644
--- a/src/configs/poky-master-config.xml
+++ b/src/configs/poky-master-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Poky reference distribution for master</description>
 
-    <xi:include href='../common/targets_poky.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_poky.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-poky-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/poky-master-wip-config.xml b/src/configs/poky-master-wip-config.xml
index b128614..82375a6 100644
--- a/src/configs/poky-master-wip-config.xml
+++ b/src/configs/poky-master-wip-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Poky reference distribution for master-wip</description>
 
-    <xi:include href='../common/targets_poky.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_poky.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-poky-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/poky-scarthgap-config.xml b/src/configs/poky-scarthgap-config.xml
index 8f0043d..590f42d 100644
--- a/src/configs/poky-scarthgap-config.xml
+++ b/src/configs/poky-scarthgap-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Poky reference distribution for scarthgap</description>
 
-    <xi:include href='../common/targets_poky.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_poky.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-poky-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/poky-scarthgap-wip-config.xml b/src/configs/poky-scarthgap-wip-config.xml
index 7d38edd..2995ebc 100644
--- a/src/configs/poky-scarthgap-wip-config.xml
+++ b/src/configs/poky-scarthgap-wip-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>Poky reference distribution for scarthgap-wip</description>
 
-    <xi:include href='../common/targets_poky.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/distro_poky.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/local-poky-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.xml
index e1a089e..5a5ecbf 100644
--- a/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.xml
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Analytics v09.00.00</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.xml
index 24f199c..8ba1857 100644
--- a/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.xml
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Analytics v09.00.01</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.xml
index 9e77c7b..84aebd0 100644
--- a/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.xml
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Analytics v09.01.00</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.xml
index de57928..17f4a9b 100644
--- a/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.xml
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Analytics v09.02.00</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.xml
index 76674d7..b17e040 100644
--- a/src/configs/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.xml
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Analytics v10.00.00</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.xml
index 7308167..b6b9239 100644
--- a/src/configs/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.xml
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Analytics v10.01.00</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.xml
index 23b1a1e..689d685 100644
--- a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.xml
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Analytics v11.00.00</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.xml
index 51b3453..904c44a 100644
--- a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.xml
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Analytics v11.01.07.05</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.xml
index 01408f4..6b0203a 100644
--- a/src/configs/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.xml
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Analytics vselinux-11.01.07.05</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-linux/processor-sdk-gateway-10_00.xml b/src/configs/processor-sdk-linux/processor-sdk-gateway-10_00.xml
index 5b7f9c8..d95abd3 100644
--- a/src/configs/processor-sdk-linux/processor-sdk-gateway-10_00.xml
+++ b/src/configs/processor-sdk-linux/processor-sdk-gateway-10_00.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Linux v10_00</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_06.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_06.xml
index 4f3091b..7ad8d60 100644
--- a/src/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_06.xml
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_06.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Linux v09_00_00_06</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_07.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_07.xml
index 6692925..48038e6 100644
--- a/src/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_07.xml
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_07.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Linux v09_00_00_07</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_06.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_06.xml
index f8ebadd..6cf7315 100644
--- a/src/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_06.xml
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_06.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Linux v09_01_00_06</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_07.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_07.xml
index 09700a4..94138fd 100644
--- a/src/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_07.xml
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_07.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Linux v09_01_00_07</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_04.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_04.xml
index 8e78543..ef62651 100644
--- a/src/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_04.xml
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_04.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Linux v09_02_00_04</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_05.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_05.xml
index 7953cb0..a392d1f 100644
--- a/src/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_05.xml
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_05.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Linux v09_02_00_05</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-09_03_06_05.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-09_03_06_05.xml
index a2efc86..b5bac85 100644
--- a/src/configs/processor-sdk-linux/processor-sdk-linux-09_03_06_05.xml
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-09_03_06_05.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Linux v09_03_06_05</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-10_00_07_06.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-10_00_07_06.xml
index 15e4786..1c3ca85 100644
--- a/src/configs/processor-sdk-linux/processor-sdk-linux-10_00_07_06.xml
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-10_00_07_06.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Linux v10_00_07_06</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-10_00_08_06.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-10_00_08_06.xml
index 03f23ec..0b4fdff 100644
--- a/src/configs/processor-sdk-linux/processor-sdk-linux-10_00_08_06.xml
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-10_00_08_06.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Linux v10_00_08_06</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-10_01_08_01.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-10_01_08_01.xml
index 79a5cc6..e54afaf 100644
--- a/src/configs/processor-sdk-linux/processor-sdk-linux-10_01_08_01.xml
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-10_01_08_01.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Linux v10_01_08_01</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-11_00_10_01.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-11_00_10_01.xml
index 339c4d7..38aa819 100644
--- a/src/configs/processor-sdk-linux/processor-sdk-linux-11_00_10_01.xml
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-11_00_10_01.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK Linux v11_00_10_01</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.xml b/src/configs/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.xml
index c3a0a82..393e1e1 100644
--- a/src/configs/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK v09.00.00-am62xxsip</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-09.00.00-config.xml b/src/configs/processor-sdk/processor-sdk-09.00.00-config.xml
index 7fc7e25..2aa5745 100644
--- a/src/configs/processor-sdk/processor-sdk-09.00.00-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-09.00.00-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK v09.00.00</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-09.01.00-am65xx-config.xml b/src/configs/processor-sdk/processor-sdk-09.01.00-am65xx-config.xml
index 6286162..594dba5 100644
--- a/src/configs/processor-sdk/processor-sdk-09.01.00-am65xx-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-09.01.00-am65xx-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK v09.01.00-am65xx</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-09.01.00-config.xml b/src/configs/processor-sdk/processor-sdk-09.01.00-config.xml
index c57afe8..60025f9 100644
--- a/src/configs/processor-sdk/processor-sdk-09.01.00-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-09.01.00-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK v09.01.00</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.xml b/src/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.xml
index ebd448c..ef9e4ec 100644
--- a/src/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK v09.01.00-legacy</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-09.02.00.08-am64x-config.xml b/src/configs/processor-sdk/processor-sdk-09.02.00.08-am64x-config.xml
index 6ec86aa..75b4a4a 100644
--- a/src/configs/processor-sdk/processor-sdk-09.02.00.08-am64x-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-09.02.00.08-am64x-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK v09.02.00.08-am64x</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-09.03.05.02-legacy-config.xml b/src/configs/processor-sdk/processor-sdk-09.03.05.02-legacy-config.xml
index 71bd067..7093231 100644
--- a/src/configs/processor-sdk/processor-sdk-09.03.05.02-legacy-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-09.03.05.02-legacy-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK v09.03.05.02-legacy</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.xml b/src/configs/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.xml
index bd1671f..c11df3b 100644
--- a/src/configs/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK v11.00.05.02-am62lxx</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.xml b/src/configs/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.xml
index 2ef7047..cf3eb77 100644
--- a/src/configs/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK v11.00.15.05-am62lxx</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.xml b/src/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.xml
index 4b7d298..aa74482 100644
--- a/src/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK v09.02.01.09</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.xml b/src/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.xml
index 4443130..a611434 100644
--- a/src/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK v09.02.01.10</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.xml b/src/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.xml
index 314a511..a8364ba 100644
--- a/src/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK vchromium-09.02.01.09</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.xml b/src/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.xml
index 039ddb1..234a14c 100644
--- a/src/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK vchromium-09.02.01.10</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.xml
index 24938c3..96ea7d1 100644
--- a/src/configs/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK v10.00.07.04</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.xml
index 9ee86f2..518357e 100644
--- a/src/configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK v10.01.10.04</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.xml
index 0d108bc..64dd3a9 100644
--- a/src/configs/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK v11.00.09.04</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.xml
index 65196b1..28af57f 100644
--- a/src/configs/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK v11.01.05.03</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.xml
index 53ecc11..e5122a2 100644
--- a/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK vchromium-10.00.07.04</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.xml
index 5a9df9e..a3f29c5 100644
--- a/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK vchromium-10.01.10.04</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.xml
index 71a9acb..6bf2aff 100644
--- a/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK vchromium-11.00.09.04</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.xml
index 3bd1b8e..43a2e11 100644
--- a/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK vchromium-11.01.05.03</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.xml
index 5793c01..1dfdaeb 100644
--- a/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK vchromium-11.01.12.10</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.xml
index 3d40933..095c0ec 100644
--- a/src/configs/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK vnonqt-11.01.05.03</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.xml
index 93c45d0..70fcb8a 100644
--- a/src/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK vselinux-11.00.09.04</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.xml
index 9231c95..1e96e8a 100644
--- a/src/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.xml
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.xml
@@ -2,7 +2,8 @@
 <config>
     <description>TI Processor SDK vselinux-11.01.05.03</description>
 
-    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
diff --git a/src/templates/local-arago64-v2.conf.xml b/src/templates/local-arago64-v2.conf.xml
index d9d2ae7..797bd39 100644
--- a/src/templates/local-arago64-v2.conf.xml
+++ b/src/templates/local-arago64-v2.conf.xml
@@ -1,4 +1,6 @@
 <local-conf-template name='local-arago64-v2.conf'>
+    <summary>TI oe-layersetup build defaults for Arago 64bit builds v2</summary>
+    <description>TI oe-layersetup build defaults for Arago 64bit builds v2</description>
     <line># CONF_VERSION is increased each time build/conf/ changes incompatibly</line>
     <line>CONF_VERSION = "2"</line>
     <line></line>
diff --git a/src/templates/local-arago64-v3.conf.xml b/src/templates/local-arago64-v3.conf.xml
index c8a5d51..35ba584 100644
--- a/src/templates/local-arago64-v3.conf.xml
+++ b/src/templates/local-arago64-v3.conf.xml
@@ -1,4 +1,6 @@
 <local-conf-template name='local-arago64-v3.conf'>
+    <summary>TI oe-layersetup build defaults for Arago 64bit builds v3</summary>
+    <description>TI oe-layersetup build defaults for Arago 64bit builds v3</description>
     <line># CONF_VERSION is increased each time build/conf/ changes incompatibly</line>
     <line>CONF_VERSION = "2"</line>
     <line></line>
diff --git a/src/templates/local-poky-v2.conf.xml b/src/templates/local-poky-v2.conf.xml
index b45d6c2..d04e653 100644
--- a/src/templates/local-poky-v2.conf.xml
+++ b/src/templates/local-poky-v2.conf.xml
@@ -1,4 +1,6 @@
 <local-conf-template name='local-poky-v2.conf'>
+    <summary>TI oe-layersetup build defaults for Poky builds v2</summary>
+    <description>TI oe-layersetup build defaults for Poky builds v2</description>
     <line># CONF_VERSION is increased each time build/conf/ changes incompatibly</line>
     <line>CONF_VERSION = "2"</line>
     <line></line>
diff --git a/src/templates/local-poky-v3.conf.xml b/src/templates/local-poky-v3.conf.xml
index fa313eb..d09ea38 100644
--- a/src/templates/local-poky-v3.conf.xml
+++ b/src/templates/local-poky-v3.conf.xml
@@ -1,4 +1,6 @@
 <local-conf-template name='local-poky-v3.conf'>
+    <summary>TI oe-layersetup build defaults for Poky builds v3</summary>
+    <description>TI oe-layersetup build defaults for Poky builds v3</description>
     <line># CONF_VERSION is increased each time build/conf/ changes incompatibly</line>
     <line>CONF_VERSION = "2"</line>
     <line></line>
diff --git a/src/templates/local-v2.conf.xml b/src/templates/local-v2.conf.xml
index 49e060c..bbff2fa 100644
--- a/src/templates/local-v2.conf.xml
+++ b/src/templates/local-v2.conf.xml
@@ -1,4 +1,6 @@
 <local-conf-template name='local-v2.conf'>
+    <summary>TI oe-layersetup build defaults for builds v2</summary>
+    <description>TI oe-layersetup build defaults for builds v2</description>
     <line># CONF_VERSION is increased each time build/conf/ changes incompatibly</line>
     <line>CONF_VERSION = "2"</line>
     <line></line>
diff --git a/src/templates/local-v3.conf.xml b/src/templates/local-v3.conf.xml
index e300aaf..fbb619f 100644
--- a/src/templates/local-v3.conf.xml
+++ b/src/templates/local-v3.conf.xml
@@ -1,4 +1,6 @@
 <local-conf-template name='local-v3.conf'>
+    <summary>TI oe-layersetup build defaults for builds v3</summary>
+    <description>TI oe-layersetup build defaults for builds v3</description>
     <line># CONF_VERSION is increased each time build/conf/ changes incompatibly</line>
     <line>CONF_VERSION = "2"</line>
     <line></line>
-- 
2.17.1


