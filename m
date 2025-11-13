Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5FDDCD98FD
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 22:56:04 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5708.1763074559419434515
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 14:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=CkSeNNWw;
 spf=pass (domain: list.ti.com, ip: 40.93.194.36, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFsD3mQge2kBfYoK7TWf5uodpyVu0dQTEpFB9xtSzK52fnxi5uO1DYoEgIgTdNKSbppedCY/pxZHKOB2BLqTs/4ACkzrAHucLJ1IMwo/yM7cmO3+Q/RDU9xB9XJeyaRedGTOFDgaIIgeXJ5NicSl0fFSQNc2kL9lDNtYbw8ikzp4wRL9kE0/pXlCLD7T4N4CizyKfhjESqdqQIeNKpV4dGJsQt0qJnkvns7KbSzzecoDRx+u0xaHjQpCz6XzPMFBSDyDocCWCXWzv380sjgwQM5e8wG7Un0G/i2ApysPTxmwLTmzOU9Quie9Tl3bIuiz2LNnyVs3MIG248AiQXKzIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdP9Epl4WsQWzDtofrZoVeOB8hxewwGCLrCVT49sqB8=;
 b=rjKCJ4dR+hr7IyNhIvHP3d7HSSLwuIx915onFi2ygsOr7/OpRKvRZOFdyOYxolX5qHPzRdowieLpcTixgAN1sxBjDmhwb5Es/0FiLxbW0Cskj9q4F+x6VpIv2FVero72hEELvAajVgQRBeqqiTBR4fbbKwuS0D/PCUiyk42f0SevkYST5UYnU6NjceSNSAEXEvMfOnkFEenTeSzpwrfKc2xsdytJsZZohke8Nw2myoggh+gWijHo+l1QCX4dm62S3OKZfNEQzaBTo8/+xJnU0CqDWQWXWNKUF36OC72NdTuBvfAmyLIuz52vxJTU3gKNDQJOcgVUut7djJ0dnUw7oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdP9Epl4WsQWzDtofrZoVeOB8hxewwGCLrCVT49sqB8=;
 b=CkSeNNWwzuNjZUMME+57aI7cfs0xcu6KKof8RmgC9gEdYJQpfloeltZ/kgMb8GPidbrc/X7nbjZUadgyHI71W+FLQRSyKwdzqWIevMSZ1OK/YIlnC9wvfpI8DQcW/qN5VldQEde+yaOU4UTIbGuEBzz7bTkgNIXGIjRNR3+PaS63TfKkp6e1TkyGUrPuHWb25utmEtEiGpL0lMDUvcPPSbx2RAGTUdeR2vXrR+ZSxxHmdBPPg58uediuewSSpqZ1XBo1GCQs61NbMKVaSpuPLPDPpsh6zuDqhRui7iKEDKDzv70q3c5iV4iJxqVW0hNftl4VtW4vcPPBhnMLyVeqgA==
Received: from BL6PEPF00013E0D.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:11) by IA4PR10MB8542.namprd10.prod.outlook.com
 (2603:10b6:208:567::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 22:55:55 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2a01:111:f403:f901::7) by BL6PEPF00013E0D.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 22:55:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 22:55:55 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:55:50 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:55:50 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 16:55:50 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADMtoYJ1023246;
	Thu, 13 Nov 2025 16:55:50 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 014502A4E; Thu, 13 Nov 2025 16:55:49 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH 01/10] offscreendemo: Add REQUIRED_DISTRO_FEATURES
