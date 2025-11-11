Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215F2CCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:05:57 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13393.1762851955955436990
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Nov 2025 01:05:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=u7EvIE9G;
 spf=pass (domain: list.ti.com, ip: 52.101.193.67, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeNysriqhHN2P+l+P6C84WP/GyRi6hkKH/k10DrU966FWJKr77jTVe6YJbOyzWL/Pu7e/qUSoWgXlLqDgODxOnCd3aFoJ/UTRKubU7QRy7YgnTw/N0OGreEbtfJAQrUwJoXcWvS8no6/9fP3vNTA6Scc+tgutyTHXVpy+n358IGhigd7sBYEs3XYNdzPeh/xt9DdW/i2jQ/fZIapRfid6sdkIKBzpU+WVSPlCjZ0mf6+PsAcBkHRGtDzDneA2VCdd61nEYQX+xGIs0nKL1EhVFLAQG9sQdiS0RiydtGc4WkXYIMhtnMg/N/VsHaz77vOHeHppLOitgpOe6oyV8p5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVUsAVDWS1PPK3uNwn3jkQdkqQPdo9uTs73s6hX1LeA=;
 b=F2qe+J94pfKExXQYGFE/V5guwR/mYPPHDXG5sIN9vg6RAvGKX4CuxvldqO+ZoU8yRdVxIzDwMqd9x4jPHLx4ByCOY+ckAGunrYxliGRWOvMMRIyi9AoglK2WJgUeafrilNecdtyJA85FJR8Ijf400EXA2FXFLu9ywEolI2C2sQFWkXEPfJ2KXUQNKL1T7wMUcSJJ/V96VBFm/WVqu5mBwmsLQVzibs9aRlBBL9E5wx4nF5byKAM9bhCvnMahu9iriZppisSxBad95nUF+ZaEQ+zyQaxnn3J+2kfV4Er26YaJb5Qu3wJ5ipcPpLDkYSEpjujOcgkIbcX5Hc+0Jg7wtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVUsAVDWS1PPK3uNwn3jkQdkqQPdo9uTs73s6hX1LeA=;
 b=u7EvIE9GEE2tJcenU0VtOmzm+53OWfeKwiwxbAnCUVT3mBIidVid70s/V7SV4iNTyvnBCoHERqfPVp4/XadAi/+WK+at/so9HOMtbqBIR8OUb4P36YC76vUCYW0x3Ia6dBUdtuHWsqQPPr36QojhXuxC500QO5eLgj6DtaMG/yJhPvA2LwAL0tDl6qGQ1DanvGGr9Tzm0jN5543iVy+x7AdPvCtcRDb1cPu0QlM5M97/kXojrWFrGuq0A9GSHbN9jEquiGQzWOgplFCQItdldBhsnq6J9c91QauhEW8MRGVYjDsN9x/wAgIUvKXqy41BZvu72tazRTid5t9g6v5vXg==
Received: from BN9PR03CA0905.namprd03.prod.outlook.com (2603:10b6:408:107::10)
 by CO1PR10MB4562.namprd10.prod.outlook.com (2603:10b6:303:93::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 09:05:53 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:107:cafe::5e) by BN9PR03CA0905.outlook.office365.com
 (2603:10b6:408:107::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 09:05:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 09:05:52 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 03:05:51 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 03:05:51 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 03:05:51 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AB95pbV695477;
	Tue, 11 Nov 2025 03:05:51 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 11E859ACF4; Tue, 11 Nov 2025 03:05:51 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202511110100
Date: Tue, 11 Nov 2025 03:05:51 -0600
Message-ID: <20251111090551.665341-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251111090023.3949493-1-lcpdbld@list.ti.com>
References: <20251111090023.3949493-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|CO1PR10MB4562:EE_
X-MS-Office365-Filtering-Correlation-Id: 01b0c94c-bb21-4bfc-30a2-08de210183b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fnQtEZDrpcpplgMTxIIN3o96cs8R+13j5E5FKvQCADsRqRSPsoweIh9OPP6f?=
 =?us-ascii?Q?tjfT1A9LxKL+9nAGh6YidB0Zs41R9ZWCsJbfbAmyCwWAwFdmC2yJW/hHf0b1?=
 =?us-ascii?Q?/0zTm2fujEejFMyZNgzyHtFFUk3MiFvofNwJKOkxUWYRfXU6WWLYorllRJhq?=
 =?us-ascii?Q?MsUkFBXPPrigFQWzZGMsVePxD4eAY7CkYbF0GqrJKdY2N5xN2e8htV0qrz/n?=
 =?us-ascii?Q?8LQkUANv6ggJusJK5SeqEfQfsvMUfELoha3jOVAKYWPJ/ykykzRY9F76yiik?=
 =?us-ascii?Q?Q9iw2r0qcmBqzF1T/aXlpvS46uN7UdPchjXkX7eBQpg2ZdPBTy45h4Dtd+Jz?=
 =?us-ascii?Q?ODW+M8AnVXwUecFyVKbjmGoC9n4mhNSnBrAcTiUK6uqixVSR9rAFJ9jxNolX?=
 =?us-ascii?Q?0MRwLNDVf8aEMwLg9or8P2fdAFGBiuAFW6aRmzvbE9idMYEbPUA0TuoXiQ/B?=
 =?us-ascii?Q?QWFTHyYQFZP4p+oyG/+2ZKRlgXREiSfdP7XRAn/P/yLux4RSqDEGFOsuNFbs?=
 =?us-ascii?Q?zjpOaHsmOsPdfA4yh/izUdjAGiq/sjtepDI3OJjz3C+FvTnki4pWdOp9UGID?=
 =?us-ascii?Q?J6hEm4NZkOtwfjxU3gsGnpdPNVEV0bmsW0yu7qBx9hPR6aCBPxnMSQnJg1I2?=
 =?us-ascii?Q?uuHd2gWXELi4x1vnXAvUHbKomYNapAkwJlgMvQGFCBUGbvlOCQ2QGRL1P9i+?=
 =?us-ascii?Q?wOHZq3Y++mgYovt3m+YrkYRXW6a333GLqSvQNo94wuA4Us2TmSes8XiOoM1a?=
 =?us-ascii?Q?GZBCLBPzkOn7KHlyHJPovexviYFKcxwnjBjXfuGyuJdE4zvWRPO6nLC+AuPb?=
 =?us-ascii?Q?Plso3h50vxQmb2/kUvdOu4Nhe0K1atjDkw/JdZWGPKrHZXnycwVAAeBs6bkI?=
 =?us-ascii?Q?ZdRkmqyQPFEApR1fNpgAe9cScACjaa7+bhfLmisOjN7YyBQOGGiiAjHoCkPv?=
 =?us-ascii?Q?MYtSA8eYKnPVLr/84o1Vf0rMI+4V/KVL/d30cJs49iR4K4bsgI4PdxQYSfRp?=
 =?us-ascii?Q?Um/huvt3U4Rq9ZYFfhkU/OED6biTKvyX4sw2fJpbxif5WxXEnDcCwzqqRIrJ?=
 =?us-ascii?Q?5U7mZTbYU4aiNBnf2RDgIgf64S/WE8w7qw5JAKjeoj8fuoqyn/qpOFeeTTS3?=
 =?us-ascii?Q?aIbOy+hSjqjDS2ct/8OXMifI9ClvuPmQnLOtK9X20CICl9EpOHw+vvpfYYye?=
 =?us-ascii?Q?6iPjH0oUKE86VbSHIzFzJdi24vJUvWbsViBF32dubXgF/fz2ashIRe/XH3KY?=
 =?us-ascii?Q?bQ+BlP5idbTSFBWavkqZKJ5u4+dj4KzfnTS4WLo/CyunqiUukHbKl7ewOvCx?=
 =?us-ascii?Q?bE0PTZFUlAIUPPrNYYNWCDWtEsS1b5rkhVFC0RVDvu45szHVNycEXF31Hg8n?=
 =?us-ascii?Q?xab1tzDrSIBPAaHXqKcJlsqIM/OZLE+twOjfaXkoiHWcZbDCRmMU2bQQMB8z?=
 =?us-ascii?Q?c46NOocRqMhWM7zpz292+AlBmbAWSqDEkQ8ZE/BHknCzYU3idbwU+YHYbX2a?=
 =?us-ascii?Q?i6ZcFTc10O8qP6WaEiS7bH0FrV2LAPxRQ65/Ildl1WjclgaJmOol50fZPb3I?=
 =?us-ascii?Q?4iFdGVKYHv9rxPb4ZpQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 09:05:52.0799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01b0c94c-bb21-4bfc-30a2-08de210183b3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4562
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Nov 2025 09:05:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16742

meta-arago / na / 20251111090023.3949493-1-lcpdbld

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202511110=
100
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merg=
er: cicd.master.202511110100. (COMMIT-MESSAGE-2)
        patch



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
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.=
202511110100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 11 Nov 2025 03:00:23 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: af1ceea0b1f57169bd6b8fd33ec21ce69=
ae797a2

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: packagegroup-arago-tisdk-graphics*: Add DISTRO_FEATURE ch=
eck for some packages
- Commit SHA: 18d215b03c65ba448bf38dc3dd98efe8a17c25bf

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




