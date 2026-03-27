Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD48410AB83C
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 01:17:48 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63823.1774574258293363781
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 18:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=xWlq72nN;
 spf=pass (domain: list.ti.com, ip: 52.101.46.9, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXcFbbO5AH1I9JMMGcKypziOyUcxnC5Pd0wROQmbIIVt9wK0YUCxUkEQmBlO3YEaMu9rQ3CiNEOTbrvdqo7poP1srjf3088jRyuv7kUshC9jbeN2HSTOVveyt1u3+yc6oZvSWFqRIj/KZRwusOCBzySpgpoJliv0iQjN5vbFYXkKLjmTwqgtgoOnD4GMJ25cXTm4YF/44IrSiGWeFBWC2GKmWJMkbdLZYwFEgUWexqpeOGzm+oPgNUvNWAlkMQW7NXJUX6jtHQIUVBMdXQSOXCFOSlEfaNgoncos53bwv2YmbTITD5IkqlIcGMzkvVJO2/8695sQEg87hrNITENk0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ra3B60kBBOlBJT9P0V0UWAONi7SG+ojBx0X75e1vAAo=;
 b=QgTz0ogEGMYffbS1vAjbE8IaS2J9L3m50x0fxpN2ozElrQLl8l4OPeiMNqQ805Ak5ulxg9/PJDecH+BuO6IChewtIVqeVUxfASzzyR610Qip4esBYp/mFepFpsn7qQBuwz9d950XMq/dUEsYCv5PQYw3KVF/M7MJ8157/jmoLvzBfXyiOaNp0IfRNk56QHJLFnACriUxZm5Tx2vLtbj78tv+QsFJwzYjC1wGJNk4vbH6muC7vkF5/v6Qwvs957MCDqnRWKKvchmQ/42F6fixQYG3IpQ/mdGeMUatdyn7X1DZ2/JBZSBSDmGlyE6peDEwfqHZskyq/Sw0iyxbxqQHFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ra3B60kBBOlBJT9P0V0UWAONi7SG+ojBx0X75e1vAAo=;
 b=xWlq72nNQqMNgnvSLfG7qd7kym5q6GpaitdsaRIVLiQIJ+K4oqAqhQSXqR/aapKbml5cRPKgfNO8dQLRh3AZ/HdE99J9yPvXx2R0NRVqYJNAmjp1rHab34fd1Glzh5i+xGk2NLDNesIzp/hpaYwS+pqBo0mlsfkDclxnXf1qYYi6AUG1+BV69NZxRWQHWkM5cs9L+dkB3+vo43rHWaf29I0XJEKVvQ/5+DxtBRcouQy2+AWbGmoawK0EQ9/MnqAHyMRFXVV7wLh18UBitE3cHxxY7rX79Z7Nbse2vpYddFdZ8pKmGWjbrJA4SnjoAxB+Jqqbma31P4fFoCnzwXNWTQ==
Received: from BL1PR13CA0016.namprd13.prod.outlook.com (2603:10b6:208:256::21)
 by CH3PR10MB7573.namprd10.prod.outlook.com (2603:10b6:610:178::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Fri, 27 Mar
 2026 01:17:34 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::d9) by BL1PR13CA0016.outlook.office365.com
 (2603:10b6:208:256::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Fri,
 27 Mar 2026 01:17:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 01:17:33 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 20:17:33 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 20:17:33 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 20:17:33 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62R1HXH54172226;
	Thu, 26 Mar 2026 20:17:33 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1DEDF9ACF4; Thu, 26 Mar 2026 20:17:33 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202603261656
Date: Thu, 26 Mar 2026 20:17:33 -0500
Message-ID: <20260327011733.2988189-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260327004905.3892552-1-lcpdbld@list.ti.com>
References: <20260327004905.3892552-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|CH3PR10MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: f137524a-d994-42a1-3e6f-08de8b9ea017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	uD1/aCCNzUOI9lv+iQnejp0udE7gH0yDwefPqWbvaFYWYhhN2T2NpntU++XZRmHKNFcy7TS26x6+hjMAxpWPeCCDdk7pDRrdHqLvlfYsQAnPLQl5LXpnsRhKBs/Yhj7pYzl1iCssX3fIlBcw/hg6TAwGOaY4Ci9pobBDA/nqhlKjYFKJq33oOv502lj2xfr0JJmX9q0dmTonLBjgPOVpzdA7ZW7hRqH7IoKNkQbJQZpIzU3mmSYQftZhqCymU8yLs0l1qKDqxEx2WGjZe/yF7ncP4FldIrePsxbhlHxFIM4CaGrCqaWh9xVnlTYDsy/4Um1P1Ln8saaC5lghM4+DxfApPtQuitPiOK/HPWOpCVHsPIcgoWg+ANipKgGh9XCAXaZUE2uTqy9iAiESg4GUPUUI5cSd7eYIRCr0ZqEYYdTOz2n/G9ABGMdshtgfZ3PoQGsJKdw2KSBRBYONn3cdRVTF6qGqVpP1XB/G11peG+yz4wJoWCNbIvihtWclPHXhlZ7EenqKmEmuMTF0+Xu5bulQDTHa9cwjftjorEKR/WXC/eSEDahOVBvei+RVD6fcaev/nIbZ+3x04PqyDkjyONrBHxLfpiYoZWxJmYTLxvHVuuAGSBmmykPaUo3P1UPJA75jI4a8+c6KuZPBlCGhGxoQC/iqwG2OeByIA6S2Tnxj2QZMcSJZplejwx/QGtWJZolMphATdFaT9X7dELc/Y9my6j2gqHFlL5UQsAAa0/ykJSaWPfh3FliHD9tBBEvOIWxihxJwLVe7QI4LW/cJ8w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	T2sIy+Rt728RNatxT00ZCWrL5+aTsa7gHAvGqBGH3oN5QRVJZF3SQrlFmC0imOgCUIr/qACT69QzI5Tyb6ju5i/BEbiyoNF3bbURkeSR7NEO/n7cjFyZyAlHunqjz54SrVWDKzQRcF+q0q33Brrd83FRpwzdizq8KLP3xxvolAHw5+eU9EP8vg6reiM0RvZ/zftwKx6z3mhIyZHEFORO7+6kCKyVr/1cwKPINuDpom3xJRmkM04YTXYIa1agaxoTvjZ2WHsZdLtgsm+0L1T95e3YMuwVZsf2cx7xK6IYgtUXO3yGmbXfsbNEPHKTYBZMF6t2D+6b3F2cfP7gC+6eUtF75efbrBuaEPoQNK0RMVRnmQ12WD1yppyTqptcwmln8Az9m3KDHkP4FsSCDoq1MZOeN1sicKnUwG5xlwj5oJsiEY0lk7IhPKn60pQKxDiu
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 01:17:33.8987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f137524a-d994-42a1-3e6f-08de8b9ea017
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7573
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 27 Mar 2026 01:17:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17453

meta-arago / na / 20260327004905.3892552-1-lcpdbld

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
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.=
202603261656
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 26 Mar 2026 19:49:05 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c28c01853bb02bf0e3cea9dd5e9f7cfb8=
2e5af2f

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: mesa-demos: Flip to a bbappend
- Commit SHA: 709638666ac6799340d26efe8752362560c452a2

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




