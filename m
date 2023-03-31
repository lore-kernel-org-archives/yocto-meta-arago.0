Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01300C761A6
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 22:04:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.8474.1680300263683648117
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 15:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZqOJZhVZ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32VM4MH6038553;
	Fri, 31 Mar 2023 17:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680300262;
	bh=gli2iJXpDaNHP9u/e/yoGkz8myWJmZlNLCJ3+okfTbQ=;
	h=From:To:Subject:Date;
	b=ZqOJZhVZuTI58zCrfZwtGedvN/A1ZVYTJTwxin6zHq90OmQ2wO3aG9nU78EuZ8Pon
	 3/1nu+DjV/3mZ4AFeiI/IoEJK1L3jPSj93krmrtZpzwQ67fIrdtc1Hz8yppEZajKgt
	 5j6r/g+lRsCQLwHFzeg+hNHXDLiSHFCSzOjnYt74=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32VM4MUP111916
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Mar 2023 17:04:22 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 31
 Mar 2023 17:04:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 31 Mar 2023 17:04:22 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32VM4MBm011990;
	Fri, 31 Mar 2023 17:04:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1piMr8-0005MT-7d; Fri, 31 Mar 2023 17:04:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] images: Add variable to add extra packages from the local.conf
Date: Fri, 31 Mar 2023 17:04:22 -0500
Message-ID: <20230331220422.20570-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 31 Mar 2023 22:04:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14287

The bootstrap, thinlinux and tiny images all had a variable that allowed
for adding additional packages to the image from the local.conf file.
Add this same concept to the default and base images.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-base-image.bb    | 3 +++
 meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
index 13bb8272..815dcff8 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
@@ -8,12 +8,15 @@ require arago-image.inc
 IMAGE_FSTYPES += "cpio.xz"
 IMAGE_FSTYPES:append:dra7xx = " ubifs ubi"
 
+ARAGO_BASE_IMAGE_EXTRA_INSTALL ?= ""
+
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
     ${VIRTUAL-RUNTIME_initramfs} \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', 'ti-test', '', d)} \
+    ${ARAGO_BASE_IMAGE_EXTRA_INSTALL} \
 "
 
 export IMAGE_BASENAME = "tisdk-base-image"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 8d36e561..3b9747c1 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -5,6 +5,8 @@ DESCRIPTION = "Complete Arago TI SDK filesystem image containing complete\
 
 require arago-image.inc
 
+ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL ?= ""
+
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
@@ -24,6 +26,7 @@ IMAGE_INSTALL += "\
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
     ti-analytics \
     ti-demos \
+    ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
 "
 
 export IMAGE_BASENAME = "tisdk-default-image"
-- 
2.17.1


