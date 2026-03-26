Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E37E106F2FC
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 08:12:10 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42631.1774512727674816663
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 01:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=STGB06sY;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.57.41, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vthTK7kLWQbES6SJJG5Pb6riJnc5vWEikiMh6wiJ0r6zH+pRQHVRW1mvs3HdgaODldSpHdXHAw5n+PPNxelQ3eel684rUbBNiG8UF+xWzYel2xZ6nQ3SrxHX+se7X63wgCiL069hxjsStE7bdiKXgV2i5wekQJQYYWFHvXXMotw4Sn4wqC3M2SQEzIvGX5QbaZhxfi6ecFm973RNVD8qhV+WQjsP7vqSYWbkETpzPgSK2KLo3mewMX637NmqW2pP9G0VTNZtE1PJZr+QCs6osrVOBA8sw076rcON8Xs8XB7cjtFEG+/Ou0JDXfIR8YYg7/CHqUPo0ZkoAtyaw3B4nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqIpVqjmxwAPZEwIMRK0XJdU9M0QQnGuS/70v4mz6Ic=;
 b=mKEMOlSgbRRhgBGZAjFSQGkXVR0iY8b2D5XGPLLCRyY091yROhgLgpvLdu8Dr5/9qLt7L1gP9XzwEfsclGJY5Fxsd/DedgHZgLW1GAnxkvvwkx1tcWxzh3RGGXdKF3nJK9jDyPGLOhMK8dqt/4qVsPxpaus1QrQ4CC26L5BDBeSaAMyvt2h7uDstQSz7u4JdtAB7hV6gJVJjbRwDIFI1O/lbBSwY4qrjEwuhOBczUpOXn1Or8l30RvYz8I0bZqWbraVex2HP3lZtH4WJO9UPYY3gZ2hEPoAdDY23I+WspkLeKxKBKqbpRGp2RXMUI8uRjU/JDnushyVIaRQlkP5EVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqIpVqjmxwAPZEwIMRK0XJdU9M0QQnGuS/70v4mz6Ic=;
 b=STGB06sYdjj38xY06uD1EWI248Lpjk98oFS8Uv6O9AASvA7L+6OV6w2kY72rUbaLtgDzbtUd8DNNGwTzNOkrJCkjrOkWYh7BQuMwUuYLLr3w79kLQd/OUz++rpavkUIhnwP07hPDVKCd2mqUwf3buPhyTQ/J+lQSLk3ybB6OoJk=
Received: from MW4P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::10)
 by SJ0PR10MB6327.namprd10.prod.outlook.com (2603:10b6:a03:44d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Thu, 26 Mar
 2026 08:12:04 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:303:8b:cafe::fa) by MW4P221CA0005.outlook.office365.com
 (2603:10b6:303:8b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Thu,
 26 Mar 2026 08:12:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 26 Mar 2026 08:12:02 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:12:01 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:12:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 03:12:01 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q8BqKI1796058;
	Thu, 26 Mar 2026 03:11:59 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v3 2/3] onnx: fix 32-bit ARM build failure due to LONG_BIT mismatch
Date: Thu, 26 Mar 2026 13:41:50 +0530
Message-ID: <20260326081151.1214749-3-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326081151.1214749-1-p-deshmukh@ti.com>
References: <20260326081151.1214749-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|SJ0PR10MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c887bd-2447-40f8-b93f-08de8b0f5ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	mRolw7ZsWeLFUCi0lDo23H8EvgNTsOLjQ8antYbspkxvxyNvdkQz1PG+BEkTRMKAIy0lPFtRlO+naeajp0d3w4eqlL1p+dk1kmAB620FgG0dsWYTddhAsTVcsOiEopL2C+uRe3fnK3BjiMFuaNIkwe8qvcJ45IY3x5lvZaejVZ54CTb/EzgXEiG8fpgrMyCbhZOkucnJNAzKqmWJO0enfCOAYlvpFkkJItd0eWTKWO7fi3VuUHT0MVQ7PACDAnbXZU6O8TsQ9Y21QCRAvQSMvBRV8SI7lI5wOC00+U9jRTgJpKHIBULZgAjaHC9PmLx5XbxMhsb+ctN71IRBvCPwsA/8F7scMAjWR5d8QD4eln3oZnK9p1DP9A/qt3P/f9b8UK0ISEdvdKjx71tKhNa/F+1SAQed/O4cA8Ti9lkSVkowwk1rzfjuIGPCr7AXKHIegLtf8TqS0/kZkUa+DhzlBHzVr6EhAL97hzPEjHpLmF2ftbwGGY40zNrUScFkzPmxnjFxuvfHohoXHJ8cLXUGeMVDR72h/tl+V5DtSMMcNaKQVU0IvJDy5dZL7RjIMh7h9xXN5YR4/EjxhxkQe9hiDk7wYWcpIbLeU/OllKGOAlzjxaSqfgYL1uKNUkc8Fu46JMfIQ/KTyhhn48wvhZJISWi01H0e9YMuSsmfFJ5TSRb0gI+hkA/IJRqZNXidFxM9VZ7g0dhXVUGW+/tncOQTAv3984lMAhUbF0h68+qTf3g1ZQkjuBIIFBvhA5CFvXgrzDZsvBYdqBMaIas/SoMMUQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	a+0R0P8SYA6ihUxOWGR0jr9B5gCfUWVTJF69ROLIzNQSZtgrIoPmHz6dL+Vw1wzQFF16ESB2p9XTNMdEFSvowmDoA254CS5KxWzty2zg24pbB7ryvnk4Wl4RRC3ZNhNniUtso57Q5EmFMJc7lpYQKVY5cHMxejlxm2kUbmWNB7YozDYtFw1nCVFqQTLyQbBWbYlcKho5t00iGiy44IsO+gZjVSX6AfwFNfzI3zeQCwnlL2CYP0F7EvZ2HQ4LYWomRqlAibO/hyRvUrxAfk7OpT7VntcYvJDX7Km1DQVjEzkjdsIIPPZ9bNFozK808tMUgc4SNv/7B3kbdVfW9BUrWZSfIjJWnEHzSvB10KtNI+MPqrsD8VC9RfqClLqNZHblzM88SjaNFtFVr6ky+1dZwHoyocW10sck3adpgSK4GToOrFOU8hMxVwflOJdR2T5X
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 08:12:02.6684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c887bd-2447-40f8-b93f-08de8b0f5ca1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6327
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Mar 2026 08:12:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17448

Switch from python3native to python3targetconfig to
resolve cross-compilation issues on 32-bit architecture.

The build was incorrectly pulling Python headers from the native
(x86_64) sysroot, leading to a "LONG_BIT definition appears wrong"
error when cross-compiling for 32-bit ARMv7. Using python3targetconfig
ensures the compiler uses the target's architecture-specific
configuration, making the recipe compatible with both the
architectures.

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
Change Logs:

v2 -> v3:
 - Update the commit messgae addressing Chirag's comment on v2

v1 -> v2:
 - None

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


