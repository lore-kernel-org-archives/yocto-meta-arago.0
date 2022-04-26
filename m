Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29932C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 20:02:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2204.1651003374820811519
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 13:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xQB5ymOk;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23QK2rkU007805;
	Tue, 26 Apr 2022 15:02:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651003373;
	bh=IdyOtAzPKeXLf/ZRWSNRFWiQrbrj424C+KPenA3fDH4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xQB5ymOkXLXDh24RjJgbAxnE/JRjv/yBxr0wgw1qxP49bdrG/tgsxQMj6yGRvyDVV
	 40oYxdZyVST1omIBeL8ZASAlPpyNgiN9lYPADm+B9FENGC0iyySoc5UXu7dsHK41w9
	 w6ZfxNPYVLe/tZMfFfOhH6RgyH/OWy4OWOk11BIA=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23QK2ra8048027
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Apr 2022 15:02:53 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 15:02:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 15:02:52 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23QK2pgY099348;
	Tue, 26 Apr 2022 15:02:52 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][oe-layersetup PATCH 2/6] Add layers for split meta-ti
 master branch
Date: Tue, 26 Apr 2022 15:02:47 -0500
Message-ID: <20220426200251.19417-2-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220426200251.19417-1-afd@ti.com>
References: <20220426200251.19417-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 20:02:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13794

The latest master meta-ti split into two layers, add new layers here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 configs/arago-master-config.txt      | 2 +-
 configs/distroless-master-config.txt | 2 +-
 configs/poky-master-config.txt       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index bd0ccec..532a145 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -7,7 +7,7 @@ meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-d
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
+meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/distroless-master-config.txt b/configs/distroless-master-config.txt
index 8211bd5..5c55459 100644
--- a/configs/distroless-master-config.txt
+++ b/configs/distroless-master-config.txt
@@ -1,7 +1,7 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 bitbake,git://git.openembedded.org/bitbake,master,HEAD
-meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
+meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
index f213411..b395ff8 100644
--- a/configs/poky-master-config.txt
+++ b/configs/poky-master-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 bitbake,git://git.openembedded.org/bitbake,master,HEAD
 poky,git://git.yoctoproject.org/poky,master,HEAD,layers=meta:meta-poky:meta-yocto-bsp
-meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
+meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
-- 
2.17.1


