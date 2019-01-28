Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 3DDDD529A6
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2019 19:44:47 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0SJiVUi026574
	for <meta-arago@arago-project.org>; Mon, 28 Jan 2019 13:44:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1548704671;
	bh=ZI601ILTFfp+5TS9k4Fw1OFuBU6b90aj7kjBDh/EN+A=;
	h=From:To:CC:Subject:Date;
	b=mwAhmrhvlmEMOYkoUArMsqUwkxgPrP2so/w2pds8oKN66H9hyRGLB1P9PzGE0pnP2
	vp/+Sej/GNH4NeOYxWLyS0g1/wW77Uvt5QAcNlZ/JVQZ72p/NxU/eBPrj6w+PaTc24
	r4gCvqtCIdbdE4GIAVote29eV2iBQsqVIcEVkYKo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0SJiVCO034464
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 28 Jan 2019 13:44:31 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 28 Jan 2019 13:44:31 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 28 Jan 2019 13:44:31 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0SJiV0A025389;
	Mon, 28 Jan 2019 13:44:31 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 28 Jan 2019 19:36:46 +0000
Message-ID: <20190128193646.24770-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][PATCH] vtun: depend on openssl10
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
X-List-Received-Date: Mon, 28 Jan 2019 19:44:49 -0000
Content-Type: text/plain

upstream migrated to OpenSSL 1.1, so depend on openssl10 for now

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
index 4450cc1c..50e4d236 100644
--- a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
@@ -4,7 +4,7 @@ SECTION = "console/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://vtun.h;startline=1;endline=17;md5=9ac9e7fefca60c72400239e0de40cde8"
 
-DEPENDS = "zlib lzo openssl bison-native flex-native"
+DEPENDS = "zlib lzo openssl10 bison-native flex-native"
 
 SRC_URI = "http://downloads.sourceforge.net/project/vtun/vtun/${PV}/vtun-${PV}.tar.gz"
 
-- 
2.17.1


