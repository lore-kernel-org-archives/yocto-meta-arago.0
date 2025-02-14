Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0D5C021A4
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 22:25:12 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.33657.1739571909002113162
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 14 Feb 2025 14:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SYpi6KNG;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51EMP5AQ105129
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2025 16:25:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739571905;
	bh=8ZyxA/YEsUy9jqWme5fOmVVSWAKBdvymmIXJJvu9beU=;
	h=From:To:CC:Subject:Date;
	b=SYpi6KNGaCyMNcHPNENRbN9b5WkfhfM3vkdT19cR5x8yIUVQBvTEsps+XD9NO1NUW
	 RY6E7i5Qar7143iakGZ2EuHNLgEOZ9DFmFO29P1PzpgkIDzNY2JXPH+AA8wPzmwbHW
	 ifek1zNdoxiRBfVBYR9ecbRlAttuz/kQt6Qh/8Lk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51EMP5PF000968
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Feb 2025 16:25:05 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Feb 2025 16:25:05 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Feb 2025 16:25:05 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51EMP5RY126866;
	Fri, 14 Feb 2025 16:25:05 -0600
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][oe-layersetup][PATCH]  configs/arago-scarthgap-wip-config: Remove meta-arago-demos
Date: Fri, 14 Feb 2025 16:24:58 -0600
Message-ID: <20250214222458.420631-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 14 Feb 2025 22:25:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15851

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

The changes to scarthgap-next and scarthgap will come as the removal
patch in meta-arago makes it way through the CICD process.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample | 1 -
 configs/arago-scarthgap-wip-config.txt                         | 2 +-
 kas/arago-scarthgap-wip-config.yml                             | 1 -
 src/configs/arago-scarthgap-wip-config.xml                     | 1 -
 4 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample
index adbccbd..f70b6af 100644
--- a/conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample
@@ -11,7 +11,6 @@ BBFILES ?= ""
 BBLAYERS ?= " \
     ##OEROOT##/../meta-arago/meta-arago-distro
     ##OEROOT##/../meta-arago/meta-arago-extras
-    ##OEROOT##/../meta-arago/meta-arago-demos
     ##OEROOT##/../meta-arago/meta-arago-test
     ##OEROOT##/../meta-qt5
     ##OEROOT##/../meta-virtualization
diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
index 4cc4556..dfa65b0 100644
--- a/configs/arago-scarthgap-wip-config.txt
+++ b/configs/arago-scarthgap-wip-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
diff --git a/kas/arago-scarthgap-wip-config.yml b/kas/arago-scarthgap-wip-config.yml
index 4614b81..7f4fc3f 100644
--- a/kas/arago-scarthgap-wip-config.yml
+++ b/kas/arago-scarthgap-wip-config.yml
@@ -13,7 +13,6 @@ repos:
     layers:
       meta-arago-distro:
       meta-arago-extras:
-      meta-arago-demos:
       meta-arago-test:
 
   meta-qt5:
diff --git a/src/configs/arago-scarthgap-wip-config.xml b/src/configs/arago-scarthgap-wip-config.xml
index d330ef2..031ed52 100644
--- a/src/configs/arago-scarthgap-wip-config.xml
+++ b/src/configs/arago-scarthgap-wip-config.xml
@@ -13,7 +13,6 @@
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-demos</layer>
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
-- 
2.48.1


