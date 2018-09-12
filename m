Return-Path: <yuanzhao@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id A4B6752A2B
	for <meta-arago@arago-project.org>;
	Wed, 12 Sep 2018 20:16:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8CKGH2Y035487
	for <meta-arago@arago-project.org>; Wed, 12 Sep 2018 15:16:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536783377;
	bh=X2aRoe6GzGiv4Cub3JXWR47DD1a9Zmd4xSZtLYzqbj4=;
	h=From:To:CC:Subject:Date;
	b=MozKSdl0XmXUF3/0ZauJSp7k3KlO2YeAIfreAEAAmV5H+b+DsXEeIl9Gz6Q4cVh4u
	IJKnOQEbSwy5iCzxW7VVYmP8G59iYBPMKLxswHpdr+ASIGqWkmCnGTPsnaeQuc4Nkt
	/1CxaIoGLB+jB0fPs8nss+ew2p0g+EaOe5e0ZVrE=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8CKGH2O013586
	for <meta-arago@arago-project.org>; Wed, 12 Sep 2018 15:16:17 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 12 Sep 2018 15:16:17 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 12 Sep 2018 15:16:17 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8CKGHPQ016607;
	Wed, 12 Sep 2018 15:16:17 -0500
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Sep 2018 15:16:11 -0500
Message-ID: <20180912201611.120052-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] tidl-api: update to version 01.01.00.01
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
X-List-Received-Date: Wed, 12 Sep 2018 20:16:26 -0000
Content-Type: text/plain

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index 97c2b68d..fb37a249 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -1,4 +1,4 @@
-PV = "1.1.0.0"
+PV = "1.1.0.1"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://tidl_api_manifest.html;md5=fb8d8b8edb866b0b233462139d1c3222"
@@ -8,4 +8,4 @@ GIT_PROTOCOL = "git"
 BRANCH = "master"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "a229faf1c14ddfa48e44d271ddfad44e4e7fc033"
+SRCREV = "7e9a3942ec38efd64d45e34c10cba2f2938f5618"
-- 
2.14.1


