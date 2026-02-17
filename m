Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1A0E9A037
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 18:38:18 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19189.1771353492125190278
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 10:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=QM0BJYw7;
 spf=pass (domain: list.ti.com, ip: 52.101.48.44, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rh7dYst8wmiVClSkZYE4XR1vqXsMKLC318NyWmagnj3hvA3IBg9CnYwdhTE9RS1hpH2Rr5fSuHxuYCw2JCam5pI7icXdqJO1KbOAuRRrDL6cYGkTrROZqtY8Y4wiu57cyeMmY49vj11/t5MwYsV0auW5wGs4q+1jZ4DRnRnxrjmLN0JhnE15/SiwuKoGERokkxLoaIxF/0AkFf9PEyPocy3+qvoBTo2Ikz3wA3tJkmFxqhAH0bklWm8vOnFmC5hJguEJy8FkU7SE7RpGvcvioPyksLJPxQybqFJvyuDgJLcNnMgmHbq369E9YAlFTnE3ADQ6/S7c8dxO0CfgYXENFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5NTwMIGdGqpPR9+nROUkBXlbR8G6X6q/Tmw2iX6iPU=;
 b=usuuMBdThkmTehpbpjnqBfCuX2clQH3DTVmL6FVDzbZCeqw+Nq2+JNcP7dD1e7floQ4tqL3TyeBF5YmetXhKof603DmW+NNmZMnSlK8dmv9pJWfObZxYNzYwQ009MYF80nPgLmsomSKBCfuMVL+1QCJoOV9TU4ckpMo1LGTopOUtd+IuaJz7/vFQT4ZIUpMCWkHvDEGZqYy/6LnVltUw1KLVbdP1HYWKU0BLyI5lztTfLgHRwH0cCHQ+JjzGpXcMXziWnmKAdkEYspYwmGnRNFtnhsTOsd2+8wXsL2S8/vsqA35dO5kL+4Fy4+8d497UgOFoFb4KirF638ZxyOrlQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5NTwMIGdGqpPR9+nROUkBXlbR8G6X6q/Tmw2iX6iPU=;
 b=QM0BJYw7i3ffixkAIXj9gVTpUCxDteUSqoacKrZ6dUuujSFMLEAzoUOS2mh6nhMwYLNqP+o0vLCuoZvQILPHh+TlYiozKUEEcJwtdcOwgftjxMD2AXQcYqAx278uCZLVAHqbXL6LqONadS12SfzT7PjBJCWlYKt8dYzOwZEy+6k6npymSNbnPXb8UkvOxHpBUrtpGk4I0S1URAirXyjLb+7w7IRQF00vUjEWkPx/ZFeij1FIPUEDDG21iY7SUsdpHWfyyvBSenlDo5z8hi+GzvUhrL+/W/7eXdxIhlrdI91DG8EB1JEqt3RnhNqXSCFdLlvE2yJqhA97G34WHEf3EQ==
Received: from MW4PR04CA0186.namprd04.prod.outlook.com (2603:10b6:303:86::11)
 by DS7PR10MB5925.namprd10.prod.outlook.com (2603:10b6:8:87::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 18:38:06 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:303:86:cafe::d9) by MW4PR04CA0186.outlook.office365.com
 (2603:10b6:303:86::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 18:38:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 18:38:05 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 12:38:01 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 12:38:01 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 12:38:01 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HIc10P959320;
	Tue, 17 Feb 2026 12:38:01 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 28B939ACF4; Tue, 17 Feb 2026 12:38:01 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] xdp-tools-arago: upgrade 1.5.4 -> 1.6.1
Date: Tue, 17 Feb 2026 12:38:01 -0600
Message-ID: <20260217183801.2690249-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260217182239.1635550-1-reatmon@ti.com>
References: <20260217182239.1635550-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|DS7PR10MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: 30c593e9-e184-43f0-eee2-08de6e53b03f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OxvcARxTE5qdwGZBJzXsdrax9p9mHjJmbDijNhFAXuPO6ved0XOEpveXRnnI?=
 =?us-ascii?Q?ooGZimnU+WQ62tJa8F36EYVVX8jnIeXDqJVjEA6qMHvKNvuU1z6ChGhLsoe/?=
 =?us-ascii?Q?aDwIayH7BH/y68KIKHR4wNKRO9DUDyuz7oGxU66RuchrxCHSsr4a/awdp+dL?=
 =?us-ascii?Q?VdqatF9+z5jI41pd9hz+YLxh/Ui1ySH8pyFrJVJnAIWDfG2VbN4dfeWie6UZ?=
 =?us-ascii?Q?KUnBacCxgQiRIBCKp1VRL/RE5+u2bqw2+t2tcEIdPM79ajdEhnO2HwfuYpi5?=
 =?us-ascii?Q?Lk8Z9sapY+Q/VCqekRUUo4/hTcO93ZwOzAkpjFxeSbbVuYK5YzLzJ5UYsjUP?=
 =?us-ascii?Q?j5jm6YnyDyOsfBVp/L3MSC0MDtuPUC3KVfEIOLvFOJDh4yQ8TE3EePkz4y4k?=
 =?us-ascii?Q?iJTV8kyPhxWFDpYI7CQbRbN651bwYozAtB3GwwpFP0SgQBISLtmVkWJWTd3F?=
 =?us-ascii?Q?7O0brW+mD/PgKycjUydVgwZsREuvLUXJU+Q/VRWgr0+q4pRf6wuLBCsSHKRs?=
 =?us-ascii?Q?d5Rehzz8581I2/bI962Rp4GfgEUxBVGoRO34cAGafR53ysuYS/3dTOWfkWIi?=
 =?us-ascii?Q?SgNOTuYXCZ5yvrVJC/aJH328Lwyugt0fabn81ZNUBjtSUkJViwj56GRop/J0?=
 =?us-ascii?Q?wdnxB1k7q42J39RkcJMM3KNUXSsGTEIZfpJEIoU2EOiGPSztmum71KRpBI2F?=
 =?us-ascii?Q?b5jVoAJGlrqH8sLMrmeT/ATDaVb6c4Ci0rmwIB4w4i4NLC8nZ6XbHn5skcXp?=
 =?us-ascii?Q?WTvBebwcLTIzfvoh2yyiNtJDjO3t8KS3xXJReBlRb8n9fK+n6YcNBx9JHlTA?=
 =?us-ascii?Q?aiMrc1ZaSIQO4s+SdjDYdYlrRkMx4fg2E2xd99zsNL6MRsifDEis7B3w65yZ?=
 =?us-ascii?Q?EQ+Hkc/iCtery4vJOJ1/AA/GecpCPUlgCxwrgCDDZee+NNk1kjwVARLnQPZN?=
 =?us-ascii?Q?Q1BLu1bmZ5NdVBFjL2Wg1oxcOgeXGu1T95nxRa5CU7Tjmc3dKltvxLbgfaRd?=
 =?us-ascii?Q?DAvHdz5CGraKR5PlMYU9RuxViqFjxuExCCKg9pIP1a27ZRxa7uu6azK+EDzO?=
 =?us-ascii?Q?IaVSfavOKd4PvXH7LujyCP3u9gRJRzNljtvpROgqF6WpaVVB0B7MHRF1BYVv?=
 =?us-ascii?Q?DPwoSj5x+WpNM6z54JCXVRUWAooHmhHMdrev4YDhep/aFYB/yGgvkmyvRgmj?=
 =?us-ascii?Q?4+EZXxvDM6DwctBqCWuZav6t3Jx/BiLAXkqRuVpRcVT36IUFzPtsGIqAsfXR?=
 =?us-ascii?Q?aNw0g9YGl01IrJw9kQtoFkJASbuKCvdj08WCdCklkekELjBYHLcIcJYa9iOi?=
 =?us-ascii?Q?7GVtwATTwg4JgHe/Eed1PLi0g48KBWDcK30BCAV/TGpsViUPHxBQs/LlQuJU?=
 =?us-ascii?Q?bEZstNU4IbIWAzJj0783Rytq0qqrINC08YdAeV5Je5vw2bA/WTSA1kUt7h6S?=
 =?us-ascii?Q?QTCf+iPUMwerYnjwfrR3WE04xH6DfIQntUTNFCzSGu1nm8SN+LQoeMn0EjHD?=
 =?us-ascii?Q?FPR+xdilKk5Tr64LxfLfMJbcSZ21QVZJKEbe4AgySMnrNklkb4nzoWuk5HQ2?=
 =?us-ascii?Q?hH0IC0yliZ0zpkz0ezml7WdOGFYUvmID6puv2isHE19AxiQL9NbE8zXQ11dV?=
 =?us-ascii?Q?DLRTB2JIvoxSfywvOsG08jIYqaq+2FMFhQuvdewqEzwix5Dl+VCUGq91yKDc?=
 =?us-ascii?Q?hx7zXg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iTbyLRmKdI7W6d1EGxn/O+09DGyXZhcDXb20urOh9RaTq0Jy8198Ck0+V3SDJIVEyOoaawUuvmeU/zH2davwvTOcr9gxFeJ+hwIex0kcP+JF3yhCZCDZajyNG9eYcL3Xh6fBzOARGFJwUXMLCUlLcjdWWgUvGzqPZkb57MVWv2GmS+oTIy1RD+s5HKNkT3aDDqDhxr5wIKjyiSdI6QVy6Q7PdDMxaWDBW2VLOKZvKOeFH3qe8qQOhOZwOcH62rAh7UQ6EJ7181CRxj5ELAu+6OjmFhneKgm1QvGNDaCBgiBNRUGpIrcgoQfXZgpNOOKDsdiXPcnXhkqEgp1d+b34un9USzWfyBuSlP/VJURMX/v33iX44ADvcXuVx82Ccw7kEU7tTatGkfEHzxeTYstZQ0oGWX0CR0yG9dlP/lIsuydCb1S1qpHfDHnXzli/OuP8
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 18:38:05.0131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c593e9-e184-43f0-eee2-08de6e53b03f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5925
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Feb 2026 18:38:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17111

meta-arago / na / 20260217182239.1635550-1-reatmon

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH] xdp-tools-arago: upgrade 1.5.4 =
-> 1.6.1
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 17 Feb 2026 12:22:39 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 8abf058faab939a0f34db829e3526d438=
ad87505

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602130934
- Commit SHA: 61171ba24123649fe6cd3ef567ca3e767d9a7d6a

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: Nothing RPROVIDES 'systemd' (but <build-dir>/sources/meta-virtualiza=
tion/recipes-core/packagegroups/packagegroup-yocto-builder.bb RDEPENDS on o=
r otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




