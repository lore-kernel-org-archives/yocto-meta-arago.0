Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138B0C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 15:11:47 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.16200.1714662699134707667
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 May 2024 08:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Cg2Q6Oo8;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442FBbuq061515;
	Thu, 2 May 2024 10:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714662697;
	bh=VOLHjq1as7qMHfGdocDBi5PitubK2iZQ+UBbW1lBvDo=;
	h=From:To:Subject:Date;
	b=Cg2Q6Oo8XISoc1iSTZhoj4fGwPGo3ctSOI0kXcMIZZpC650Y0GzdL7/VWx2NV7/9n
	 TCSRMRK/mW8mBnHQxE37mJB+sa8XJt4jl7QQPwLu1yM33O8zThG0+shqcZc6AR5d68
	 mDSDog5NUcmcllM/iZaJfHQADa0JA6FkqvRaasO0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442FBbQp010167
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 May 2024 10:11:37 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 10:11:37 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 10:11:37 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442FBbG6105888;
	Thu, 2 May 2024 10:11:37 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1s2Y5x-0007Oa-0B; Thu, 02 May 2024 10:11:37 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] configs: Update scarthgap configs for meta-arm
Date: Thu, 2 May 2024 10:11:36 -0500
Message-ID: <20240502151136.28389-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 02 May 2024 15:11:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15322

meta-arm has created a scarthgap branch, so update the appropriate
configs to point to it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 configs/arago-scarthgap-config.txt      | 2 +-
 configs/arago-scarthgap-next-config.txt | 2 +-
 configs/arago-scarthgap-wip-config.txt  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
index 9b35f25..bd2df66 100644
--- a/configs/arago-scarthgap-config.txt
+++ b/configs/arago-scarthgap-config.txt
@@ -8,7 +8,7 @@ meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
index 2606d3f..177410a 100644
--- a/configs/arago-scarthgap-next-config.txt
+++ b/configs/arago-scarthgap-next-config.txt
@@ -16,7 +16,7 @@ meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
index 32349d3..bae0606 100644
--- a/configs/arago-scarthgap-wip-config.txt
+++ b/configs/arago-scarthgap-wip-config.txt
@@ -8,7 +8,7 @@ meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-- 
2.17.1


