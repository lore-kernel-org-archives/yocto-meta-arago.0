Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786B4EC113C
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 20:37:44 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4562.1771879058712815676
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 12:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=f2ejCd1y;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.70, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SK6BLKmrToI/XQ4oQifvETzBG7vnOuE/bU3hc7SABjBm8iAOPy+tTD+UeFBr/j1r1OLFKXVCYvvwADqUodcQdUNdXefjlLl8yh+aivoiOjHorDUd5HG8kRf1Msh/3C+jXTjx6gV/H9JkSTqZXKz/xLa/oNzR8OdcEWrpF3N+iNMbDayaMGLGNpjzpewfkiYZjdoHqcUy5yKtrBWrG7qCvPvydPWEPwxjUDpB70D/SAOfXTSTigLDm9M+ZZL3rKyGFSYGDEkdqvVcBbCOeuM/zOmw1dTN9AeGP24Wz8CC8HtLTSNwVRyDrtwhBprEHRl4GoYMf/gq9tVJnCmhMkvkzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrLKAty4Oz/dJh671Kn/KLBtiIw2A6cBU+BR5htrsJ8=;
 b=F+YIKC/edecLHWi0ulUqLAUtTO22eIgw1S2qJvIWGQUzo6NWQmhBkCSgfGDr1GsQbt6UxIO2dNpxBUSIq4i1gw5CuAdZKu5uQ0imjqjcMDMjlyD55xUzh/Kvy50uyOfdZchKEROo2VW9pjesVxFfHV6QB6WMTJl5lamRka1qieTOROaJGckywM1Vbt3uOePEUCr8T0cKD/8jqD7x8/88t1ZeIMlRThEjMiI/10Ib7H75mZxZalomdAmlE7PMcSrvv/LQY/kv3N8FnQGMox66WZDGX5VSsp6ViqZLG7ws0m4uODvy2hso2NEmYRAOWe4Ih9Xn7cuOM5MZU9JbLQ2gVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrLKAty4Oz/dJh671Kn/KLBtiIw2A6cBU+BR5htrsJ8=;
 b=f2ejCd1yovZ1uVbtUOd075IH4X3yaUebeVC8IICHRKyi1UvopMY53GfHgXJo0KCNS92KfTbnEmUVIAWal4m1YaLldd5X5PaiVUXKW2LU/PPCyNPzaSb7vv/Upo1es5jmiTNCGlB+V0CsW7J7QEejEUAR/FmvWrDHeqTJ+ORpI0c=
Received: from SJ0PR03CA0125.namprd03.prod.outlook.com (2603:10b6:a03:33c::10)
 by MW4PR10MB5839.namprd10.prod.outlook.com (2603:10b6:303:18f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 20:37:33 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::3a) by SJ0PR03CA0125.outlook.office365.com
 (2603:10b6:a03:33c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 20:37:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 20:37:32 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:37:27 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:37:26 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 14:37:26 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NKbQbl980462;
	Mon, 23 Feb 2026 14:37:26 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][PATCH 1/3] kas: set path for all repos
