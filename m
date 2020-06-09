Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A721C529BC
	for <meta-arago@arago-project.org>;
	Tue,  9 Jun 2020 00:03:55 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05901N4c068160
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2020 19:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1591660883;
	bh=k1V+w9JyDG/iXDYVi5vxju2EQMRA87DTzxZMIeJdczo=;
	h=From:To:CC:Subject:Date;
	b=jVFJz3kCkeUG2c0cZRgzY35cFIMEiUX5qKJoy4v9tn4fOQZefcUQr0pxOdzzkdb2a
	tY57ku4G+Q+A4tB6Iie7ddEeOZjar9MKorxabnmTA3NmCaNVgUNSGrAiv6/2EIxzZV
	8x0ax3yDpEDLNomTglj5kleMzlxonmSf7ySVFcsk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05901NMt105859
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2020 19:01:23 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 8 Jun 2020 19:01:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 8 Jun 2020 19:01:22 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05901MLG125366;
	Mon, 8 Jun 2020 19:01:22 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 9 Jun 2020 00:01:19 +0000
Message-ID: <20200609000119.3276-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] coresdk-07.00.00-config: add config for CoreSDK 07.00.00 release
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
X-List-Received-Date: Tue, 09 Jun 2020 00:03:56 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/coresdk-07.00.00-config.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 configs/coresdk/coresdk-07.00.00-config.txt

diff --git a/configs/coresdk/coresdk-07.00.00-config.txt b/configs/coresdk/coresdk-07.00.00-config.txt
new file mode 100644
index 0000000..e4fe1c9
--- /dev/null
+++ b/configs/coresdk/coresdk-07.00.00-config.txt
@@ -0,0 +1,14 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,6cc09fa33131f71a3fd0e336ff07a4186b41bf8f
+meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.00.00,layers=meta-arago-distro:meta-arago-extras
+#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,fdd19517e17240b0b61765bd02fc483a1bde986f,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,237879d59e11187a49216a88b73a057408e4b3f7,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,e413c1ef621688e69bb7830bb3151ed23b30b73e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.00.00,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,f8ea9ac3a06f543bd3dc259ffc1b60eb197a132d,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,c88cf750f26f6786d6ba5b4f1f7e5d4f0c800e6e,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


