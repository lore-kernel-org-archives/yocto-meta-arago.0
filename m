Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBF8CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 23:24:15 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1347.1762471449163752343
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 15:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=CxOBMSkG;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.52, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HN1WDd9Cpm+BFjcOeAcPToVgfzRLtn5iHuqJimGAxaWPaRha6n+w5x3Z+1o1exdgEjPILdIZOx78Xb9lQGSSNegKydT/sgNamLnBG50UTsYFfGLHGDfGRQC28qLBo6aQv3aZDBaYkFhUuiOHoVSLnAQpsHiu0PpY/sqNMD7Gl+zOyBCF1T2lehw2WQJPMUkyMAJVUVr7OP+uk0vojiOmp/rfHEtjMSaTOQar7HQ9ey4DHl7Y4t3HOq4FQnO6gq4d2GeE0l6lealQQZsSH7xIvbKMqoQk/acPRH6niTUKFSxND22CRb5zSjKByESB3++OSZt9Iz9S0M40scenZwHKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrJO27Ha199jRSVkDrRavFtIzL2yljTg1ABRbXbhJGQ=;
 b=cDstElSz0Q5cvjzfAT15NdfIsBESakVDTmfqU0FLxkA5L4oPvwWUC+wygob4lCoe6LmoUij/rf8E5XJpJ2zfHA3meRQDlIF0FACIEi7H8Tfcs/Rm3DVJbS/WXZtwF8yc8qv7dSoKqe5hBttlOX4yhu7H/ocBUAwRSTMuU2gB352rQFOQmaZIHTM17EnEGUUnhc8Z6KdOdwNvgNlaoTKkfTinXKtw7yeyUrEOPXgm2w8HUPF/9f9npPY5oxIuGuCdgjYxyxG9Vkst2Nx1b4dM941U/3WtWf+J/8RO1zDfwBhAZhiCl/8cEja4nw6dMT7tTaiQqKf1WDLsQcpojEYggA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrJO27Ha199jRSVkDrRavFtIzL2yljTg1ABRbXbhJGQ=;
 b=CxOBMSkGUiM80IyHHM7n4hMWCJ5iReF/paYrcbkWlfKon//xlwtKNCQ+i61G1m7XoqQncIRVQuGww3fCCCJvCduxgQnEDATaTWoVD3fr1wAIPXZV/6YzRDo9CKIo3fkzv1Y10kbDgo65eeqrFpRwsOZI+HHLIPD2sTHeXySdfjc=
Received: from DS7PR05CA0015.namprd05.prod.outlook.com (2603:10b6:5:3b9::20)
 by SJ2PR10MB7671.namprd10.prod.outlook.com (2603:10b6:a03:547::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 23:24:05 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::e8) by DS7PR05CA0015.outlook.office365.com
 (2603:10b6:5:3b9::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Thu, 6
 Nov 2025 23:24:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 23:24:04 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 17:24:01 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 17:24:01 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 17:24:01 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6NO1iT2071671;
	Thu, 6 Nov 2025 17:24:01 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] emptty-conf: remove extra "-conf" strings
