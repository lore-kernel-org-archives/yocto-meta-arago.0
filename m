Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FA2EDA6B4
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 17:06:01 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23551.1772557551441141484
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 09:05:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=C8cNbdhb;
 spf=pass (domain: list.ti.com, ip: 52.101.52.43, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PfOkiFtGPpJuC36ndj7RmKuecblrY5qc+NjOj8qBHXNzN71vZlYNBDHMW5Aqovhvk75eiv6dsqEy/oyh4k8zaCNnIgHieYaBK1eqssPtg2c8UHWwe04fn+be1OLQatNxwcTe7OmPjRWBerMbv440qjmgeRsUohF+JQAgC4bUyb/+aUrP8mhrGrpE0J25d5lMlDP3uiPv9rdVMiA+WRatsDEb/BcrsND4mlJ79KPOb2aM/kJN6rY4qUEFYqHpmufdHmQopmSWzPFX6GqsSk96ZQGqwLDulH40j09/xdQlrKm0sLWzNv7f2rbh/HKlffIH/a4eRAfKtjKg6PE703EpsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fXCOhy7hl3NFPxdVNdjO2sL1N67dKa5kfM2bamSlX8=;
 b=TWNDc5NEYd5HytftS6pDk+Y0CwLAl7Eg2Hp2HI3iCE+Vbu9X5mML+1wOdaAK/k42kCJ/sV0rUzeDG2ZBrg7f9xPBFgWy+ZujdrXhLVBIYhnnCQWz3wmWsQM+iP43NZsF0SsWNWInuB6s2MMH/csMMN3FwTlZ6szq+2TGdcRnruacNgmsKlk8CGSRVo5or4j3pDATEefQJjVKQo/4IU26kXcgtCh7IjInuuA7TnS+cA8fcdqFrTM4s0KlcwHlwcSsEHqtmlTr3toLo0mnAbPnWbakWqLfK4StL4WjeutqUKOjJUvqOuV7/no9ZO3FCUbruglJ/xCNgqNRWtNA63ZEQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fXCOhy7hl3NFPxdVNdjO2sL1N67dKa5kfM2bamSlX8=;
 b=C8cNbdhbQzdcmdouujPqqJUHZi1sSwh5hQkq5rUFsKwpnX9OrJW1HFxuOvnkvXk67+MhlTQpPDEQseKMaPcwoDpGJlxW094qO+kBfkLdrUm1mmMIPf5czgJM1SIDYHHdp8Cer9+UkbuHGMW+Yt+pU1v3voxrJ+r4WqDfhsaa4+QIYCd7aBiAsyzyF1Kb6yRCfTn6UOdEO3IO+yxPG899VVDbQH0nUScPWdKJUuHguHCwdKytC63SrQmfzvWqqK3kvj2+IvQGohbSZ7MkVf9Z0jvtEV6L2S6lqoJA3xLjqpeHIJJUrax0JDH5NNnv95hnpW7rVvlvrylkv9Gipy64BQ==
Received: from CH0PR03CA0219.namprd03.prod.outlook.com (2603:10b6:610:e7::14)
 by IA4PR10MB8445.namprd10.prod.outlook.com (2603:10b6:208:568::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Tue, 3 Mar
 2026 17:05:49 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::80) by CH0PR03CA0219.outlook.office365.com
 (2603:10b6:610:e7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 17:05:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 17:05:47 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 11:05:14 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 11:05:14 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 11:05:14 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623H5E0c3789751;
	Tue, 3 Mar 2026 11:05:14 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3482E9ACF4; Tue,  3 Mar 2026 11:05:14 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/2] ti-test: Break into multiple packagegroups
Date: Tue, 3 Mar 2026 11:05:14 -0600
Message-ID: <20260303170514.1118897-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260303164829.299398-1-reatmon@ti.com>
References: <20260303164829.299398-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|IA4PR10MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: c1183d6f-59da-4b8d-6793-08de79471d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	cSztoayUWeuTF1vJuReTXFoWWXl9Pavzpy9gAuD31EqFwgvA2MvF36TOQvEb/x2QnLNcuyJEdx96Gg9Nysi65B5t27Z0Q/mucQ1z5b6MJpJlk0lVZaoe1hyq2sseO3odXrF3mQj9xMv2pGS31nOLQpI/9zukoE1ck1OyulcBXlYnG50zw/smvQEYUub4Yq1WlnEPN1UvDSb/2Jv3jkBeD7tzMRRIJWe3uT+PPqbf6VY0vdL3YtpzWULgLFPR2X+O1DzAhqnPV+dMCryvCaQFDMvzA4VplSHSrcIzviMinmMeKKf2c3BFUBe76npOtCqQ0XckXm+GWpHGsNRUIqWq51x/9FDyJb8xiYb5vaiszIvPHHi6etMpTOZyIGWiWOl4+Zd3l1FyM64hm7q24T2oJapTryqXEWdRZcwSv/ZLVe1PStad0vZTk2kZjQA7xzrKDNHFKGc3RUzTgpqUgomb44FLicxItU/43zDvZWo5Yrvc1Ut1AYMmNvWLkzIfrPW+K3D4vISPMYNKkRSoZRrts+5eFwU6+1nz4fUXYoOwJ7x27kcKYLmH+QP2TbqA+LsLMlH7rG2uF6lx38IVKA/bdoZx+OfFr/BYrPn8PSj9FOKbNExzwS3mQHifherUZhdkgyLfJBXCgJJ22cFayLLU4P/q7bm4ebdcJwunDS1I5iDOjOp1Ltuc3DiGkFcLsm84wfgmCKRzmnJ1bXN+93ctNSqKixHrgGflN6I6EW/Foly1tf9h6Fx6ju1JIEB8hiwHtK+Tci1c/s0hrOrZjXMpPweYWArPqBPjgaf+C8nWbeY2znYfh0CxamSv5ispYPNO
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5moTX1R3L9POiarpZWCmzsJ9H9L5sN9xOjn9DFuG6je6bqhzXPr/t87ICZbQrWWN/0tPfftdkiTMTiduDdBqW5rkqWTAFe8+ty/jafXlcbRQDwdczPU1uMG78DX4VGn0mi9sBWSwLy0q1TBgDl23ZgakcSPodLEirUF5+wf6fdUSx6vcXYIUP6KxE6izF8oEjYnghwHmYO/ZsnXoMy7eQ/96b3XKAGYZPxyYXH/ZDMrK1iHGQHykh2Z6AiGkTm7tmS4DE4FZDPJiYoByyD3jilJMwzGoCiyzf2i7QFyv+LN6TKyopXjPnLEwQ43t9w2tFM6LiBXofhSJ1/2uMqk5iJ8DzKHH49GFIqT5rVLJAQwzfBRdsFwW1sd9JzxOSy3T0rJLL4v/15xChMa3nxDJiQLIZ5WfqwsI/niwY5Z7pCvaMkOqh5qkMk5hI0bX15CB
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 17:05:47.7888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1183d6f-59da-4b8d-6793-08de79471d91
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8445
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 17:06:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17203

meta-arago / na / 20260303164829.299398-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH 1/2] ti-test: Break into multipl=
e packagegroups
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 3 Mar 2026 10:48:28 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: ab696cd2be7702f7ec6bc03e6afb58136=
29415d7

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago.conf: Remove temporary hack for DEFAULTTUNE on armv=
7a
- Commit SHA: 58966cd5a2d433b4c915e652f21f2e2b2475ec21

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

