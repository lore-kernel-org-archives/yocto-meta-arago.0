Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B217BF47CC6
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 19:49:37 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53091.1772740174558336549
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 11:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=hJzOq7l6;
 spf=pass (domain: list.ti.com, ip: 40.93.195.44, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SLC7plEBPslfSR7RZ9wrvGWyXxKyxo8NstWFnaX87h5oRqTZkLz02JRstxijfCzchhViPw/4/B/E6EaLqRbMNL433bfjUWUU3kGYPZ3jP104NzvnL+U5RelCQeg27oPUjaDPxC2kec/QH7YG2V3Pfhn8Ax801OVCKJJyJwy4HyCeT7uecQOI05HZ7+gX2ERI4TTEuyD+H6/wmD1HZj4q2B80cN9dWbZTCVlknnOiEhmQhrn5RqwlfTmDMT8tyF2bZdDkubhDQsEP6jSyNUmYNzKQLpBk2rktdM3QrZRw9DfJ8fg/8uS71ZlqyoHXhxsxlNrMLzPGVzvcq4KzQnbkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQPiza0yTxKG12t4zGXyDh3FWOuXEBGFE0b6UyEQI1Y=;
 b=knubcfILP9Lu6xMvtQyEucemxPu7SNb1wOtBa8+N71xldTMyWVbFtlUWnVvWeUzzyAS5ZZ+Q21WLH3Ky9VLu6677ofx8/SyP2ocMsR7Yau1/wngT/5CTpFxJWej7PFjLmoS5OxIdxxwP5xRuPNtjqr7zWrL2+sQJ3beL68UcCcHKJAjiahMVt2Fbriyca8k0Dht4FbdGpJQFUoRit1RaVHjGwQ1FSc/Wnpx8O014wY5QP2M2W47RsL0o4K7a1ciJBXrRdzIYmA0v9pFzFCT2vPVSnCOdpG+DsIRAeUgWZ3C83Zy8ir6LwHByJL8bYdJ6Wc/5CzXtxjGTdRVDghr5Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQPiza0yTxKG12t4zGXyDh3FWOuXEBGFE0b6UyEQI1Y=;
 b=hJzOq7l6itvGoxokseBSQuRwFIiOZ2AT524QUIgcYKZg6Kc6iT3ppWVe6istXf44sMoMQeTb/P7vzF2J6WdIuaV1tuLebn54YMH4ff486a5Vv8G00xlH3b5yGJ0u2p33LnzQJfznI1xRMnZb8N1Hw3A/R5tIdeDfXzIbO/zFtPyM4uSx85niecUgktB1foBN8Wdaq4h2qR9vc8c4+Y7OIsiYTbRWAeUfBbrrBvduRdDfI0UEXQB+6pSnVNt1ql/zDeKpoTxU0hezJFClYU/xbGc49umiUTdl4/2k6xaHfHjK/qUW2vNL1Tg44dFxwnTb4ymHvTE5tlg/X5aGFPVyWA==
Received: from PH7PR10CA0019.namprd10.prod.outlook.com (2603:10b6:510:23d::27)
 by IA3PR10MB8372.namprd10.prod.outlook.com (2603:10b6:208:575::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 5 Mar
 2026 19:49:28 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:510:23d:cafe::df) by PH7PR10CA0019.outlook.office365.com
 (2603:10b6:510:23d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 19:49:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Thu, 5 Mar 2026 19:49:27 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:49:27 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:49:27 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:49:27 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625JnR1m1989466;
	Thu, 5 Mar 2026 13:49:27 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0F71B136F37; Thu,  5 Mar 2026 13:49:27 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
Subject: Re: [meta-arago][master][PATCH v3 0/4]Migrate GP AI Stacks
Date: Thu, 5 Mar 2026 13:49:27 -0600
Message-ID: <20260305194927.2830380-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260305193125.2045659-1-p-deshmukh@ti.com>
References: <20260305193125.2045659-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|IA3PR10MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c4c301e-8a5f-4196-407e-08de7af04fa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|34020700016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	HlSbXaXMaxjluHWGni98YEdxBn0r50yLoeFx8jUEQrSL1un3qWGLn7fxEA7hGx3cE4tBUQWUVvSeiRrYSI/n7tDa/Vm38zmviEuJKTl53oPEYi+ws+M8JLv17l90QcUFIP4wNaRAuN/GofiNaHh5JTFDdo9w/z3Lx+atmiekaPBxz5TE86zYmiYX3B0kLzkREnN86zX0T/rSqovwYhSghQ/74TWJNlTln/oS9cuOg3Uuwmm0Fdq8g6RKs07ekw/xC3U4gy/hX+myxHXDdRW986Fb56UooiDZXW0P80oI4cH/jHxuw6kG7kbD7Oi+t3YBlEQFV8SiIomZ0XgwvSQpLyRG7cfdhJATYd4D2DUBgzUKOKYC177fmm9pnjHUzbDL+3xW2dredkNVJ9jl/BEtXh4RpfXT1xGvkbctmdXy3aQil9LhN6dt57G5HxD/JxI6vrH30FJCDnnJZAcHs/5WF2kLzCQjoNi73Axtuyy12X/mVh4kDLqyw/AJP5WH8JhttfHAG5cuA8CGWfA/OzOFoCxYpYMgZJnEDRG4eiuDawBGJsCccGdM3GkosC2WBc4T3yphfsJtDRv00MhfRsbVd01oe6bt1RiGSykTrD/1/jih5H3R95UBhWGbID9MUWxbzD8GrH5rx6KiFcn6EalC/I4duxa+cQG6WmQameF4aHCqZXdQex20bviP+HhWi1F4cr5tLfjldaLfh8e4EzZyXoZG1ci08kC0jZokzvwIGrCnmpv/a6P9ONBaGuA6JLNSF/bxvJnl88ADbQHCag24ow==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(34020700016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	h6/cxA6pwPoqWShDuRzN3pIuuVQMb3ptEyhefkQlKxJQjrdn847uL7wfdJaAZ0G9X55HVWN5KBFuNqd6NC4zb4Q8t2LV9kCEnPziAPZm1qmo1RwiPODDzdGHWJCRrv2OJ8vB3EMPJragexCz9NW5+h8Z/lMcI7+dODstfPIKzkF3tvll9s95B/05FfnWZ2AAoDfI8mSCXBJvJwmGs9ehD67iGkrWmWgUAUTcpM3pzx7t9kgMIRIYWUNOEYVSIyvRB1mwaeRdgijI1/3rchC5tlYeKnSIK8duhQYjT8LBhXY31EA5u+8cZhVdo1u0zQXqt2Sj2qW/IfGQR8NFdSTQ0nD32IWPzIsxC1iW1DTUz0Zi31TUtsRtQ6iB3ZvMAsnlTciVe4nebEaRieYAoQPzTzRTWMd+FxkcYkXM5+GhXbCRAypp6cm5QWmS6q0CFXPO
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:49:27.8723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4c301e-8a5f-4196-407e-08de7af04fa2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8372
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 19:49:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17265

meta-arago / na / 20260305193125.2045659-1-p-deshmukh

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
- Patch Series: [meta-arago][master][PATCH v3 0/4]Migrate GP AI Stacks
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Fri, 6 Mar 2026 01:01:21 +0530
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: 7a14ff08b69a63fa89d2efd1794bcb8b6=
07edb89

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-test: Add iproute2-bridge
- Commit SHA: 538a04f7f91be5e391fe5613f298d6689ac3a2c0

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




