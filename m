Return-Path: <yuanzhao@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 7BEB452997
	for <meta-arago@arago-project.org>;
	Thu,  6 Dec 2018 18:07:34 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB6I7Ndm078131
	for <meta-arago@arago-project.org>; Thu, 6 Dec 2018 12:07:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544119643;
	bh=JdcnygNtlRTJOH/ahfux6xNRKtpCj9t+CLfNcIIXViE=;
	h=From:To:CC:Subject:Date;
	b=uWDC2hBd2wtj35ory5ayRKGhQhyv8WQ/u3z75xccMV/MUROLAClLh5tyR6+Sng+ut
	8BSvZZ5/OlGkeitZUi1mEvMJxNqPZRuftheWcAKtXswx+sjVH+hHFDHevxQQguJrq9
	bLb+LrLuiXl1EQa6UVFeDQ1IkwleaJzDhyoFrOk4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB6I7NCS015368
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 6 Dec 2018 12:07:23 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 6 Dec 2018 12:07:22 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 6 Dec 2018 12:07:22 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB6I7M5X021724;
	Thu, 6 Dec 2018 12:07:22 -0600
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Dec 2018 12:07:13 -0600
Message-ID: <20181206180713.1032-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] tidl-api: update to version 1.2.1
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
X-List-Received-Date: Thu, 06 Dec 2018 18:07:34 -0000
Content-Type: text/plain

- Fix tidl-viewer build error

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index 1b1167ec..46e15c07 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -1,4 +1,4 @@
-PV = "1.2.0"
+PV = "1.2.1"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
@@ -8,4 +8,4 @@ GIT_PROTOCOL = "git"
 BRANCH = "master"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "03978a83b03d8881261222344d1a08e0f4e2bd06"
+SRCREV = "224a2377087f407491e98c1780ae38876bc9d65e"
-- 
2.14.1