ERROR: Signature change for opencv
   opencv:do_recipe_qa: b918c287ba59cb6ae736b54917476fed1a6d9f8cfdad58a2659=
f40b69778d960 -> dce1f0c92f5e2430d5808ae968a5b14cc68046b17d81172b7a7854f818=
e45054
      bitbake-diffsigs --task opencv do_recipe_qa --signature b918c287ba59c=
b6ae736b54917476fed1a6d9f8cfdad58a2659f40b69778d960 dce1f0c92f5e2430d5808ae=
968a5b14cc68046b17d81172b7a7854f818e45054
      NOTE: Reconnecting to bitbake server...
      basehash changed from d93484f40c528aafd57b8eb594a71359f3127048c53c717=
1ee91a521ce1592ea to 45b0ce43bce97313ace71acbe01715c0ac544f1a0786657c4e4e1b=
25048f2867
      Variable PACKAGECONFIG value changed:
      @@ -2,4 +2,4 @@
       DISTRO_FEATURES{wayland} =3D Set
       DISTRO_FEATURES{x11} =3D Set
       LICENSE_FLAGS_ACCEPTED{commercial} =3D Unset
      -LICENSE_FLAGS_ACCEPTED{commercial_ffmpeg} =3D Unset
      +LICENSE_FLAGS_ACCEPTED{commercial_ffmpeg} =3D Set




