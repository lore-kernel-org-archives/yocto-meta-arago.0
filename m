Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E47CC43219
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 14:37:43 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.10523.1647614261088649898
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 07:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iLob29h5;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IEbbW5110656;
	Fri, 18 Mar 2022 09:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647614257;
	bh=JH0WZQYHODuUB0/wEHjfOXFgTE526QMqz8gkCwLB0vQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iLob29h5OipCi9qJISJp8jl4jHH+g9+B6OJiQN/tNRiBlV3c15IL/jGeJgYyedfJ4
	 cq/HGbeszd4WTgtssnVpjf3ogOoNM6Edok7pqvjXlUWGvSVttQ09CAX9rkV7/M+Mzw
	 uCPwrmq1VtvJ6XE7yrhOOBb7evljFSNOUOCF5XTg=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IEbbsT082461
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 09:37:37 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 09:37:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 09:37:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IEbbKE072434;
	Fri, 18 Mar 2022 09:37:37 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan"
	<j-humphreys@ti.com>,
        praneeth <praneeth@ti.com>, minas <minas@ti.com>,
        "Hilman, Kevin" <khilman@ti.com>, "Patton, Schuyler" <spatton@ti.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH V2 07/12] packagegroups: Add a new bootstrap
 package group
Date: Fri, 18 Mar 2022 09:37:30 -0500
Message-ID: <20220318143735.17642-8-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220318143735.17642-1-nm@ti.com>
References: <20220318143735.17642-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 14:37:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13641

Lets try and create a minimal package group for board bringup. Lets
call this basic system necessary for board bringup as "bootstrap".

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since v1:
* review comments incorporated

V1: https://lore.kernel.org/all/20220309021316.28370-4-nm@ti.com/

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


