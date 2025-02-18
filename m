Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FA8C021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 16:33:36 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.67.1739896406300195764
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Feb 2025 08:33:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nWaQ+HFK;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51IGXPag040928
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 10:33:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739896405;
	bh=G4whZ9tycx+7liPoP7i1LqM06j5WV9aMQZVBLo+LVbk=;
	h=From:To:Subject:Date;
	b=nWaQ+HFKPHIPOOazJasylOvlen3mfi6msEhzaZxa3ledK2VOLCjt1k8sE7Qira0Ad
	 qgC+FuZt7tMJSteAilena1trXKwfsAxqfG/a7V21gUO4oCEQfPvO249zqiIkRgtsp0
	 XUy4or8L+/s0QuEhax28tri+UCsyIqfSOxsaDCOo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51IGXPXP032761
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Feb 2025 10:33:25 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 10:33:25 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 10:33:25 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IGXOj5097132;
	Tue, 18 Feb 2025 10:33:24 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tkQXE-000721-NK; Tue, 18 Feb 2025 10:33:24 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] configs/arago-scarthgap-*-config: Remove meta-arago-demos
Date: Tue, 18 Feb 2025 10:33:24 -0600
Message-ID: <20250218163324.26990-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Feb 2025 16:33:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15853

Now that initial testing for removing meta-arago-demos has completed and
it has been accepted onto scarthgap-next, we need to remove it from
oe-layersetup as well for scarthgap-next and scarthgap so that the CICD flow
has a chance to build correctly.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../arago-scarthgap-chromium-config/bblayers.conf.sample     | 1 -
 conf/templates/arago-scarthgap-config/bblayers.conf.sample   | 1 -
 .../arago-scarthgap-next-config/bblayers.conf.sample         | 1 -
 .../arago-scarthgap-selinux-config/bblayers.conf.sample      | 1 -
 configs/arago-scarthgap-chromium-config.txt                  | 2 +-
 configs/arago-scarthgap-config.txt                           | 2 +-
 configs/arago-scarthgap-next-config.txt                      | 5 +++--
 configs/arago-scarthgap-selinux-config.txt                   | 2 +-
 kas/arago-scarthgap-chromium-config.yml                      | 1 -
 kas/arago-scarthgap-config.yml                               | 1 -
 kas/arago-scarthgap-next-config.yml                          | 1 -
 kas/arago-scarthgap-selinux-config.yml                       | 1 -
 src/configs/arago-scarthgap-chromium-config.xml              | 1 -
 src/configs/arago-scarthgap-config.xml                       | 1 -
 src/configs/arago-scarthgap-next-config.xml                  | 1 -
 src/configs/arago-scarthgap-selinux-config.xml               | 1 -
 16 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample
index 3e5edee..29beb7d 100644
--- a/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample
@@ -11,7 +11,6 @@ BBFILES ?= ""
 BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-distro
     ##OEROOT##/../meta-arago/meta-arago-extras
-    ##OEROOT##/../meta-arago/meta-arago-demos
     ##OEROOT##/../meta-arago/meta-arago-test
     ##OEROOT##/../meta-browser/meta-chromium
     ##OEROOT##/../meta-qt5
diff --git a/conf/templates/arago-scarthgap-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-config/bblayers.conf.sample
index adbccbd..f70b6af 100644
--- a/conf/templates/arago-scarthgap-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-config/bblayers.conf.sample
@@ -11,7 +11,6 @@ BBFILES ?= ""
 BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-distro
     ##OEROOT##/../meta-arago/meta-arago-extras
-    ##OEROOT##/../meta-arago/meta-arago-demos
     ##OEROOT##/../meta-arago/meta-arago-test
     ##OEROOT##/../meta-qt5
     ##OEROOT##/../meta-virtualization
diff --git a/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample
index adbccbd..f70b6af 100644
--- a/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample
@@ -11,7 +11,6 @@ BBFILES ?= ""
 BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-distro
     ##OEROOT##/../meta-arago/meta-arago-extras
-    ##OEROOT##/../meta-arago/meta-arago-demos
     ##OEROOT##/../meta-arago/meta-arago-test
     ##OEROOT##/../meta-qt5
     ##OEROOT##/../meta-virtualization
diff --git a/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample
index 51b8551..094ec81 100644
--- a/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample
@@ -11,7 +11,6 @@ BBFILES ?= ""
 BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-distro
     ##OEROOT##/../meta-arago/meta-arago-extras
-    ##OEROOT##/../meta-arago/meta-arago-demos
     ##OEROOT##/../meta-arago/meta-arago-test
     ##OEROOT##/../meta-selinux
     ##OEROOT##/../meta-qt5
diff --git a/configs/arago-scarthgap-chromium-config.txt b/configs/arago-scarthgap-chromium-config.txt
index 61d0bdb..9f500fa 100644
--- a/configs/arago-scarthgap-chromium-config.txt
+++ b/configs/arago-scarthgap-chromium-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
index 5c7adcb..6513be5 100644
--- a/configs/arago-scarthgap-config.txt
+++ b/configs/arago-scarthgap-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
index 69fee39..5d0915b 100644
--- a/configs/arago-scarthgap-next-config.txt
+++ b/configs/arago-scarthgap-next-config.txt
@@ -10,7 +10,7 @@ MOTD: NOTE: to point the recipe to the appropriate cicd/next branch for that rec
 MOTD: NOTE:
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
@@ -26,12 +26,13 @@ OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
 
 LOCALCONF:OVERRIDES:append = ":recipe-${@os.path.basename(d.getVar('FILE'))}"
