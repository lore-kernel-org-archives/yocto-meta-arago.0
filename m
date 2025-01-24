Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177D9C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 19:37:20 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1555.1737747438815531938
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Jan 2025 11:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XjPlvM53;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50OJbFuh600553
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 24 Jan 2025 13:37:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737747435;
	bh=43SPyn27KFxXG71rxf/P2v+v7PEvRiATU1zko2UhJWY=;
	h=From:To:CC:Subject:Date;
	b=XjPlvM53Ck1LC37BkViAO5cusmAwm0bgi0P3cHcNzPhl7Bj0hlfB7BiqcZoPpXz9y
	 xWaCAYQYAo6Qz9V2QW5ukD4IOK2s0oO4L2PAiYLXkMS0ZcH0wGSZh3OPT9iXXRxTf7
	 vRUlrYXaREaiIAAu4QlLn9sB4we+saqJpbCN6FnY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50OJbFXI018235;
	Fri, 24 Jan 2025 13:37:15 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 Jan 2025 13:37:15 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 Jan 2025 13:37:14 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50OJbFjS079555;
	Fri, 24 Jan 2025 13:37:15 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][oe-layersetup][master][PATCHv2]  configs/arago-master-*-config: Remove meta-arago-demos
Date: Fri, 24 Jan 2025 13:36:47 -0600
Message-ID: <20250124193647.1729123-1-rs@ti.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 24 Jan 2025 19:37:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15756

From: Randolph Sapp <rs@ti.com>

Remove the meta-arago-demos layer to help break the dependency on
meta-qt5. This comes after a patch in meta-arago-distro that removed all
of the packages from meta-arago-demos. These were the last of the
"demos" in meta-arago and they were only being built for legacy devices.
Demos should primarily be in layers above arago unless they are used for
functionality testing.

These modifications are required as part of the effort to make arago
less dependent on meta-qt5. Moving forward TI builds of arago will
enable and test Qt6 by default, but unlike before this will not be done
in a way that creates an explicit dependency. This should allow
customers and layers that consume or extend arago to toggle Qt support
more easily.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

v2: More verbose commit message following previous feedback

 .../templates/arago-master-chromium-config/bblayers.conf.sample | 1 -
 conf/templates/arago-master-config/bblayers.conf.sample         | 1 -
 conf/templates/arago-master-next-config/bblayers.conf.sample    | 1 -
 conf/templates/arago-master-selinux-config/bblayers.conf.sample | 1 -
 conf/templates/arago-master-wip-config/bblayers.conf.sample     | 1 -
 configs/arago-master-chromium-config.txt                        | 2 +-
 configs/arago-master-config.txt                                 | 2 +-
 configs/arago-master-next-config.txt                            | 2 +-
 configs/arago-master-selinux-config.txt                         | 2 +-
 configs/arago-master-wip-config.txt                             | 2 +-
 kas/arago-master-chromium-config.yml                            | 1 -
 kas/arago-master-config.yml                                     | 1 -
 kas/arago-master-next-config.yml                                | 1 -
 kas/arago-master-selinux-config.yml                             | 1 -
 kas/arago-master-wip-config.yml                                 | 1 -
 src/configs/arago-master-chromium-config.xml                    | 1 -
 src/configs/arago-master-config.xml                             | 1 -
 src/configs/arago-master-next-config.xml                        | 1 -
 src/configs/arago-master-selinux-config.xml                     | 1 -
 src/configs/arago-master-wip-config.xml                         | 1 -
 20 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/conf/templates/arago-master-chromium-config/bblayers.conf.sample b/conf/templates/arago-master-chromium-config/bblayers.conf.sample
index 3e5edee..29beb7d 100644
--- a/conf/templates/arago-master-chromium-config/bblayers.conf.sample
+++ b/conf/templates/arago-master-chromium-config/bblayers.conf.sample
@@ -11,7 +11,6 @@ BBFILES ?= ""
 BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-distro
     ##OEROOT##/../meta-arago/meta-arago-extras
-    ##OEROOT##/../meta-arago/meta-arago-demos
     ##OEROOT##/../meta-arago/meta-arago-test
     ##OEROOT##/../meta-browser/meta-chromium
     ##OEROOT##/../meta-qt5
diff --git a/conf/templates/arago-master-config/bblayers.conf.sample b/conf/templates/arago-master-config/bblayers.conf.sample
index adbccbd..f70b6af 100644
--- a/conf/templates/arago-master-config/bblayers.conf.sample
+++ b/conf/templates/arago-master-config/bblayers.conf.sample
@@ -11,7 +11,6 @@ BBFILES ?= ""
 BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-distro
     ##OEROOT##/../meta-arago/meta-arago-extras
-    ##OEROOT##/../meta-arago/meta-arago-demos
     ##OEROOT##/../meta-arago/meta-arago-test
     ##OEROOT##/../meta-qt5
     ##OEROOT##/../meta-virtualization
diff --git a/conf/templates/arago-master-next-config/bblayers.conf.sample b/conf/templates/arago-master-next-config/bblayers.conf.sample
index adbccbd..f70b6af 100644
--- a/conf/templates/arago-master-next-config/bblayers.conf.sample
+++ b/conf/templates/arago-master-next-config/bblayers.conf.sample
@@ -11,7 +11,6 @@ BBFILES ?= ""
 BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-distro
     ##OEROOT##/../meta-arago/meta-arago-extras
