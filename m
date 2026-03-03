Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070E4EC142F
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 11:04:58 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15763.1772535897166353401
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 03:04:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=SAmgTHw8;
 spf=pass (domain: list.ti.com, ip: 40.93.198.63, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=st27aJqCiVbvU4haVXWRuaQSqd5SwRJMHyfq4Mr+RFuh6p7iEuPMkRiIDN4pwku86JiWux9hwBvW3lXm+uB67PvP3AKqh7c3coaZOlp7AyAMPYwxTZQ9Wn+f0vL8dSUeCOCyGk99BX4VCQ0KJspdBZs5eH/P51zFsaJDYevsgbg7n0tU0zfhZ4aZUQbMNDJwtZp4M3/mkLx5foF9mVCGW5f6bI5N0caNQcjTZqq1Qt/iPsV8zpo2E+pmY3BKNXimNimU/+f8aEyBtC+dlZtAbblqhdiXvAwNUkUuVgCd5J2sw3rmInCumfLW+YvOptp4KrX7cxmWg6/O804Wd0YOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyA14IQqqg0tXgv5dxL3meen98974oqQZPW+ST0WNko=;
 b=eqIy6S0vYRmuJh4MRrrHUPuVyRRXffO5iFB2CKzB4TAB/z5wIeAOlXFhcYUqQHKTlfV5q1XxHO3uOImLF1DOgbL4ywmlluae3zQmEzVsWp/UZUpLOs+Ykf24ZqmdAp3LmwvF0lRKQ9ZIPWrggM7eh+C1KlYn2WgdFDYUdiSNZNKrdhr5z4r+UeCiYZYtMKBI1orNLGRFMBufZaCjGg1HZLhWCVAe2rrRIP7x71Knj/4FyeO5Vz+TJmdHMP4oSAkCDMqE8eyGNwbUVCBfAlGy5LDglOWhdxJo8s6zDuANVuE2vtHceXZZYIKd7aqZsCZYzPmb8NR2JbZDsFI2GneLLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyA14IQqqg0tXgv5dxL3meen98974oqQZPW+ST0WNko=;
 b=SAmgTHw8w6Tp1suocPv2SNxB0JvIMR8SLedlc8JxlAYCm9XCHlcXXk3DIpjmsE1nPAlkilZr6hpKiR2sDkTc7NdjHe1W5X9eqJnehGHm5KBQvdcT7dtPS4XbltCoteaRiNxuwpSqHw47uNDyprXFQYVyJERqLiGJ89YFn5m7I6dsRyXvBEXfLt8yXTGo+/pYF8dFh2wL85mpl3YbGET6ZTXqOMvoUrLM9zb8tLpGFc6CN1CdH2temR0JtfV8QddPfDs5ImgS8ZoPLlw5dPKYyTXGlEZW14BgiSWTMn60at8wsU0H1u/P/+EZeNapUqzZ5oucNu+1laf6NSE3hQ/qbQ==
Received: from BYAPR11CA0106.namprd11.prod.outlook.com (2603:10b6:a03:f4::47)
 by CO6PR10MB5792.namprd10.prod.outlook.com (2603:10b6:303:14d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 11:04:54 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::7b) by BYAPR11CA0106.outlook.office365.com
 (2603:10b6:a03:f4::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Tue,
 3 Mar 2026 11:04:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 11:04:54 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 05:04:53 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 05:04:53 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 05:04:53 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623B4rvc3501659;
	Tue, 3 Mar 2026 05:04:53 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 0899518565D; Tue,  3 Mar 2026 05:04:53 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <a-limaye@ti.com>,
	<gehariprasath@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
	<vigneshr@ti.com>
Subject: Re: [PATCH] tisdk-uenv: Add instructions to load initramfs while booting linux
Date: Tue, 3 Mar 2026 05:04:53 -0600
Message-ID: <20260303110453.1914993-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260303104930.889956-1-m-shah@ti.com>
References: <20260303104930.889956-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|CO6PR10MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: f8dfd4d8-ba94-4b72-ba71-08de7914b309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	D2Y8VfqH8G/p3ckXBz9XHN3A8gazze5fMf6KOjeCARSo1NW57NrlKN4RelBZC+6t/2MOW8QQMpeC+ciNgBDAm8fdC+Y9EsIxtQl5CmAWuKvezIW0WIaA/6TP8Un6XWBUOHQpBW7+hKjDHsl7a5IkOMPZwknD0RrRA2JRkb87VDNCzwrYuI3yeMJ6d/zrOwFvNZd3wgN+hZIALdcW5rKinvdcguWRvuVEl276bKUPowfgQi1RukMyspNxAZ91BKDEMADv2lmVnr/Wxku71ok67hDS7sfx0jvSnKOjydmBc27zV/pNmF3/gS7vThx/c3NqfzB9YM+zmTLTlDrT80NnjmrZVQ5H0ABnosM5l85kTNHmd8mIsq+zXkoDTPgB6QpnNaGV+oPKjH763yVf1oW5jybdsquq51UUyvi5WyXwrjjq6lUdR6Oy8ff8glY7lBqpV2x5hWCVsl3620ygMi6Tih/hD6IgFKm/KUCYgJ0flwqTtI20b9SBGos4oyhVFF1lezRZ8bUS6nw9qIqe8em6l1S9qjVhrtV391ghEuWGM6vbyEd7JJJ6O14S+l9oA+XySRioH8fliYfLFpLIqlRW9sxvNPe3YOcKKIc35Iq2uGkoBFaSUT5DRz3iYNNsiSYxZGFp5O8naXVfjcjl6kFOigQ2AncFFnk1Xwjbfg/VZdvTFfCNp0oNV1os8GxMEUV3lLV0pHkP+i5FTbT3kCDKTMMUfPgap0bVzT3i5Hf7LPjpTEs/9SRxLL91PUogm7CRg+3cqS2mrdRR/uicT96//xbApoDf0HGGUvQFkeM3IcumARy352Nq6npz1bPEuTHB16jWpu6nrCWM88YmZXAkMQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0fuX9xvojeEvwu3ymd2vdjQmilPTckZjzKXHgqj88EgT10hqFgpF5eXUvHPqbc18nNpPGZnsJxPAVknMxsh7ZX+/lwUu/sDuKi5NiyzCeaDR4nJggBZvlLwAD/GchkRrFYCQqXWzVIN3T5oDqCZj6FdejfOTDncGPTmMrMzyRInrJ6SrWKiSU2DCs5h+HwavK78kYueXx6QoXXq6MMJjbbV6LOw2ww24gkQZY+p6wVAjbg7Rqu3HU6yP5d2Vy1BNSUM/bYQ4o8xdPQyl1nxhygxKy3OfVAypR3urQV+xAyz0vg1rBE/Wx18w0vreBZ8fi+G219CuXlMGzIn2zUwGik8jMguT7GSDJHkcBtHIMQz+QtkJoZxm/B4t0tS0ugrGM5+zK6vQKCbHFEJxzlGVpHhxEcVYeak1xQR1CBj85eG4RMWzNuxAUCtt31L4NRuE
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 11:04:54.1879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8dfd4d8-ba94-4b72-ba71-08de7914b309
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5792
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 11:04:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17192

meta-arago / na / 20260303104930.889956-1-m-shah

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
WARN - [PATCH] tisdk-uenv: Add instructions to load initramfs while booting=
 linux
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:69
            Subject: [PATCH] tisdk-uenv: Add instructions to load initramfs=
 while booting linux
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [PATCH] tisdk-uenv: Add instructions to load initramfs whil=
e booting linux
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Tue, 3 Mar 2026 16:19:30 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bfd42e0a50f352920681956519d89bed7=
057492c

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