Date: Thu, 6 Nov 2025 17:23:40 -0600
Message-ID: <20251106232339.628461-2-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|SJ2PR10MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f4425dd-4c60-4ee1-34a0-08de1d8b9340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|34020700016|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kdlvOWGMECAoT8g/n+wkXS8i9pxq6pdKYzwo3h7qmoftWXq4GipAmu7HC57Y?=
 =?us-ascii?Q?F3GsqfVNYSKUQ/pgcZCamDulFjgIaNTedoxF30Hw+gso6rTa3Elxk14AG0jO?=
 =?us-ascii?Q?bjeGDFup85C2AGvdRi0L0pmXY1oxgfM67oJQYmHZbgr9p4NRNl5+mGCeR7nB?=
 =?us-ascii?Q?1aDerUkQJ6seCR5hFYmDMjs7aX67Gu1EGDU7WsQ9b6InXAKoINzUZLNxhPRS?=
 =?us-ascii?Q?PEie2Gw7ZxmQvnxlEFkwBanLRtQv953GS9PXKOdzNO5EH2Bm86b5EBtNxIUD?=
 =?us-ascii?Q?ii8Bl7/hi7AZs2Im+XBU2WVlgs8kC/2FpK9uhHAGl9yLp5NW8sbNWGhEYm5m?=
 =?us-ascii?Q?sYoDR0hKp7a/y5Y2dZPQhN+iX7UUtJNLOzOBHNa1JEQAf7eTWsemHhXgLLjl?=
 =?us-ascii?Q?6AuKCIXru1liOxr9yJ9Mw64y6h9CwWx61xBFCIcXgBolrY+sa8IcfG2Gy1E7?=
 =?us-ascii?Q?GygNUo+wKT93rG4QQdOUzCqXOwlXboV3jiDfju/JPSQB9IYvT0tt/2HcZWCQ?=
 =?us-ascii?Q?Y1CtvxM8FEmD8yjc9+5ZNF/K7NO1wZrs9Zs0+H2ijDVP3JWCSdxVZWehzLfD?=
 =?us-ascii?Q?dnLfapgl4RsQRUi0LWiz4IO86ISLQWcTjSDZ8QsmPvieyj+Xc+dUNgjF2HqO?=
 =?us-ascii?Q?b6FZiyglGaEV+k+p+79gpyfxBU+iu5pSLbde/7YD9y9Ypa913UFv2I1PDgxF?=
 =?us-ascii?Q?AUVxqSQAujooU1CcuTizHQEKSZfgTcaTjSqYKYtUqQkChsjcNnruvT3EwqJM?=
 =?us-ascii?Q?beA21HKKaQs2SHDntMmZ1lsBz/U2J6ocXYNjnpovpJJe35jwQLs3YJLROH8D?=
 =?us-ascii?Q?iLjQ6P2ShRYpGIY2Uj0LY3QkukFy34ej/XZw4lFH8GS83rf/1rjcgtmQIzOM?=
 =?us-ascii?Q?fGJioag4qLe1KR58311K/DiqYHC6+yYyXzRByXOmNkubkt1rD2qgzJiXrE6k?=
 =?us-ascii?Q?WVmTeOxw/uXVfvuCNRCSWnN7p1/FSHp6jmNHQz5lLCOIJTRN2nm0x8y2p503?=
 =?us-ascii?Q?+pMjTO9Lf5p7ep9asqp9SSFnTK1RAiXX/TSxP26vqYqqJqWtDKEsbzfroRKo?=
 =?us-ascii?Q?uDXcJARHda71qoXJSeZ7THpsTAQsjoMI2lWwpBD0SKoQyT0Ycli1rqbKRmv4?=
 =?us-ascii?Q?CL6cDGU/OvRatqK8OGry+vw3HSmjKy11psS6TeKV997cxPUlRqtCDcGYrbtJ?=
 =?us-ascii?Q?HLqbD7RU+Wd1C0LRq68esAACJOD3znJhqGUS6urr5l4HOy/eUIDrkxjswChx?=
 =?us-ascii?Q?KWrgg3Ned/zR2NAlQtvR88LRV0GOgLHwFLfyTmou7QW8OlFS16iUPoUY4HYT?=
 =?us-ascii?Q?ylk/rl6637GHWBWIixQYRApmsDM7dYyL23CKhlMakIpXFDXUvmax+Ak0+AkQ?=
 =?us-ascii?Q?vojCtwwVFVRzjEOnKwynRNchNF/pouzG5mRJqihA98+vL4FwD9e+7GOIPEYM?=
 =?us-ascii?Q?ce25xOeI5oLlGOAyiJzWkwAeunXL2aSWKc3P5wFZWV70FOsA2WlTfD23zWCP?=
 =?us-ascii?Q?0xUiuetqmC2ihGW/9hX46cS0ewP5BjMZrgdAEOOf6/sgBg+hYGk5+8sN42k5?=
 =?us-ascii?Q?iSgK0epvbVXGVVv1OMQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:24:04.0464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4425dd-4c60-4ee1-34a0-08de1d8b9340
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7671
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Nov 2025 23:24:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16726

From: Randolph Sapp <rs@ti.com>

Left these strings in after the package split.

Fixes: f9509939 ("emptty: 0.13.0 -> 0.14.0")
Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb b/met=
a-arago-distro/recipes-graphics/emptty/emptty-conf.bb
index 0aacb086..0b98e2e1 100644
--- a/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
+++ b/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
@@ -9,6 +9,6 @@ do_install () {
     oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=3D${D} install-config
 }
=20
-FILES:${PN}-conf =3D "${sysconfdir}/emptty/conf"
-CONFFILES:${PN}-conf =3D "${sysconfdir}/emptty/conf"
-RPROVIDES:${PN}-conf +=3D "virtual-emptty-conf"
+FILES:${PN} =3D "${sysconfdir}/emptty/conf"
+CONFFILES:${PN} =3D "${sysconfdir}/emptty/conf"
+RPROVIDES:${PN} +=3D "virtual-emptty-conf"
--=20
2.51.1


