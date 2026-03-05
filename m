Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C4AF47CBF
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 19:32:27 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52884.1772739141450522015
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 11:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=gmJMGHOS;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.30, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4ENVs88XHdo0ghHvauaYDhqJQu6xJnJrKEwzdVeN7bgyO6h5UlBw3yRHO3e1j6RBuQVXDL2QCWgWg6/gdTtvWQWMA3YuMVbRdrJujVVyto6lRaYPMDCbVad412AXrrHJ1U/nYtnm7Zy+ka5eIpfrinX7Z/vNo34bMg9fGZZD8Aub76H9lKxaiKislQySOiiaVMwBvPjwnhjJCFIlL1l+S/53BKYrGkG5jSsu0AOSdOQQdJ4i9rjSx69iaMHHqaZc+uyHQxvQGNn34pb9rzH05QMNmVLq0adl2h9EBlsXvODSHBEDc3wC+JMg0lDIVayExBsmBROOMKBqa9eZbSxYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PxQr3MTuRsMfJgkMEw0apaCdmTrRZUJYwcc4BxieEQ=;
 b=D3gdUSch3EiXCyuhzWmW5TmO9SLEKdRvrZQaVtbvrjC2nf15eksuk1IxCHo0MuTxH1ms2X3v8iyVWDlH3QnK1SecK9Kyst+SnHg3NaIoQvZsXH4V708mC7PX3Dqrjt2jKjdPifUYOMD9KM/tkawXtGPoonEZEx5dEebI5Fh2Dpn9rMwY39ZBC2sfDYd8QqOBAD0WB2v2FwbGNHpWDSvYNNfKyW6NnAssN9LLqs2JK7kXGsnAZjsske+AOGVfpkG5FYoNdPa6SfIjsJf0NGauF69O9ZuiFuLMRd4Jwct42934+YIm6JkioEYchrq+2haAqM0gk1QPdu5VrRk027oYbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PxQr3MTuRsMfJgkMEw0apaCdmTrRZUJYwcc4BxieEQ=;
 b=gmJMGHOSR4gpiKEiGMcRqw8y9O36f+cbdKv7csWj2LO1Wir/KUTlMQM1LRXqYyoHnsxaactJhyj0IPnW67yBiTsYj4bUy3IQAjNh+fuQIfWkrQRQQxJlaCg2ESElnOTS+lZKPPQxGhUcBSzWOECQ2kDVm2fmtX+pE62mIJwlOs4=
Received: from SJ0PR03CA0243.namprd03.prod.outlook.com (2603:10b6:a03:3a0::8)
 by MN6PR10MB8069.namprd10.prod.outlook.com (2603:10b6:208:4f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 19:32:17 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::76) by SJ0PR03CA0243.outlook.office365.com
 (2603:10b6:a03:3a0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 19:32:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:32:11 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:31:35 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:31:35 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:31:35 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625JVQ312427052;
	Thu, 5 Mar 2026 13:31:33 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v3 2/4] armnn: upgrade v24.11 to v26.01
