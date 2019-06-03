Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 3270A52987
	for <meta-arago@arago-project.org>;
	Mon,  3 Jun 2019 19:59:07 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x53JwUuc103022
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 14:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559591910;
	bh=gbpIAt5vyMV6PR3XoTNZqq2LSfoQeJ8dCkz9zUoO4Ng=;
	h=From:To:CC:Subject:Date;
	b=WDfC+PBs+yOKA5ezuxk8k5DklK6GNP6oROZozGOiU4OAL0KXD64v8lQYuqCM3/3yf
	gHB3vmCI2OOzXQI7TNYG9dsj5zLNdlm3ur57syY7weVK1CM2QTcSh65bnqfTzC4soc
	gH2nlCsH/TN3nuUrdX4enwfAM2Y0Vxk3HcpFSz8s=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x53JwUv9013792
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 14:58:30 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 3 Jun 2019 14:58:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 3 Jun 2019 14:58:30 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x53JwThA061080;
	Mon, 3 Jun 2019 14:58:30 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Jun 2019 19:46:34 +0000
Message-ID: <20190603194634.21117-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] coresdk-2019.01: add config for ti2019.01 release
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
X-List-Received-Date: Mon, 03 Jun 2019 19:59:07 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/coresdk-2019.01-config.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 configs/coresdk/coresdk-2019.01-config.txt

diff --git a/configs/coresdk/coresdk-2019.01-config.txt b/configs/coresdk/coresdk-2019.01-config.txt
new file mode 100644
index 0000000..1c05f51
--- /dev/null
+++ b/configs/coresdk/coresdk-2019.01-config.txt
@@ -0,0 +1,14 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.40,7c1eb51d1e8a4c5f39bf9dddf05fb0b3598da72b
+meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.01,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,0630018c0033c91fddda62a49f59a82ba6ec6850,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,9b568b6ae1bf1bebcb9552703ee40f9b880e07ed,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,4cd3a39f22a2712bfa8fc657d09fe2c7765a4005,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.01,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,thud,b30036d4ef7ce9fe746833fc54de6ac7b0e00638,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,thud,f162d5bfe6eaeca24f441c83c87252c8d05744fc,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


