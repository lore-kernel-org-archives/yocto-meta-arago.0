Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id D186152988
	for <meta-arago@arago-project.org>;
	Wed, 19 Feb 2020 23:35:31 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01JNXX8b017552
	for <meta-arago@arago-project.org>; Wed, 19 Feb 2020 17:33:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582155213;
	bh=TQus5ZEiW26XH7Letcx3xlqzrvvlgLBKgGX/uFM/+ng=;
	h=From:To:CC:Subject:Date;
	b=eByKQ8hQe+BuzmnrUNlMC9kTYGprok5JSfP9ORcfVyp97pAkKEYvclygJ2kkq96ER
	fs1ByPNAtlEXTOpI2vRyH9Uy/ta57hQ9YVSy9YKV5rRCppnluGa2Fpi5Q5KRn+hHt8
	1Meax8IC/9z36BmdFuayJF8h9sNoyovU6cj4k0go=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01JNXXrM108983
	for <meta-arago@arago-project.org>; Wed, 19 Feb 2020 17:33:33 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 19 Feb 2020 17:33:32 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 19 Feb 2020 17:33:32 -0600
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01JNXWhi097824;
	Wed, 19 Feb 2020 17:33:32 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Feb 2020 18:26:09 -0500
Message-ID: <20200219232609.23625-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [thud/zeus/master] [PATCH] tidl-utils: bump SRCREV to get enhancement of Tensorflow Lite import and writer
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
X-List-Received-Date: Wed, 19 Feb 2020 23:35:32 -0000
Content-Type: text/plain

* Support subgraph partitioning and serialization of the partitioned model

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
index d5958de3..5801331e 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
@@ -1,4 +1,4 @@
 SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
-SRCREV = "0a0032f1ee4d8c53d2a765da48af554836389630"
-PV = "01.01.03.01"
+SRCREV = "fe5ff65c2619717cc1f501a0a359e6242c7056c8"
+PV = "01.01.03.02"
 PR = "r0"
-- 
2.17.1


