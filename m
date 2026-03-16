Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EC3F53D6D
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 16:50:19 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55566.1773679814639124686
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 09:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=AMNB0XHw;
 spf=pass (domain: list.ti.com, ip: 52.101.56.28, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyIXw2+FqwdnroIL0fvEBqNQskQ1fPBuHm8A3fzIUcVjsXH+aNSeOwcXaS4SPIMP4/hw0Uu6iL23DsTVQLzVEZXyy8t5SqTY+1SpZX/xMRwnCOg6VAC5Ej30iJ8EC/7Jhyf+ta1n/73v0tsFoC1Ew0JuxyYUfAjQ/svluQtuBGEKc23c+o2TvRL95ktRlImaTkywiAgisjYM0CrLan4ao8Ylmh5F2C6fwMf9KmmNjIbCTAQ7mHN7e83OerJW1OhOe8OVwyDyzZkAVNJNeXQphihyCY1blERy5/izgGDGOopZJpOg7vK4EPAPkVeN23T/Kp3xjYUeFXyld3go+z3q4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fANJ7WH4p1pyZNUUhlVL/o3rS74+xyJxJkP+zWZv9s=;
 b=Q+1c9FqxHf5GfwfIWxc5eeIwuuntLopRYUk0dKyHSgh+jq5GL0BTT6EnapDf+PDgzAD13twJIpBWJ30HJ/mZpfOKTN9yTsV99JXVVSvsHN4vDGPIzRhe7vopBtgzS+ON/e0ZoSKH5CxIAj2OFBs5bP9XM71/dMIJ/PhDLZguaBOmLhX/+uLQHukP8tIMPRWUGtg7aRvuXq2uRQPM8o/nwpKlcJnRaPSBQga47mTwr2FcZ6X1avyEH2cyNU1cKh79CSZ1MLkGckGi8mxivdMAWPwpaMGPYSUp5pBBPUNoO6nOsm9VcU4EvjDX08YHN0g9CGqYMyvbCMjbYmMaTg9+pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fANJ7WH4p1pyZNUUhlVL/o3rS74+xyJxJkP+zWZv9s=;
 b=AMNB0XHw/64+ccTNgavcE5y3Y3NeDauSpK+JJWkuPLVOYoQxaNAC4W2i+YX9Sqdu+S/M/KK4S4iIh6YeVp4poCGKgXb3DtsivfPUCjDxJ74eXYZicHKjbmZ+HHU8daRNIpnFGAbho+zMRGFG+y/NXYa3QhNvWi/uhRtr+sqSamuoUvSjz7KNZOFs579W7GweZYSpcn6ZCHLsrox+6q3pAYb1bTRSxFudTw87CZ83je2WCvSmZioRhdudSo1fq+AuddModJsqNnBjUJdGQMh876av5bs1ved/3r6xhQ47NbMxPnSuGX6Aqmlqvwi3d1P1ha3TQ3u2f9OkCKuc/aqQyw==
Received: from BL1P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::15)
 by SA1PR10MB7594.namprd10.prod.outlook.com (2603:10b6:806:38b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Mon, 16 Mar
 2026 16:50:10 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::f0) by BL1P222CA0010.outlook.office365.com
 (2603:10b6:208:2c7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 16:49:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 16:50:10 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 11:50:07 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 11:50:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 11:50:06 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62GGo65c1143969;
	Mon, 16 Mar 2026 11:50:06 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C46819ACF4; Mon, 16 Mar 2026 11:50:06 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v3] flutter-wayland-client: patch build to include cstdint header file