Date: Thu, 13 Nov 2025 16:55:49 -0600
Message-ID: <20251113225549.1708035-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251113225017.22994-1-reatmon@ti.com>
References: <20251113225017.22994-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|IA4PR10MB8542:EE_
X-MS-Office365-Filtering-Correlation-Id: 9110fa0b-53e6-40b6-6dde-08de2307cdd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1RA8JA7ZUhGtegz/Lt1mUYsJbg09nk5MgB3/uYDPGyo/rBzBmlAhsu8Gd0oX?=
 =?us-ascii?Q?ry4yhLUcqJgbJtOeQWYBqxEdDkY6UtWN4spmr9uraIPOIbkbz7mbEjznKyYo?=
 =?us-ascii?Q?prfa8Ep8mXLqd2s9DHCBgIi0OVvV9Q16Jr3svBZQ6kFPOAEws1oViaAMe+Us?=
 =?us-ascii?Q?hsS+C4hZtd1dz9Rsj9HNOCdtgoZvrq0JtNeyLOFnl7PQ2kZmwPfo1TuW6e4R?=
 =?us-ascii?Q?VFjauLIIiNVzlCPaAiKNbnBBBP1q/H70wmgYzy4AcbjvB9YyaNA2rDa8zHK0?=
 =?us-ascii?Q?OOxA8Q2CrDKpY4wh4DDCFayL7AKbFm6jwnCA6Fc9lkTwFkQDBtQ7qmlrBZPv?=
 =?us-ascii?Q?i47QllQHLSghMR9c0fWHTblNkQDGnwiA4WDdelrJs/MbS0YoejFWuJLBDOPs?=
 =?us-ascii?Q?yiaHtagMm2PP2pMwCXiN/Tx4HPrEs1vH0wlKRTo9HaKvOL3e4Obexvc6Y3mC?=
 =?us-ascii?Q?b6DkN4p59umQ68geXSUdkyG77268uGjigCd4b0t4x9tKRSvI6KnaIyNvs+Ha?=
 =?us-ascii?Q?jb2rvAXwCXBXyCLVlSW5Xb4Pk4/YSIMFF7pAzEJKJ+B+hEC+B0TyeXQp1r0h?=
 =?us-ascii?Q?MQcz2pqJrpcAWpa1ljIiyNP85k8LL+wj3qcaWoUpnEHzkZ7gFLH6ottp7mi1?=
 =?us-ascii?Q?ZbK+PlMF3DALKDxLQFT7eQQGVFdUOYEp6dBYD+v8fMNBGrzccToBc+kwr27Q?=
 =?us-ascii?Q?+XuvVyf9edmHgYzU72kJwBHNQAaZWQV+DhNd2Yfh5CB+Bl1y4jYzt6UQs/3T?=
 =?us-ascii?Q?jzkldjRV2Fgrk272/S3T38TsFGjgnfRsKxZzxrK/wUtxPWT24Md3B5yDW74l?=
 =?us-ascii?Q?4k5NsChTUrLlea0pinOWfAlavPJUGHmIcXT040kjHB4SGbaiuehKqh0Fd82W?=
 =?us-ascii?Q?dbKalAJuF5rBiWeYX4GHqR4LV0zmScr4wU2JSw1ysydk5+HSEwUQaFCpWIjs?=
 =?us-ascii?Q?wSdgSBiSSUes/995KOoXi0lnqgq8i9L4dtRh9YN5ohE5l5bfptDQjVtKp9q/?=
 =?us-ascii?Q?+HL4mR8HB31HVW0QBKRR7Yf3fFiOiNibgCaB7EnJzFIZT1rksKarPpKiK8Ov?=
 =?us-ascii?Q?fYx2OGymG3dkIR2DDlblzDHatfyf/JZnN7vUM/r2NVio9eBgVtIfBVOA9keT?=
 =?us-ascii?Q?8SC24Qf0ko324/ZPGhNkil14l9rzBJmbJDlnjTIrtxiJVX0OjXn7Imp6IKHR?=
 =?us-ascii?Q?9LGSW57smCrwmVl0ByZdmxXlI+Bk2SbpIQUSyg37xAtcwExMC2Kkv9JOtcXk?=
 =?us-ascii?Q?QJG1332FvIXWEzyMFJIi3h5LYBSucW5G7LQqqmmQp4LXuAXA7EMGxxyobTB9?=
 =?us-ascii?Q?QNJV5+QRQZzDPtpRgYPw/ffewjq+LsQlQiirH9cXs2pgLbQFhZCRYGvKqsaX?=
 =?us-ascii?Q?NS0qycaOoadDjYHXPjN6da9PP/MLIC502xzhKCURB06sgll8IA938DF00x5w?=
 =?us-ascii?Q?GLX3kWC6DgHSAxWout1uYR87RAfCsJFhUUA9aIJAzg4fEtfWQV+JH8sd5KmU?=
 =?us-ascii?Q?R6EKCCHT0yPfSQMpIQz8NG2yZtT3YUTgNHDoikYTe+w9M6S8E8iEtB4KJFTs?=
 =?us-ascii?Q?l9b4gcQMdOUvy8e/32U=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 22:55:55.6885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9110fa0b-53e6-40b6-6dde-08de2307cdd3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8542
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Nov 2025 22:56:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16765

meta-arago / na / 20251113225017.22994-1-reatmon

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH 03/10]  packagegroup-arago-tisdk-graph=
ics*: Add DISTRO_FEATURE check for some packages
    WARN: Commit message does not include file/recipe name: packagegroup-ar=
ago-tisdk-graphics*: Add DISTRO_FEATURE check for some packages. (COMMIT-ME=
SSAGE-2)
        patch
WARN - [meta-arago][scarthgap][PATCH 05/10] meta-arago-extras: layer.conf: =
Remove SIGGEN_EXCLUDERECIPES_ABISAFE
    WARN: Commit message does not include file/recipe name: meta-arago-extr=
as: layer.conf: Remove SIGGEN_EXCLUDERECIPES_ABISAFE. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
arago-extras: layer.conf: Remove SIGGEN_EXCLUDERECIPES_ABISAFE.
              meta-arago-extras:
              conf: (COMMIT-MESSAGE-3)
        patch
WARN - [meta-arago][scarthgap][PATCH 06/10] layer.conf: Add missing meta-cl=
ang dependency
    WARN: Commit message does not include file/recipe name: layer.conf: Add=
 missing meta-clang dependency. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: layer=
.conf: Add missing meta-clang dependency.
              conf: (COMMIT-MESSAGE-3)
        patch
FAIL - [meta-arago][scarthgap][PATCH 07/10] makedumpfile: Remove outdated r=
ecipe
    ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-=
UPDATE-1)
        patch
FAIL - [meta-arago][scarthgap][PATCH 08/10] abseil-cpp: Do the version bump=
 in a yocto-check-layer compliant manner
    ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-=
UPDATE-1)
        patch
FAIL - [meta-arago][scarthgap][PATCH 09/10] libyang: Do the version bump in=
 a yocto-check-layer compliant manner
    ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-=
UPDATE-1)
        patch
FAIL - [meta-arago][scarthgap][PATCH 10/10] v4l-utils: Do the version bump =
in a yocto-check-layer compliant manner
    ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-=
UPDATE-1)
        patch




