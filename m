Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41D4C07E8E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 13:42:56 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.16698.1713966167844770662
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 06:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nivuxQnh;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43ODgk4j087150;
	Wed, 24 Apr 2024 08:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713966166;
	bh=UBl/NRG+9A2O11xI2yiKGG++CCh4bUQImnYkZlr0vFg=;
	h=From:To:Subject:Date;
	b=nivuxQnh45GLb6Pb0IDvK0QN5F3xYGGd+Ug4Bxe05c0kbZT6DlzClegy/TIhS39FU
	 VP8qC+zK+W1IDIi2r8+mYYnP2T3Wc2kfm1h7FD0TR+XuVWMHVcV++mJ0Egdh3M2apT
	 UzPjLewzfP9qH+kLGta2gViv2H+NxIVqMg2CQiQE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43ODgkqE014917
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Apr 2024 08:42:46 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 Apr 2024 08:42:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 Apr 2024 08:42:46 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43ODgk6T095857;
	Wed, 24 Apr 2024 08:42:46 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rzctZ-000112-VZ; Wed, 24 Apr 2024 08:42:46 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] configs: Update scarthgap configs for meta-clang
Date: Wed, 24 Apr 2024 08:42:45 -0500
Message-ID: <20240424134245.3865-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Apr 2024 13:42:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15306

meta-clang has created a scarthgap branch, so update the appropriate
configs to point to it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 configs/arago-scarthgap-config.txt      | 2 +-
 configs/arago-scarthgap-next-config.txt | 2 +-
 configs/arago-scarthgap-wip-config.txt  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
index 5f36770..9b35f25 100644
--- a/configs/arago-scarthgap-config.txt
+++ b/configs/arago-scarthgap-config.txt
@@ -9,7 +9,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,H
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
index 2445cba..2606d3f 100644
--- a/configs/arago-scarthgap-next-config.txt
+++ b/configs/arago-scarthgap-next-config.txt
@@ -17,7 +17,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,H
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
index 0f5e75f..32349d3 100644
--- a/configs/arago-scarthgap-wip-config.txt
+++ b/configs/arago-scarthgap-wip-config.txt
@@ -9,7 +9,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,H
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
-- 
2.17.1