-LOCALCONF:BRANCH:recipe-ltp-ddt_20250130.bb = "cicd"
+LOCALCONF:BRANCH:recipe-ltp-ddt_20240129.bb = "cicd"
 LOCALCONF:BRANCH:recipe-cadence-mhdp-fw_git.bb = "ti-linux-firmware-next"
 LOCALCONF:BRANCH:recipe-cnm-wave-fw_git.bb = "ti-linux-firmware-next"
 LOCALCONF:BRANCH:recipe-goodix-fw_git.bb = "ti-linux-firmware-next"
 LOCALCONF:BRANCH:recipe-linux-ti-staging_6.12.bb = "ti-linux-6.12.y-cicd"
 LOCALCONF:BRANCH:recipe-linux-ti-staging-rt_6.12.bb = "ti-linux-6.12.y-cicd"
+LOCALCONF:BRANCH:recipe-linux-ti-staging-systest_6.12.bb = "ti-linux-6.12.y-cicd"
 LOCALCONF:BRANCH:recipe-prueth-fw_5.6.15.bb = "ti-linux-firmware-next"
 LOCALCONF:BRANCH:recipe-pruhsr-fw_2.17.25.bb = "ti-linux-firmware-next"
 LOCALCONF:BRANCH:recipe-pruprp-fw_2.17.25.bb = "ti-linux-firmware-next"
diff --git a/configs/arago-scarthgap-selinux-config.txt b/configs/arago-scarthgap-selinux-config.txt
index 79a1136..d27bada 100644
--- a/configs/arago-scarthgap-selinux-config.txt
+++ b/configs/arago-scarthgap-selinux-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
 meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
diff --git a/kas/arago-scarthgap-chromium-config.yml b/kas/arago-scarthgap-chromium-config.yml
index a6d5a51..9e2bbb0 100644
--- a/kas/arago-scarthgap-chromium-config.yml
+++ b/kas/arago-scarthgap-chromium-config.yml
@@ -13,7 +13,6 @@ repos:
     layers:
       meta-arago-distro:
       meta-arago-extras:
-      meta-arago-demos:
       meta-arago-test:
 
   meta-browser:
diff --git a/kas/arago-scarthgap-config.yml b/kas/arago-scarthgap-config.yml
index 5ce2d76..87864ec 100644
--- a/kas/arago-scarthgap-config.yml
+++ b/kas/arago-scarthgap-config.yml
@@ -13,7 +13,6 @@ repos:
     layers:
       meta-arago-distro:
       meta-arago-extras:
-      meta-arago-demos:
       meta-arago-test:
 
   meta-qt5:
diff --git a/kas/arago-scarthgap-next-config.yml b/kas/arago-scarthgap-next-config.yml
index 75d6cf7..c6dc88c 100644
--- a/kas/arago-scarthgap-next-config.yml
+++ b/kas/arago-scarthgap-next-config.yml
@@ -13,7 +13,6 @@ repos:
     layers:
       meta-arago-distro:
       meta-arago-extras:
-      meta-arago-demos:
       meta-arago-test:
 
   meta-qt5:
diff --git a/kas/arago-scarthgap-selinux-config.yml b/kas/arago-scarthgap-selinux-config.yml
index 16235e8..ea839f3 100644
--- a/kas/arago-scarthgap-selinux-config.yml
+++ b/kas/arago-scarthgap-selinux-config.yml
@@ -13,7 +13,6 @@ repos:
     layers:
       meta-arago-distro:
       meta-arago-extras:
-      meta-arago-demos:
       meta-arago-test:
 
   meta-selinux:
diff --git a/src/configs/arago-scarthgap-chromium-config.xml b/src/configs/arago-scarthgap-chromium-config.xml
index 739ab88..c581453 100644
--- a/src/configs/arago-scarthgap-chromium-config.xml
+++ b/src/configs/arago-scarthgap-chromium-config.xml
@@ -13,7 +13,6 @@
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-demos</layer>
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
diff --git a/src/configs/arago-scarthgap-config.xml b/src/configs/arago-scarthgap-config.xml
index dc960b4..3f5d6b0 100644
--- a/src/configs/arago-scarthgap-config.xml
+++ b/src/configs/arago-scarthgap-config.xml
@@ -13,7 +13,6 @@
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-demos</layer>
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
diff --git a/src/configs/arago-scarthgap-next-config.xml b/src/configs/arago-scarthgap-next-config.xml
index b8c096d..f98a1a8 100644
--- a/src/configs/arago-scarthgap-next-config.xml
+++ b/src/configs/arago-scarthgap-next-config.xml
@@ -14,7 +14,6 @@
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-demos</layer>
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
diff --git a/src/configs/arago-scarthgap-selinux-config.xml b/src/configs/arago-scarthgap-selinux-config.xml
index e580d4c..1246f61 100644
--- a/src/configs/arago-scarthgap-selinux-config.xml
+++ b/src/configs/arago-scarthgap-selinux-config.xml
@@ -13,7 +13,6 @@
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-demos</layer>
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
-- 
2.17.1


