Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7539CD4F26
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 23:16:13 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11768.1762989366526808567
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 15:16:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Fp62TRg1;
 spf=pass (domain: list.ti.com, ip: 40.93.194.21, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6C2LmO4Dxc+Jyh4ObdnYYPA6CrO1+T4ksrjhiOyBDH94FSP4nmbO0oCMa6GPDfpKCadc5DmwFUOnCCJXtQA47uv8dHE17fqdaF7zbb/YJ7tMT3fbGlva2ntXANNR3z62OM6R6khlNWh8OC4ZbfjJ7KkSDbmf7kZLUxjN/V98f/8SFPuZAnk/Pt53skm7H8agTepnFpYAyRRTccazlfTdzvFqFz7g3QoBVKJ9/rAXAOktzD8AQzG8KEUxrXDHMulXbk/8NqFj/QwGCpdC51u9bAzNEjBzMrrCNw5TS/Iw5mRy/8QT6M00lh3OPAo1MBN1A+MNYKdFnQJcmH4pqGcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7yKOzrrxwnlI2Z1VT4lToiQwgTfaoiOCiB+JoDmjEw=;
 b=nH0DMosCKLrVnI4Ftei4iKHGnPZyO9C8dqMuZ2LgsFbtV2oQhEUqvUUsKo+jVqLHkfQQwI5Fr/BFiU92J49knsXgoe+8DXLZsJaQRv0NZDcFDzbP9yBXLPen/Pf07kA6Py/m6uRc9HUEPhHIl29lyVXF2vQVXtpR9h7FC8YzhteF8Bj2cipDEtk/R6LzRCyrSGZLuNj90hk/MXk9bTn5MZBPzbeD499oRf05LZFGJrgEzT3SEAacyJ+kPFLjehqBJhl+6r2wZNvv0NS/pPCtKLW+E7eBVhyOZspJAjrPam3l2P/Q5yRd9D1t1rNj4HI9AakGsDAk5+M2e3zSI+GSwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7yKOzrrxwnlI2Z1VT4lToiQwgTfaoiOCiB+JoDmjEw=;
 b=Fp62TRg1OGoDcvFbT36sjjzy9luRtmzV5U08cv3BqqO2JCXDXpGcp3oUvLSkYIIDmltTM4UAKcqaUJp1qRdxuFbwNFGXL835gWupvQVoYRXX2WD4AluAnbpRvPyh80pw9zZ6PDxi1WZx+etbEWVtvHQrA+EZwNlXB0gVQJ4NL1qqkyxKRJFSxAKyaJ/FVHFRoqBf9w2Nfw+FJy86vSLhhJ3XbeKH3FrOhqJ94jVgjR8d3apO6g8epiz3UUAxGD3+AH4JFF14y9CkVZ8jGFOBy4Rgfy2RPiviO9f0bpstJaFuxU6yxc99mG8eflTIhy/HmkgFSU6eYgaqCnjrec+hNA==
Received: from CH2PR07CA0028.namprd07.prod.outlook.com (2603:10b6:610:20::41)
 by IA1PR10MB7198.namprd10.prod.outlook.com (2603:10b6:208:3f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 23:16:03 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::ce) by CH2PR07CA0028.outlook.office365.com
 (2603:10b6:610:20::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 23:16:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 23:16:01 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 17:16:01 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 17:16:00 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 17:16:00 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACNG0pG3455909;
	Wed, 12 Nov 2025 17:16:00 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DA00D9ACF4; Wed, 12 Nov 2025 17:16:00 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] libdrm: remove any rogue specific overrides
Date: Wed, 12 Nov 2025 17:16:00 -0600
Message-ID: <20251112231600.1476151-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251112230956.191245-1-rs@ti.com>
References: <20251112230956.191245-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|IA1PR10MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: d1482653-115d-4cf3-55f2-08de2241723d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?d8QuHFGlqkwTWOo0x1Ir0yNsrcbZjLiGO02dLRMSO+YG44ZHNGnbgSn1M4QC?=
 =?us-ascii?Q?hO9Y6UL7gNfcwlHWSanwOuH5MhyWbTlLA13VdXcbk2WjOKGfUvcLDrFGlFTA?=
 =?us-ascii?Q?N2ci7stGByIKPv/lICH99ZAqJhXAu8FCWjfejYdbZpRldq7Ou6LYk4Cw5QvE?=
 =?us-ascii?Q?q1brzRXQgyuf8YvCSf/ICh7KEFdmRcAIjeLUa5YttHqbPKw7+439huiav8Y6?=
 =?us-ascii?Q?uVHcvcF/F6lG/81pX57W2+TeSeGe421R8dTfCI5GUOJLyAwzdFrV7OtukxGF?=
 =?us-ascii?Q?iTdZCgN9/+ToqFG4nS6BG7Bkc+9hRHfi+E5sM+wNgNKHLCpNMYEZZ/TM+oYm?=
 =?us-ascii?Q?g01RxBoik6oybDCgWJUkILPMaG5vNJo2xosIYvBKyAjZqBCEOTjgxu3tCrJs?=
 =?us-ascii?Q?p8NwMwoPWA3emwRQaLcWEV5FgaFJPHF1lytb/XTyTv/1vhqv5c9a9uceule8?=
 =?us-ascii?Q?JaXjkVAp44lJFg1B/q5tA9XgKuL0tQD9myV4WWKsoyAowgTdR0GOR7T7KIvu?=
 =?us-ascii?Q?BI6pdkh4+DCJfq1o+s8trAQRqRoLg8euQRmaMFQ/miSxdetYCJWt43eG2MtG?=
 =?us-ascii?Q?eWwYBAUgJtOKpo6h8YQ/TLQ3Vr1l0VsgoEixSeSlTLWPgdlAhLpOQDuqNaVu?=
 =?us-ascii?Q?xf/20jp+3u4PC1NRmavzwljwh9rgXv9IRmmgeMdurw2DOwOZM6AzyDFaTkx6?=
 =?us-ascii?Q?jbuuwj+5URhn/ft/jgXLIHq6w3fFOMxz34tOaRmAJzurXAyEHLwlZbTM7z0e?=
 =?us-ascii?Q?RZg1u0UbggVrXPDDKNa6fgMsXZjWZgDLwc/t2JPQrVCzdvraEi9QTF6DRoRQ?=
 =?us-ascii?Q?Ev8CbZnOs23zrNBtanPzKIP4SpxQEYVX7XRX2rCbjHrR+hwIbwrPJyQJzDzx?=
 =?us-ascii?Q?+gWTpjXZI8hdVom3/V2nRb89Vj8k3FPwPnNhafPqYP42a40JonQRD17WHVbo?=
 =?us-ascii?Q?IvpdTk+goNkn2FnS2Wua6HfMtr9Ivp4js+gwNTOJa+VcfZrnI+WTO016l/et?=
 =?us-ascii?Q?6FrEMyhUxk4bZLN+Luza9iICiFAgWlJyi0gpcx1x/kWgUPWdMLPlnYPgkdWi?=
 =?us-ascii?Q?Ux8+jtBqBdGkLAAFBdYjJDDq82SmB6J15Rzmn3SZTj5o0WIsbdf0H2WjNuc3?=
 =?us-ascii?Q?LrgDi0xGnO5VsSTaYogazc3chtsfjMDnaSPkscpwgyevL5FBvFRq9Q948hdq?=
 =?us-ascii?Q?2VCk+9AqySXgHjn97rrdYblF/KUqBIzalB3lNJOCgbQYu4wVcuDba3aT20o3?=
 =?us-ascii?Q?7PD7hI7Opn+lqrz2MjuUY/l++Pe7xTxcCG0qIi7AbHH4InkHREh7N24u4x97?=
 =?us-ascii?Q?U1i6xEqYhCPt4E1qKImS56defAYi2J0ckuYKqyFCcMI0yV5/bx5To5nU8muj?=
 =?us-ascii?Q?oGNWiFbJZJ/1FAi80aWFcXiH6X4Xej1dbFtQXpoxYT/SonLrmM3JuQgcgmQm?=
 =?us-ascii?Q?NQLT/90SZu9viit8/L2+iuk89DKKa03LaBNKDLO2Mgy8SKIROmmP/C2jfD5s?=
 =?us-ascii?Q?DxAFDYDJ1RwXmP/gHNqg9Yc1AcAds5V5LDX3scVs/1T759nRUt1FTlcv0PPZ?=
 =?us-ascii?Q?b1RwGv9wJbpTLfP0TnY=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 23:16:01.7113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1482653-115d-4cf3-55f2-08de2241723d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7198
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Nov 2025 23:16:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16753

meta-arago / na / 20251112230956.191245-1-rs

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
- Patch Series: [meta-arago][master][PATCH] libdrm: remove any rogue specif=
ic overrides
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
-From: Brendan King <Brendan.King@imgtec.com>
-From: Brendan King <Brendan.King@imgtec.com>
- Date: Date: Wed, 12 Nov 2025 17:09:56 -0600
-Date: Tue, 13 Jun 2017 15:52:44 +0100
-Date: Thu, 24 Aug 2017 13:28:38 +0100
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a7bd32da13c097ca6630c162f1cdaffe4=
036d969

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: syslog-ng: Remove this recipe
- Commit SHA: dc9880094f431f05b8de3c876b56466f3bc8e98f

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




