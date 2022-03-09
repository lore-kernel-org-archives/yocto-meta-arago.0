Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.1293.1646792004270532337
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 18:13:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pb4WE6cO;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2292DKmD079259;
	Tue, 8 Mar 2022 20:13:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646792000;
	bh=QHQNZR5Xn3CtT43csEjDld1ICh0AQhZlkwZKhqC0nXg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pb4WE6cOFQeS2TiV9jfWovYLxgKMXfFQCOf+zYO2xzD4xiMyRZQTH3zzXjI5F2ImH
	 1UzUKASZmTxrlhmylczH0guVOz70zOwxSXGh0ExKL4IQ+Qv3C0kL1lh2mXvd1OHswX
	 /0AOSRXU0GKszc1+qbXL0lXvFFY2ndVG37+S/MCQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2292DKdp100506
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Mar 2022 20:13:20 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 8
 Mar 2022 20:13:20 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 8 Mar 2022 20:13:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2292DKTc061435;
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
Subject: [dunfell/master PATCH 6/6] recipes-core: images: Introduce tisdk-bootstrap-image
Date: Tue, 8 Mar 2022 20:13:16 -0600
Message-ID: <20220309021316.28370-7-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220309021316.28370-1-nm@ti.com>
References: <20220309021316.28370-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Lets introduce tisdk-bootstrap-image which now consists of a
completely bootable system with bootstrap initramfs that can be used
to boot up and minimally debug a system. We also will create a rootfs
that matches with the initramfs to allow users who use mmc and other
similar boot media to have access to the same debug tools for a new
platform bringup.

This kind of image is usually suited to be used with a minimal
bootloader and kernel devicetree configuration.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 .../images/tisdk-bootstrap-image.bb             | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
new file mode 100644
index 000000000000..85584f0cf257
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
@@ -0,0 +1,17 @@
+# Arago TI SDK bootstrap image usable for board bringup
+# This consists of an usable initramfs containing board bringup utilities
+# that can then be used. In addition the root filesystem also has the same
+# set of utilities for debug and basic performance checks.
+
+require arago-tiny-image.inc
+
+ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL ?= ""
+
+IMAGE_INSTALL += " \
+	packagegroup-arago-bootstrap \
+	kernel \
+	k3-bootstrap-initrd \
+	${ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL} \
+"
+
+export IMAGE_BASENAME = "tisdk-bootstrap-image"
-- 
2.31.1

