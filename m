Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FA9C5DF66
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 23:54:31 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10742.1771631659382118786
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Feb 2026 15:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=cSaV/bm/;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.61, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4RHgBmSDbhiR1lvsxb2lQAXNjmkaH1im2cf8qZ6+3bB1YNfAH2bZ4dBOBJfGVyvUF7mH/YO8fw9Q0bx07EOSQURjWuCWBIBZW3TSbhwyv/uqrpAFWzVxUoCdDR2ATthkuucph24s7DlntHaN98Qnl7UFbi7/3uUWadMcnKEhGuG5LnaM+Eska55PDjm/ZpwdqqgFaJiTnbqH9NDxHBzhK7PcP02Z7GotGEH7MPLeruzvDiZNAFGVvmYyuj6l89P/IXptTJr7aZiso6i2dTUhErDuQL7Q2gCEYr6GKYGWyzmyyT/mVuRDDc2RZAsLLZRp9OR6uxTl0u3GdgbaRj+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrLKAty4Oz/dJh671Kn/KLBtiIw2A6cBU+BR5htrsJ8=;
 b=Put0BAHd4o8XLIccNvHKoShEgbKkaf+5pcQ3VG+4ATxxMyigXmexAjbJ3vekalL3JmFu2b84f8UXS5lq6gvPtlDrJyjaWWVTQyoyIJ0d+Rxh363EP7t1qoggWEB6YuVMTUXV1/R3RmhpBf/PmxJ3HOWXqIgAzKK0ZWeRs31QdruspmHLxUsi1Zp2WmaLsyJkI0039IgiazA4SK6z21K/n3jkmNfCfNfhR12cDuQaEmtsgqgg+YrWQSWeb2h/f5CdgIlJQ+sD6J+S+V60sa1lbeQghkOu/bM6f1xqtZCkYrrQSx1ZmpfHYkSEQjesOkfsSZ6wbIs46M0ettZkCr7KHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrLKAty4Oz/dJh671Kn/KLBtiIw2A6cBU+BR5htrsJ8=;
 b=cSaV/bm/Ovx6d+Si11pzlK5IyDo/NSX+g7ZvP5rfG5IOZtZE8z6Z5THdwQhWvLPO2KaseHqwdG2GpauVTpNT7VndoHl9ho53F4SnDFePRtIOmp42GGMx9FtM0WEX0qDkVFQYEroFHooeti9yJ1qP798rSNd9v6uLYsLj6Lu11/w=
