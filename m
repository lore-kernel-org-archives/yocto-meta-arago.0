Return-Path: <xuj@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 1E047529D8
	for <meta-arago@arago-project.org>;
	Fri, 13 Mar 2020 20:50:06 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DKlx61039233
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2020 15:47:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1584132479;
	bh=hVRoQD0JNt30np/BpXGQYaq5umnCcoOK6Hq1Mzclgik=;
	h=From:To:CC:Subject:Date;
	b=sXzoyaxd4/kd/OFz6EAGvFVAB95qAzpoQRVuuDwTxULouJfrH4OT0ZBwPsXKkmQ4S
	YlPpNRkcRpNYU4A2fvzhH2YNF40SwkH303zxmBAreIM2YNi4GahAZvZ8dxp0NrpyLD
	QBWBAf0GzYjrl5c0Hmwy2c1syA1UtAn4uIpC+Gjc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DKlxod083491
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2020 15:47:59 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 13 Mar 2020 15:47:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 13 Mar 2020 15:47:59 -0500
Received: from UDA0869574.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DKlxm5060755;
	Fri, 13 Mar 2020 15:47:59 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Mar 2020 16:43:58 -0400
Message-ID: <20200313204358.21521-1-xuj@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] neo-ai-dlr: bump up SRCREV
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
X-List-Received-Date: Fri, 13 Mar 2020 20:50:06 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend b/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
index 7e6236d..b68b5c9 100644
--- a/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
+++ b/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
 
 SRC_DISTRIBUTE_LICENSES += "Unlicense"
 
-PV = "1.0.1"
+PV = "1.0.2"
 
 DEPENDS += " opencv "
 
@@ -38,7 +38,7 @@ SRC_URI = "git://github.com/TexasInstruments/neo-ai-dlr;protocol=https;branch=${
            git://github.com/google/googletest;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/protobuf/third_party/googletest;name=neo-ai-treelite-protobuf-googletest \
 "
 
-SRCREV_neo-ai-dlr = "ac8ed960e8525e26eb271cb8f4402e73a78d81bf"
+SRCREV_neo-ai-dlr = "aefda8ab117ea437ba01b1cc7e54d9e866cabeea"
 SRCREV_neo-ai-tvm = "11f0a9d2349b94a733aae1c8bd652e6055f4b185"
 SRCREV_neo-ai-tvm-dmlc-core = "ca9f9329654dbd42f06988276c6f74eb8bdd5038"
 SRCREV_neo-ai-tvm-dlpack = "b7bd45cdd8b67f4ab2502a8717f2e0926d9b4121"
-- 
2.17.1