Date: Fri, 6 Mar 2026 01:01:23 +0530
Message-ID: <20260305193125.2045659-3-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260305193125.2045659-1-p-deshmukh@ti.com>
References: <20260305193125.2045659-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|MN6PR10MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 84343b0f-66df-4d4c-afb4-08de7aede5a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|34020700016|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	zYnFutcZurN7xZFqUlJnrqmOPwAMTAKUQq7VDINhgd8eKKoN0/UiFYn5SrCp9fQkZh6W7+LEGXficCzOG5X458LEa2hQ9hlkRaEVEI/wtW223r6+mt6Vc4+q6l45Kuw7e8iIc/SlgcDnP7vZMjW+HrLd5fvTpP9NhcOKbC7hPec89bbwamlyuOIBHF4/QgfewRzkRab1xumlYipqcw055JKIaaMG/wiHAfEHNYUtFQJ4SAnR0I2Nu/L5CXrkXD8ZWX1tcgUnRS8jCmpOYCBHNynYiwn4/Yc5nF5p0c+mbqauQjIyZ0n55hwTD2vrFEc97sDeBKR2bSD1mskginNIFg/82fgyKaissF1YooHz+RhitETPrqSJDmb6WDanh9kNlidVAiTP3N5QDFtxeDHUPTPaRoHw8sol/ksH6pHcOq8ureeesXgy6UAmN1PKG0wSdzpo+2x2OKzKfpzW5ffQ0WlXXRc9g6nuBZxznmvIwvUryqJnkwcRuMngVG5hkt2PiF0mOeaAxNCXdAF3yyTcN/KTXpvUgWZh2I9ko46qGVeZ1BqyVXQhp6FjM11RargXG2UjE02I7JFunhYfO2x34i5Gvav2QzzoWpO/CJGbzRelixEOekxBeFHFkQNcNMExiN1djHIwhgXoY5CxE2mKmJUw/1I40Qp5FVJA59M1GiPpklaoZuBQ033LerY5ru6wVE3DpW6Wmvuiz8Iept76H5oRhWr14zBVMw7L4atQ1E9Om+RlMlLPfkpfTJWLy7w64xjv4oEmyDHA8VCezQEc4Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(34020700016)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	DwIX1Uz5n0LP/nxvDUlW+vAGB6sFLncmNj/PSiqOsPKcEtyXzsI1kjYMsdhkC8fnpkghCjNN8jTa5cLizu/l8WB3JTd8C2WJZhkQPEUMwTRkaQ5o5oUYj52HtvCQekbvu+m3x1TQRvARpfiyavAWOcdSiIdqy4pCoxSqGCTRWct8HgkOYOaocC0fvALuqgss9YoaiQIL8pbIiUiYvp/zV1SW80OvjLu9Gar6iRd8/nF1ayxXCqQH1pocAHMrSxGZfzZAtMXn6/SK+A9RjZ5abV/v04CzIRBaO4ekIZbTC8lNlakNljGDRwFjKkeRjjkOs+/dywlB8EEPtrcyQt1JQWLk1Li3Xy7/26r4G8cp+rWSy8AbtrP7YkMM8pNyl+4i9xxToZou+1PiAtJ8cTNUkUReoviMxhlWdbSyTBnrNr7SHfBHcXmImAbY3I7+5TCj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:32:11.0339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84343b0f-66df-4d4c-afb4-08de7aede5a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8069
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 19:32:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17260

We are migrating ARM NN from v24.11 to the
latest version v26.01

Key Changes:
 - Update SRCREV to the stable v26.01

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
Change Logs:=20

v2-> v3:
 - Removed patch 0001-Fix-type-casting-for-32bit-builds.patch
 - Link to v2:
   - https://patchwork.yoctoproject.org/project/arago/cover/20260305173419.=
1735480-1-p-deshmukh@ti.com/

v1 -> v2:
 - No Changes
 - Link to v1:
   - https://patchwork.yoctoproject.org/project/arago/cover/20260304123221.=
1450993-1-p-deshmukh@ti.com/

 ...01-Fix-type-casting-for-32bit-builds.patch | 40 -------------------
 .../armnn/{armnn_24.11.bb =3D> armnn_26.01.bb}  | 10 +++--
 2 files changed, 6 insertions(+), 44 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/armnn/armnn/0001-Fix=
-type-casting-for-32bit-builds.patch
 rename meta-arago-extras/recipes-devtools/armnn/{armnn_24.11.bb =3D> armnn=
_26.01.bb} (88%)

