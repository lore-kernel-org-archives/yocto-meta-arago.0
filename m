Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F553CD4F3C
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 04:08:07 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18260.1778990876811264094
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 16 May 2026 21:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ak5iwrTn;
 spf=pass (domain: list.ti.com, ip: 52.101.57.52, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8r3MRBDPTwCkLSCFU95HcvrqMg6lAH52GMk+qcBCqrIuC5BqC5DjWsv3u/EkvOva3eJGkAhkIInnNkSu2jgJ7UFVbtxB//QvxZ0qhBhQDSO81DayWFJ08Km1LDuEeAzH/ZYjqndmcA3GNS9Zue0Er7HfWLEjYoa4WPNPFsqGO6tiagmIrqE5vimUtbXpn3sNFh7Ogg45xzcvKhbSVsOTUe90zjTQuAdWHh9Jiyt6dZyvMGxmTIXqwgHTCeyAJ4DQxKMC9vJJ1FQ8F22UtJp2FSfeabMShrqYCgbZYVNsZdqoCOZseo9Ssq3ee352k4SE5KJjBWJxNNTak+IULugDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHrcV8v5NbW3xEm/xhSk00oKHz2ZsXJQufoWy1AOMq8=;
 b=ogkYDyTTqtON0HkfiMNJxUqptNiYUjHf76iLHK6so7luV2JdLDdn8xs0ecCgWRLXvZh5FD45ramFatl0jcel9chGi2561GSt0t1yUoZQyf42ZMRH6AGw45gkC7kBey8wk8zk2Qx/xRCO3zZfr2zfRzdjKal+D/xWBqVLZIWOGK+iKyeAmqWLnBZa/PPuTfqG2AxYFva+eNpk8TXo8ZqKFBHsXcuxBEFxZNvD8j2DvB0LtJ44DDDTs4X3r1yeUTZUBoaohRZxOD4Jlj5h7JoxjeP+DADgPorPD6IfOW+HF07fK4d968j30FwpWsBmUqKLQJ6TM3haXcsGzNGrtA+vnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHrcV8v5NbW3xEm/xhSk00oKHz2ZsXJQufoWy1AOMq8=;
 b=ak5iwrTnxaxjLk/xPuBdJoz+A0yU/eEpNZB53qR63xdM/0Qxu6MLxvp/1A+EgUd3ygQe1G8so8zBxib4P75rTw1B6lQGaHtaQANBElEZ+ZxuxAK6Y8DLouJZ4z+yIyYQG6siXNOTy37kpYD59qcHQ6pkktizukFUpMtpa4h6nFqK7K1QqJbEKHNw+ZLvk3Qh18P/zlrfvjPI3YBvREDj6s6sq9YT+6rgSLYP8yp977f4NwNnMBMwExecoyFnxP3Tk+2JHw+0kzJVl9AeRfWukfmnd4OM/aZRONf+ENswcHXIo++7WqBQTGvHnoRNtdwUVlNCTI28K1yxVJKdxkv09g==
Received: from BN9PR03CA0476.namprd03.prod.outlook.com (2603:10b6:408:139::31)
 by CHAPR10MB997747.namprd10.prod.outlook.com (2603:10b6:610:2f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Sun, 17 May
 2026 04:07:53 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:139:cafe::a1) by BN9PR03CA0476.outlook.office365.com
 (2603:10b6:408:139::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.22 via Frontend Transport; Sun, 17
 May 2026 04:07:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Sun, 17 May 2026 04:07:52 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sat, 16 May
 2026 23:07:51 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sat, 16 May
 2026 23:07:51 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Sat, 16 May 2026 23:07:51 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64H47p32651863;
	Sat, 16 May 2026 23:07:51 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2F5F59ACF4; Sat, 16 May 2026 23:07:51 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-arago][master][PATCH] open62541: Update upstream-status of pthread patch
Date: Sat, 16 May 2026 23:07:51 -0500
Message-ID: <20260517040751.3553568-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260517034702.1309037-1-t-lannynd@ti.com>
References: <20260517034702.1309037-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|CHAPR10MB997747:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b717f6-75d4-46c5-d215-08deb3c9dd9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	WhaUCnbsQ+p4XNR5V1m+Gw5Ud717UxJ+77g0BYHkdZA6pyPMClLs6K/8cxy/va0ta5idrAJKkdFCxVveTGHAwpuuWpOFiwIP513UInfV1oGlBL6xsCR6oSZCkvBzV2blbTftWI8I88uH68tTq9rxkw7iyHq2u3mXq9Me2EPAOLdqTxdmBVYh11iyhxA0aAGiiHhmruT8J7yywogzTCauD6d11jvG64ZyL2/gC8iMLV6OiF/6OIK9CTnG4etA3tBLrfh1zUKSsbAibC8ACf9oaO5tXjtZ8LPv4XUuUfpEolOuRKV2m6lC8ZAWAlC6QlMqJLHcLMQUfMUUO7hfrTrr9I4Ykf7Skn1yT/ErKaNMKG2BqwOQNXkY2YQXqaKi564fcqKsqIVoq/lgXz+w/CeQFLMSdtGFNj5f34Mo3isRPXhoR5TChQOfrQPsv3X4zuuWX1Rp9Wupc9Dj6awy1JQEhX0gzDKl9oWaSW7yd6Yurr8oIgmB24QxIySIaWe/pX21cvcBTKgG1UCVmhuiZ2aiSCfaZreBPB8atmHIRp9hk29hnu8wgGqY3c6ip2LByEYuPbxnUUQn2Q5tNcIRIkWVhE3EBSKnjsCm7ELg4ps80GnuK0VY32U3zC9W+FPeL96zOs2d9p/O2ILc+dNzoQgIwZ/YbsXBIj99ThvTaF5hwxxCKxYyKWapaUFk+PPQmw3x1cBstQfwh5T9yMgljm5DllboAnVL4PYjF3MCXYfRpcA=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1oXSv6eSTvdRXYsKpFypFnHY1mBbCDaEvJ76ZA/ZHZ47LqGCbJ9vTklsXqaKfRUN9j9QosAhLtxRPKA0OLSlz1ygQq19pJ6dmvW0hZEEv3kaypbD5qARrXa4xScJjUyGBR4ufFeKb0oMhWqXnna3z2U2D/vOz2Sx0YzZL49EQrf+r2MrMZ6kKeeRalxDsyMFDiaeer+K4GLy706L+ZvVmBmdDKfm2mpk00iHLLhxnFAZHT/lffbQJBYBtSo9FBz1hv3JpqirU4m3WjUqiC0QNC8cQvlAZdY6zYopK/8AfIpKpmZrFL9FHwbycT4voROras49DuzMFZiqUssn7wnsK6adWbvxOG+CPV3MptA2GSo0zOCwvail+wNQkjpzp30N3rqoBlsWDfhxn8uP1mxgWBQeqWM6PBeyrjHp3TwhKBNm9mo2DZBnwnN+yYXC1oFb
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 04:07:52.0128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b717f6-75d4-46c5-d215-08deb3c9dd9f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR10MB997747
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 17 May 2026 04:08:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17524

meta-arago / na / 20260517034702.1309037-1-t-lannynd

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
- Patch Series: [meta-arago][master][PATCH] open62541: Update upstream-stat=
us of pthread patch
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Sat, 16 May 2026 22:47:02 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fc83972630c96c43a8fd0d2c2ec91a23b=
2dc4a25

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: open62541: Update for v1.5.4
- Commit SHA: 494ee5ba207496a4b355aeb84b014ee326e9f5b4

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
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




