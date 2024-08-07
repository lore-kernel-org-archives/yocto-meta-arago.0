Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4078C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 14:23:09 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.34793.1723040584546767223
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Aug 2024 07:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iEPm5aSq;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 477EN4nP085424
	for <meta-arago@lists.yoctoproject.org>; Wed, 7 Aug 2024 09:23:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723040584;
	bh=wxP6R4Ke+qpsq54IpUmhMcyK7L4eGOVkx1fxCDloxSg=;
	h=From:To:CC:Subject:Date;
	b=iEPm5aSqLh95j483g+TCYsITzsHVUHg5A6XiuUy5a/2eWGORmT2sohM4JNKzPQq7+
	 VZKkVhkj9xJIPIxf3FHFlurdXQrGvzQxe8tPNzk5pbGBFbm6GRp7w2jlLVoZDQEpTb
	 2d1jZ6BqdM03jSDdN8Oyf322E9rwNCHO/0C/2Hbo=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 477EN3MR026594
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 7 Aug 2024 09:23:04 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Aug 2024 09:23:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Aug 2024 09:23:02 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 477EN2d1090844;
	Wed, 7 Aug 2024 09:23:02 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [oe-layersetup][master][PATCH] configs: processor-sdk: Add new configs for Sitara SDK 10.0 Release
Date: Wed, 7 Aug 2024 19:52:49 +0530
Message-ID: <20240807142249.319688-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Aug 2024 14:23:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15508

- Add processor-sdk-scarthgap-10.00.07.04-config.txt used for
building AM62SIP & AM64x.

- Add processor-sdk-scarthgap-chromium-10.00.07.04-config.txt used
for building AM62P, AM62x, AM62LP & Beagleplay.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 ...cessor-sdk-scarthgap-10.00.07.04-config.txt | 16 ++++++++++++++++
 ...k-scarthgap-chromium-10.00.07.04-config.txt | 18 ++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.txt
 create mode 100644 configs/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.txt

diff --git a/configs/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.txt b/configs/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.txt
new file mode 100644
index 0000000..f2b10ed
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,11d83170922a2c6b9db1f6e8c23e533526984b2c
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,10.00.07.04,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,10.00.07,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,eb828418264a49b8d00035cb3d7b12fcea3be801,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,6a80f140e387621f62964209a2e07d3bcfb125ce,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,18f939a5fb37528a5415b05077ece383c346a119,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,10.00.07,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,1b85bbb4cab9658da3cd926c62038b8559c5c64e,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,df21b1563910c80d7e2964971b7c5b79b5186922,layers=
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,c00a9a8f25b0042b0723a5d20b88e92d473d22bf,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.txt b/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.txt
new file mode 100644
index 0000000..408d804
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.txt
@@ -0,0 +1,18 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,11d83170922a2c6b9db1f6e8c23e533526984b2c
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,10.00.07.04,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,10.00.07,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,eb828418264a49b8d00035cb3d7b12fcea3be801,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,6a80f140e387621f62964209a2e07d3bcfb125ce,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,18f939a5fb37528a5415b05077ece383c346a119,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,10.00.07,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,1b85bbb4cab9658da3cd926c62038b8559c5c64e,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,df21b1563910c80d7e2964971b7c5b79b5186922,layers=
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,c00a9a8f25b0042b0723a5d20b88e92d473d22bf,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,10.00.00.04,layers=
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
-- 
2.34.1


