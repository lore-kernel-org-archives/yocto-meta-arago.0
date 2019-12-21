Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 64671520E2
	for <meta-arago@arago-project.org>;
	Sat, 21 Dec 2019 12:33:02 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBLCVODY069869
	for <meta-arago@arago-project.org>; Sat, 21 Dec 2019 06:31:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576931484;
	bh=Qa7N3rX6MnzyHQzhc/7J6MdlJ6PphpyMfuBIa97o948=;
	h=From:To:CC:Subject:Date;
	b=Uvp4Jh7eL6QZJHRPEdqEf4ikxeqQLIn2cL9Eio7QFtdiK8Jg1ZCOljrLiDmLsBbZ/
	GJUe++VNg8FQS3si1iaDWvHcK2C9Tz2WQ4scWoM1dWUF83nSCtYGyEEwgpz6qgPp2r
	qG20gXgPEV6pXA64ikwlqsphCdn3bn9MvOcHshJI=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBLCVOKi093742
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sat, 21 Dec 2019 06:31:24 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Sat, 21 Dec 2019 06:31:22 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Sat, 21 Dec 2019 06:31:22 -0600
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBLCVMD1070921;
	Sat, 21 Dec 2019 06:31:22 -0600
From: Djordje Senicic <d-senicic1@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 21 Dec 2019 07:28:48 -0500
Message-ID: <20191221122848.6326-1-d-senicic1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <d-senicic1@ti.com>
Subject: [meta-processor-sdk][PATCH] neo-ai-dlr: Update README files and sample inference configuration file, per latest TIDL-API
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
X-List-Received-Date: Sat, 21 Dec 2019 12:33:02 -0000
Content-Type: text/plain

- subgraph0.cfg used in /usr/share/dlr/demos need to have additional configuration parameters per latest TIDL-API
- More details included in README files

Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
---
 recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend b/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
index c49f2ba..7e6236d 100644
--- a/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
+++ b/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
@@ -38,7 +38,7 @@ SRC_URI = "git://github.com/TexasInstruments/neo-ai-dlr;protocol=https;branch=${
            git://github.com/google/googletest;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/protobuf/third_party/googletest;name=neo-ai-treelite-protobuf-googletest \
 "
 
-SRCREV_neo-ai-dlr = "40394be2e39eaa6248f9bf0a1143692083c0e3d2"
+SRCREV_neo-ai-dlr = "ac8ed960e8525e26eb271cb8f4402e73a78d81bf"
 SRCREV_neo-ai-tvm = "11f0a9d2349b94a733aae1c8bd652e6055f4b185"
 SRCREV_neo-ai-tvm-dmlc-core = "ca9f9329654dbd42f06988276c6f74eb8bdd5038"
 SRCREV_neo-ai-tvm-dlpack = "b7bd45cdd8b67f4ab2502a8717f2e0926d9b4121"
-- 
2.17.1


