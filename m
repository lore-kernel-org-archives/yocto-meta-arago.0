Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 24EBC52C56
	for <meta-arago@arago-project.org>;
	Wed,  7 Apr 2021 04:04:52 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13745ElU103241;
	Tue, 6 Apr 2021 23:05:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617768314;
	bh=Uym2PoEY9NuG15SQbi7GigLW8fI2bgVSV3UPS4sH1Ro=;
	h=From:To:CC:Subject:Date;
	b=xRaT/dajXaK68QCwRqljydwwKk+bwiNzHoO23b4hthqF5eHGEhaYWiulqzloDZjhZ
	TWvy/s2iafgl2z2w83/r+KFkYFB7xrwyn/lPvxslLKC08poEX1OePg8+KEPReLojiI
	hZsiRGwk4ktrFMU2c6I4luKVYN3uoleILfa2ZAr0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13745EZq052385
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Apr 2021 23:05:14 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 6 Apr 2021 23:05:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 6 Apr 2021 23:05:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13745DLF124365;
	Tue, 6 Apr 2021 23:05:13 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
Date: Tue, 6 Apr 2021 23:05:13 -0500
Message-ID: <20210407040513.2486-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: [master PATCH] coresdk-07.03.00.005-config: add config for CoreSDK 07.03.00.005 release
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
X-List-Received-Date: Wed, 07 Apr 2021 04:04:52 -0000
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 configs/coresdk/coresdk-07.03.00.005-config.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 configs/coresdk/coresdk-07.03.00.005-config.txt

diff --git a/configs/coresdk/coresdk-07.03.00.005-config.txt b/configs/coresdk/coresdk-07.03.00.005-config.txt
new file mode 100644
index 0000000..97e540a
--- /dev/null
+++ b/configs/coresdk/coresdk-07.03.00.005-config.txt
@@ -0,0 +1,14 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
+meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
+#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


