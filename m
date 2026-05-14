Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B69CD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 21:55:01 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22495.1778795692572746546
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 14 May 2026 14:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=M7Wh955C;
 spf=pass (domain: ti.com, ip: 52.101.46.52, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hluNPAr/y6L/xAiftD3WE8KLIbqjxqnbDiy34b/yVpIecqBcwr7SCLxJL73jTtPoBnBNl9zNHbOYP7FFkchBoPkT0K7YtWGKsPhsQRGqA1y4djRL5m3L74uYP4FpZTtUofoJG8hRwELIz1fLxtKk26gDHq0D8w4EtxEloBxXK4a7u9TLT3sHZF5P3ED+lvi1zl3ceFAeIL5S/HNKoPWj5ekbjDmr9ViBooZGBoe1XfECcmNSDrVCJqBT0LTOS1dAnjvbRE9weBUmZyXEp11N3ihEgBA9/n/aZAU8QC0XQh6XvO5eegisF2Pf427zkxC0kQF7OV1xmeum0wI0SzZ5aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qkDJzzH4SGbakAlLBza6c6JeMlg50jdqhXX1cp/y/w=;
 b=Lily6Wz22exnDgHNbwcsEFKxZh2St9Llqq7VQzuZo2egb/rWbyC9wzrAHL0mjdz1820C60EkEfyOnqnGY4pJIm4i4jzD3VAO4wEU6ig9wMDEieF3C5esH5y9xYX8JTZD8fUA2Bu8ztSeqEvYmfwa5XOG+qhTQXDhwaFS4TrE+tSg3yPDuss4ursBBicTHNV+/Jq4ncWvt4nju3+Fa3IKtK7dDLOx3iIHD+CVmxzMPd3seQAb9TTFRJpsdRo7Jp5RciyyBBf6wVZ+OvzQp/1pkzQuIpdeInDJaJ9sc/lAIDtsETUSRr4p/3EIMg64c7S6ysbDsjuqKAHj6ocIErBplg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qkDJzzH4SGbakAlLBza6c6JeMlg50jdqhXX1cp/y/w=;
 b=M7Wh955Cz446O55KJ5Ts4SOXTSX06/JTK+D5GVB4fhy1v+hGxgfW8eRSdo0Sur+evkz104+xoJJ4LOsc30njmCnP7xrNgRMu5cZ1EeuaQFBrsdaDb2iSJL54GZO+0Q3T6Sgg5BX7d9pSrc9vCuwxVkl7F3qICY8ikf2SkgyCnsc=
Received: from CH2PR07CA0065.namprd07.prod.outlook.com (2603:10b6:610:5b::39)
 by DS0PR10MB8078.namprd10.prod.outlook.com (2603:10b6:8:1fd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 21:54:49 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::69) by CH2PR07CA0065.outlook.office365.com
 (2603:10b6:610:5b::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Thu, 14
 May 2026 21:54:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 21:54:48 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 14 May
 2026 16:54:47 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 14 May
 2026 16:54:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 14 May 2026 16:54:47 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.30])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64ELsl0M3080568;
	Thu, 14 May 2026 16:54:47 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master][PATCH] open62541: Update upstream-status of configurable server patch
Date: Thu, 14 May 2026 16:54:26 -0500
Message-ID: <20260514215426.452140-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|DS0PR10MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 384cf3b1-a8cf-40d8-b9aa-08deb2036afb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	OliHRyb5FTCdnwDqYvjDitCC/qj6rq+/Inaf+45OAu+QtZ3b2LjDj/GNZQ14hwoQkx/jPsXzW2M3hVCmS+JKCWPKv4VrlW/pZ2GKNLqvU1EwW2n6rzi1pW9dZm2Cv92RFXnVSvYjuY8okBts3Zo1wKBCiq3LaSzsmyfuN0dGX6xzlu01MS8Ay/xU/g4lvJS2DUGNBRf/aNGC2A0v6x7YCxrDBSNvzvrKRqW2G3sH3t9aydhA7EekkPI7PW7l+Ams7bl8r5UGmhfai9gM7iSHYYsPZLjXsJA2pUnDNFkDeM9Dk+Do2IE4hqUH+oaVMidGLzOT5V8aKASizYjTXquv6r38faDqZO8mFBdyexESW3mHjP9r70Aljdc6oggyIb9D76277JCykGLdMU1BL234s63UAo1wz+cbelHOIVUq89IYGg4Z+kGrOTrxhrNXAY8hEsNbOhBmIbrrBUmShVmVAvNeYdXiGMGTQg6e5BuAEhUIu1dY2d/qF8s+9apF6WLYQqM5FqrcDlGGdMJ4JXwk0lzgvqa6z9lB11GoRUJi0vWqT0Dy9AINkOQjZiP2xmSTI2E9/G6jtVxZloKnk3zG3y+6OLDVeuCd9sCpLnxlsTYNY7UHDJkisXR2BnzSoM811dAjQvh3VFlO7QAjclrORv0LlIFXd0qlpb+ulSlGWT9lrWnscYcW6aRF1R+hWUNPiGSdzXUe0UZcE6Rm2DfVQ7cLE05CPNIaQl/xd8sx+BI=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zeZU+JIqux4GQUqe/kPKSNlvqE1PLFQrk1VFRhUVEMlxkE3DTJE4TdZlkUlNOWT0Bu35nVJm+T/NFAcKxsQ90HWI0vtn0cNFy37ytNa8FMOlVha+N0qhUV84vw/F0qLpki3eQ+L44yqrVDufFMSttrgOAGvg/ozJaIBIhBIK+Ivj99UdLI3gzlqRH2oiqNAdZTIBSpR8PyaLV4lGWbHPlkrl8/bKsqWJMWQ4rcgRqA3/dq6x1sBuY0tLE8ACKf1ehUd+7p39+0kmsm+76/HKrQ/THFmYJa6EbZJizIS8uxKEa8frFmSlNljRGPw7kXYnScmjGPWf8NYG6zwuohSnksvTa4GrFUrWk4Fwnq8xU644nS++92t9YqdgzFAPxBotaZ9ltE5qNQ4CReFh/4F9kWvLK2goMgR+ZQLKlEdjHR0qu9PKNEkGTd3xdCcQf3hO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 21:54:48.1736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 384cf3b1-a8cf-40d8-b9aa-08deb2036afb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8078
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 14 May 2026 21:55:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17520

Update Upstream-Status from Submitted to Backport because it
got merged upstream.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 .../0001-examples-client-allow-configurable-server.patch        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/000=
1-examples-client-allow-configurable-server.patch b/meta-arago-extras/recip=
es-connectivity/open62541/open62541/0001-examples-client-allow-configurable=
-server.patch
index f6a1b724..e950875f 100644
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examp=
les-client-allow-configurable-server.patch
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examp=
les-client-allow-configurable-server.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] examples: client: allow configurable serve=
r
 * Enable a remote server URL to be provided as an argument.
 * Default to localhost if no arguments are provided.
=20
-Upstream-Status: Submitted [https://github.com/open62541/open62541/pull/80=
45]
+Upstream-Status: Backport [dc33c82dcbeea22f8e4fa9ee5e41b691e8db1f03]
=20
 Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
 Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
--=20
2.34.1


