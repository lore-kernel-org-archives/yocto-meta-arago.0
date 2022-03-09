Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.1292.1646792003938976498
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 18:13:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=f6C6gRzi;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2292DKHm024799;
	Tue, 8 Mar 2022 20:13:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646792000;
	bh=G3fINsUgkcyRBmJVHfHv8+nSQ/5pKinK53ZWZpDzqJQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f6C6gRzit8LnQ92HJd7tJJlmxNTSc/k0sbrNwzhPV21MT8hUVzRB1vbVS4K3GJ7gH
	 LlJBOsEoo0UIpdr+l6KdghHZeHqCl58V+g+GxplkcocOFkX3pMehNUR4Djn/nQml9w
	 esl815+fn/Wh3Y0VvGxc9JrWWwvEnJQC3Eds2m/8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2292DKR9095975
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Mar 2022 20:13:20 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 8
 Mar 2022 20:13:20 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 8 Mar 2022 20:13:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2292DK5C077992;
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
Subject: [dunfell/master PATCH 3/6] packagegroups: Add a new bootstrap package group
Date: Tue, 8 Mar 2022 20:13:13 -0600
Message-ID: <20220309021316.28370-4-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220309021316.28370-1-nm@ti.com>
References: <20220309021316.28370-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Lets try and create a minimal package group for board bringup. Lets
call this basic system necessary for board bringup as "bootstrap".

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 .../packagegroup-arago-bootstrap.bb           | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
new file mode 100644
index 000000000000..e5b670a16b73
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
@@ -0,0 +1,55 @@
+DESCRIPTION = "Task to install additional utilities for initial board bringup"
+LICENSE = "MIT"
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+PACKAGES =+ "${PN}-extra"
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