-    ##OEROOT##/../meta-arago/meta-arago-demos
     ##OEROOT##/../meta-arago/meta-arago-test
     ##OEROOT##/../meta-qt5
     ##OEROOT##/../meta-virtualization
diff --git a/conf/templates/arago-master-selinux-config/bblayers.conf.sample b/conf/templates/arago-master-selinux-config/bblayers.conf.sample
index 51b8551..094ec81 100644
--- a/conf/templates/arago-master-selinux-config/bblayers.conf.sample
+++ b/conf/templates/arago-master-selinux-config/bblayers.conf.sample
@@ -11,7 +11,6 @@ BBFILES ?= ""
 BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-distro
     ##OEROOT##/../meta-arago/meta-arago-extras
-    ##OEROOT##/../meta-arago/meta-arago-demos
     ##OEROOT##/../meta-arago/meta-arago-test
     ##OEROOT##/../meta-selinux
     ##OEROOT##/../meta-qt5
diff --git a/conf/templates/arago-master-wip-config/bblayers.conf.sample b/conf/templates/arago-master-wip-config/bblayers.conf.sample
index adbccbd..f70b6af 100644
--- a/conf/templates/arago-master-wip-config/bblayers.conf.sample
+++ b/conf/templates/arago-master-wip-config/bblayers.conf.sample
@@ -11,7 +11,6 @@ BBFILES ?= ""
 BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-distro
     ##OEROOT##/../meta-arago/meta-arago-extras
-    ##OEROOT##/../meta-arago/meta-arago-demos
     ##OEROOT##/../meta-arago/meta-arago-test
     ##OEROOT##/../meta-qt5
     ##OEROOT##/../meta-virtualization
diff --git a/configs/arago-master-chromium-config.txt b/configs/arago-master-chromium-config.txt
index f15ab67..df3f0ba 100644
--- a/configs/arago-master-chromium-config.txt
+++ b/configs/arago-master-chromium-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index 1cde5d9..7a1a481 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-next-config.txt
index 210bd68..0868327 100644
--- a/configs/arago-master-next-config.txt
+++ b/configs/arago-master-next-config.txt
@@ -10,7 +10,7 @@ MOTD: NOTE: to point the recipe to the appropriate cicd/next branch for that rec
 MOTD: NOTE:
 
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,master-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,master-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-master-selinux-config.txt
index ed4ecdd..5cf0631 100644
--- a/configs/arago-master-selinux-config.txt
+++ b/configs/arago-master-selinux-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip-config.txt
index a85e1fb..eb9c49d 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromium-config.yml
index bf8c5f3..837ef0e 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-master-chromium-config.yml
@@ -13,7 +13,6 @@ repos:
     layers:
       meta-arago-distro:
       meta-arago-extras:
-      meta-arago-demos:
       meta-arago-test:
 
   meta-browser:
diff --git a/kas/arago-master-config.yml b/kas/arago-master-config.yml
index 6a21d96..5434891 100644
--- a/kas/arago-master-config.yml
+++ b/kas/arago-master-config.yml
@@ -13,7 +13,6 @@ repos:
     layers:
       meta-arago-distro:
       meta-arago-extras:
-      meta-arago-demos:
       meta-arago-test:
 
   meta-qt5:
diff --git a/kas/arago-master-next-config.yml b/kas/arago-master-next-config.yml
index 6514b9d..03dadec 100644
--- a/kas/arago-master-next-config.yml
+++ b/kas/arago-master-next-config.yml
@@ -13,7 +13,6 @@ repos:
     layers:
       meta-arago-distro:
       meta-arago-extras:
-      meta-arago-demos:
       meta-arago-test:
 
   meta-qt5:
diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-master-selinux-config.yml
index 922ab89..46b32c7 100644
--- a/kas/arago-master-selinux-config.yml
+++ b/kas/arago-master-selinux-config.yml
@@ -13,7 +13,6 @@ repos:
     layers:
       meta-arago-distro:
       meta-arago-extras:
-      meta-arago-demos:
       meta-arago-test:
 
   meta-selinux:
diff --git a/kas/arago-master-wip-config.yml b/kas/arago-master-wip-config.yml
index 429bb06..f994926 100644
--- a/kas/arago-master-wip-config.yml
+++ b/kas/arago-master-wip-config.yml
@@ -13,7 +13,6 @@ repos:
     layers:
       meta-arago-distro:
       meta-arago-extras:
-      meta-arago-demos:
       meta-arago-test:
 
   meta-qt5:
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/arago-master-chromium-config.xml
index 9abaf97..ec58ea9 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-master-chromium-config.xml
@@ -13,7 +13,6 @@
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-demos</layer>
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master-config.xml
index 8380a57..94f3ac1 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-config.xml
@@ -13,7 +13,6 @@
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-demos</layer>
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-master-next-config.xml
index 0eee296..122258f 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-master-next-config.xml
@@ -14,7 +14,6 @@
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-demos</layer>
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arago-master-selinux-config.xml
index 6ecea87..0c5019f 100644
--- a/src/configs/arago-master-selinux-config.xml
+++ b/src/configs/arago-master-selinux-config.xml
@@ -13,7 +13,6 @@
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-demos</layer>
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-master-wip-config.xml
index 74718d5..ded9e5a 100644
--- a/src/configs/arago-master-wip-config.xml
+++ b/src/configs/arago-master-wip-config.xml
@@ -13,7 +13,6 @@
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-demos</layer>
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
-- 
2.47.1


