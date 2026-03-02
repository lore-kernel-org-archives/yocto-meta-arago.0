Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C2AE9B365
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 10:54:54 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157820.1772448884118268599
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 02:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ST+CStmJ;
 spf=pass (domain: list.ti.com, ip: 40.107.209.35, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WioXtK/dkUUERhYjm3EP2MQ/DZAM/KCkIHDBJr/sqw1YHm9ZUciTan91bM2qQ5E7dYVEw2eDPTQL3pGndOwZVVh99eH0jt0WNy0MvgDKrwmsGJdQko2tm3+QYTlaHbWBK6qSuRMF3UkVaEy3plnaVg2bKvKWIERzVpzPGW7V4BDoT8xfKnJ07Xr9dliANT6Z2VDEA/Ufcl9kFRzjUQHceOb+8WQreSusPGQqw0KETzVAUH/sjKCEA4WUW3KZXETQzd33hnGodiADqmgXlLKWlu/7FLmk+6Loy39/AFxWMPaJ3Ll4lyVkiLK2MEMT8maKM/ssV8FP/CQDDvE7npoiaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOnkxWMlRR1CIwqtbymQWViVpV9/W0EGJTY3Jz6vPqg=;
 b=DHbg60TzM/2cAJHWoz2Pzvwjwnb/f3GIafcGqxOrUack+rmeW47XuJ4fPwmXqwhdKC0Me8WBJAyM/Pl+A8mW1xBl1h6Ns1iCRdM+T+HHjWjzsI63Z0sAM8C+mpeWU64czP/uvjrFTWjWGmqG1/4aZoZk7+83jen9czpxtwCV0wOU79Y+9Ans3FS8Sp26g/G6CePIM+xdbp2iCNG0UHp2Gps59yFiZHs/25976LTA+Tll2rweiHzXd83Y6yV/Fq6qp7/8/yj4GdtcV824S3kxMmyrn58Jjo8xKWXRHy6uEcIqilGGPPpRnYNEC83cG815IbhjQV1uZAQGdPKvC3wvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOnkxWMlRR1CIwqtbymQWViVpV9/W0EGJTY3Jz6vPqg=;
 b=ST+CStmJs7JxwAJ+YEgq8xFUJIEowaIwxzKs0C2eAzbIWGtZX/LQe0bkpRr38eRq7CTsT+q4fwFUmRLcEren6R2Eaq7coLOzW7ZAzkNMy5LRq+XL3NRqXZHVN1/nPpYLT6eUvVkaGeDVlc1gmJWrUc8bQUiZjzXHDg0X+E4qLdaOtzQgUe8wTVGPHdGc+0tAYMBiZE0sZnyhh+zI3DZHKLMq0mdYUjR9PPo98nJM+YUVmFzcxpR+z21iQBH7BMe795Nct10wYhAsGEv8bx+oC26U4gp+V3AOgJxmT0EOF8KZQY6cgaXWS+bQB1jOFp2a7byg0b5cgII8BGOiwE5wGA==
Received: from IA1P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::7)
 by PH0PR10MB4630.namprd10.prod.outlook.com (2603:10b6:510:33::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 10:54:41 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:208:464:cafe::5e) by IA1P220CA0023.outlook.office365.com
 (2603:10b6:208:464::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 10:54:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 10:54:40 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 04:54:40 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 04:54:39 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 04:54:40 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622Asdon155717;
	Mon, 2 Mar 2026 04:54:39 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CB8202A54; Mon,  2 Mar 2026 04:54:39 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<denys@konsulko.com>, <c-shilwant@ti.com>
Subject: Re: [meta-arago][master][PATCH v2] linuxptp: Add support for HSR in Linux ptp
Date: Mon, 2 Mar 2026 04:54:39 -0600
Message-ID: <20260302105439.1683814-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260302103515.848554-1-danishanwar@ti.com>
References: <20260302103515.848554-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|PH0PR10MB4630:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc6d602-afe2-4f52-ba40-08de784a1ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|34020700016|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	ceIkQjjp3qxIJmZ5I49Usli9Nzr84GSw0kguYXpLc7LU3prQOTOnx0g0iQ3BrEQ6eF3zU8lTUMR2iWP7YDguexwWKmEewMBaOTVJtpY03rit1iaZw5O6GMQGGOqaQSKq0AQ0Uh3LKwjTloXYWI2O8IHQDE460+DESDiDo371NpHLa247bSgI2gDAglNjGTqm7PKLWDvrx+peuKcaop2BVsQKCvuV8WdtfpzPxs6yKaM2KSfXO6p+rGrvd5eWtbQ2an/qSjwBZaRUukub+BSMZVbiAxajc2e2msXzyrAqsRGjqhQRv9RkWcLzZsYablV1AiR4odjwcrqxVX8e+BM/mgCqgBhsZUGQlZbZLk42VeiZtxfRMRyvMzssIjvADYjW5rHxTJ1cvM5yb/vvDwYQU00HzAGkRE2NV3+XE6Alu9z4MPGuHolO9dAKgHZ+CIkRy3kS1dRXP5OXrC8fNBtgqFbm7NGUR7GSS3cRY4gDFEL25r6G8D+4kc1ZEMuwX1Qa7Z4YFsiIhZpoAeHjAmJyL+JW0shxzMtvnfXlEQ053ENPfbXAu8IZdn+SQPWuBHK1yC+Hl+0DUTr2E31+yYdnkGMDoe1YhI7q7gqTTAm/Nuqbgr326QaAZ0RhehcfGM6R5tImrKM4wAebcyTYHLCd8uArb7qvZx/+QzNVNR6M9/kZ7GEfxCTxuVSCsYKGV/YwcJKfXA+okxh1iplNoRxpzFMuy4d8YFKFswvQiuOh8rssovE9ko1LKcCAQY67pxsWE8E6+vBtiPmirWw3p3qeKYCobHx/aP4tL8DdypIIUUSqmm374GT/kUKBQM6yj6OScf/3oRRily9DUGp1hGul8w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MreWZOBfzYcDqD9JxkkRVwFWBAvNcGCcH8pjhY1txOPIXoJFPruaRSMi9kbwrYBuumO5UeYz7TylqHNtXbR38Vvgz9Oc7rS2ZgJCiWYod291jIg7Y6Q+m033zduTW002HQYgSqq7fjn1KfT7tUUvf8NB0BAwL2JGAJ8iIvE/+35WBCyMJr0xH5gULawoWfCf7exbuxmQR/Y2k0aw60bq9ZcAFMC/KjJIdJtb1cS18efAHS0nsud0ro96mPIJfH3sPrIQHPal3qIhiJfYVM8dAkkDiMjyS9vCN32bTlH106ROGS0iL2K9vCAxp8zpy4dbQZ86unWdox1//S9i/v8P2DbddKa/wTVwB8fV2Ru5ceu490xvj6eVJbQyXW788cjQcVeg4oaEGF56CxUIbX+YxewSlgn2vnwVxrCc3kHOL5ufYXKkEUY+CaQAugPoP9U4
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 10:54:40.5749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc6d602-afe2-4f52-ba40-08de784a1ade
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4630
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Mar 2026 10:54:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17168

meta-arago / na / 20260302103515.848554-1-danishanwar

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
- Patch Series: [meta-arago][master][PATCH v2] linuxptp: Add support for HS=
R in Linux ptp
- Submitter: From: MD Danish Anwar <danishanwar@ti.com>
+From: Cliff Spradlin <cspradlin@google.com>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: MD Danish Anwar <danishanwar@ti.com>
- Date: Date: Mon, 2 Mar 2026 16:05:15 +0530
+Date: Thu, 2 Oct 2025 18:37:54 -0700
+Date: Thu, 18 Sep 2025 12:58:52 +0200
+Date: Thu, 2 Oct 2025 10:09:32 +0200
+Date: Wed, 22 Oct 2025 15:32:22 +0200
+Date: Thu, 2 Oct 2025 10:34:10 +0200
+Date: Thu, 2 Oct 2025 10:37:06 +0200
+Date: Thu, 2 Oct 2025 10:39:45 +0200
+Date: Thu, 2 Oct 2025 10:45:44 +0200
+Date: Thu, 2 Oct 2025 10:46:17 +0200
+Date: Thu, 2 Oct 2025 13:01:53 +0200
+Date: Wed, 22 Oct 2025 15:42:28 +0200
+Date: Thu, 2 Oct 2025 11:51:53 +0200
+Date: Wed, 18 Feb 2026 15:45:27 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2da2006bb575f585ec44628cdd5c4cbba=
8cbd80b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
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




