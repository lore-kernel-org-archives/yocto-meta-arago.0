Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.1235.1646792006611802799
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 18:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BgjgnBdT;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2292DKPH049064;
	Tue, 8 Mar 2022 20:13:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646792000;
	bh=GWygkAE4MWoTnHYoFnlYe5FHKoOLyjufIzc9u3t2msY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BgjgnBdTx9llvdjncd3tb401KuskLgwi4+wmhOzhgr6pS9EvGYTOuSVdsL5oryP87
	 dD12IblSl6lDTMplbywkPNLOEQ2Hzz1uauVl+pJ/f2HeH0IvOfHPb1TbGrRPz/1XH8
	 VJQkd0NI562QUSZJ6PZUvWKn5bL6JISgs/LaYeMI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2292DKdo106088
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Mar 2022 20:13:20 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 8
 Mar 2022 20:13:20 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 8 Mar 2022 20:13:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2292DKFW077988;
	Tue, 8 Mar 2022 20:13:20 -0600
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan"
	<j-humphreys@ti.com>, <praneeth@ti.com>,
        <minas@ti.com>, "Hilman, Kevin"
	<khilman@ti.com>,
        "Patton, Schuyler" <spatton@ti.com>,
        "Devshatwar, Nikhil"
	<nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master PATCH 1/6] tisdk-tiny-image: Split common components into include file
Date: Tue, 8 Mar 2022 20:13:11 -0600
Message-ID: <20220309021316.28370-2-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220309021316.28370-1-nm@ti.com>
References: <20220309021316.28370-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Lets split the common pieces for creating a tiny image into an include
file This can then be used to incrementally build additional images as
well.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 .../recipes-core/images/arago-tiny-image.inc          |  9 +++++++++
 .../recipes-core/images/tisdk-tiny-image.bb           | 11 +++--------
 2 files changed, 12 insertions(+), 8 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-tiny-image.inc

diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
new file mode 100644
index 000000000000..79c8f6075911
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
@@ -0,0 +1,9 @@
+ARAGO_SYSVINIT = "1"
+
+require arago-image.inc
+
+IMAGE_FEATURES_remove = "package-management splash"
+
+IMAGE_INSTALL = " \
+	packagegroup-arago-sysvinit-boot \
+"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index c0ef8f247ee7..af04b76bc588 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -1,15 +1,10 @@
-ARAGO_SYSVINIT = "1"
-
-require arago-image.inc
+ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= ""
 
-IMAGE_FEATURES_remove = "package-management splash"
+require arago-tiny-image.inc
 
 IMAGE_FSTYPES += "cpio cpio.xz"
 
-ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= ""
-
-IMAGE_INSTALL = " \
-	packagegroup-arago-sysvinit-boot \
+IMAGE_INSTALL += " \
 	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
 "
 
-- 
2.31.1

