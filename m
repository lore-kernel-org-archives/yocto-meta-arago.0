Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32DEC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 14:03:47 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.211062.1724076214511545281
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Aug 2024 07:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=x3Ci0lf2;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47JE3XTk121657
	for <meta-arago@lists.yoctoproject.org>; Mon, 19 Aug 2024 09:03:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724076214;
	bh=H8/O2ohLt80blI7PUX/57X4roR5/tmqioy1kNNmr/rI=;
	h=From:To:CC:Subject:Date;
	b=x3Ci0lf2m2EIK+9xg8Mvdoe1c4gZES9MritX/1IJvG6k9K/fOZlw7yXUZb5eMF53S
	 lLndYtJlMr6SHaeK1bOInl4wOt7gQGj7rRC4KzePqdri5agWEsE1LxKhv5fB8awtJd
	 FFbLkzQxLiFoj7uJ7dHlRUTKCOgGuQFg/io5ZxLI=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47JE3XOC017987
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 19 Aug 2024 09:03:33 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Aug 2024 09:03:33 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Aug 2024 09:03:33 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47JE3VAE114522;
	Mon, 19 Aug 2024 09:03:32 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-linux: AM67/AM68/AM69: Add configs for 10.00 Release
Date: Mon, 19 Aug 2024 19:33:28 +0530
Message-ID: <20240819140328.903560-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 Aug 2024 14:03:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15512

- processor-sdk-linux-10_00_07_06.txt used for AM68, AM69
- processor-sdk-linux-10_00_08_06.txt used for AM67

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../processor-sdk-linux-10_00_07_06.txt       | 20 +++++++++++++++++++
 .../processor-sdk-linux-10_00_08_06.txt       | 20 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-10_00_07_06.txt
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-10_00_08_06.txt

diff --git a/configs/processor-sdk-linux/processor-sdk-linux-10_00_07_06.txt b/configs/processor-sdk-linux/processor-sdk-linux-10_00_07_06.txt
new file mode 100644
index 0000000..899e1b0
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-10_00_07_06.txt
@@ -0,0 +1,20 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+
+bitbake,https://git.openembedded.org/bitbake,2.8,11d83170922a2c6b9db1f6e8c23e533526984b2c
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,82833bae8835e06301c23c8833642ae4c02d303a,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
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
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,af81e0d81c5efd005bfc0ef749f690f9748c70f6,layers=
+LOCALCONF:DISTRO_FEATURES:append = " virtualization"
+LOCALCONF:DISTROOVERRIDES:append = ":foundational"
diff --git a/configs/processor-sdk-linux/processor-sdk-linux-10_00_08_06.txt b/configs/processor-sdk-linux/processor-sdk-linux-10_00_08_06.txt
new file mode 100644
index 0000000..4195de6
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-10_00_08_06.txt
@@ -0,0 +1,20 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+
+bitbake,https://git.openembedded.org/bitbake,2.8,11d83170922a2c6b9db1f6e8c23e533526984b2c
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,cbf054c7401af6e1e8bcc4eab07daa9a4996f7f3,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,eb828418264a49b8d00035cb3d7b12fcea3be801,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,54b806b1985f3989722ee308e1073530fe3328c1,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,80e01188fa822d87d301ee71973c462d7a865493,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,84328ead40d7e6fcce4d80ab7d07f4dcaf9d777e,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,ecece16871afe6b674d2aafd27e0f18bbaef1966,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,fe561f41aef0cff9e6f96730ab59f28dca2eb682,layers=
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,1c9d3c22718bf49ae85c2d06e0ee60ebdc2fd0c1,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,af81e0d81c5efd005bfc0ef749f690f9748c70f6,layers=
+LOCALCONF:DISTRO_FEATURES:append = " virtualization"
+LOCALCONF:DISTROOVERRIDES:append = ":foundational"
-- 
2.34.1