diff --git a/meta-arago-extras/recipes-devtools/armnn/armnn/0001-Fix-type-c=
asting-for-32bit-builds.patch b/meta-arago-extras/recipes-devtools/armnn/ar=
mnn/0001-Fix-type-casting-for-32bit-builds.patch
deleted file mode 100644
index 9f59de9a..00000000
--- a/meta-arago-extras/recipes-devtools/armnn/armnn/0001-Fix-type-casting-=
for-32bit-builds.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 10953c25a77989709bcbd065489700314fe0c8c6 Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Thu, 16 Jan 2025 11:11:28 -0600
-Subject: [PATCH] Fix type casting for 32bit builds
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrew Davis <afd@ti.com>
-Change-Id: Id68274e68e7832b827050a2e417053e88e7a6728
----
- include/armnn/Numpy.hpp                         | 2 +-
- tests/ExecuteNetwork/FileComparisonExecutor.cpp | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/armnn/Numpy.hpp b/include/armnn/Numpy.hpp
-index a4154b434..f77b065ca 100644
---- a/include/armnn/Numpy.hpp
-+++ b/include/armnn/Numpy.hpp
-@@ -209,7 +209,7 @@ namespace armnnNumpy
-     template<typename T>
-     inline void ReadData(std::ifstream& ifStream, T* tensor, const unsign=
ed int& numElements)
-     {
--        ifStream.read(reinterpret_cast<char *>(tensor), sizeof(T) * numEl=
ements);
-+        ifStream.read(reinterpret_cast<char *>(tensor), static_cast<std::=
streamsize>(sizeof(T) * numElements));
-     }
-
-
-diff --git a/tests/ExecuteNetwork/FileComparisonExecutor.cpp b/tests/Execu=
teNetwork/FileComparisonExecutor.cpp
-index 903ed0362..4617ebe4a 100644
---- a/tests/ExecuteNetwork/FileComparisonExecutor.cpp
-+++ b/tests/ExecuteNetwork/FileComparisonExecutor.cpp
-@@ -187,7 +187,7 @@ Tensor ReadTensorFromFile(const std::string fileName)
-
-     // We'll read the entire file into one buffer.
-     std::ifstream file(fileName, std::ios::binary);
--    std::vector<char> buffer(fileSize);
-+    std::vector<char> buffer(static_cast<std::size_t>(fileSize));
-     if (file.read(buffer.data(), static_cast<std::streamsize>(fileSize)))
-     {
-         std::string tensorName;
diff --git a/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb b/meta=
-arago-extras/recipes-devtools/armnn/armnn_26.01.bb
similarity index 88%
rename from meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
rename to meta-arago-extras/recipes-devtools/armnn/armnn_26.01.bb
index af55fa4d..b1172ea0 100644
--- a/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
+++ b/meta-arago-extras/recipes-devtools/armnn/armnn_26.01.bb
@@ -3,12 +3,11 @@ DESCRIPTION =3D "Linux software and tools to enable machi=
ne learning workloads on
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3e14a924c16f7d828b8335a59da6407=
4"
=20
-BRANCH =3D "branches/armnn_24_11"
+BRANCH =3D "branches/armnn_26_01"
 SRC_URI =3D "git://github.com/ARM-software/armnn.git;branch=3D${BRANCH};pr=
otocol=3Dhttps"
-SRC_URI +=3D "file://0001-Fix-type-casting-for-32bit-builds.patch"
=20
-# v24.11
-SRCREV =3D "3ed70c005559d409feff2c578a1a39cf8fec8804"
+# v26.01
+SRCREV =3D "600c0004a2a7a2d600a3bce22ef83193de1dde57"
=20
 # Only compatible with armv7a, armv7ve, and aarch64
 COMPATIBLE_MACHINE =3D "(^$)"
@@ -37,6 +36,9 @@ PACKAGECONFIG[ref] =3D "-DARMNNREF=3D1, -DARMNNREF=3D0"
=20
 EXTRA_OECMAKE +=3D " \
     -DHALF_INCLUDE=3D${STAGING_DIR_TARGET} \
+    -DARMCOMPUTE_LIBRARY_RELEASE=3D${STAGING_LIBDIR}/libarm_compute.so \
+    -DARMCOMPUTE_LIBRARY_DEBUG=3D${STAGING_LIBDIR}/libarm_compute.so \
+    -DARMCOMPUTE_INCLUDE=3D${STAGING_INCDIR} \
 "
=20
 do_install:append() {
--=20
2.34.1


