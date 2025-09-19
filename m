Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEAFCA1013
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 05:19:34 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.8994.1758259171406394920
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 22:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=S8VCY2Z3;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: b-padhi@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58J5JUY5640096
	for <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 00:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758259170;
	bh=Ru8fwVux5NyJHq8CMYLthPVrpWEuOxpxT6zsaFbznE4=;
	h=From:To:CC:Subject:Date;
	b=S8VCY2Z3L6ldk0XGJQWAk1ww5y9Lr7ZRUFsxwRovFQIzLt9KsdKH0xMbH/ddbTfJl
	 42W7azZrzMAT7K2aeTE7xBgtUOb5Pc7PAGsWHURk1opwyqSFfwLZKZXM/FZ91fgwal
	 fYNa2NCA37b920WBFWZThw3JBiajXsw+2o0i7Prg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58J5JUhL2653872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 00:19:30 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 19
 Sep 2025 00:19:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Sep 2025 00:19:30 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58J5JR5M1754322;
	Fri, 19 Sep 2025 00:19:28 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>,
        Beleswar Padhi
	<b-padhi@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-linux: Add 11.01.02.01 release config
Date: Fri, 19 Sep 2025 10:49:22 +0530
Message-ID: <20250919051922.3101673-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 05:19:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16598

Add release config for SDK 11.01.02.01 which will be used by AM57x and
AM57x-HS platforms.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 .../processor-sdk-linux-11_01_02_01.txt       | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-11_01_02_01.txt

diff --git a/configs/processor-sdk-linux/processor-sdk-linux-11_01_02_01.txt b/configs/processor-sdk-linux/processor-sdk-linux-11_01_02_01.txt
new file mode 100644
index 0000000..9199dec
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-11_01_02_01.txt
@@ -0,0 +1,21 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,982645110a19ebb94d519926a4e14c8a2a205cfd
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,67c473bc6d88a2cce13b2e8c36fcb79cb0015339,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f635a31f5f9762813a8527dd31323549b7,layers=meta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,ade45671712b72e988d622caab51774f5a069c32,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,af1db2042caf8021d767dce1b26c08b59b96f3d1,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,c29a18fa39ede952f3f6108ec007c1906e2d9a0d,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,0e2876e2ea7c28ddff5bc0052bdbc83dd07b7c98,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,057ee563305e9484b29d02347aeafdadc5ea28ed,layers=
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,baa5e7ea5f37f54c2a00080798ad7fb4c0664f69,layers=meta
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,am57x,982761ae3031c12ab7c270fb4e91b15198795299,layers=meta-ti-foundational
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
-- 
2.34.1


