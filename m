Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA175F44863
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 13:08:32 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155698.1775826509394295630
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 06:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=GDzmWCgm;
 spf=pass (domain: list.ti.com, ip: 40.93.196.29, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCbOsX/SrNyJXRwKf/R/L7+hg0oC1mAuHjUg8RiJulbb9ZtQTho//3jmRtaqlCgQQqdzZUTzc6RZH9vJVEoc5Uy3lDnyCnB7QbVj1P596AHCDVrZyOeRhmtcmcX/KtqJmSyyFbDtEukt0hs/KYzYRdfgGFWfPSZfzrekBIx5X+XutElsqV+B+gKbQpKNF40MwDpg4v8M4p9oyKNRuTJUZRPlk26Zox0jZfAgbr6xGWE2rytRbhlEhb1l3024DPR1jxQR0gGc/YVqUmt5Z4CU0gTiYV7OI4Ks1Do5qK7QpPz09CDZW4wofSdMYRwvZCMP6KKs4+Paq6FhFtSEOQbNYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcEe72sO9dAEWmVM0xDA1HT+UWaOiesxN8BaaaLoSgU=;
 b=ySFIaVJJ9LvtbpygxqjduZ2RAkIy6ys2OOXRbOF08vJm+2FcvN6xZVjbMn+T2vaJEYqL75Bqd/skqijs4dJewm3AjdNxrMv/2iWUYXJQkUlUZOCIi+JFhttu8vMa2FmR16Ep7Gzno7MiyVq4YxAZohqYsLp0wfO3SnUFyvht7y+HJbhD5KjUMgUGRGcyL/U40WBECSViG32binkfcGC926OLo2GoXjIvLao3OVtyvBXSLQ6WI25YdWblFyNwbkTNQiAtGehb27zz21zWGq1ZsKNt5TqOFWtJ3tKfVun/zjNFcXmaD0v6sHyEQvcRNrR2ogrWDl6tFx2PQt+dNVV54g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcEe72sO9dAEWmVM0xDA1HT+UWaOiesxN8BaaaLoSgU=;
 b=GDzmWCgm351W3S58A1AmXId7ihFKx/3KLhPYpgvyAQF7FTHHbnLkohissMgqNgdYvCiT7/oDsX27qthJ8L+nQ02p2H2FtxfY7nGahaK/MNAWYrCht/hxdGR4sp+xOavTZiNQjtZC4PFeUdoPBH3sYbYv0PlCjrPdj/Ev6Sy0aYyt5a7FVVZSPTyMPewaHXlei7Qj9P3xJ7sLX0q64dVzrXBLNMTCXye81bCDucq4trsfMN8y5kiJOb8ojzrwjIcz3nfjpnY6Iqktm+f6lJrvWaZKJZCQ5ktppUnIP9rGf4H2uZ3INNXTG2wySS4RHTAa6ejxJmOHM8wTJg3DQZrokA==
Received: from DM6PR18CA0032.namprd18.prod.outlook.com (2603:10b6:5:15b::45)
 by SJ2PR10MB7785.namprd10.prod.outlook.com (2603:10b6:a03:56b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 13:08:26 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:5:15b:cafe::78) by DM6PR18CA0032.outlook.office365.com
 (2603:10b6:5:15b::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Fri,
 10 Apr 2026 13:08:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.0 via Frontend Transport; Fri, 10 Apr 2026 13:08:26 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 08:08:20 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 08:08:20 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Apr 2026 08:08:20 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63AD8KIK3241977;
	Fri, 10 Apr 2026 08:08:20 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 5D5479ACF4; Fri, 10 Apr 2026 08:08:20 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: Upgrade from 1.26 to 1.28
Date: Fri, 10 Apr 2026 08:08:20 -0500
Message-ID: <20260410130820.2766945-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260410124117.1847885-1-reatmon@ti.com>
References: <20260410124117.1847885-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|SJ2PR10MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bd1667d-5fd1-4bf4-44a6-08de970240c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	hTUDv2bJ8fE0uIYzDPKWfJnXmZ46Cg7jcVkltnca1xu8ZUxc0yE8OvPBACagbQ7fNCPz4DPGDBbHSiP0kJJ5wNYT+MGWsHkhBZ/kpTmqUsWCmwBHdmxdfGHTr6nFy5To2uQyBwDHPeHKVd93Bb0OSe1Jsxamir4iCv5VrkwapXH88iL1sIOZZr5zgiJWCKn0M3CkKZGVwo7olVWryQcP9tGiyEv4lWvhgcX895bxv8NzkROpsJgbXzNHtgG+HCb/lXICm3CLS57SlQcKsimu30NmZCDmpFKvUNCyiz3z9mXv1f7RXWn9OVBatQ6Yyrk6zTP0F4WfhJLyQ0TrfxFHrj7Pmc8cYrXFS3vGbmFGFMOIUa9+V2YzXMPr/aHzgR1CQSM7UkgqBlGWmD2WpwFVs5cw72Gt4iIPPRp0mqv+PQnxmpGM9TYzgcDta95j3TfyvDPtkE5z9C3hM8YeY0EbwEepBEHdH2+W1ayWo4n7HB9sXX6USO17JOZTRq1TtQfpozrH4ibBhvp3r3xlgif2lgiwsTOOjZGLCUzSEkmOddd9nI2sdVO29JtWU0Luszxi+hx+M5k6yXnDXVzabZvPjqmln2adAnxdvMQKIGhtqHcuoIAqEaD/7ZRn+ZcSj8cBd2+0dIyTbbJRlp1ldVz5qRz5DZeKw+kd8pOQnp6D4H4SJlfLhM5kvRXKLYP71ux2OKARLUpWEePHxY+lh4AtLa+0sa1usWHJ+y1mDsKcTjG6fhKvhP5qLObzLx565Q9HGsYrJOAuPlWjgq6omJo8sw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	nrwdXw1SC5ABEUs/Bt2+8lD78owuAJBRJTskWBodzgBVzNnzXPIfBJsZ1D35oncnkNIVBwy5AJItMHkaWfgxs9XJt10uKV0QWd6ZIbEEDC7Ugmm3/31c3TfwI/YOi5D6o2Rjn463iMW/fow5fB4ZrhPkJjeCbLai0ZWE3qLmcuGq9yv8hNL1oom2J7lvevVHkYzrjj3PLld+ryuAtPdAMZvvRN60O7PMddypFqRMgX505xHWjeUi2CrSoBFATjK59dCwIprsudQULu1AL3tuVVgNiPDrjmqsXFTVnrZU2EY9Ojau/K+8MICR9eQRaZS8DMfC6Rt9NOO5Ex40AWCzZSs21C4mJbNigySBZwfquRMzFcSSxRRhiXhwvF32AJ+O6667jEDJASELYxal9tKiTR/qBuMBBTD5/9v7Z4pNjCXFa7AVtPC/oZRait1bFcWd
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 13:08:26.4712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd1667d-5fd1-4bf4-44a6-08de970240c6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7785
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 10 Apr 2026 13:08:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17463

meta-arago / na / 20260410124117.1847885-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: Upgr=
ade from 1.26 to 1.28
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 10 Apr 2026 07:41:17 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a349641f71af545828b7f6d18fa166b9f=
824d2fe

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: mesa-demos: Flip to a bbappend
- Commit SHA: bb4c958d05baacb1002163ed922196637d19f691

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




