Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id BC132529B3
	for <meta-arago@arago-project.org>;
	Tue, 22 Oct 2019 01:15:54 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9M1Eapn086606
	for <meta-arago@arago-project.org>; Mon, 21 Oct 2019 20:14:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571706876;
	bh=PfmzVEulyz2isYtWDx2637AnAOiN88CWjvo5SgXHVh0=;
	h=From:To:CC:Subject:Date;
	b=RKrqnFJSNHqhhVFrMKiEiHP6G6mbGECjoYozWue2BdoCKNarpYIJFwbIRAFAMBRQk
	Xp7YDZsbOFZn77T5rbmt2lpsLKrFzssO0b0JUkJKRHhmZueKcGvqiT99E77YF+qSKQ
	zOM1687wLO3Eukx8WCmXxI4vjnv278p3pgtSNXwU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9M1EZuE024664
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 21 Oct 2019 20:14:36 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 21 Oct 2019 20:14:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 21 Oct 2019 20:14:26 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9M1EK9Q112901;
	Mon, 21 Oct 2019 20:14:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 22 Oct 2019 00:57:51 +0000
Message-ID: <20191022005751.5677-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layerstup][PATCH] coresdk-2019.04-config: add config for 2019.04 release
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
X-List-Received-Date: Tue, 22 Oct 2019 01:15:55 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/coresdk-2019.04-config.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 configs/coresdk/coresdk-2019.04-config.txt

diff --git a/configs/coresdk/coresdk-2019.04-config.txt b/configs/coresdk/coresdk-2019.04-config.txt
new file mode 100644
index 0000000..4fd004a
--- /dev/null
+++ b/configs/coresdk/coresdk-2019.04-config.txt
@@ -0,0 +1,14 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.40,6b045e074c6fea97d4e305a5a3c8bf82135d95eb
+meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.04,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,2d088d252624b19df384aecc434d23afb636178f,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.04,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,thud,f5be8c8309a932cde507ba24d042880a922df0b6,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


