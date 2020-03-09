Return-Path: <yuanzhao@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id A9711529AD
	for <meta-arago@arago-project.org>;
	Mon,  9 Mar 2020 19:10:26 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 029J8LU0054545
	for <meta-arago@arago-project.org>; Mon, 9 Mar 2020 14:08:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583780901;
	bh=ZERuPr58NDfBusCUVGNEy3FTdBajlgDFHiE8kqqkG18=;
	h=From:To:CC:Subject:Date;
	b=TMus+09duzZPEBFnF+5bLl5hRcs6SuzYYJtY9GhXE5vy7eM8UBE6YC3boWPp5/Bzl
	stLGZx1UiKo+wI5Cu2gRSvQihaW0awpZbZ/AzPLF5pz95Y4TbS49OE/ILyyHzs8uls
	lXX/QI8tgLZY03mjT2UNBLbQPEXMuq2nSlD5H0vE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 029J8L2J083750
	for <meta-arago@arago-project.org>; Mon, 9 Mar 2020 14:08:21 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 9 Mar 2020 14:08:21 -0500
Received: from localhost.localdomain (10.64.41.19) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 9 Mar 2020 14:08:21 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 029J8L4m002631; 
	Mon, 9 Mar 2020 14:08:21 -0500
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Mar 2020 14:08:16 -0500
Message-ID: <20200309190816.136602-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] tidl-api: update to version 1.5.1
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
X-List-Received-Date: Mon, 09 Mar 2020 19:10:27 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Allow specifying NUM_EVEs used in subgraph runtime

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index c45b33fb..c81a97fa 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -1,4 +1,4 @@
-PV = "1.5.0"
+PV = "1.5.1"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
@@ -8,7 +8,7 @@ GIT_PROTOCOL = "git"
 BRANCH = "master"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "eeb4c457c8881a81fbf59a60b2ee070d2450a935"
+SRCREV = "4b801ad96b50f53e977b96d8b227ba4bcb26e011"
 
 # default patchdir is ${S}
 S = "${WORKDIR}/git"
-- 
2.24.1


