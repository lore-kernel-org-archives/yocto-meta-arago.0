Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A493C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 19:14:17 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.4266.1707419655252892829
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 11:14:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KXTYQij3;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: detheridge@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418JEDKA122331;
	Thu, 8 Feb 2024 13:14:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707419653;
	bh=E0XmUUiBcHVsbMeUitYgo6Gv5Nu7R3FyRZaeRNb1cwY=;
	h=From:To:CC:Subject:Date;
	b=KXTYQij3xufTEuO9loUqoLIGTgz2W73usTe40bSdUBXhlBHT8fPvP53ckrvtaPdFv
	 pLyaDHxwZSiSBttiCxqhxHm6/Ejk78bUTjwdJEpO2duf2OM7NGTLZaYcyTAHzJOPpS
	 mPpKYxMvmhAKw1FYFLXdNot79Kvf9oTZ4iKUiPzI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418JEDrq012082
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 13:14:13 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 13:14:13 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 13:14:13 -0600
Received: from uda0867391.dal.design.ti.com (uda0867391.dhcp.ti.com [128.247.81.32])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418JED4o085167;
	Thu, 8 Feb 2024 13:14:13 -0600
From: <detheridge@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <rs@ti.com>, <detheridge@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] oe-layersetup: configs: add meta-clang into the kirkstone configs
Date: Thu, 8 Feb 2024 13:14:12 -0600
Message-ID: <20240208191412.1382-1-detheridge@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Feb 2024 19:14:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15138

From: Darren Etheridge <detheridge@ti.com>

Add meta-clang into the 3 kirkstone configs.  meta-clang is pinned to
the kirkstone-clang12 branch because this is what we will be using for
the chromium v111 browser build.

We want to pull meta-clang into all kirkstone builds even without
chromium so that we find any integration problems that clang might
introduce even before we start doing the much larger chromium builds.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
---
 configs/arago-kirkstone-config.txt      | 2 +-
 configs/arago-kirkstone-next-config.txt | 2 +-
 configs/arago-kirkstone-wip-config.txt  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone-config.txt
index ceb8d74..43a8a0b 100644
--- a/configs/arago-kirkstone-config.txt
+++ b/configs/arago-kirkstone-config.txt
@@ -9,7 +9,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,H
 meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
-#meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
+meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
diff --git a/configs/arago-kirkstone-next-config.txt b/configs/arago-kirkstone-next-config.txt
index dcf935d..9d173df 100644
--- a/configs/arago-kirkstone-next-config.txt
+++ b/configs/arago-kirkstone-next-config.txt
@@ -17,7 +17,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,H
 meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
-#meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
+meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
diff --git a/configs/arago-kirkstone-wip-config.txt b/configs/arago-kirkstone-wip-config.txt
index 9dd72ab..dfe8bd6 100644
--- a/configs/arago-kirkstone-wip-config.txt
+++ b/configs/arago-kirkstone-wip-config.txt
@@ -9,7 +9,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,H
 meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
-#meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
+meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
-- 
2.36.1


