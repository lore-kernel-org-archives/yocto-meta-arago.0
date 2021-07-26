Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id AAEF252A0F
	for <meta-arago@arago-project.org>;
	Mon, 26 Jul 2021 22:16:52 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16QMH4AG027979;
	Mon, 26 Jul 2021 17:17:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1627337824;
	bh=CO5wR/zkh9pWxaFRjHBVZtCXNjOB7SMJFjG0O+M1JYA=;
	h=From:To:CC:Subject:Date;
	b=Kkk+ZAEZ0Ei6vcMombe4IGI02cvKvzxbLKXm0fyJBEXia6ye0JZis6fW4wZMCqYZP
	sLxBdmQO5UJ6Zy4XPn8JottI9TljW1TyU6L/IpVczLHwJ8jLTPKKwvm75euPFh+JFn
	vvz94Z3+Q9GTIOP7Rh9s04epvRccBeHFZ+kTPrqE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16QMH46H040513
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Jul 2021 17:17:04 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 26 Jul 2021 17:17:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 26 Jul 2021 17:17:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16QMH4lc068907;
	Mon, 26 Jul 2021 17:17:04 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>
Date: Mon, 26 Jul 2021 17:17:04 -0500
Message-ID: <20210726221704.13153-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [oe-layersetup PATCH] coresdk-08.00.00.004-config: add config for CoreSDK 08.00.00.004 release
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
X-List-Received-Date: Mon, 26 Jul 2021 22:16:53 -0000
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

add config for CoreSDK 08.00.00.004 release

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 configs/coresdk/coresdk-08.00.00.004-config.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 configs/coresdk/coresdk-08.00.00.004-config.txt

diff --git a/configs/coresdk/coresdk-08.00.00.004-config.txt b/configs/coresdk/coresdk-08.00.00.004-config.txt
new file mode 100644
index 0000000..2924ec3
--- /dev/null
+++ b/configs/coresdk/coresdk-08.00.00.004-config.txt
@@ -0,0 +1,14 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,0e0af15b84e07e6763300dcd092b980086b9b9c4
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.00.00.004,layers=meta-arago-distro:meta-arago-extras
+#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
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


