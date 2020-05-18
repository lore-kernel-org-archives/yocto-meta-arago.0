Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 8E77B529AB
	for <meta-arago@arago-project.org>;
	Mon, 18 May 2020 20:36:43 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04IKYGVm063874
	for <meta-arago@arago-project.org>; Mon, 18 May 2020 15:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589834056;
	bh=mFMLi5bMxqiW/IbgcoQojMoCE7WzwAXQIeAhTVX4rdU=;
	h=From:To:CC:Subject:Date;
	b=qXyRg/n9WEEpJGTYrLbHty8RXtz+Rj7KZAKtrYWo3ZfsyfFHMEWX/i4VkoUGOXkBT
	g2SfQLdtwmcxAXz0TiSj3iux//QXIGHK8/Gm+FsEZIeiEyKV3281luDs3mVPnbDKFZ
	7R6OeJnzAjcSSlTHLvl5SYZpSioNNxMuhHbCc/CI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04IKYG2O009997
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 18 May 2020 15:34:16 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 18 May 2020 15:34:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 18 May 2020 15:34:16 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04IKYGqE048969;
	Mon, 18 May 2020 15:34:16 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 18 May 2020 20:34:16 +0000
Message-ID: <20200518203416.24292-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ltp-ddt: add extra RDEPENDS on top of default ltp
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
X-List-Received-Date: Mon, 18 May 2020 20:36:43 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
index 24887584..c130155b 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
@@ -27,3 +27,11 @@ EXTRA_OEMAKE_append = " \
     ALSA_INCPATH=${STAGING_INCDIR} \
     ALSA_LIBPATH=${STAGING_LIBDIR} \
 "
+
+RDEPENDS_${PN} += "\
+    acl \
+    at \
+    pm-qa \
+    serialcheck \
+    memtester \
+"
-- 
2.17.1


