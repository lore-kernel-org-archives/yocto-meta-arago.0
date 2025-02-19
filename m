Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D60C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 00:52:19 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.12078.1739926337673912897
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Feb 2025 16:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YxkXIJYF;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51J0qE27113783
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 18:52:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739926334;
	bh=HArkJlvjdHFjQ4DaFC88lr4KhPWgqVQjVaKexyLq/w0=;
	h=From:To:CC:Subject:Date;
	b=YxkXIJYFYX5+x31mSnD9cfUrvNjfgXxBvSV2WizbBM6oAk5xZ7IcVhtZbtYz/khom
	 mKxRex8qwTCwEnn9YFTNmCNs1FeqxWP0F4ASC7hJnc8qN6LQuaYBm5y1Fjq/Ge7qw7
	 Jwz/uwA0b2iBlWHsbi8Qu44v06Glj/qomsQKtsxY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51J0qEVL109692
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Feb 2025 18:52:14 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 18:52:14 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 18:52:14 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51J0qE7h021587;
	Tue, 18 Feb 2025 18:52:14 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][oe-layersetup][PATCH] configs/arago-master-next-config: qt5 -> qt6
Date: Tue, 18 Feb 2025 18:52:07 -0600
Message-ID: <20250219005207.2012870-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Feb 2025 00:52:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15855

From: Randolph Sapp <rs@ti.com>

Move the master-next config to use qt6 instead of qt5 now that
master-wip has been verified. Use the dev branch for master builds since
there is no master branch upstream.

Moving forward TI builds of arago will enable and test Qt6 by default,
but unlike before this will not be done in a way that creates an
explicit dependency. This should allow customers and layers that consume
or extend arago to toggle Qt support more easily.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 bitbake-setup/arago-master-next-config.json               | 8 ++++----
 .../arago-master-next-config/bblayers.conf.sample         | 2 +-
 configs/arago-master-next-config.txt                      | 2 +-
 kas/arago-master-next-config.yml                          | 6 +++---
 src/configs/arago-master-next-config.xml                  | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/bitbake-setup/arago-master-next-config.json b/bitbake-setup/arago-master-next-config.json
index 1b9238d..d0065e1 100644
--- a/bitbake-setup/arago-master-next-config.json
+++ b/bitbake-setup/arago-master-next-config.json
@@ -35,16 +35,16 @@
       },
       "path": "meta-arago"
     },
-    "meta-qt5": {
+    "meta-qt6": {
       "git-remote": {
         "remotes": {
           "origin": {
-            "uri": "https://github.com/meta-qt5/meta-qt5.git"
+            "uri": "https://code.qt.io/yocto/meta-qt6.git"
           }
         },
-        "rev": "master"
+        "rev": "dev"
       },
-      "path": "meta-qt5"
+      "path": "meta-qt6"
     },
     "meta-virtualization": {
       "git-remote": {
diff --git a/conf/templates/arago-master-next-config/bblayers.conf.sample b/conf/templates/arago-master-next-config/bblayers.conf.sample
index f70b6af..4f26d30 100644
--- a/conf/templates/arago-master-next-config/bblayers.conf.sample
+++ b/conf/templates/arago-master-next-config/bblayers.conf.sample
@@ -12,7 +12,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-distro
     ##OEROOT##/../meta-arago/meta-arago-extras
     ##OEROOT##/../meta-arago/meta-arago-test
-    ##OEROOT##/../meta-qt5
+    ##OEROOT##/../meta-qt6
     ##OEROOT##/../meta-virtualization
     ##OEROOT##/../meta-openembedded/meta-networking
     ##OEROOT##/../meta-openembedded/meta-python
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-next-config.txt
index 0868327..4076923 100644
--- a/configs/arago-master-next-config.txt
+++ b/configs/arago-master-next-config.txt
@@ -13,7 +13,7 @@ bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
-meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master-next,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
diff --git a/kas/arago-master-next-config.yml b/kas/arago-master-next-config.yml
index 03dadec..a678b03 100644
--- a/kas/arago-master-next-config.yml
+++ b/kas/arago-master-next-config.yml
@@ -15,9 +15,9 @@ repos:
       meta-arago-extras:
       meta-arago-test:
 
-  meta-qt5:
-    url: "https://github.com/meta-qt5/meta-qt5.git"
-    branch: "master"
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "dev"
 
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-master-next-config.xml
index 122258f..415236f 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-master-next-config.xml
@@ -25,7 +25,7 @@
         <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='master' commit='HEAD' disabled='true'>
             <layers/>
         </repo>
-        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='master' commit='HEAD'>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='dev' commit='HEAD'>
             <layers/>
         </repo>
         <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='master' commit='HEAD'>
-- 
2.48.1


