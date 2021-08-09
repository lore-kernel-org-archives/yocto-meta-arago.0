Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id E064952ACA
	for <meta-arago@arago-project.org>;
	Mon,  9 Aug 2021 18:20:58 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 179ILHi6026327;
	Mon, 9 Aug 2021 13:21:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1628533277;
	bh=1CiPX2gl0JMvCSQR30rrELIsuPjrSKHUTF5t9LsP2nk=;
	h=From:To:CC:Subject:Date;
	b=vzKmAUpPw+cv5NZvRU3Dp1GomfUd+iBmDvDRT7AQkqLMw99tRxij/8FjKOr0UWcXE
	csuqg8Qywi7OQnUsdygMeLU8aBcjZhhvPeUnIwZ8XPtuL6dYpb2klzzvQq0HLEBQCT
	NGFjbZJMc8hNDpLYyKxhQvs3a6w2ENhsqwGBMk1w=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 179ILHff005693
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Aug 2021 13:21:17 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 9 Aug 2021 13:21:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 9 Aug 2021 13:21:17 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 179ILECf087609; 
	Mon, 9 Aug 2021 13:21:15 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <yogeshs@ti.com>, <praneeth@ti.com>
Date: Mon, 9 Aug 2021 23:51:07 +0530
Message-ID: <20210809182107.6899-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: nsekhar@ti.com
Subject: [oe-layersetup PATCH] processor-sdk: Add 08.00.00.21 release config
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Aug 2021 18:20:59 -0000
Content-Type: text/plain

Add config file for processor-sdk 08.00.00.21 release

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../processor-sdk-08.00.00.21-config.txt           | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-08.00.00.21-config.txt

diff --git a/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt b/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt
new file mode 100644
index 0000000..78a921c
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt
@@ -0,0 +1,14 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,0e0af15b84e07e6763300dcd092b980086b9b9c4
+meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,ea2e8505fdf9948c0e2881af9dacb07e801c9037,layers=
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.00.00.004,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,4d6216a04c2ebe04bf02392c02d9589d35ebf3b4,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,7bd47ef6c98323c95a9e527129dca98c9a65ee08,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.00.00.004,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,9b83aefa9c4a21d9dc1eea4a6b00af379466a288,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