Date: Mon, 16 Mar 2026 11:50:06 -0500
Message-ID: <20260316165006.1323653-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260316162516.22885-1-a-christidis@ti.com>
References: <20260316162516.22885-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|SA1PR10MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: cf88b70f-a593-4805-4860-08de837c1648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	9cQfdbJPdTdr8Qewq/my+apES0zghyWnYvuVt5+wKMOS+i8U99UbFm174OJvMmAdSQ5QiCbVyPRwvdm6/VlkhrrHgcNPK1vooXLEP35+4RmVJBauUZWssiDl8cdDem+xFTQ+MIOzQ8El9D3kQLZ+nd2NIkHJcYGWUdrc3Wb7jdpSxAM6fGDdMIQ4FZ2bZpgPU7kN/Lwk8tmuY1JbqFaFJvpdN4LJhg/vgv0fE+//+FZsY6FMJJQUx4P5YdJGFpgkdLX843L6eRjbo9+vmOpWMUXMZhpCeKp1b46ISWwZU1uolrWbi4ztXJMMFgC8dOKm+VomfOL+q3Xye2IKeE2+aXP40HuBz4TrGhlAg5TtpDQkOYTAwURAyQNdg2kHO4B9QvQsmhuzIOLwjhVZN6YGjvTq2EnP9HMVQJYc6nadQFzk4QUdZOjhFdaImOp7KWTwucn2/ipQhJkMxc3k8TB7z9EX0fY/pEne0V1sVJFWMMzA72FF3vmX2DVI6ovnh8cKnkzuY/8uTTXAv9g+dvihKIWQL1FdQNyhB7wCGmNpIZcoArR3O94/OwoaNihY62V5Wgv4d6+UhnCJMAjIKsrwoMAKgl8gBNlYwbpYFhAcTZC74kp/IHDFM5KlTe8dHO4NsCfGGwEr2wdwOIgUJsCHw97rOa3OZOjw9VJ3NikXsFWfgbF8I9GZvqE9QqsVJ9RjX+YpE1w/CxdF/2vEr3j6KM+mHRswvF24LPgm6EiATDJDkzzA+YSSFy0osX+0yis2bNgdUszKOhotXTdjoX3g7Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qDBlIqCTN3UTu4RV7bil8kuOHikCayHsDh7ypieDnL2Tn313d/Po8POWrHv3FWrxjGlPVdv+op8iSlxx+WNqe6dZGTh8L+vaoTmuiplOIBIOBT8/MP8hNM8Q2cYqPr4tmdyMdOmiAK1fBeDTATzEBFzLgIuanI0t62Eu1J+raQLiVO3IBDi/Dqo6ppSCI1ZTrEyVuiDijT4Y8WuJxeEZLxYhl/lNEBOrEOmbHQej7ov2/UDZILVWL2ObBinsvac0LP5Z+lRFMfJUhL42XrOSsruGMXhbx5KeLdI4/6P5PnyttshDldoFNKhWDi1YglG1ZCZ+9Ny9e8BUgFclILvFh7grJwA+EIbyzPzywct0LDNv4EGW3L2KyPdoYmNcybL5Q7v7tYuxcgpGiXit3RjxqUAqOqa3tsepqqeZNMX9gPkRYOVUetubFbsg8FOuMTVr
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 16:50:10.5090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf88b70f-a593-4805-4860-08de837c1648
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7594
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Mar 2026 16:50:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17354

meta-arago / na / 20260316162516.22885-1-a-christidis

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
- Patch Series: [meta-arago][master][PATCH v3] flutter-wayland-client: patc=
h build to include cstdint header file
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
+From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Mon, 16 Mar 2026 11:25:16 -0500
+Date: Tue, 10 Mar 2026 11:01:28 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 07956f91e4590347f6daef34f23a21658=
b6adf03

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202603091800
- Commit SHA: 27f3d88f1cbc33e107604da7df01340b8a67620f

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
ERROR: Nothing RPROVIDES 'weston-init' (but <build-dir>/sources/meta-arago/=
meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics.bb=
 RDEPENDS on or otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
ERROR: Nothing RPROVIDES 'weston-dev' (but <build-dir>/sources/meta-arago/m=
eta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics-sdk=
-target.bb RDEPENDS on or otherwise requires it)




