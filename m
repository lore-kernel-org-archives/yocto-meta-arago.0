Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976FEC3525B
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 18:40:51 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.13382.1647628849931123056
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 11:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pJKlWPko;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IIelh3105260;
	Fri, 18 Mar 2022 13:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647628847;
	bh=vnAYbGvoEDig141ZnxeRnvveHzJh9TpFFOVo9SB7eo0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pJKlWPkobQoXrgcW8GGuhDDskqM10b8EMMlqG8BB+r+ZAMuXB9yxW+dSdskuN53Ar
	 a2xD3XwDbnOxsd+ZHZ88drthmHRMlwSk0U7M/jVdnYMc/FCiAZblx1fOl25m3XPLJO
	 UkdnHsAOpfxCiJ+l9Zi/Md5Yhg/OSvl3dump6NhI=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IIel4l083357
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 13:40:47 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 13:40:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 13:40:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IIelYm103519;
	Fri, 18 Mar 2022 13:40:47 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan"
	<j-humphreys@ti.com>,
        praneeth <praneeth@ti.com>, minas <minas@ti.com>,
        "Hilman, Kevin" <khilman@ti.com>, "Patton, Schuyler" <spatton@ti.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH V3 08/12] packagegroups: Add a new bootstrap
 package group
Date: Fri, 18 Mar 2022 13:40:41 -0500
Message-ID: <20220318184045.11246-9-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220318184045.11246-1-nm@ti.com>
References: <20220318184045.11246-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 18:40:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13663

Lets try and create a minimal package group for board bringup. Lets
call this basic system necessary for board bringup as "bootstrap".

Signed-off-by: Nishanth Menon <nm@ti.com>
---
no changes since V2
V2: https://lore.kernel.org/all/20220318143735.17642-8-nm@ti.com/

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
2.17.1


