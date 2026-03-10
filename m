Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7973FCC9C1
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 04:56:03 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33333.1773118558135237926
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 21:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=D72++j28;
 spf=pass (domain: list.ti.com, ip: 40.107.209.49, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKggGnKoRuy2m14lf6B1Cd6iA4R6k8k/YnfgSfwjRTfzfjRRun8mx7Oqdr3XJKUhW+i7OK8XWcQ0mQq8hFPeveNZnDylSvtqS9t9ulQaQijWB7e6Ds8jDPm0pRQWs5/sBtRskMZe6Y27mykexGeB/eUrLSYPh+t9IB2Oi9KM4n2qpq+JMjIxAYCa6182mfuSjTVqrMSuipTD1dwcj/M4gWGnCBhK4jVg+IzCFu4Zu2utHXrI0lHzecYmiwY96Zs5wNw0pZaOYEbTEy+X5czK4Qts85gELcpkhZ0Z/CFAnN+b4pUpvrLloH18Nq39BQCF9KlqS+PQwh5HXvBF2lY7/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETsb/FE9qpOMu2rnkH3KU2dDv4XrCa206HuErYxdgQc=;
 b=piuxU57Dqmseli7n36zL6ZDtlinl4ltB1LD/CH7lWdwaS6xUomip3bL3pUcRsdK7JDCR4iPgdmifJFGjsV1u9Pe1FXHqVvFISPp/KW2x4dDQl9JUWpQzyZfuv5Dfu++/VeJlrrm2u4O7fYp6CXxWgQXbsOmy5EiK6SiC/TIB47Y/ZKCDpV5j9CiwUllyvQM238izHMbavWhwE5Vh6sP8QtGP1bHD75yqflg1fOS6iyp+yc3SFHkJTu1bw26SqtHqYLrmIMRUlTDWXuKFLbDyu2O9o9k0SAK70p7lIQpfN6C8DcEQaUQPLoIUt9B6osysDUiEOefiAFDKaRrlpYuyWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETsb/FE9qpOMu2rnkH3KU2dDv4XrCa206HuErYxdgQc=;
 b=D72++j28NiMTg37fs38hZx/7WxBJ8vsTcc2fJSQXRq/VRbgYrfuqu40Xvg9MsHHNUjJdabQZWDx9lh68Sf478Q0546UWu4DdMHKodc8vViZA0pdoDNyt4Bm0QDIgO1kvf77LRCbd6A/ePjlq3KqdFIANHm+QLSKnq/4kBXDHTmPRhg6eL+x1k1sOV7Vk2NYZXSJODjv2H3QBlcM6jC2/R9l3OA0L51dHMTJjfbMzHjKpVJnxLKeHvy68D7/Jek73qJCrpULGxrRJcOp3yMfy2Fk8c88z0QE2GfxG9keali0Zr0E02buAgK+INctrCOppP0xuXAsucjqBBAIFVPB/aQ==
Received: from SN7PR04CA0034.namprd04.prod.outlook.com (2603:10b6:806:120::9)
 by SJ2PR10MB7039.namprd10.prod.outlook.com (2603:10b6:a03:4c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 04:55:55 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:120:cafe::7e) by SN7PR04CA0034.outlook.office365.com
 (2603:10b6:806:120::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 04:55:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 04:55:53 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 23:55:53 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 23:55:52 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 23:55:52 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62A4tqxW2823442;
	Mon, 9 Mar 2026 23:55:52 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E58A1138B5B; Mon,  9 Mar 2026 23:55:52 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202603091800
Date: Mon, 9 Mar 2026 23:55:52 -0500
Message-ID: <20260310045552.903655-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260310043605.3034415-1-lcpdbld@list.ti.com>
References: <20260310043605.3034415-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|SJ2PR10MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e37a1fc-e9aa-4638-da40-08de7e614f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016;
X-Microsoft-Antispam-Message-Info: 
	efvxewZhY4E8YW4t4EJzUT61VoR9evUFU/4Cr4fucMeJ2OguEU2ROxiUFjUzVKFBYKOeeY40DUngdJUteuRw0kpwN9pCoqG/aQGc/F7j69xfGls4TA+/PMAhbG77e3JjMV6lmRaREy0Op8wjSHihZjiy/ebdm3o3S5O1Zy4chKUu8u0WC2wTd876e3s3RgDt2WDkGOjmRjKmyElKAYvkSfeOj48w/onsdC/334i1l3q9xf7COJbG60K+K+Livlf+SeYOe2f1xyRYT+sH+FKZcdLuJr1+z7H3liV/pTtkP1JOLAamF5U2qPR74XS5Yb4vM0hDtoNMHEkRAfVd/ll2VS5Za4+pjRzeh8EQU/X+PxaqQakpLscfrtI9dY9tfv7wWRCD4QtWz78s+CIP5pgZPfcLsPJUQzeEN2mSb3llpSNdSSu1hmOyjWLPI7PeEHFBUQpCZGfVX3RvFe6QB5FxvQEuO9xLy53YFMX4VEpVfREVTlGsItc4emhlYbh6Cz9yKf4peROBtCocTqzTSGLkS9gnTc6BifIwx+6htDjqW6JTd3OXvuPeHZKMeLJtke33MeWsMdVe0RFl0G1FDHZAeYVZaer1wy2+jzi0bR0eSRO+cAmFpuqFJnE/W1bcrfZMQu1xZS11IcQplNRVQw+v5C4XA6bTDIzk7yIp4381WjDXMkslLWwcI8Us8ErUZDH3XjjH7kmTZtluO6ZCL7sbXZilrCMawiL+rna7KVrBbLkD86j3QbMy3FpSjYURZpQ2d2Dt/6KOR2bMgoTbz39ibQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MZoaNx+mt6ljtxXTy4UoaZLRpvzBpVOtA/97X3YK01jp4Hemi98+Dpw0dhJks1uLuXH8a0NZHo1iDXxLfnifI05DHTRK5MpT5p4NINyp7viRyyypMLvPBSZ8nrDDiU84QVx0tMEFZLB4qao2UgK6uo+2yiIVfWiGxT1U+K0VkuvXD9D/5nL5u6HNtQuxMdnLRGMPRxoflVpfR72Qo78noHWwJA0O8oojyYQ9ROkruz+qmGX5ZYjwu0/jSh30u4u0Z6zzmjO+JHjrS7CkRE4chrd7GDlY0ZYld5M/pQWP16vuuGfJEWgIi3PCU7E8k8+Rn5QG5x7zXpZnKJLEmAm7dKi2240cFjeSgLYxoTJizpcKM9fcIeTJFV5pdCTN0XBDYOn4DCdgf87TCHrVYEOfWtVqPEt2WY08eUoi1uTRscy2sk2U+nwAEKyTLZTCvPb8
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 04:55:53.5094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e37a1fc-e9aa-4638-da40-08de7e614f05
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7039
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 10 Mar 2026 04:56:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17301

meta-arago / na / 20260310043605.3034415-1-lcpdbld

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
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.=
202603091800
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 9 Mar 2026 23:36:05 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 43992ccb72262168554c00d688571cf7e=
2109cb9

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ltp-ddt: Add missing iproute2-bridge dependency
- Commit SHA: a57fbdefd04305eb187fad262d7b19a104977e28

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




