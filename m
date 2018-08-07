Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 1F55152993
	for <meta-arago@arago-project.org>;
	Tue,  7 Aug 2018 20:44:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w77KiOLv095471
	for <meta-arago@arago-project.org>; Tue, 7 Aug 2018 15:44:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533674664;
	bh=JWsJ+nkreTTqf6lp6+SelnTbu7TEYvDJ4ukmKjhC6Lg=;
	h=From:To:CC:Subject:Date;
	b=ctI+qY4wZLv/6Jv9MbM3VE9eSzx6B5Pa3R4H6nw8sP34UN9bMq75DJqrRP3Z7pWLB
	nYCf7Eyas/YTygZMidPgnrwTb4fWjCNN0USM0RHXQhMIfOxE19InbDdQIu6kpFVg9D
	LHdVlmCaMJf60p4ev13nqc/WEePdbVtiTnmm0ts0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w77KiOSm017391
	for <meta-arago@arago-project.org>; Tue, 7 Aug 2018 15:44:24 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 7 Aug 2018 15:44:24 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 7 Aug 2018 15:44:24 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w77KiOwd029164;
	Tue, 7 Aug 2018 15:44:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 Aug 2018 20:42:04 +0000
Message-ID: <20180807204205.15813-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH 1/2] coresdk-2018.01: add config for ti2018.01 release
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
X-List-Received-Date: Tue, 07 Aug 2018 20:44:32 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/coresdk-2018.01-config.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 configs/coresdk/coresdk-2018.01-config.txt

diff --git a/configs/coresdk/coresdk-2018.01-config.txt b/configs/coresdk/coresdk-2018.01-config.txt
new file mode 100644
index 0000000..9d9d685
--- /dev/null
+++ b/configs/coresdk/coresdk-2018.01-config.txt
@@ -0,0 +1,13 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.36,223a0f68530571d2280f526bddbc718fa803a3dc,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,rocko,ti2018.01,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,fe6dbe144acbcbcbe37f5e9a07a08e414dbce036,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,dacfa2b1920e285531bec55cd2f08743390aaf57,layers=meta-networking:meta-python:meta-oe:meta-gnome
+meta-ti,git://git.yoctoproject.org/meta-ti,rocko,ti2018.01,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,rocko,5fcb57ffd67384b3487d0a1b83a1f13d52a15eb7,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


