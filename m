Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8CEFF8850
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 22:55:13 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1679.1777071303401782995
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 15:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=g7fRakNu;
 spf=pass (domain: list.ti.com, ip: 40.93.195.15, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jnzhm6v1333Fnip2VILtQ0v2BaJ83ZL5UvvVyLigYlGVAwrTQdRP86bTCZU64L4Dz2Qhi7hTwv42e1RYje90kgPfUiPL2Qy7rYv68Alv6T+Sj35krihCHTK2cscJFZpcixWlHu4LcswjxbpszGNMoRWMPtkZvhhr+DysyfF1jNzFxz7HXL4++12cerb2KyS+orbsCIPG3L6OAGnGynHyZxCvR1ZPlpzYx15zq1ka/xImZ4qXW2iBunTznk7KllRRGgtrTY0GV2R5wOdjLCAaaPKaqK2XUgHIi3+MBzWDo/iftVM5wSOCLGRUluz05K+K3RK1E+UEBvKXFQcs2l8PBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcmnB+D8t5gx2BUmLwDFYsW+SyAXRDDnHNxjMfApjXg=;
 b=eXe1wfx1ecMaxrDeyov9w3g5Qv5VI64H1UuR0nEUni3Gfqvas9Z+usNHDo7W66bgzlqM7dL13olj8yiMogs9LliDPliEO49+QL+iSS7pfUMmgJLy/8oIPz9/WdeXka/uVSHOKUdg6J5iJKfLzGyqTw30Vi7jW4ZOY6VxEAopeZWXTuY4SqJ1uPHY9sjy1cW4KqWDdtRy+6GU6Wtjdub1cNhfN/9pgU2aL/5e4xFGD2bpGCNLtYupdl3WpkrpX73oiBjdwpzBU/44jbvUOlmO3C9+QPxn3phv3ZHPV2vVu0/97kE+lVUUkg1UW6VXDBdBHd3LuR6FKm6aPYHl5WZ+gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcmnB+D8t5gx2BUmLwDFYsW+SyAXRDDnHNxjMfApjXg=;
 b=g7fRakNu0sMJ/OIUd/GHPD6pzxPZqTOFqU5sf+171kXTBMSX5SaipeLqBGi5AAKeaSA9IDRzCFNox7WWUHze9X3hru9eiqJVPCDdd7AC1h7M+yml+JoB8bYlVxW71qm3W2P6FY0B9QI8KFtTYo19ohBNV0lnV+kg5a4tONwCvVwxOkE0Mqpc0HDSaY28+/33qR4nskNLD7OTVjWJTTlzEvoUAAjy3SakZMdD91eQE3eyCeN12WF28Nu1BwCtDmS2GkrYgmlQrhkKgrxH/SVkazbF6jme9IpaJ7jjo7Eutn+lSD1xBE9xf2YGf+QfQoS3q4vO8f1UBAXefFwci6wxIw==
Received: from BY1P220CA0042.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::17)
 by DM4PR10MB6255.namprd10.prod.outlook.com (2603:10b6:8:8e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Fri, 24 Apr
 2026 22:55:00 +0000
Received: from MWH0EPF000C6186.namprd02.prod.outlook.com
 (2603:10b6:a03:59e:cafe::dd) by BY1P220CA0042.outlook.office365.com
 (2603:10b6:a03:59e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.23 via Frontend Transport; Fri,
 24 Apr 2026 22:54:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C6186.mail.protection.outlook.com (10.167.249.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 22:54:58 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Apr
 2026 17:54:57 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Apr
 2026 17:54:57 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Apr 2026 17:54:57 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63OMsvGH2278588;
	Fri, 24 Apr 2026 17:54:57 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 916779ACF4; Fri, 24 Apr 2026 17:54:57 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <rs@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <s-sadik@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCHv2] qtbase: remove serial event 0 handling
Date: Fri, 24 Apr 2026 17:54:57 -0500
Message-ID: <20260424225457.2810747-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260424223749.2643202-2-rs@ti.com>
References: <20260424223749.2643202-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6186:EE_|DM4PR10MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 9823bd65-9c1a-42dc-47d6-08dea2548297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	y/26gjEyFbPrTll7uwqTHzAz7E7Qf5m/G12vdRsumUiXanzdaJPgirra0fyXzK7baHA2+wvdfnnZZaG3CQ9wr5LmDbDUSjWZ/Q0dosARDMeon8agejZqUrkNUEWU2fnLufZDNHqFPYlHdLB6mmBCvn9KRysGSnZYmf1VGIkEodPrtRPeyo4g5cDohNgcTMa/TRU8hY2u8OQVEbY5fBjjdIRQ3aXf6XhaV5cqlMiPrmPQ9L0EQpymUoxGKlo011Vh13HM/4yrVZm0Yb4yQxhQonJuGc0/zAiXHpSNWQ8mu7nAquMj/AAObsOaud1BTK9zKMR2L1aNC1FiSDfyGXq6lL3WCSXQYID1ika+0E6sl35URUcM0W6w5bx89Lb3quEIVZHLE2CoN+wnTLl05pRxVlhhx1u11fBX62RiNDc6Ab2BlT8jY7LUHRQb8tbCq6PC8fEkuUTUWNIzmGJ+TpU7dc0mIoFJbTdzMKGKueA90DjlXPPGDdV7cLk5SX1Q+CKHXXdYOKc1kS4n69NxFJ5wH4RkqO/862kHv+B+tXNzJTN1rJfZeUq02N9P4LXOLO9N66GR7Kcv4cHsPPQusubHzwo+reYN1EepsJg3YndvP+g06QLLeIDrW407nRb5n7hlpGtXnfsv9D6+p/gB280Bd0c4+KlInQsV+4/e5AEc+AnFY7+WAn6a0KvwP+DSpbWuEsIRjo58N1y8OUrFTov2KU+Vu22/f9tpcP0KdSJ7D/kzJmM1+LnC+VV2G9mEydpo5i5RD41Pkz21UuV0BbWgCQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Nb94MU79MKtgSae6ffftB7tLrxcdC153Q5/F1yqHT/UezivPvyOV26pxNmmdtiNLn2NbhhnWCADTQYRcoNCO5eEobXTI/Z5W+O+wPEkcOSQK9rSk3qodRK2pFdvMvkcsVdYtip13tYRfmHW2OyaQDbyjYY+N3r/dRYocQ9iJjXMwiN8nV2mk4Sa6wN6jB/NF94pgjJ6Xh0s9Gn+/xDrMHH3NQwTPs2iiGqpRbsr9Tg5ufot/tIYcs/Bthsvu0rdphuIsTTcVufJbYxpvzyk6lo3hWn8IzINJ8mctP2mCYyqXBrIywarwIf+9y+bl7iFBgF/lGcU44YRnNcfbVBZBasD5aJGMYcARzLHH7lPTSzVuuX5WR5UQ6IwUQiiMrhvNIqKS+KsKmSJ8oEDtyqGgIgTUNTfr9MjFIc6u9R3Hn4gvOOP63eJsZoIC8bpegv4j
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 22:54:58.3753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9823bd65-9c1a-42dc-47d6-08dea2548297
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6255
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 24 Apr 2026 22:55:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17490

meta-arago / na / 20260424223749.2643202-2-rs

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
- Patch Series: [meta-arago][master][PATCHv2] qtbase: remove serial event 0=
 handling
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
+From: Randolph Sapp <rs@ti.com>
- Date: Date: Fri, 24 Apr 2026 17:37:50 -0500
+Date: Fri, 24 Apr 2026 15:14:26 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1a4cda07c6ffd8e28770263becb9a7496=
5e83ec8

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Pratham Deshmukh <p-deshmukh@ti.com>
- Commit Subject: tensorflow-lite: Fix file packaging for headers and symli=
nks
- Commit SHA: 480b57f06af61bc5ba01af73fc6d94463124e318

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
ERROR: ExpansionError during parsing <build-dir>/sources/oe-core/meta/recip=
es-bsp/barebox/barebox-tools.bb




