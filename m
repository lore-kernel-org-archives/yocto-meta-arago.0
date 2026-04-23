Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B98F99344
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 07:54:28 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14615.1776930860876346958
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 00:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=MhSN+wB7;
 spf=pass (domain: ti.com, ip: 52.101.85.51, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFjL7mYN5eoJJHymJpbsS95rQHupsrZM3VPB42bjf8DhLjlUejfictViOWPwccNjIrEBo3AUgyHhWr/QZRMFEYAI2gWwapmExM/8N+a05eEqd4rOuGSeqyIlorppA5yC1R4r860QDhUx+JADiIUjh1oq4tngfqkm6bML51+7snmWyQ0wv3wP+BoR3c9PWHZchYaycXEl/QdsvjAD6+wY2pi7NEq5UgpQMe+JRiXwfbJ8GIy2xA+RyUvmdZoJcFqT/PUtkNmNQHlQ8aYPUM7X/bPb9LsdkYpkXwEjfzzbOoTlWUkvkNZSDe+SIzyMNlvjSDqqNA8qwpOR8kkueGv+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuuKUOtwevxbUp/kgDurgQ9r/CNQnGNji4/VanQOa64=;
 b=GP+W4Rt1XUzRbxAOFoeCKeLNye6oOd7KLiZTFRYgJK68aoeSsCbSXnXTqVIBcjVELwNWwIvloyQFnxwZEtY3hTrEELV2VrRsDYo4MicSjL6HX4uQq+yI13VSC5rQ8LxEEEsrHggAGeHjlpn6iRSYv5WnJ/7dFIhS2yKBV4wyIQIda0M1Cit4/9eZB3PNs+fbtjZ9ZkEzZwNNQLJ9RWH0WzpmD/Nvrf1496ZoBqUkGOP4Pc6FQYbVuseuh+U8NCJN100Pk9HfszGhX20m4SzaGYPtizA73CCu9JeTGMJlTqTqapgP2cgKX9DN3V/VjH9m8GJaxPZACVz0zOpYGdo+LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuuKUOtwevxbUp/kgDurgQ9r/CNQnGNji4/VanQOa64=;
 b=MhSN+wB7Zp8wQwG1vrwQLV7s8zWcB7qninfgKFr7Gn2RUVk0+Bo8SPymtFMdbomLKbWgJdeePkEe7/9Ztf07Swr2m+NJVGPRdcD8ZdffsLILo1aXYynq5J/NC/xdOEx6WnDUBW8rXl+uPvcdMFjhOV1bOvv47Zfi0xrAjCqvUuQ=
Received: from SA0PR11CA0047.namprd11.prod.outlook.com (2603:10b6:806:d0::22)
 by SA1PR10MB5685.namprd10.prod.outlook.com (2603:10b6:806:23d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Thu, 23 Apr
 2026 07:54:18 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:d0:cafe::8) by SA0PR11CA0047.outlook.office365.com
 (2603:10b6:806:d0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.21 via Frontend Transport; Thu,
 23 Apr 2026 07:54:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 07:54:17 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 02:54:16 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 02:54:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 02:54:16 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63N7sA8p3876629;
	Thu, 23 Apr 2026 02:54:14 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v 1/1] tensorflow-lite: Fix file packaging for headers and symlinks
Date: Thu, 23 Apr 2026 13:24:08 +0530
Message-ID: <20260423075408.1886225-2-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260423075408.1886225-1-p-deshmukh@ti.com>
References: <20260423075408.1886225-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|SA1PR10MB5685:EE_
X-MS-Office365-Filtering-Correlation-Id: b906092a-db94-47d6-6e0e-08dea10d8548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	XUNZzcrYCyb5orGKYgVz5yQ8zO7vg7m8iRRsJqVPeo152CmafQbGK+ZyUpmq/0Lj+N9/Mh//kA5TjazzAPxTRtnbQzLK94oBi/7M2/fKaVBn9w7ltYk2fmnOod3EHnvywWew+2hfQMKrD4pN7zivm9GTNz0rg3DKAZbxAPJV5VTBoLEVNZiTVXYa/oFi5ezVJ+24QXeQJugNCR0mUtbt5PL99YDotc1mWU4XLX9rscHqW96L9vmHNujf002lEzud7z6TKTO2O/Zk77CMVz3iyZa7ZYaLge3OJovlFCwAzK1Jdg6mi2A61qL+Aa3A4f6DlErtzG29jOQHakYUVyTlRMnDTInxV2Y9NXtDEzKNP+yDMlG0sMT0QAM18ypGc3ctvPnodAoLTCwcuIKC7iUauvbySLXf0wxBZ4ikUjRsNtz6Xsz6Ld5xGNpMDAPvpDr37sBVsXTX4mta1XEggOfpd546+colWr4RREuGJapJ7s5G4KupC8GX/M99FwtlBds8aRWM+5kAGmqpxJqb9k4GqF2Kq84e2Iu50NzsWh6BLy82e1i44J2ilGsFMiIN1edJyfLRuuazpVCg/kDAf5nzN0AqBTy5zNjpeUWFqxCmjof29u9E1kH2YqczCbZBlRfbirKCQccqBwBRI5DRSIyKPP+meDUzuZijp6K8LeP365VXbKep+TfLcdYuq1q90etucQQtn9cQozjyH3vjTnDJ3IAMTbVS+CeD3a24V4FO8/4gxY18C54EveYVVaUoE9qH4IgJOGZ9qcIUWBzKw5elEQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JSS6g3+aPHlossvVOAaFCNEXyQRNBoUz/RmBAPFTVYaTvlxa25a63aFrVwdG9siea2hbAVxRZVJvCvit2jvte/wtyYkUZ8ECh8sMTbxL9y5RYGGPr4N97KFvsAtNeqKL0PeKbKMOk0WBmzUtj0uGK3pP1M+xkMmHt58QhmU4gmJ6PVsg75lkbVHQn+dRs7RgySq9zm3hIf6tMqVwERn2zcu5Gwc/DtrpXXLilwcnVgY5p+H2CbF8brNwBIeFz0Al9qkUdHsnBxPPsGvaEOVpY2VkGM9/uyabAT50e+DTYM0LQxWeqkjlxEQ7CCVF4a92qRA0mriBQwSh9o2iz/dmekX2GY5A3aNFO8MVFo4WJCE/TKvsKQ4w4JrKMz73htvYGpM8woOeoPZPE9M0ovUqqX+xo+KHoAssFxh8cSgHwdQ2LFQET+lwsFo2N7lYq5DV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 07:54:17.5283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b906092a-db94-47d6-6e0e-08dea10d8548
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5685
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Apr 2026 07:54:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17483

The TensorFlow Lite recipe was missing proper packaging directives for
development files, causing two issues:

1. Headers installed to ${includedir} were not being packaged into any
   specific package, resulting in missing headers in the final rootfs
   despite being built and installed correctly.

2. Unversioned .so symlinks (libtensorflow-lite.so, libtensorflowlite.so)
   were incorrectly placed in the main runtime package instead of the
   development package, triggering QA error [dev-so].

Add FILES:${PN}-dev to properly assign development files:
   - ${includedir}/* for TensorFlow Lite headers
   - libdir}/lib*.so for unversioned shared library symlinks

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
 .../tensorflow-lite/tensorflow-lite_2.20.0.bb                | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow=
-lite_2.20.0.bb b/meta-arago-extras/recipes-framework/tensorflow-lite/tenso=
rflow-lite_2.20.0.bb
index 559ec5ef..75889b7e 100644
--- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2=
.20.0.bb
+++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2=
.20.0.bb
@@ -229,6 +229,11 @@ FILES:${PN}-tools =3D " \
     /opt/* \
 "
=20
+FILES:${PN}-dev +=3D " \
+    ${includedir}/* \
+    ${libdir}/lib*.so \
+"
+
 FILES:python3-${PN} =3D " \
     ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime \
     ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime.egg-info \
--=20
2.34.1


