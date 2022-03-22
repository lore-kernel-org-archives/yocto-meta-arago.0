Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94984C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:48:20 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.13364.1647971299479720362
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 10:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OxFqrTxn;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MHmBqc093522;
	Tue, 22 Mar 2022 12:48:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647971291;
	bh=kXu9fUPoRpK1KuqI/EkCaSAwZCH4ZGvQO6D3Ec6uzFQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OxFqrTxnwFo5oXj43VPB+3LOJ9HMvooEKTlezu1zPbla+FeibfzdMgTrHlD4m2P0q
	 UwfKVoYKekElLNHubmMYXyGLhsiORRk16hWufx94hqsQDCxC3K1Cc524KvWx6UOzDO
	 UBL2BmflPm9hGko03mtarbdrbT418e21zaY+V8Bs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MHmBDj025020
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 12:48:11 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 12:48:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 12:48:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MHmAOh000522;
	Tue, 22 Mar 2022 12:48:10 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V5 08/12] packagegroups: Add a new bootstrap
 package group
Date: Tue, 22 Mar 2022 12:48:04 -0500
Message-ID: <20220322174808.16341-9-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220322174808.16341-1-nm@ti.com>
References: <20220322174808.16341-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 17:48:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13701

Lets try and create a minimal package group for board bringup. Lets
call this basic system necessary for board bringup as "bootstrap".

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V4: None

V4: https://lore.kernel.org/yocto-meta-arago/20220319123310.8546-9-nm@ti.com/

 .../packagegroup-arago-bootstrap.bb           | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
new file mode 100644
index 000000000000..9d961c282c5d
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
@@ -0,0 +1,53 @@
+SUMMARY = "Task to install additional utilities for initial board bringup"
+LICENSE = "MIT"
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+UTILS = " \
+	 arm-benchmarks \
+	 evtest \
+	 memtester \
+	 nbench-byte \
+	 pcitest \
+	 serialcheck \
+	 yavta \
+	 hdparm \
+	 i2c-tools \
+	 libdrm-tests \
+	 rt-tests \
+	 iozone3 \
+	 mtd-utils-ubifs-tests \
+	 net-tools \
+	 ethtool  \
+	 pciutils \
+	 rng-tools \
+	 stress-ng \
+	 iperf \
+	 lmbench \
+	 usbutils \
+	 devmem2 \
+	 phytool \
+"
+
+UTILS_append_ti33x = " \
+    omapconf \
+"
+
+UTILS_append_ti43x = " \
+    omapconf \
+"
+
+UTILS_append_omap-a15 = " \
+    omapconf \
+"
+
+UTILS_append_k3 = " \
+    k3conf \
+"
+
+RDEPENDS_${PN} = "\
+    ${UTILS} \
+"
-- 
2.31.1


