Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6482BE95A6C
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 10:19:20 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61785.1767089950007558113
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Dec 2025 02:19:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=TBCDNeq/;
 spf=pass (domain: list.ti.com, ip: 52.101.48.25, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgBJk2r/CDldkNGZknrh9Zl/RdAgmGyMNKvaneZ7P34VIfXeaCIwhICHaHxcdKpx8+zejv15c9aUoV0omApthNzBBTxA6+MAHOwJ+HHvnK4jNh+fYRtvR1sWqxAQyrczIaRY/Hy1VLsMgpJFwVhoAlVDTNCLEtuPJ8ldqVUInmmrTR5PNiYeU1zxlP0ICAOgZG5H270vhXdrbuExWw57Q+ldX1lipiYTkqR6wtgnDlgMTnHvYjy4JdZYzd4jbAOvOM62tSRuz8Lf3MvkzNB9s+q+qdhtAHfbVfTi9eqVqJ4jVMmoUmSZ1ZzzAVSy0d8CAmg4XAmc4X4N5c340aqRmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKlUKWJW8kjG1LCxvtsvh5MyWCy7OO0Ui1aVN7oq7Hw=;
 b=KdQg5mmMrohj+qYx4DYRZk/it8naBdnGt30aOwU8uh4EICBw9EvUpmun2GLYg021geqiH/WI2IbhrX2rt/SPPPCx2N1V3sxPSJF1aPl7iQPUdJlngPzewumkLYhX5dfpjNAgHYxFAU3a7k0y0nani30Bdbjh6+DizG8G4EIynB0BwHjbOfAY7HWxuhZi7hVtIjIzbbqfe7ve1iKb5lX/kdqGpkpAIzIkCBV9aOrahr5lNmHNwECAL08wchkI9VTYCzzIJOr8XHenB4fHRdukP6O+oYL3jMPeZAdvj5rFNRA5MRqyRvCSCjE1xRYakadB29N7sMrpSdNvJ1EpPKteBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKlUKWJW8kjG1LCxvtsvh5MyWCy7OO0Ui1aVN7oq7Hw=;
 b=TBCDNeq/OkcKXE0+tSuwNSUpWxTy6HikzaBkM7tbpf7k5ueB9FdPDApESn0Vhvj1iUe1A0ycm1fU94NZrOcy7LQlAOTHqAPsOHxssrr+ZFQgFZ9kklhccLDZi8k70Ry7bhK0bCV4SgyvMQVmyjgpC1XN2/XyGeTe14u5N4nQIDYCeSPbXR0Ke/FGVvHtJAraI6D1XFaAZFJF04xdUBWKT741MaAj7H6wR2nyfbFPvhWCFgKwwZoZ6MGPoOY+pJrLGeH+rNAuTGqi1vEjYoSwBGU/foE1zsQbsbcYFI1i3VqE3gm+2OuN8dbgDE/8KnOQLAoXuPsucdzNa7KExFDxIQ==
Received: from SJ0PR03CA0212.namprd03.prod.outlook.com (2603:10b6:a03:39f::7)
 by IA4PR10MB8588.namprd10.prod.outlook.com (2603:10b6:208:569::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 10:19:07 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:39f:cafe::db) by SJ0PR03CA0212.outlook.office365.com
 (2603:10b6:a03:39f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 10:19:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.0 via Frontend Transport; Tue, 30 Dec 2025 10:19:06 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 04:19:02 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 04:19:01 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 04:19:01 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BUAJ1kb190057;
	Tue, 30 Dec 2025 04:19:01 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9315F9ACF4; Tue, 30 Dec 2025 04:19:01 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <c-shilwant@ti.com>,
	<reatmon@ti.com>, <a-limaye@ti.com>, <gehariprasath@ti.com>,
	<praneeth@ti.com>, <denys@konsulko.com>, <u-kumar1@ti.com>
Subject: Re: [master][PATCH] cifs-utils: Remove bbappend and patches
Date: Tue, 30 Dec 2025 04:19:01 -0600
Message-ID: <20251230101901.3251773-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251230095729.175372-1-m-shah@ti.com>
References: <20251230095729.175372-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|IA4PR10MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7d8d61-3088-4c4d-7e66-08de478cdd41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Y6iiqAHyNDJN6RkX99PV/wr9nk/I7bhh7B5p9jkz25pNch2GEVGevHgk9l4P?=
 =?us-ascii?Q?MqaB7yqWZNugoS3HAli63PLTUoqIn7mBlmGYtQ7q7c4DYCrgqH+XgQH/YsLs?=
 =?us-ascii?Q?sl26d3QYzls5i6/7tRASffDNP+Md1eNtf9eg3vy9kWd1+XAMwJle1U6cOACX?=
 =?us-ascii?Q?8QaAuMk0QBuaBTuaq24PK5/ymdp973QFlXGksQp5I/g7bA3mlf40kFFTZ2bA?=
 =?us-ascii?Q?IOTy59ZGdaHJXIglVebE/RE8KOKTC2QQTSxRFGuIRqVDlcRpw4HHe1IEAYy9?=
 =?us-ascii?Q?BCne9fF1nECF25mfHPM5T/+0+75l+nXpu9ciGSylH0U3cjM49J1vSizE3yuM?=
 =?us-ascii?Q?q/l1gTCgGRsphzsVWQS/i5Pf0L10MRUpd3AVeLJA8gU+q5f0LS4iZ23doPtS?=
 =?us-ascii?Q?Wi9A9MHOBlXs+jbBDNMgWEOqqvVMc1LwuI7wFThZ4bR8p2gxHGblGxICxkZb?=
 =?us-ascii?Q?yPanJ1Q28uL8dZYdFAR83SuZpXhO0bCudeC9jpVIX6xG96WIAcJRM+n5Get8?=
 =?us-ascii?Q?d7YHxNETRAqEzx/B3jN42leCJ5YxXC4HXmu/NlcwLBtwCdBFiBRjKIvKaZiF?=
 =?us-ascii?Q?p9XegdYqaLTN9s9O+3fc6cTRZ8yiXYxt9y0btTzK8Eawz2VbvCbs16BcAcwX?=
 =?us-ascii?Q?qksdpTLtfcKVRfmh01IGp917aYmS+/+UfNc2Os2bu4EiFX+6fyRd9McOapOm?=
 =?us-ascii?Q?MUM+64CPNLtqYHvYxJgW4ON/KMVEb469EoIZ7QtKU+JM1uV3Na/6fqprhFdx?=
 =?us-ascii?Q?e0dQV2AaOAb14aVvdaqbt0E6XIoorJzf+v6KSygCuDQwVNuzpHQ213X8wZsn?=
 =?us-ascii?Q?5nAnx2e9b0ppKs/qaByNgj4sFsRMlQuP4SN+JPocoP5ups9KGru6yqwYaJBz?=
 =?us-ascii?Q?aNzmPenYhD9Hwu+SvNFy3GEuMDgX4iS8y1VnPQYHNds3iLES7A78Dcqk6vuW?=
 =?us-ascii?Q?1PqWgvaG7sJXrSKrqSP/PrYEbsQIcrx/zLUDasRCfXdqdY6sFv64SBuXIS6y?=
 =?us-ascii?Q?OxwKsZacSvUuqH3DJE2vCfizYm5JVtj5ZiB1LWUY3L6KMCKL0MeRaO09Mgxg?=
 =?us-ascii?Q?0Y0gQceXs+CAIAxIMH5ys0jHfqRTLDuXeMZoJ2eEAICxnH0azAQPYFaWrPwa?=
 =?us-ascii?Q?trlEHUX31NDl+aP+KU06nFxCVBYsW7shEzctFw58zk90X2uOl04c23kJK79q?=
 =?us-ascii?Q?DhpvyjchV/YTyCSPeaImfpCzg5+h2G5iVScgcKZy5n4vau/huWqZW1tSwTRt?=
 =?us-ascii?Q?jy4zdaC40bifBc6+SjBpYeIZHiDkXZVDeNvZeH29QOs9k579md0hR286GOoz?=
 =?us-ascii?Q?xMOLKK+3lLm/9Ixy/pHqBQojC41+wGefYek5uPlnLG4IRK2phZGlcRDaY13l?=
 =?us-ascii?Q?/O26opeSYAMtyDq7gPo9Zz2C5p/4Hbj5rea7C+OzvGqfOshXKV4Fu/79QGtR?=
 =?us-ascii?Q?PVuPr+/LM2v3G6luakhSQelo7V8qrviJt5rWV2a8qvR7vqxFykP9OCCBqXd9?=
 =?us-ascii?Q?hO/xXnjUEogjgVW5D/jQR+LMHukRTvNpwqnvDYVoQhXuLZDysgIdFiYXpK0x?=
 =?us-ascii?Q?EzpfucHnb3TtFXqv3VU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 10:19:06.4832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7d8d61-3088-4c4d-7e66-08de478cdd41
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8588
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Dec 2025 10:19:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16904

meta-arago / na / 20251230095729.175372-1-m-shah

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
- Patch Series: [master][PATCH] cifs-utils: Remove bbappend and patches
- Submitter: From: Moteen Shah <m-shah@ti.com>
-From: Daniel Parks <danielrparks@ti.com>
- Date: Date: Tue, 30 Dec 2025 15:27:29 +0530
-Date: Fri, 3 Jun 2022 15:34:59 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7cf564950369206e93238f9e2bc8f34c1=
9e9026c

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512191404
- Commit SHA: c38be2eb3b16b176476f04572877129f82a0dff4

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




