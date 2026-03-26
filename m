Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7161109C038
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 07:27:09 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42802.1774510027786987127
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 00:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=IqXQ5sMZ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.59, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBLOVkgma0guY8AVvUOHLG4RTGALEUZf9fJKZKBnMEUwnQQC/FEYrZrkgV8ZAUgKock9xE9nL6nvqDZNPsKIpFAX7B/xwdJpMt2Zz70p9wdl6LxS09pR/A1vZpTRHWngzGPRQwzrunrZG9QnXvNWS0H+BB7GpXSueJN5xOKmhkhNI8fLBDAapj6b/gEKRSW4gitoA+tRExFlO0bRQ7InHkXU+JraCazQlph69GPmymiCQnS5oUbVLTavWvMQl8vxEIcvzPcTga0THrA8EIk4U5Tho1S3mVYawRf88tq+eG+L0O0lj75yibtEEMt4+lu4ATQgT3IXJX2a5KQK8CKSbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izW8ekk001l+9zql2fs1xRVj3zqjkaIeIIxBvBnOhes=;
 b=dYvrh7++nJjq/GreQat0ycF+TLwj+VjZg7nUw4W3hBaRFdsiL0ed4HG9TOl1OaLJTLytRBgbatkifYXkwOZOx/fuVec9hQs1uJb0ZwYk1EaYDLw/i6e3cNSaGFgAUgTPrat4FxsezbWCAmiiCe6Vy03qWZXr6RnS4/KO0NYyn3gN/ywHe1J2XgjGwaSweFZHc3JGIStamtnklPll5nAn7CZAFcoBJdiAqq6UlNYgEVbVnFqaNaclSTvX//ZtZPReylb7V0ytFKal5ruE4zZT8ojCvnVZgy6vNstV/j2gC5DkPaGsZoqZpJh8vVtJbbN4pUKOV/mGMFgtna1yGdai+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izW8ekk001l+9zql2fs1xRVj3zqjkaIeIIxBvBnOhes=;
 b=IqXQ5sMZbxNMTONiDY7eduJlgux6KtEM0Edd56BkuvVl/RUjWSB+JMmHsTTgLrulAVM0XoO/LS9e6gDfn621BWuE+nVcykYbeYhvvu+uoG2DevYKcUersQZrQMR8DFXDtBCDAsjZi5S/uM4eR3G28Cl7J/Lvf5yh/6vWMxZLDYk=
Received: from PH8P221CA0050.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::11)
 by DM6PR10MB4124.namprd10.prod.outlook.com (2603:10b6:5:218::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 07:27:05 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:510:346:cafe::89) by PH8P221CA0050.outlook.office365.com
 (2603:10b6:510:346::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Thu,
 26 Mar 2026 07:27:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 07:27:05 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 02:27:04 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 02:27:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 02:27:04 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q7Qsxd1733061;
	Thu, 26 Mar 2026 02:27:02 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v2 2/3] onnx: fix 32-bit ARM build failure due to LONG_BIT mismatch
Date: Thu, 26 Mar 2026 12:56:52 +0530
Message-ID: <20260326072653.1025506-3-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326072653.1025506-1-p-deshmukh@ti.com>
References: <20260326072653.1025506-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|DM6PR10MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: 0666a6fa-cd29-4395-45b5-08de8b0914b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	S+TP0I6CzuAdRoXguBPp587B9K3991KVOFMN1OJHQ0a7UIZwDuAOdrMMXf7yNowPz8CDh9f/xdx0VtgtJ1yNUyawxQgM8BWIW+0fVYcu/89lpJAbpoKngDJzpaL+mTjBhoYRvKr1h4DEEj9Rs9OtC6sHTwNw0Z3ST7Zw7Iz4EbDTSTJ6kl0LB0c6MM6I30rKs3vTa36XQ++b1ugChG3Ex0KwXSMrsv5OaS7N6G7jmQH/dwatrKiFSqoAH4GEB6hCfqbBD+Ga7RlA78aE9FEbl+qQt4XE2JThytgjOB83Bp0RNozJRiL5tW47LuA5Xj7XpCiH1DbXkcCosOVJK0EKe1GJfAzW4DlOSUNRRt2dp5Q+rVru6BWe7mLGe5ey9/UCfbL/+7GndKySgHEagaoHLzXHSn8gxe6O+Pi/hd7aHxkWb08Ue4I7TiqQ/v86EwzWcFthD4ylfnXOn8z6O1NZmrxtoBNz3ERcS9SJZ6rin6ozQ+nthRRubDdbFXiG7PabzeWKGVWKXadslj+JWUhQrddVtCvkrH3YcwakyClKsqHHQMArKJyqOcxqVLzbnkK4ePjOPCPABMtNKqnygE86ncEflpIMZa4zMHF+ceEgSVTdtwCWXZbBZpB4iUmhQTlJoRzQ47Ky4CT7mJi0gDs7CBCq8K4n4gJFcMQEM+3qBbJt4Zh62NflPtztYYY+VHidPdO3RKnmOOZSNWuhJbFhSULyDqfRIqpX7/8B3PEtleMjVaRp2tcxGSDjea4PWdjVsESZMQbbE/nDQd4UTdKg2w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZBhRMaKmt40rkdwwpAQ8mVpiUS2cblMYcOLrwRnrVYha8IRuk9LL87XBAVh6He5EqsD6LwCDZ2s/u96D4fl84TNgnLFfHi8KYpqiFttTsVKCAjTrHMkHKEL5F4lflEfjr6rT3NuoTrJgevWEn6176ynaZnaX0Wp4OIqYocldMD1HIn2vhs8lPYVh9axCQkcwU1XdzbhnC1tMe+OKywACexga5jq36wnQ8/fJ/46Z2qq+VzYouGhKNpSzLruDRYU1fNrP2LmD+f8sCfbXWekEzw3M4R7iny1I2CLaqH8Bq/vEpu4XIHOqgam+2U7bS8LJjHMQHUi/cg9Mbiz8cA8eJKJBhoO7V63w8LnIn78h7izzrsEv10CPB4xUEwGKQbnSG9/pX3v7aAxrEfM2tM8dnK6BfSiwsZMniI2iY4sNfoPUNLlSA5eBV5o8qgQH01R7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:27:05.1059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0666a6fa-cd29-4395-45b5-08de8b0914b8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4124
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Mar 2026 07:27:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17441

Switch from python3native to python3targetconfig and update CMake
include paths to point to the target sysroot.

The build was incorrectly pulling Python headers from the native
(x86_64) sysroot, leading to a "LONG_BIT definition appears wrong"
error when cross-compiling for 32-bit ARMv7. Using python3targetconfig
ensures the compiler uses the target's architecture-specific
configuration, making the recipe compatible with both the
architectures.

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
Change Logs:
 - No Changes

 meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb b/meta=
-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
index fc565dec..7d27119d 100644
--- a/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
+++ b/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
@@ -61,7 +61,7 @@ EXTRA_OECMAKE:append =3D " \
 	--log-level=3DVERBOSE \
 "
=20
-inherit python3native cmake
+inherit python3targetconfig cmake
=20
 python do_build_version_file() {
     import os
--=20
2.34.1


