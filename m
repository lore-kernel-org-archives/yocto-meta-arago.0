Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C5BE6BF0A
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 19:25:46 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.333.1769801145379058786
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 11:25:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=cmSV1kRh;
 spf=pass (domain: list.ti.com, ip: 52.101.62.57, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQslGSyxKA2vtXju+OXNl80V/2hJSHZh4wy2+yauIZYjD550tAXBmB+XE7hWQXc08lC74gVbvEyDV5uYTivg7acp/g0G0wPAWiGR3VgD64Ondl8x6IZVKaqiQ4fptQPeXIl+eSYmZnpHLYeLgRSUoaIqWY8gNeoTam79k0xGFW+zEZBt+rxdyBo4nNTBFxJv5soBC2MGXwglDBC84SvaKBLJSqdIvFb3ujD0wx0jcVahVTf7kZV3TEwSkisCbh/jMMOKr5rwSQo1c1IdB1dS6igXjZF2DpUfhhjD00PJXUQLaBGbTm5l4QrWyNRiOz/r8nYGxLkW0qj24Hc6cxTNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTw6D66Xh37sNfaHG7KmbXt19LkFWdjSUkpDQhYSK7w=;
 b=XIop3vdttJn0zspRYHlrKWOEjxEtFmWcXXwza08DAXVuWue3jvVAo/Zuo6LLOILhfxBqm9pyJzlTTqGDJ18SE5w3VjtJI77PUfYLaqNg6nd6Glya2serYX9V3vIzk+rUHtLj0xopCGXx7SPBA5M9/hpDHS8yT4uj9U9/eP9uwKqZGF6TT9arpiYJMi4S86t3nyDnXchqrPWTaztrL2P0UK0kYq7DR5wCEwqfxsOC875D0fy+QFZ7zdf4Bh8DCQ1q3/0YdPZ6lBPFJSw36+ToATIBDiAzbAKvVMOlRFMkSlMYdJZ2ZvAM2dIiWMG/xU+U+xjWqQAAgR0hg+RV99G2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTw6D66Xh37sNfaHG7KmbXt19LkFWdjSUkpDQhYSK7w=;
 b=cmSV1kRhkTkmiwyA/MZcRexdWsOodceq3ZMyuWOqjTUSXInZppqHoudqAXgPtE8p4iarUeIdi1G0NIqXMbuvMh/qpVAZFHlfWdZR4zVdrSEpI20bBHkW3xRTuqWd834ktEilNrSyXoE+HEHFBFlZ1dijRXrvvLnF/Tuh7jpqFtvJxi0xdgx6qhq4g33LkBLuO/eDEUpw8QUKdiAEhp6pJTcc0VdxMHg4vXEWbWcQHGiS68ER/MWQ5vvGsMW5fve/JU8SA+nzxvOf72sQd/nL00oWLg9FeBzKBRjdtoF2SnxU8Wp2cCXY24xfxjn5tqlpr1AHuUEdP6zSVBd3iwR07A==
Received: from BYAPR01CA0058.prod.exchangelabs.com (2603:10b6:a03:94::35) by
 PH7PR10MB5674.namprd10.prod.outlook.com (2603:10b6:510:126::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Fri, 30 Jan
 2026 19:25:42 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::48) by BYAPR01CA0058.outlook.office365.com
 (2603:10b6:a03:94::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 19:25:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 19:25:40 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 13:25:02 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 13:25:02 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 13:25:02 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UJP1Ww1806213;
	Fri, 30 Jan 2026 13:25:01 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id A36082A61; Fri, 30 Jan 2026 13:25:01 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202601300920
Date: Fri, 30 Jan 2026 13:25:01 -0600
Message-ID: <20260130192501.1648172-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|PH7PR10MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: ae30d223-d44f-4cb4-c32a-08de60355ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FwOPVNrny9udTyxhWxQHCMONWoCtf9jaqohWgXyVjerwP88xEccnOPsizuVl?=
 =?us-ascii?Q?XHzc1doAdTBPbI3twrYu34d590tF+eFoETivWkUMi+5c8pUJI3xFtCmGkB2M?=
 =?us-ascii?Q?9XDpuPeovvx474Kiu+HOIbhC+2H3zrxL8ayO1Ug4kerCe+XRzRn7HN8MQZ0A?=
 =?us-ascii?Q?P6JMqmXJI+zjfVDwTIng7jNl9AorcfCrG3tdDFA7qHVfZ1cwyVsDEuRucTD5?=
 =?us-ascii?Q?J0H1dyXaXSSPEOSJxSzJG/qmyA1RhhgmNBlsj9uNpqQpmI+lxlVdpRjaPCrk?=
 =?us-ascii?Q?JJXK7ddXOD+Iii7isFjyDdgUxcpqB+Ih45j4LIqunHIKTC6uJjA31mqC/8d6?=
 =?us-ascii?Q?r9QUejTYCXSNKKxt6Ms5Suge/UClkgH1mqJILAf/E+bHCoqZygv9F7gzSsi1?=
 =?us-ascii?Q?tu9GLCyqQdhwm2bxcSehpgYi3kFy/8tggQFpYfGq1G0ad5Umw1fYkcdRMSt0?=
 =?us-ascii?Q?aJtiUo6Mcwf2KClSBy7p9rCiO1cRY+jlPgoKl3CUUA4JcBPl4baFX/mEYdeG?=
 =?us-ascii?Q?mugAJAJv6owNVhOe3FU7c8bFC0aXZIGUTIDSs7/odFhVomfLsiu5naj0ndko?=
 =?us-ascii?Q?wYpFJzCGeKbAP5EISWWSrndKRl9TOAuQODzkxiuZGsHCpIlmfsKAYg/z1Bnl?=
 =?us-ascii?Q?Aa+2geTrEZ0eKGEYOqi93sShRRVvIV7eLme240s/D3WsF4/iad7I3M6lEfAl?=
 =?us-ascii?Q?73MeVbFcKgQszaG0fLfYMVM/ZQXfEEPw3gR2O5TOaACoRpGjApkxZvzikx0Z?=
 =?us-ascii?Q?fQnFoQqTQ7TeWGkdz80QWJZ37vAfvDpQhlFUYS9rfGMGM0UvSqQTFUwa7Bc6?=
 =?us-ascii?Q?qGzyPgQ0M+Lo9eD+6daN3zF1jNLwibnCD90eL50uPtlTGUKc6iHFaxlwGl0/?=
 =?us-ascii?Q?Nn8MD5B1YxtwspcH1WIgngpmM2BcRimbAaPqqR0klvmK9ttj9L0kjALgDmZH?=
 =?us-ascii?Q?NKtfdpQ7GUuOykwOHLqAcKzad58OolvHgG49y+VTWvNme4NvUjQhV+KFfzma?=
 =?us-ascii?Q?M8xGBG+qH/3F/X4fyisvVUZZ7M7tIg/0cVE14xTtLIqPeNFf78QE866rOdcM?=
 =?us-ascii?Q?bG+ofa0gXEsnkseGqUy2luMhBlw/3Rpbcc85/1+plc2Dd8Gvnx6ik3VK/RzU?=
 =?us-ascii?Q?vMhVtVOagXMdGpP460DGtzGbGc8U1qHQXC1TU4bU3QKXrz+9KBgRXsb5q3te?=
 =?us-ascii?Q?wac2Kx4ZZp7rdW5yKQklcG05n2NByPkK4dnLtr6H3dBLtCDasSFhO3P3CYon?=
 =?us-ascii?Q?lvWYL7tcxMbZBHzpNgX4A2mu4Q7G2FXzSJkvcjaxRHD9sYzsZEftf1NTnwIF?=
 =?us-ascii?Q?pBXFOdVky+TyfTcXsHLgADAB6lXAiPfK3hwXJeRA93uAHtHVNdxx4hJrxXw/?=
 =?us-ascii?Q?oKrsQn1U2zCR7VYUnCFx9JPyxkWLjREM4ZUW7EwV2a6dTlJ+btON62L1b6ST?=
 =?us-ascii?Q?IOWtKnBSH73mosJHTxVE+EYXIbfkawF8LXQsULpoq0UMAcUYiVIrjETtZyq8?=
 =?us-ascii?Q?JahQDyIeSELs4155zHExlGguopxGW6xTLB4c/fa/9WRS1FyswKbbpawbLlS+?=
 =?us-ascii?Q?DPlcORmpif4YhFJrkmUlLEGwKfHF3JwZTNVlXCC5Wk7O5cz1j8m82dMFb1dW?=
 =?us-ascii?Q?5ZgP4S2Xi6tyTg98kOzHDd/a+1oHxoxKu2Be7/v84/m+xYeLWf4PlaIceQiP?=
 =?us-ascii?Q?fVY8mw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qVqoSGK/KZPON5IeYoP0lB9zI9W/GEKH5IOCel1W2u3DPG9K/eoHUj+4q/Em2tt8kLdLHLAhF9LWo/E+8zsaNTDlZBl05D5sXcsXCS8FWX9hYlX21Khtl0qP8f7oCTA+A5AA7ydMv/XN56ZTOp8QF3A96YoRoPHMDhuPZ6uUsAVPeuXDyHBCm67zkjc1lhelPvZnH6OZUSNdtakC+MPRYyyUN0tz7nTKUBLVuIgj1qcTiYxpdGUK3dPiECOyOXpr+eyq6i14uHNxMFC37dPs/NS4HoRxUdYrMVxsS58k6vh8osQWkQv09/tS2Q6h403+m2s5SBU8LYg9tNRO2124ECylh7dOmTq7V9dDkFrCYBCX2EoAsm/TM0Uub7W9aYv65T8jCpyGQCv9n0+f2G7vWOInaFYSq3cjTrAR8On9mG0loMpSj/sPtMwy+Qzf2pC3
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 19:25:40.5274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae30d223-d44f-4cb4-c32a-08de60355ad4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5674
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jan 2026 19:25:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17055

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3Dbe5e3b1ceaf18498c4586e9806ff2783ab336072..009ab8e98152dcc4ee070e066882e=
da6b42f720c

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
index 85480996..ba6353f3 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
@@ -14,7 +14,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "be5e3b1ceaf18498c4586e9806ff2783ab336072"
+SRCREV =3D "009ab8e98152dcc4ee070e066882eda6b42f720c"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