Date: Mon, 23 Feb 2026 14:37:17 -0600
Message-ID: <20260223203719.3644542-1-rs@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|MW4PR10MB5839:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d83611e-3adc-4332-20f0-08de731b5ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X+s4zGfnkGgT6ORFyI/zMXyVWYdTbqxm+jy9lHdnrdvaNzlrEVmvY4Za+qpP?=
 =?us-ascii?Q?olNSJ0/JvDVOYD9iar3MadIfMotW7bxG7gl4JUwnAZV9UUjNLNyQUD7g4aJC?=
 =?us-ascii?Q?mbIDnUO8u82qQ85cSvCV71reZvhhAuKVA9rMTCr4K9v0+1dJ7tD10+xvRlUV?=
 =?us-ascii?Q?WuNALcqmWrF5S2qHdrgBExetaf7iQTdHatTy2GdBzYfDR/IdzKOO5P897xJ6?=
 =?us-ascii?Q?BMZqNWeloGb2/RLL7WpOFJ6UTA3/6bSvEKJxVJknwFfleltWBr5eo2P3YFj2?=
 =?us-ascii?Q?uPvJbmyfVRIQFOdpZdsegA6cY3x1d4OlPKj3SbWWkuHHq0lD+t+0Wwcql4gb?=
 =?us-ascii?Q?K0EHnmrSM8mL83hHovIjCaf+bfzT3lF8/SLYuWTrbdGrd3sOfzg1SEnsk1Ki?=
 =?us-ascii?Q?FLa1877azljvrwM9TFi+F6opFwdV3T+ENBZqtCUws8Ce8DnAPagkTLfb/YZJ?=
 =?us-ascii?Q?eKyLa62yE/9/5+daz0Unn1Pkq2I8x6j4mXHyW8MDHf6ZT5vumYgHdB+8HthW?=
 =?us-ascii?Q?+qXudpkC27WI/SCSIdyXZ6XIhX+DnxfSPcqrOZk0cWuoaeBXjjZxygt2gdyz?=
 =?us-ascii?Q?b/cxtBo/Pbw2zGDuWSkBpsOpx2yKvYro9dqPV+jhro53NGioQlkzv/kodiCz?=
 =?us-ascii?Q?ShZLH3PGlc9vyInWpETA0clpBEvIWJVV9FX2En8KNZUZK1NkLrguZ1zqCsXO?=
 =?us-ascii?Q?NJa8VAhuLwzDy3xH470XiJbBozC6+IcEyERj/NrW1XqbptuOmFDFlWmnhMtZ?=
 =?us-ascii?Q?1v73L7K5NIESp0MoSry02jSEHgDytfiLtBIE/7ABgXpcIC9KmQiLJFw05Z0o?=
 =?us-ascii?Q?WPmO7nHM/fHSuExmjccC3jBSBRymj0701vAfWkr8gP9KwmIFmfNCCQujsWJr?=
 =?us-ascii?Q?97a1JH49xi8eRBrDPFTdROQXE3FwvSbhA+snaNiPzv1M0yXu1d1yp8lv2iR9?=
 =?us-ascii?Q?vGqbIoMzcdATrj/Gn33UrqDaZpRf8SBanRsC/TcsoeGjowiVe97Wykx6eoTS?=
 =?us-ascii?Q?WiHfaKsxxh7sJ9CqUwEzsocfDiwdtOWJQzVuzjv5Ve6YJi+xqDWDfYGiHMzv?=
 =?us-ascii?Q?4QEVQOsVglHPRTSFK/mko848YyuCZBZHBatCy4+XpZirhzQXN7OmTP6Wc1fl?=
 =?us-ascii?Q?qS65bdyBrvOjdJTNt1QDH5xHot+n5egTY0aUTDud4H707mPzK9TYDL0Ryirv?=
 =?us-ascii?Q?6X8cdnQR2ehq/ROrx6mHDl+igR8TC5r1gOgcS9eDfgk0+2QYnsMT7z81ijQf?=
 =?us-ascii?Q?wafGuLmnWlVdTFCRpANmxl77XbR452+tU20zPVcH05RMCDWmxt2gutjQB6ih?=
 =?us-ascii?Q?jMutGA0/DB2IWwVU0LoDLxLQsllE5VuNrj5cX1od95Y7AyjBB9jRaXcbQYsi?=
 =?us-ascii?Q?ehnymEXAzHao7wKwEz+5s/VyHcaOqUvrIpp6T0q0efKTza8nrgP5QkfFa2ne?=
 =?us-ascii?Q?qSNqJkD/Vq7a+xPKPiOEf+2LphMFau2jOYnCsMcn58b0Z12NBYf77z0/XBTR?=
 =?us-ascii?Q?hhBqXmRMpDzC3grKF6Cq0lZtq0p4/Dgjv4gsrOSvXcWxAwksJ2RnCk3Xrus+?=
 =?us-ascii?Q?z4nB2iRmYbTPu8aG1osGJNDZnfBdi0Nw+eMeO5bWJwmlCnHsjWn58Bm/PnlH?=
 =?us-ascii?Q?sQJYyk0YrRVoUdDHruSQ5rUticPpS3J+9ZT4Kkyni+/SCX2wnV9Cc+rLJxG3?=
 =?us-ascii?Q?dZLP7w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	yo1vm2NjPmYCVLtUoxjx4M6qKfasVDtVdHhyYGtM/DmjrP59Dzis8GTZnOz7//s3JIqlrOxkFeawjy7BsZD0m2ftY32TvEREZBMnzrw0NG3rujIx5bbxWFWZpXrFixW2eNEE9EzVJDR5amlWLK1wFmn9fCCoCDdfpKKKqh/rwuTbN3SskLXSxYpBRnBufKLCX4Sja6fgN7ZQeROlNXNm09CGxdJsv7XkslN3AZXnTMoEkkI36jOg6zL1PI1aEraO/G0dm9rtoQ8HRkwlignG4oW6X/xpHXxK+RzaalrPQCvuwZNd4fnzPz/Io45KUsYQbp/2Tq45Z7lKqt3asvgyLPYfCN+mBoiMb6Ema/pHnktQ21ut8yC42khI0wWEw6dSkZ5DQaGqn9t6Ia7+dOpzqqknmTu/V54XjMMM3zwzAI0Gu9JInsFVvyjZiOBrkJ6d
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 20:37:32.0996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d83611e-3adc-4332-20f0-08de731b5ea5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5839
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 23 Feb 2026 20:37:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17133

From: Randolph Sapp <rs@ti.com>

Kas allows the user to dictate repo paths to override the default
behavior of unpacking repositories to the current working directory.

Given that the not all repo names actually follow a simple scheme that
can be included in the gitignore we should instead force these paths to
match oe-layertool-setup to keep things clean.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 src/xslt/kas.xslt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/src/xslt/kas.xslt b/src/xslt/kas.xslt
index b78b788..7d1fbd7 100644
--- a/src/xslt/kas.xslt
+++ b/src/xslt/kas.xslt
@@ -37,6 +37,8 @@ target: </xsl:text><xsl:value-of select=3D'text()'/><xsl:=
text>
 <xsl:text>    commit: "</xsl:text><xsl:value-of select=3D'@commit'/><xsl:t=
ext>"
 </xsl:text>
 </xsl:if>
+<xsl:text>    path: "sources/bitbake"
+</xsl:text>
 <xsl:text>    layers:
 </xsl:text>
 <xsl:text>      .: disabled
@@ -56,6 +58,8 @@ target: </xsl:text><xsl:value-of select=3D'text()'/><xsl:=
text>
 <xsl:text>    commit: "</xsl:text><xsl:value-of select=3D'@commit'/><xsl:t=
ext>"
 </xsl:text>
 </xsl:if>
+<xsl:text>    path: "sources/</xsl:text><xsl:value-of select=3D'@name'/><x=
sl:text>"
+</xsl:text>
 <xsl:apply-templates select=3D'layers'/>
 </xsl:template>
=20
--=20
2.53.0


