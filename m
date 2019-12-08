Return-Path: <yuanzhao@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 2C89F52A25
	for <meta-arago@arago-project.org>;
	Sun,  8 Dec 2019 06:01:34 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB85xxMT081299
	for <meta-arago@arago-project.org>; Sat, 7 Dec 2019 23:59:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575784799;
	bh=NdZUd53sQV0emZrdMvGvI/+GvQvhTclIPMjtzI3Ykwc=;
	h=From:To:CC:Subject:Date;
	b=YyG4M5jHwDKn8KudipkKCwN+ISN3AiO+fRV1DqICxyeJ1LG0oGgj8isu8kfei1Mf+
	nVL/PsjPioeINFcMHIxqGmGM7YwYbmhhbwE6Eds35Bvln+cdAq0OZt4pqWN8nbC6cL
	uu7MUiXfZzoeRnUJv4YA2yXzb+FePuqYhwpjxZxc=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB85xxDb067910
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sat, 7 Dec 2019 23:59:59 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Sat, 7 Dec 2019 23:59:59 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Sat, 7 Dec 2019 23:59:59 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB85xwJD020195;
	Sat, 7 Dec 2019 23:59:58 -0600
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 7 Dec 2019 23:59:56 -0600
Message-ID: <20191208055956.38504-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] tidl-api: update to version 1.4.0
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
X-List-Received-Date: Sun, 08 Dec 2019 06:01:34 -0000
Content-Type: text/plain

- Subgraph execution support.

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index e3e124d0..116928ab 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -1,4 +1,4 @@
-PV = "1.3.3"
+PV = "1.4.0"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
@@ -8,7 +8,7 @@ GIT_PROTOCOL = "git"
 BRANCH = "master"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "092a2ed047b02d9668fddebe61d4e5920bfbfb3f"
+SRCREV = "21faf4b36a0ae9ee5b5c6aaf90d067728ff4f78b"
 
 # default patchdir is ${S}
 S = "${WORKDIR}/git"
-- 
2.14.1


