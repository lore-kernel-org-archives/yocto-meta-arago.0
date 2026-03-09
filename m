Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6742CEF36E5
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 06:29:20 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8262.1773037756208740274
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 08 Mar 2026 23:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=xCn7XGgl;
 spf=pass (domain: list.ti.com, ip: 52.101.85.10, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMmznwGjtAYM63bkOcgHQI1neSlorjCzJtOhrI5bci96FWe1TbN3BfpM0oZOMVl2mm9mbM3J07O39Y753mh19g6SWSr2Vsyvo4snUB1OnQZxg/IQiul2QIhVF9AfGlO0hHRsAv7smPgF8MJJ5CXzxG78oYAofLzpzwsDuWsYrdHzAdsjHRiZLpz3jdK3YBr2JFZGYQn+OOzVb3pTxul9jGmOcs4XminslwZ55J9/5su3RSptoQMxyBRWKtOYFn5ppuZsnj8IVUp18P3iBzPe4wzHKnBqm5W/MsqtPpYZuJPOL1+0+UdYSI/awWaFoWPXeyUUOI/vowVIRiwvVFfM/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCW8d0daRjKVDmEL2N0mz0lNL5QlriVoBBZCvjZd6Uc=;
 b=Hbv+xW4zRMvQ07D1EzZHzdzJrav5bI1EM8MkG2xJIrbrj68gR8uB2nKlF1nqedwveXjZCA2uazHLdszUpZvxBGqyIz/PwMqrgMYIJlS4El7pRkTncrWFVpHkp9s6PqPQk+SymVrKPgRbNG5N1ySD7NzXBIjz3UfYyvjDjXztbL5+E0x6mzq8tp80O0RzDoEJaBsWnv11ss0AvRLb6YP6uYBTDixbvuAkkHDAzf8XtiTUZaTS5qqQTIx0d86Ie4mbx8d+BaOq4K+ZS62TrDckUFp27p3Oo6N9iHypxO3x5EssCOUdbYj0vd+P4bB4Z2aiHI3rhRLRrl1WLTo6os5hlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCW8d0daRjKVDmEL2N0mz0lNL5QlriVoBBZCvjZd6Uc=;
 b=xCn7XGglKEXMOzlqoTI7rnn4Fg2+c8es86XATB8exB3BmdxcmWc2eNAP3irPdv/aJqvAEyFoXIvBzk0rtbDPb23mll+qE6OmgSpXRpRY+WwqSLjxl0p0tuMu9oS42O8YXi1bWQlugHT2IlIka58ANhJYlvJcXkdmYOSz6P1EgJsd02iskqAlCzttoZfM71JklQ0NnXceNlSTSamW1rN4zanNKlBRjGlUVUdpB78krSe0WnkkyJ4o2e8rTkLBTLp+FEaxRPeEHBOGNvCGNAYYAS3tEJFTC30ytAK4QUNzQ+HYtj6EWULRTv68UpwE8AnwgC3yyMXtnmBj7M4tMkvh0w==
Received: from BYAPR05CA0005.namprd05.prod.outlook.com (2603:10b6:a03:c0::18)
 by MN6PR10MB8071.namprd10.prod.outlook.com (2603:10b6:208:4ef::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 06:29:14 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:a03:c0:cafe::4c) by BYAPR05CA0005.outlook.office365.com
 (2603:10b6:a03:c0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.23 via Frontend Transport; Mon,
 9 Mar 2026 06:29:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Mon, 9 Mar 2026 06:29:13 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 01:29:12 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 01:29:12 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 01:29:12 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6296TCFA1741166;
	Mon, 9 Mar 2026 01:29:12 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9D5E62A53; Mon,  9 Mar 2026 01:29:12 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>
Subject: Re: [meta-arago][master][PATCH v2 0/1] nnstreamer: Fix buildpaths QA failure
Date: Mon, 9 Mar 2026 01:29:12 -0500
Message-ID: <20260309062912.2991668-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260309061254.3942533-1-p-deshmukh@ti.com>
References: <20260309061254.3942533-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|MN6PR10MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 47537f08-86b4-4928-1c87-08de7da52e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info: 
	9I0AymAqpQs/OabBohrh3w6GpthJVLtd5aQcG0cgcD1HCZrI4Otm8t0+z3/HhcHASa7TWDaOAIU2NvnaNU6WwLcmFERpCJTUDqpw9tsuM+BDbzJQUh0p+9v9w3+Rc4+sLbDl2iV+C0iVqL9mq5Js09yxiJxOk3g5S9M6zrfv937yM/aZr8721STgvZZq8G2hEI+dsom2Zp7TNd/YwoXKurr3yOYPYt7cFbec5qkDyqgZzv3H/Qjav0BrcRSvHcV/ATJVMaAJd9epOOtB6gluARwm6Zhc8ggFAUV3EKnAwTApxWj7LUloeq7Hm8NSNOBQBIPaKlPTK84ALbHC3K3z22Zjp1iBp4ouzaEx5Vys3/2LnuBmluSaJcLs0Qkx5jlEobWRjN2BuedRWr+oexFh1SYKriKayDxAxnx4UZoSjmJDVt9XYpmGfMkX7H4LZgOpYrvOaoA7bSmnOjq8ZEzc2nuSxUGgmspfdEwQUEYc3eCZxI7CmCnDa/wF2jZNRPPRxMWP5hJJB0KQFFIEDBwDuD5PofLL3ZM5lXw76WDWusLHNGvSQsAAov6jyTTxnzzMZ4c6fOkE91teH56qgGlaIeFjUvQ3C5sJNYfWj12YT1yqhmJngklMHBEPRvHM8fNAO6P+fMMWHu+DsjbYJEU9OlxgOQKObrkuZeCrDSUf0WcL7QQ6kXunRgZ0/9d2gx9mDiub9DgskhxzpO50Wxwzt+nYRt4Ss7K2sPHe7TB9DERevMc4qW/0VYjdCjxD6tMZvp3a808p81bhud8nqVi2NA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	yJemkiEM4fu0DjtL2085Z4i9JxGoN1LuawXzWw0LweEaQ+JXBupGJfXI6PAOioOW6u8fuJ790HSzj9TggmrRos1P7zO8wDJcceSOLuKhkYDYi/aDIdFtayfyOUiDCbbHpIcu1+tDEL19RkEIpLNcYCyCny3pvpbTxXY3iiKOswoQLTmH+suqRMy/6oqS78sigFZRK9JnLMN4hb7sYfvhEtgC6vdGTD7jGGiMvaBqvRZSa9TKJsp0KBBxZRbvxvzicw3Q5dDil5cg92145nnkhsd8TU+2C0Jpgw5+G6gTOrVZvczzwaBdG+QPGYjxMuZlI5eLcH/kc0Jq6JLLGUpLKPEgCLIVEg2im1/FRwVnzMipNvJrUcFQDASr/2NQe4Idb9X49NJ2uyY6ji+X2A8GWkPW8ySufgOg+ETud+L4l6rtSMlnQIO0DD0CYuupM5om
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 06:29:13.4425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47537f08-86b4-4928-1c87-08de7da52e76
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8071
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 06:29:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17288

meta-arago / na / 20260309061254.3942533-1-p-deshmukh

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
- Patch Series: [meta-arago][master][PATCH v2 0/1] nnstreamer: Fix buildpat=
hs QA failure
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Mon, 9 Mar 2026 11:42:53 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d7baa93336105e9179310ee74e673009f=
77f7e82

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: chromium: Upgrade to v142.0.7444.175
- Commit SHA: 939752e7496d2cdaea5648fdb0418ed6a36204c7

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
ERROR: Nothing PROVIDES 'xen-guest-image-minimal'
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




