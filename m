Return-Path: <yuanzhao@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id DDB4F529BF
	for <meta-arago@arago-project.org>;
	Wed, 12 Dec 2018 15:46:48 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBCFkbKc018601
	for <meta-arago@arago-project.org>; Wed, 12 Dec 2018 09:46:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544629597;
	bh=+Z0lSlqVOLGZf6jaOdnw7OnN/60I/VE50zuXHnzKxz8=;
	h=From:To:CC:Subject:Date;
	b=P1MTGUVAs2jTHgMxhcDp8qIFEyhqdL8TA+JEEepjypoQAGhAqcjWtuB1D6NueFCrR
	yRgxLqtgrERgK9yETSbRB/Se4aVNih8jUhp9X/SROZ2xrUXhPj5j2JDGOBfA81LiUg
	QNIF9Zel+jDLDJ3iJ+N29fUw0Y1td/kE6oXDNOTA=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBCFkbRO045859
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 12 Dec 2018 09:46:37 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 12 Dec 2018 09:46:36 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 12 Dec 2018 09:46:36 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBCFka7v003533;
	Wed, 12 Dec 2018 09:46:36 -0600
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Dec 2018 09:46:30 -0600
Message-ID: <20181212154630.84283-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] tidl-api: update to version 1.2.2
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
X-List-Received-Date: Wed, 12 Dec 2018 15:46:49 -0000
Content-Type: text/plain

- Fix classification example: 1 layer group results, memory leak

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index 46e15c07..de1b99bc 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -1,4 +1,4 @@
-PV = "1.2.1"
+PV = "1.2.2"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
@@ -8,4 +8,4 @@ GIT_PROTOCOL = "git"
 BRANCH = "master"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "224a2377087f407491e98c1780ae38876bc9d65e"
+SRCREV = "139e105486ba7c7a8487cf237de37acbcbf80ed6"
-- 
2.14.1


