Return-Path: <s-alam@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A604ACD13CF
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 09:30:09 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.19278.1725355805830098473
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Sep 2024 02:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FNhqj29p;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-alam@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4839U48J065083
	for <meta-arago@lists.yoctoproject.org>; Tue, 3 Sep 2024 04:30:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725355804;
	bh=/LNBDA+NK2BHvPsB2LoPanzvzhlxnsnmB560KlIiPlc=;
	h=From:To:CC:Subject:Date;
	b=FNhqj29pz7+/bINa8WlPYCAHyGZJWsmMjvtmtpuvoF6VJzdpz3e7TmUbZXWCDSd8k
	 AAck8dddkJ+EqLF7hUIG9YUbsHWtQgUA20jZoXHn3GZLbwHQwgeV3TotA0EDtToy88
	 Z8gVqHdEekCGTZ+YX4opDVEjxbI2TEZhlcrO3hV0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4839U3Eq027791
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 3 Sep 2024 04:30:04 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Sep 2024 04:30:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Sep 2024 04:30:03 -0500
Received: from sonu-hp-ws.dhcp.ti.com (sonu-hp-ws.dhcp.ti.com [10.24.69.21] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4839U0UB026852;
	Tue, 3 Sep 2024 04:30:01 -0500
From: Sonu Alam <s-alam@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Sonu Alam <s-alam@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-linux: Adding 10.0 release config for J7200
Date: Tue, 3 Sep 2024 14:59:56 +0530
Message-ID: <20240903092956.176169-1-s-alam@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Sep 2024 09:30:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15549

- adding Add processor-gateway-10_00.txt config used for
    building J7200.

Signed-off-by: Sonu Alam <s-alam@ti.com>
---
 .../processor-sdk-gateway-10_00.txt           | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 configs/processor-sdk-linux/processor-sdk-gateway-10_00.txt

diff --git a/configs/processor-sdk-linux/processor-sdk-gateway-10_00.txt b/configs/processor-sdk-linux/processor-sdk-gateway-10_00.txt
new file mode 100644
index 0000000..f69645e
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-gateway-10_00.txt
@@ -0,0 +1,19 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,11d83170922a2c6b9db1f6e8c23e533526984b2c
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,82833bae8835e06301c23c8833642ae4c02d303a,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,eb828418264a49b8d00035cb3d7b12fcea3be801,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,6a80f140e387621f62964209a2e07d3bcfb125ce,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,18f939a5fb37528a5415b05077ece383c346a119,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,138077349667614f83637c98798c06249615a23e,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,1b85bbb4cab9658da3cd926c62038b8559c5c64e,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,df21b1563910c80d7e2964971b7c5b79b5186922,layers=
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,c00a9a8f25b0042b0723a5d20b88e92d473d22bf,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
+meta-tisdk,https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk,scarthgap,af81e0d81c5efd005bfc0ef749f690f9748c70f6,layers=
+LOCALCONF:DISTRO_FEATURES:append = " virtualization"
+
-- 
2.34.1


