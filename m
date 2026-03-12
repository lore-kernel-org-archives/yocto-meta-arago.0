Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BED1067034
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:20:21 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22808.1773325211950939149
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 07:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=w7IIztBX;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.47, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odmpQLldc061Ki4RmaoVmsI7WMA/W9xTDKKgW1CLDMOnrgMS+i08hzN6TDqgbSwF3qLVukDF1e59Cx3kgKb869NTR/PZyo9Z96/KO+BC+nTTx5Alkqd+u+mZ1j4Ycz7nthDnfycJhhiuKxecIgAThk4k+E+SVvpH1x7jqAWhVsnZ8ZK6xmdAZCxEOdyNsJYEfd0YbAbAD7ocf/QSn8co18wxEUWDMkJ/gupZUw4q79W4ENpyPHgQfDvWbHfpPLPpJDGqA/bmpqiVds0+Mvz3oZAPXNB3WpklDGE/13d8ndFEjq0RzaHt0YNOnSGZDEHsCdbbBmsd0WtcUxn96gh59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILq7TaBTq3xJOl9qLz7teNM1bbYIqGp1/pgbhhX1vbQ=;
 b=BlR7TqroTlv1UCFohAmofQFQlLbu7rgQvRqeCMCXdff/kYKkrBVJofd38PnjxKSpiXlgN+lRoNyrTI1M2o3lM1oIZmnQEWCYJqXp7UD8bpz98xpfHcI+dxseLn4BKtlhmloXvU7JA5miJSftIIii+PnGEEzbWjwzQGmzT7Ub2q5tQ6TyClk36N7WbPO/BTselR8QECucbN4ECv0r8xL/nJnsyMLpxV3wm06u2pRvSJMQRLzh74AdR/Q657WQoQ57i4gPXg07nTDJSSYsucjMS6nkxp3MZY+i9fYfEIr7so2DYtrJdZO/v2u/2tkYxRFbUwMD4xh89jk1kC+pROf98g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILq7TaBTq3xJOl9qLz7teNM1bbYIqGp1/pgbhhX1vbQ=;
 b=w7IIztBX8ucaLp7R0spFzwm/7/V77a6VzzcEezW+VyOt3L7S5oIO3+nqscqfnP5D+tYKGONoTqHqTZU/HobXrt9SKOWLq35hrjZuI5q97EaavMgFFYbBHxt/yeGMFx3I8149+KoudwLFOLx/qpoSYUOgbMCgkZJNIjDGJE8b7IQ=
Received: from DS7PR07CA0018.namprd07.prod.outlook.com (2603:10b6:5:3af::27)
 by DS0PR10MB6174.namprd10.prod.outlook.com (2603:10b6:8:c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 14:20:07 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:3af:cafe::70) by DS7PR07CA0018.outlook.office365.com
 (2603:10b6:5:3af::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.29 via Frontend Transport; Thu,
 12 Mar 2026 14:20:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 14:20:04 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 09:19:53 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 09:19:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 09:19:53 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CEJo1Z2964016;
	Thu, 12 Mar 2026 09:19:51 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH 0/1] Fix TensorFlow Lite GStreamer pipeline failures
Date: Thu, 12 Mar 2026 19:49:47 +0530
Message-ID: <20260312141948.1002945-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|DS0PR10MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: 125e9cc4-875b-43c4-9abd-08de804274e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	aKx1LW7M54X6Q8ALRW0V55cHq4HwgooIeJ3cNJtOao053ZZPtZdUTw1/xLcvGC0YHhGZqwltH4u32tWrYm982UqARps21FDzPYf36ujRA9qwJDUoy6vWGNUhmMEoambWzxG6aK7aXLU79izvAxXwhvd5/6p3KaLWOgkRmwB1lPcg4pM6jXg15vkCvkywvNS8i3D0ZxHyxxQU9dI45QqSXOxXpuMP3CZDObKTWYC4QNVWt+3QBu0xJRfOZsNmy8c9LTYsWBSaJa58RpxWCZV8OIhe82cntWntfZnWJxRUQf2y5AJeQK1EO4aYP+TybPdecWmT10SioqBVs2Fk3pLZTu2UCvBu22xP4XWJJQv5T3bLOeqj7MVXRdNkLTmAjcNjrwcUc0qZFjJhWDhVUftRhk55YdS3RGdxUnMTt9B0ZDqSsGN0Lgljj4HBnoNl1xSdjFzcUVmtX8bR51c7BYyBt3G7ogsereVgKPTdk8f4L+aBrd79HZ5nDfynx2UY1l5IwmVk4VHZzVBLIY02kPynpj7ntEqowPI5peY+gsef6GLd7rPEBk05rtZWFCtRV9Z0jmmaVKPu6gEqZbDQe6W+hFDiLbt4tMaw0dPOumKKc27NHZTZpqro+O5X52+BR/FNqb+8qyms6LP7CSihXHaP07rI+ysPwaFmyPVlIVvV9Mzuk/PJz5OdsbKyXs/bS5Lx3HoCQOKSajemh3ryt1opxELgXMSCmXes/SZK9zZNmuCSeDmv3ClDqke57MQioehI32woVMKuH3hHCfhZgneo5A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	b9iLvbtBb/FUUXCUA9AnujXlIOiQs0E1QuvZQO36Q09kemBYtpP1cAZzOdPg52HqoyhpHMRo2d0v59JjEEgI/rnudbLB2HCVzIfDkGvX4WjmoNJRXvUwaRMJzhk99oZgWBZ27z4tyBEQoPDj7MMpTMiakeHEikRu7mtGXWaEiJy7ydxezm1uWzklH9pWv0GoVFlHVEeoo+k71OhkCblzh3ubNPEFUgXy54pWrB1y6HJpNGw80e1rveBAileqG5mWsbhipVpjUcAKIwU3QNBnCsDrp76e83357LiV1UabfAB9ZA6CFOWShkcUH0+iYtJK1c4uZcahWE501nXs+trjgzoUlg0xcHsuzaoiDP1ucFB1xs/d4UGgbwD4+Xfv6sxvuuSoo9Pk00eIijb641hu2bNoy0LavAmndkZXGEN/V92IuUDiKImooFxsEj5NdY1/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:20:04.9723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 125e9cc4-875b-43c4-9abd-08de804274e7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6174
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Mar 2026 14:20:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17320

This patch series resolves runtime failures in GStreamer pipelines
that use TensorFlow Lite for object detection. The issue
was related to as undefined Abseil logging symbols when loading the tensorf=
low2-lite
NNStreamer plugin.
           =20
The root cause was incomplete linking of Abseil logging components in the
TensorFlow Lite shared library build. While the library loaded successfully=
,
specific logging symbols (_ZN4absl12lts_2025012712log_internal9kCharNullE,
ZN4absl12lts_2025012712log_internal10LogMessageC1EPKciNS2_8ErrorTagE) were
missing at runtime.
                                                                           =
                                                                           =
                                                           =20
The fix adds the missing Abseil logging targets (log_internal_nullguard,
log_internal_message, log_severity, raw_logging_internal) to both the CMake
module discovery and the tensorflow-lite target linking, ensuring all requi=
red
symbols are embedded in the shared library.

Pratham Deshmukh (1):
  tensorflow-lite: fix undefined Abseil logging symbols in shared
    library

 ...nsorFlow-Lite-pipeline-failures-due-.patch | 62 +++++++++++++++++++
 .../tensorflow-lite/tensorflow-lite_2.20.0.bb |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/ten=
sorflow-lite/0003-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patc=
h

--=20
2.34.1


