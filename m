Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E545C83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 15:01:04 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.43314.1753110053990374841
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 08:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Pd8YUH3G;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56LF0o8d830915;
	Mon, 21 Jul 2025 10:00:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753110050;
	bh=uNmYzFyjeGplGnN/wfykUyXJUnyVVIV4Gb3C94F831Q=;
	h=From:To:Subject:Date;
	b=Pd8YUH3GfY03DYMmbYxDZtYmZsalqZOQ2aUvEAH0cSjdkqnCs6F52+JB33oc1vj5G
	 yEMBSi/XsVWA/ijZdv69NsmEdh5ZvV8vl56fLa5aCGul3R5lvpqq95lhbROflfJGpX
	 7haspLKGeVNZa6hgPjx7ucIpOe9tAvZxIRmh2bVE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56LF0oYD3380539
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 21 Jul 2025 10:00:50 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 10:00:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 10:00:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56LF0oab4018243;
	Mon, 21 Jul 2025 10:00:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uds0Y-0006Dc-38; Mon, 21 Jul 2025 10:00:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] conf: Add poky scarthgap-wip config
Date: Mon, 21 Jul 2025 10:00:50 -0500
Message-ID: <20250721150050.23865-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 21 Jul 2025 15:01:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16315

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...arthgap-config.json => poky-scarthgap-wip-config.json} | 8 ++++----
 .../bblayers.conf.sample                                  | 0
 .../conf-notes.txt                                        | 0
 conf/templates/poky-scarthgap-wip-config/conf-summary.txt | 1 +
 .../local.conf.sample                                     | 0
 ...scarthgap-config.txt => poky-scarthgap-wip-config.txt} | 4 ++--
 ...scarthgap-config.yml => poky-scarthgap-wip-config.yml} | 4 ++--
 ...scarthgap-config.xml => poky-scarthgap-wip-config.xml} | 6 +++---
 8 files changed, 12 insertions(+), 11 deletions(-)
 copy bitbake-setup/{poky-scarthgap-config.json => poky-scarthgap-wip-config.json} (90%)
 copy conf/templates/{poky-kirkstone-config => poky-scarthgap-wip-config}/bblayers.conf.sample (100%)
 copy conf/templates/{poky-kirkstone-config => poky-scarthgap-wip-config}/conf-notes.txt (100%)
 create mode 100644 conf/templates/poky-scarthgap-wip-config/conf-summary.txt
 copy conf/templates/{poky-kirkstone-config => poky-scarthgap-wip-config}/local.conf.sample (100%)
 copy configs/{poky-scarthgap-config.txt => poky-scarthgap-wip-config.txt} (76%)
 copy kas/{poky-scarthgap-config.yml => poky-scarthgap-wip-config.yml} (93%)
 copy src/configs/{poky-scarthgap-config.xml => poky-scarthgap-wip-config.xml} (91%)

diff --git a/bitbake-setup/poky-scarthgap-config.json b/bitbake-setup/poky-scarthgap-wip-config.json
similarity index 90%
copy from bitbake-setup/poky-scarthgap-config.json
copy to bitbake-setup/poky-scarthgap-wip-config.json
index 7d4cb50..270ea38 100644
--- a/bitbake-setup/poky-scarthgap-config.json
+++ b/bitbake-setup/poky-scarthgap-wip-config.json
@@ -1,6 +1,6 @@
 {
   "version": "1.0",
-  "description": "Poky reference distribution for scarthgap",
+  "description": "Poky reference distribution for scarthgap-wip",
   "sources": {
     "oe-layersetup": {
       "git-remote": {
@@ -42,7 +42,7 @@
             "uri": "https://git.yoctoproject.org/meta-ti"
           }
         },
-        "rev": "scarthgap"
+        "rev": "scarthgap-wip"
       },
       "path": "meta-ti"
     },
@@ -75,7 +75,7 @@
             "uri": "https://git.yoctoproject.org/meta-arago"
           }
         },
-        "rev": "scarthgap"
+        "rev": "scarthgap-wip"
       },
       "path": "meta-arago"
     }
