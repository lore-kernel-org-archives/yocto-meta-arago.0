Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E430C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 20:12:33 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.21583.1737663146259768917
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 12:12:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YI/TS30A;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: detheridge@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50NKCOjl1257432
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 14:12:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737663144;
	bh=hhddIHMT2CUvADN4FyJgiVWRM7s04FBwQAzni5IxlkY=;
	h=From:To:Subject:Date;
	b=YI/TS30A4zfjH1efnmT3pzXuCH0nrhGIX3THMAhNl/Z0jHMITPL/5itPVBOzszswo
	 PoCUir5yIjCq2g/JQsuEfxTtb6FC/4a+keKBJjP3cEmagRJU84j8/QUfcbWlpqTJjb
	 CwAcP4jDMlu/PzQlngIaPyK7NKm8vDqENhq6v+Tc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50NKCOfh092546
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jan 2025 14:12:24 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 Jan 2025 14:12:24 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 Jan 2025 14:12:24 -0600
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.58])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NKCOU8030736;
	Thu, 23 Jan 2025 14:12:24 -0600
From: Darren Etheridge <detheridge@ti.com>
To: <rs@ti.com>, <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: scarthgap update meta-browser layer sha
Date: Thu, 23 Jan 2025 14:12:15 -0600
Message-ID: <20250123201215.2812931-1-detheridge@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Jan 2025 20:12:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15745

Update the various Scarthgap config files to point the meta-browser layer at the
correct sha for Chromium 130.0.6723.91.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
---
 configs/arago-scarthgap-chromium-config.txt     | 2 +-
 configs/arago-scarthgap-config.txt              | 2 +-
 configs/arago-scarthgap-next-config.txt         | 2 +-
 configs/arago-scarthgap-selinux-config.txt      | 2 +-
 configs/arago-scarthgap-wip-config.txt          | 2 +-
 kas/arago-scarthgap-chromium-config.yml         | 2 +-
 src/configs/arago-scarthgap-chromium-config.xml | 2 +-
 src/configs/arago-scarthgap-config.xml          | 2 +-
 src/configs/arago-scarthgap-next-config.xml     | 2 +-
 src/configs/arago-scarthgap-selinux-config.xml  | 2 +-
 src/configs/arago-scarthgap-wip-config.xml      | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/configs/arago-scarthgap-chromium-config.txt b/configs/arago-scarthgap-chromium-config.txt
index 9a1bd08..61d0bdb 100644
--- a/configs/arago-scarthgap-chromium-config.txt
+++ b/configs/arago-scarthgap-chromium-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
-meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
index 3275f35..5c7adcb 100644
--- a/configs/arago-scarthgap-config.txt
+++ b/configs/arago-scarthgap-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
index 58e8f96..8e96289 100644
--- a/configs/arago-scarthgap-next-config.txt
+++ b/configs/arago-scarthgap-next-config.txt
@@ -11,7 +11,7 @@ MOTD: NOTE:
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-selinux-config.txt b/configs/arago-scarthgap-selinux-config.txt
index 17dc6a4..79a1136 100644
--- a/configs/arago-scarthgap-selinux-config.txt
+++ b/configs/arago-scarthgap-selinux-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
 meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
index 8dd69c8..4cc4556 100644
--- a/configs/arago-scarthgap-wip-config.txt
+++ b/configs/arago-scarthgap-wip-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
diff --git a/kas/arago-scarthgap-chromium-config.yml b/kas/arago-scarthgap-chromium-config.yml
index 35e9e36..a6d5a51 100644
--- a/kas/arago-scarthgap-chromium-config.yml
+++ b/kas/arago-scarthgap-chromium-config.yml
@@ -19,7 +19,7 @@ repos:
   meta-browser:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
-    commit: "1ed2254d72a4c25879014c98be287a7e3e22904c"
+    commit: "68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4"
     layers:
       meta-chromium:
 
diff --git a/src/configs/arago-scarthgap-chromium-config.xml b/src/configs/arago-scarthgap-chromium-config.xml
index 6ccf049..739ab88 100644
--- a/src/configs/arago-scarthgap-chromium-config.xml
+++ b/src/configs/arago-scarthgap-chromium-config.xml
@@ -17,7 +17,7 @@
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
-        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c'>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-scarthgap-config.xml b/src/configs/arago-scarthgap-config.xml
index 5efd7cc..dc960b4 100644
--- a/src/configs/arago-scarthgap-config.xml
+++ b/src/configs/arago-scarthgap-config.xml
@@ -17,7 +17,7 @@
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
-        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c' disabled='true'>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4' disabled='true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-scarthgap-next-config.xml b/src/configs/arago-scarthgap-next-config.xml
index f31c917..b8c096d 100644
--- a/src/configs/arago-scarthgap-next-config.xml
+++ b/src/configs/arago-scarthgap-next-config.xml
@@ -18,7 +18,7 @@
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
-        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c' disabled='true'>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4' disabled='true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-scarthgap-selinux-config.xml b/src/configs/arago-scarthgap-selinux-config.xml
index f0d8f14..e580d4c 100644
--- a/src/configs/arago-scarthgap-selinux-config.xml
+++ b/src/configs/arago-scarthgap-selinux-config.xml
@@ -17,7 +17,7 @@
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
-        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c' disabled='true'>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4' disabled='true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-scarthgap-wip-config.xml b/src/configs/arago-scarthgap-wip-config.xml
index 667bf89..d330ef2 100644
--- a/src/configs/arago-scarthgap-wip-config.xml
+++ b/src/configs/arago-scarthgap-wip-config.xml
@@ -17,7 +17,7 @@
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
-        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c' disabled='true'>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4' disabled='true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
-- 
2.34.1


