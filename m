Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16007D43367
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 02:15:21 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3690.1765505714160328826
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 18:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=lnQRgWfc;
 spf=pass (domain: list.ti.com, ip: 40.93.194.16, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSZpDQ1JyEA4RF8P8IYAObwv5znOijIfYFGK1b6TnUHvZUAYNm+H6vQMz5gBB/QmkX9dXcb7/B5hQJXPVpSTALrE7hwzHTqasX1BLEdBZ6qbx3pG1zjNGr456Z9Wc8R6eJBJXUeVVw34eh55ZU24CBrWujsiCrM7g6jd9aovFipUf3l195Pj4+TRbe1jNATGSrf813tDOYfc57MsuWjKDeg0DZh65dlYKHPW7uitbf7SFWlFOd+JQ6jW/7yobia7Lpzmu0sM5gzFua07Xuf7T8FLkoXmKMo2/9DhG/u1tA6EjxAgGkwNsXRf9Fr0SYNEdOJhnkCXYCx/NSTMePJP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFcInjEq22zPbQpi+ETYYB7VQB6JBXOTADXOn7wUs7I=;
 b=V2ZYLNYpgfUTiqweHjzvu5468T9kqesEGJfJQsyvXnU3CbKBsfFcDBWrzU9I+Cn+T+aQ3v8eIfm3xDjSsgHI4kFXW3w3trWQINevZEDKunJlNDcVF3vduvpSMYKtcEdp0AgoyKaJ51BD1STZRKsqcM1vvXza4tWRFg/7GGubxQawTGzi66Ev3a58gdkjnteUXojkb6ZJDieT0pMoLWd7BXWN3KfNEicqQrckGYtjbrkjuxljiyVFdENC4np8Z5oLt/8yuplxBZiMJouFqPiacRBKUNQ8lEFKT0dfE0DEKkXgWL0V66Ub0dpDOh1coQxjyIsNACYTDyapOvkLCald7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFcInjEq22zPbQpi+ETYYB7VQB6JBXOTADXOn7wUs7I=;
 b=lnQRgWfcAdWwIjfBjXhnEdPn3Uqmp5DhazaPFluHFl6jHxjwMjmk41p6vNrxYqhBAVFyD5Td1u4yer0KIYnKfLc5QgeL1Xi5eJhOfXDk0Lrv268axBpFlTyvfqG4vPd5/72W9EfaH+2BFrz4KrN44TanDOJgtkH9HX0s0JuOn5q7BukrDPSHESAxk/xIAZyHWFuGOYG3xsC1/s7YFBoNUqOk+bDUUg84PHBai0mnjJ4QgUoURCLOdTYTl98/TgNokwuJzfUIJQ2xRlFQ65bAQkVJdARqkuucDK4sR9aRGznIBU8CjtMWCLK71H/37RGgLjyn2azzexPklEf4LyF28Q==
Received: from BY3PR05CA0002.namprd05.prod.outlook.com (2603:10b6:a03:254::7)
 by SJ2PR10MB7560.namprd10.prod.outlook.com (2603:10b6:a03:537::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 02:15:11 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::c8) by BY3PR05CA0002.outlook.office365.com
 (2603:10b6:a03:254::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Fri,
 12 Dec 2025 02:15:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 12 Dec 2025 02:15:07 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 20:15:03 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 20:15:02 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 20:15:02 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BC2F2S71436705;
	Thu, 11 Dec 2025 20:15:02 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D2589138B5A; Thu, 11 Dec 2025 20:15:02 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202512111451
Date: Thu, 11 Dec 2025 20:15:02 -0600
Message-ID: <20251212021502.1395357-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251212015238.1862940-1-lcpdbld@list.ti.com>
References: <20251212015238.1862940-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|SJ2PR10MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e017f12-0afe-4f85-4212-08de3924454d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rEu1zQDndgEp0EIUKXZXUMl6mzi5oFDsienrG43WGRXq/tmFPfqRkBxYtes9?=
 =?us-ascii?Q?tn8RyZ/w8TOoMS8k3bnrxVUpsd1NCT7KAQTibFDU5sNdLYSCIxlBtLa3T0ao?=
 =?us-ascii?Q?uv0zbjPBifU4sQc1iTuA2qYGXNjAxc0kjDiPuEKp1NJEhFlnNgWk+f21iF3P?=
 =?us-ascii?Q?i5Q7fRtLWOlBI3Oaq/iM/dhzl7Pk7bJNmxn6tXxnTal54XzcE7J+zYqZuNvl?=
 =?us-ascii?Q?Zu9BZV3rmRRE6Soq+XDm5/bHjBYdueNm7nxMOisZUR7veZ7fIkUV/z+n9bGN?=
 =?us-ascii?Q?Hao0Fl3rJOcBD7+6HdhkgXs0fAjP2vYMP/mTNlljvbd5b9ok08UOxl5sPLa8?=
 =?us-ascii?Q?s1rwQ0qpo2nftGBjAYbOtoyd8SqaOuoT6dzv660Nl4r1798jQwGsxz/vem/t?=
 =?us-ascii?Q?gpEQrKOP5XZnpc7uRMftqvPlBeEC0VZ6pd6FQsKw17OHmDoeHA7eE9d3DkYS?=
 =?us-ascii?Q?5tiT8g+D4Al3GBzVMdSHpoJFm/8LVlNVo/fiJn2Rsf5wGUgUxgedYGjmeyLx?=
 =?us-ascii?Q?tqF7xGu5GgXlM9N328elUKBUuo7vGdaXEHMyt3pTzzT8GmLwUCUZfD72Pd1i?=
 =?us-ascii?Q?wH88AFp5aVddrOXgJZSIT9aIaiaxYGLiqvjeaEXgQp+cNeuZYWCvKK7K4Fe0?=
 =?us-ascii?Q?ZuumC+7WJUJYgwlSgD6e6Xl6VIXpOyMbBG3D0lx4w6JuPk/D/CtK2UjKYl7y?=
 =?us-ascii?Q?yaoL8Ee6p3oFl3YYiSiXu86pSLbbX5gXEAv11mPZXcqOm0aQYNkPzynfCXcJ?=
 =?us-ascii?Q?VzjPmLdyZVp70eW3OWyWugj1ahALswqcDDKtRiptZ8XCCA5GoCZACMpl3qBy?=
 =?us-ascii?Q?4GEJ/TWIMCYoqrUTSoIOIhZlFDbwDrFyRhniA4goe52iWZnGXxWCym4ZOKtY?=
 =?us-ascii?Q?zlQ+Qpyc5kOkrpYU4uaB3KV30U/VYnl4YUHqHUejZ52Trxi2JSzuaXjMB1PE?=
 =?us-ascii?Q?wXXIyuDF2g4iM/q7l/i2qjOiTlYY4B5GTa3qjzm0InMPUmjUWoRtEalHcr2X?=
 =?us-ascii?Q?ZXZ5hAU6UOS1rkYEwFSmxJtlgW0XO9KPdeD/UyhQ2yixMGtoAXb/eP/9j5T/?=
 =?us-ascii?Q?83rya0+liMhX7Fq/oxsyp3G46KqEMY2JiVCxe0LuLm4CN93+2tRugze/4DF8?=
 =?us-ascii?Q?O3WdwX8BXgo8NnSjYUofMRMrsQrwAy8D1XDU2i5qlFYjz/VxOSgdvNVgggan?=
 =?us-ascii?Q?Gn5XIEcRmhr+Mci8wt41oactOz2u+NjI29RMjCy3/y3SVbKZ1l4YSIm/uGrQ?=
 =?us-ascii?Q?/7rKN66XSWMpOksVmc7zG6Lli4CD0V1jm+bkf4ehtWMqSesKCFh+grlWhmJV?=
 =?us-ascii?Q?D0q7Vf0t2sxW50s0ZihQDl45NyUw0X5Blfjx9shP/WGZJ+Z+xUjU2ziOXe/d?=
 =?us-ascii?Q?9R1CzcetejRdpdHlu5gBYkWII6XNSNmniS91sU+c7on49/t3jdrQcJyHxrs0?=
 =?us-ascii?Q?N/cyhf998h1xzygDHLJhpGoxzy3iSaTy5Q51ChUwx7D9dyBIGdE0zvXLid2T?=
 =?us-ascii?Q?Y/6gzMf3C2vX8MPLzoWa5rdaObe59V5e6m3jY7Ylor25kjyOrAgLWgxMTt4V?=
 =?us-ascii?Q?vUic2VLoKE51+vGJ2GM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 02:15:07.6212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e017f12-0afe-4f85-4212-08de3924454d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7560
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 12 Dec 2025 02:15:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16890

meta-arago / na / 20251212015238.1862940-1-lcpdbld

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scar=
thgap.202512111451
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 11 Dec 2025 19:52:38 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c7f2d74aa1b19a7786f31826b7fa09b8e=
28bae0f

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: stb: Update false version v2.31 -> v2.30
- Commit SHA: e1526b26afc7c68b65c57fcc7b0981b7e6638ab0

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