@@ -84,7 +84,7 @@
     "bitbake-setup": {
       "default": {
         "description": "Default build configuration",
-         "template": "oe-layersetup-poky-scarthgap-config",
+         "template": "oe-layersetup-poky-scarthgap-wip-config",
          "targets": [ "bitbake -k core_image_minimal" ]
       }
     }
diff --git a/conf/templates/poky-kirkstone-config/bblayers.conf.sample b/conf/templates/poky-scarthgap-wip-config/bblayers.conf.sample
similarity index 100%
copy from conf/templates/poky-kirkstone-config/bblayers.conf.sample
copy to conf/templates/poky-scarthgap-wip-config/bblayers.conf.sample
diff --git a/conf/templates/poky-kirkstone-config/conf-notes.txt b/conf/templates/poky-scarthgap-wip-config/conf-notes.txt
similarity index 100%
copy from conf/templates/poky-kirkstone-config/conf-notes.txt
copy to conf/templates/poky-scarthgap-wip-config/conf-notes.txt
diff --git a/conf/templates/poky-scarthgap-wip-config/conf-summary.txt b/conf/templates/poky-scarthgap-wip-config/conf-summary.txt
new file mode 100644
index 0000000..87ba526
--- /dev/null
+++ b/conf/templates/poky-scarthgap-wip-config/conf-summary.txt
@@ -0,0 +1 @@
+Poky reference distribution for scarthgap-wip
diff --git a/conf/templates/poky-kirkstone-config/local.conf.sample b/conf/templates/poky-scarthgap-wip-config/local.conf.sample
similarity index 100%
copy from conf/templates/poky-kirkstone-config/local.conf.sample
copy to conf/templates/poky-scarthgap-wip-config/local.conf.sample
diff --git a/configs/poky-scarthgap-config.txt b/configs/poky-scarthgap-wip-config.txt
similarity index 76%
copy from configs/poky-scarthgap-config.txt
copy to configs/poky-scarthgap-wip-config.txt
index 15bb088..ab354ac 100644
--- a/configs/poky-scarthgap-config.txt
+++ b/configs/poky-scarthgap-wip-config.txt
@@ -3,11 +3,11 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-yocto,https://git.yoctoproject.org/meta-yocto,scarthgap,HEAD,layers=meta-poky:meta-yocto-bsp
-meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 #meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
-meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-extras:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-wip,HEAD,layers=meta-arago-extras:meta-arago-test
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
diff --git a/kas/poky-scarthgap-config.yml b/kas/poky-scarthgap-wip-config.yml
similarity index 93%
copy from kas/poky-scarthgap-config.yml
copy to kas/poky-scarthgap-wip-config.yml
index 0344136..b08571d 100644
--- a/kas/poky-scarthgap-config.yml
+++ b/kas/poky-scarthgap-wip-config.yml
@@ -16,7 +16,7 @@ repos:
 
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
-    branch: "scarthgap"
+    branch: "scarthgap-wip"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -36,7 +36,7 @@ repos:
 
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
-    branch: "scarthgap"
+    branch: "scarthgap-wip"
     layers:
       meta-arago-extras:
       meta-arago-test:
diff --git a/src/configs/poky-scarthgap-config.xml b/src/configs/poky-scarthgap-wip-config.xml
similarity index 91%
copy from src/configs/poky-scarthgap-config.xml
copy to src/configs/poky-scarthgap-wip-config.xml
index 8f0043d..319b89d 100644
--- a/src/configs/poky-scarthgap-config.xml
+++ b/src/configs/poky-scarthgap-wip-config.xml
@@ -1,6 +1,6 @@
 <?xml version='1.0'?>
 <config>
-    <description>Poky reference distribution for scarthgap</description>
+    <description>Poky reference distribution for scarthgap-wip</description>
 
     <xi:include href='../common/targets_poky.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
@@ -15,7 +15,7 @@
                 <layer>meta-yocto-bsp</layer>
             </layers>
         </repo>
-        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap-wip' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
                 <layer>meta-ti-bsp</layer>
@@ -35,7 +35,7 @@
                 <layer>meta</layer>
             </layers>
         </repo>
-        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='HEAD'>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap-wip' commit='HEAD'>
             <layers>
                 <layer>meta-arago-extras</layer>
                 <layer>meta-arago-test</layer>
-- 
2.17.1


