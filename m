Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.12293.1642431571875651017
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 06:59:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=f27fFtgT;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-m1@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20HExUDB005146
	for <meta-arago@lists.yoctoproject.org>; Mon, 17 Jan 2022 08:59:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1642431570;
	bh=8BdeWwF5duMelyjfmvdIIpuajnc911MSNjNwnuMKmOg=;
	h=From:To:CC:Subject:Date;
	b=f27fFtgT40PaA2iZ7yRsvx66CrFvRxPWHmbqxwapA8dzbm8O4L8Qu5Vv8FjxoS6aW
	 HnqEhCm9wmMuJTadkXUibqaeTl+3eCyHDFAoAhH+KBJyQk4QO8Ld282SMZTz1XLP5V
	 C9/nMTees6Uf3CA/32spCp2gMbCEa4zzHawSDh8U=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20HExUSC121494
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 17 Jan 2022 08:59:30 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 17
 Jan 2022 08:59:30 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 17 Jan 2022 08:59:30 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20HExRE7065144;
	Mon, 17 Jan 2022 08:59:28 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <yogeshs@ti.com>, <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>, Aparna M <a-m1@ti.com>
Subject: [meta-arago][oe-layersetup PATCH] processor-sdk: Add 08.01.00.39 release config
Date: Mon, 17 Jan 2022 20:29:22 +0530
Message-ID: <20220117145922.24026-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add 08.01.00.39 release config

Signed-off-by: Aparna M <a-m1@ti.com>
---
 .../processor-sdk-08.01.00.39-config.txt          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-08.01.00.39-config.txt

diff --git a/configs/processor-sdk/processor-sdk-08.01.00.39-config.txt b/configs/processor-sdk/processor-sdk-08.01.00.39-config.txt
new file mode 100644
index 0000000..cc67eb2
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-08.01.00.39-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,c2a3bda3a29e12472ef7862e424ea1552fab2959
+meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,9d1705ba257f95702fb010c6ed3aba384b1019ba,layers=
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.01.00.006,layers=meta-arago-distro:meta-arago-extras
+#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,180241e0eee718fc52c7b6b25dbd1d845a8047c4,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,69f94af4d91215e7d4e225bab54bf3bcfee42f1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.01.00.006,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,f61fcb6e176f19f1e768ce63a693f238713c8887,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1