Received: from BL0PR02CA0050.namprd02.prod.outlook.com (2603:10b6:207:3d::27)
 by CY5PR10MB6240.namprd10.prod.outlook.com (2603:10b6:930:40::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 23:54:16 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:207:3d:cafe::24) by BL0PR02CA0050.outlook.office365.com
 (2603:10b6:207:3d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 23:54:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 23:54:14 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 17:54:14 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 17:54:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Feb 2026 17:54:14 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61KNsDuX487308;
	Fri, 20 Feb 2026 17:54:13 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [oe-layertool-setup][PATCH 1/3] kas: set path for all repos
Date: Fri, 20 Feb 2026 17:54:05 -0600
Message-ID: <20260220235407.1064734-1-rs@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|CY5PR10MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: aa20435b-773a-456d-8bf0-08de70db5a52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/f2fKwxAgHLKnQ0/aXGYWJJfE+Bt1+ASACS0rSc7eNxQ+4ma2m/jnm5f540I?=
 =?us-ascii?Q?t3P5JHYEA4Pbw5g7CeU9CbptOaaI9cKdjAz8fbxffSaNNebSRuWueUHFPoQC?=
 =?us-ascii?Q?dau+4k0cz0V8ZT7Oq/W2KNEflx7V/gB0pjicHmD2SE0OtvWDcAn/UZYpp4J+?=
 =?us-ascii?Q?VgFXJTrQ+rr7eM4cEuhEp4BlClaOiO5de10Uz2Sr9ZZuTODuTV6VDIzYyO0v?=
 =?us-ascii?Q?6X3iPdSjmed5plnWA4rzx9W4Hi5JJDy0giF14rGe7XMKrPcGlyPb9FbYF21R?=
 =?us-ascii?Q?trVm2mBdYBXgMSVYB1maRWeK8YlqtPE6PG04GvhVBic1S7+faS8Q9pIvVDmD?=
 =?us-ascii?Q?lzDr0ftBNR4iveHyO51ighF5o6HfuFMs7pfG8A1ePjrvjVCs52xmBHzY1z0a?=
 =?us-ascii?Q?B7e0qYNa0w7A+90BBN5daB81rAXuHWKrmodcg9XqBE6DCAekbcITB+4FD7rb?=
 =?us-ascii?Q?y3AFQOrZc0OyYWJ3SHYyfrrC+AUN9LCfEltw/6JqYGDOJnVacpXtOphHfjBB?=
 =?us-ascii?Q?/2eGcmESEIav10FsmYkUGpGjbzMZ6QlXU4F3OrBtixBo8vlC81wileuBCiBZ?=
 =?us-ascii?Q?4iDp5DBgiX/xNRbOGpc16Z2upn5BvbRInDGJX+NYKjNYX5l7t5TW8JxIJUP2?=
 =?us-ascii?Q?XLY4v5BggeN1sZwoiLJLMrLBFlS9YjySWYfbq5S62qm9d6XhqwQsJgkQSY5s?=
 =?us-ascii?Q?4uMFCa14iWV0SqovF4StF1psMPXZd40dnCS+H+Z6LqYTQPeIymOF8dTQ+ZPr?=
 =?us-ascii?Q?VDGPzM9G127TPBnQbzXvYHtzYLbvn0NBkqvXodtUxRSJ4qCbQpyt1mK5WvOJ?=
 =?us-ascii?Q?+gNOjXJMI29VpMoTC3pDfgDLaqsQNZFqXtf61s+u/KyKnhJmaGly+D6U2yxI?=
 =?us-ascii?Q?/9U4XWNZHxGnqiZ69jLUDBaYs5o/nF/J2UORd1XmezfwDG8+OrxLs/Sr0Axj?=
 =?us-ascii?Q?N0ZdxXRDWDulliV1pZxDk2GvdTKzGRMM+t7NuudhQZAJeno1c3Kn9U6eUHXY?=
 =?us-ascii?Q?Is2bpEX+ss4nzrsRYTGQeIfkb0o5DrQ1Lf8syw46Ub0YT1iVLhx5ngBP2zkk?=
 =?us-ascii?Q?huhPpbmI7QJIRbV9OeR/NoI2PjUBikvMJbRL12d8vZgXoHgZ3YMZRauwp6FS?=
 =?us-ascii?Q?aoQJ375qNRxTPT2rTJhE70jqahlQ4pi5wjwrPMGpyqXVbgbpsliL36teYwHg?=
 =?us-ascii?Q?igvsOdG/J+4NS2ffXUQAApFg5xry+qdYwPkSxxGqihEA0+k6ZHIht3lEmLak?=
 =?us-ascii?Q?PLmigBlM/b0wdocE8Pmlo30GjIKJFi07/pGHK+svhEY00CZd0kIvN6wKIWYm?=
 =?us-ascii?Q?IpQgs/6oGSR6StDld9PMLy6MJ1PfCHjv8eDspTqbixq5TeqI6bAX66z0pOGA?=
 =?us-ascii?Q?UxQEZPkMGiD8X06S3wnbiLGRBi0GWgNa2Tz06oNOKBe0qpfSnFSzdTeCs+FW?=
 =?us-ascii?Q?07V3QepqSxKxmpbxS0Lg0xnSh1Qwkk2e2nR7L2AvD4zRsg89rO5I6LEufNs3?=
 =?us-ascii?Q?Br4w+SELPKfD2HRGZn5hVYdXODZySrwH2lyIP+6fmS/HHW1Rdzpnk/ZHNbzX?=
 =?us-ascii?Q?LOo6lBAlztS6RExgfg6YcSsWRWLChzyFU39QwvYgmSguHMLxDWyYysggEm0j?=
 =?us-ascii?Q?0aKWTo997p/S7qEhdSpe2cEJ42VIofAtZ2YKmA59laf6/KjgZS+Q5wIMLhR6?=
 =?us-ascii?Q?15W+QQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	39iQBNRRPy+0YgAyNqhg0ScJmfH8vCvo+pT2md4WRG8tDgaPyXCMnKNeJLX0KSVr6Dk1VMsKHIc8aB7GHPj/W7f1aG8zqirm0s+m32Z9rm8ht8/uxYymoRGaPAPo6JLWzoSayvmbyN/o2sd+MTPjc6jXGMyLtPhESTYPlc0JGmXY+rxlfeojsn5F2VRksAr/pBmxUn3l5CqCSitGyUSkFHzUE3cztBnLM8SQoOCbaLT1f3D6x994D5gyB/dLs8gnMRob9OwPlrgYJm79DeHW9+hzXZdpRzx7duxYN4OFxadDdtafPHOGLASESsdajMJfnbkvQlutAKeVfaNicCyhIMPKkkWGZAsfU3fI5F+OgNfzuZHZ2wm6wi7uRD+ehrvN0DnUlXpgtCEzISZRXbDIgq2QSQlFhhtI4vqVyspRFI+9hzNwPke92yFW/tT2xubF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 23:54:14.7529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa20435b-773a-456d-8bf0-08de70db5a52
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6240
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Feb 2026 23:54:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17127

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


