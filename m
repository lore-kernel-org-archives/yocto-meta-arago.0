Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE4BF3C251
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:19:26 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14003.1773062364037189042
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 06:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=D2tu1mYc;
 spf=pass (domain: list.ti.com, ip: 52.101.48.44, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sshhwDIssZS3FZyLEFGbXmksGQ7br3gFFa/FQoGaa3j4o/wZ/8SqSsgfVPwCvwTU7jovXdRe3vVGF88GmuM5PO74J2jMTWOJJjey0Eyl7mlSUUyDiOlgrwwix8+Ut/oZsc6n5Wb20E6tA66j7Qwp4LC8fDymKn/4fa84wXoAp3tF9gHi6bjOoMNrnKvmYfJ/j7RZxQaqy46bZyefb1VsyTt3BGFrtH0F5C95eIy+mdv2UAIK+ohPk7lzxYvFG904HHGuSnan/kxxpTHTb3wafw8YhoEjWKGRTOkEzAd8P9/KEHgb3TZU5JYE1GRBQFvf+C+rZRheWTZTEnmdXoQ5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQFugOC8qGn1uCAEvtJASsI5hMXzLkieaVwLgwWz/m8=;
 b=F+EX8Rjk+9l1sOtEII7lzmmE5626UAAPFl3zGvQe5UJUDixEHYPYwkNY7D6ZcSuv/ObDz+RZrQNT30dN8DQGLq2sXrkJjbt4AGcw7Mb+5XzzH6u+mNV6vOGJwnSI8ClvMFtcsTnHGC+46UYqNSKqkpw1GEWtFvE/QS1o4s9KHkg5KPGPofIq62LrW5KzLvCi2Newk0/oT8VAokAb/a9H4oGMDbAPTqgiF1cUtab9akM8WjEd2XE8VOY86NeK46p8YSonm4v4iXVhA+XWGgjsLBS3l0JKXdHX+RQCvJhtDCS3eeMEJd02NGrn9cThZfvKvPMkU4mtx2ZgO71pQ2wtLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQFugOC8qGn1uCAEvtJASsI5hMXzLkieaVwLgwWz/m8=;
 b=D2tu1mYcwztmwAwdnWSwdrEO51Ghc/J02nVHVCN/xTCsFK+V1SdHa7m25ZdEdTqVQijikKKLKEx24fYThNnPTYmT3cImJdFgbzYkFBi2gV5GjACDS6/QIXNza2ybRV3X9ShnL06bB+uiTTAtOKXk+JbzCn+frUU/x6QQx6yz0l4E42mog5BAx+6hvJcb9xoOQAMmgJkOECN1dbYcAH0FZ5fGfnDIPSEygYW5W9dfj+NIgM4HUZMvkNDKUXuGqGAW8zvzAPrkm9rSSCatDXgwqapD3xs9bGtkwUIuwq+y2xzQsZ8DyMjryy5ALRgwxcd07Bc8WJ6cyCryRGNZcXSJfg==
Received: from BYAPR02CA0036.namprd02.prod.outlook.com (2603:10b6:a02:ee::49)
 by DM6PR10MB4170.namprd10.prod.outlook.com (2603:10b6:5:213::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 13:19:21 +0000
Received: from MW1PEPF0001615D.namprd21.prod.outlook.com
 (2603:10b6:a02:ee:cafe::61) by BYAPR02CA0036.outlook.office365.com
 (2603:10b6:a02:ee::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 13:19:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW1PEPF0001615D.mail.protection.outlook.com (10.167.249.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Mon, 9 Mar 2026 13:19:20 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 08:19:19 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 08:19:18 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 08:19:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629DJIk12216644;
	Mon, 9 Mar 2026 08:19:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CB9E19ACF4; Mon,  9 Mar 2026 08:19:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Aksh Garg <a-garg7@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<denys@konsulko.com>, <c-shilwant@ti.com>, <s-vadapalli@ti.com>,
	<danishanwar@ti.com>
Subject: Re: [meta-arago][master][PATCH 0/2] Update PCIe Endpoint Testing Application
Date: Mon, 9 Mar 2026 08:19:18 -0500
Message-ID: <20260309131918.375407-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260309130109.52886-1-a-garg7@ti.com>
References: <20260309130109.52886-1-a-garg7@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615D:EE_|DM6PR10MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: c649a4da-0ddc-47f1-802c-08de7dde7979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026;
X-Microsoft-Antispam-Message-Info: 
	WmUE1o4RHqv/JZ/B0GbEELMfxdxpH+90dberF/AWtOUQCJzv9NJhNRoP/ciwAUqeffpnzJ23pke6mo9s+bYHrvXGEHBZ1DfESZsqP1zqbPZUUeu3dp5Hrlxh4Hf3/0ERh0kWVwlq0LPMtJmaVKisCF/yrUzsv7QkL/kJI+KUqIhreQZKB+PkEMSW5LX4SM4TN/Mtryz0VD64MXhdkJVozx5Of0UNkSMyFOkc8aR0naGcGkMqckBrJ/lSUTb8sL4Kb+asBO60Nt5iwoCtNvhUif9pAfk959B4NKE+mOyP/mP1ThaT9maBWWGIgSzOeh/tFw97ZyRvB/IrGpFu4ZHTXG5RfoFMqMEq7ai2JWvisQ3sqUuBQ3PttCwRIRNaDu6N4A/3v7MwJHEIrVDEeHZ+m1F+TxIDRxMweTBfsQsDABGKSTRdpoz8VJnS/WGRWjPU+JG0OAKLmG41TuuMxnNVtvE+XuoptAAuJOTJfvyII5KJWppDzXJZyakVLRC98cvD9vFw1z8Sw7XUvvoER6qvm9wLB7H2lB+CCT9P4OJ/n0sTa2z8PBpZJZPhDD57IRml5TMNBWqL14Sq5NB5IESSPFB763+h5h+X0uB8D3B34qr4gxZ1B4TezvTiArStAdiReWUD0eHO1121twOeQZu2qRkfCPtorzUfMhNPAjHAf6fP7oWtniRM1j1koLvFbsPmQ9yEIs6wO6xRL6TN9Hs+ySS239tPaxjtaJZb8g6dzhHjZBRyViyYG4IpZHS79TUS+8SllWn1ekZoktCBZ0+hPA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HdX84jn/ao1rldMiY1xRWi6MvDQwLiIYkB6gic6RVJfdc3MvJl9JHVI1eb846Qx4uF/A/K20WQEEa5+DJuAtC39gKL5rERkVm62rGTUaG5OKPH9KS6YArhnJ9nmsbZUXZnrHGYFVrclzzc7xK8Mjv+b3lpmaYtzBkbG0Anr/Pmo8qgZSj51Zluqj0pu0vkGcmuOBTrRKq6Veg9iJOKTNuYYTKDMQ//eb7LZufKl0ByGBjeD/n3LJ2Dvt9Mt5HfRoJOvigqYeK8lnS80y/ejs5rTwPYH0bzd4m+gcBowYw00sAOn88Fs1Q5KmG5E/Xk4x9sX6RYHT77chlB/rKKNn/5IqSGkmVP8ENQYZWdnAv243JFhcxkpn2sIkaYmNZjYynV2XsUtiJA88AgHrW0aE5YU+66Oxf7MAfZPAOwlnNHozyyGYrVf6oYFxy2biLDLR
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 13:19:20.5993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c649a4da-0ddc-47f1-802c-08de7dde7979
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF0001615D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4170
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 13:19:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17293

meta-arago / na / 20260309130109.52886-1-a-garg7

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
- Patch Series: [meta-arago][master][PATCH 0/2] Update PCIe Endpoint Testin=
g Application
- Submitter: From: Aksh Garg <a-garg7@ti.com>
- Date: Date: Mon, 9 Mar 2026 18:31:07 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 7b3917d7bf2552e1128bc2aa6a82d782d=
01aa4f8

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




