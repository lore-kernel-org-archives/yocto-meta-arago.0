Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006E1CCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 19:15:44 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7472.1762542936673342028
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 11:15:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=vVxhqaN+;
 spf=pass (domain: list.ti.com, ip: 40.93.194.29, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Grsgj/eYAR6WXv/CMz036cuhtCY13UwZ4W6M96fHYtH6/hvDjHVOhQq3/cUbCNzJBEWnaNdUM+ycHwNPxO06qeHwryw/dhCn/y4og525X9U7Fjv3En2wJjyV5zl5MUMoVSxUpiTOVH7AAEi622+5i2sihiwaWbfkoYRuSSXBMVh3eukVNPWONWrdksdLfi4YLj/Gl+wAUNZl3ThnLWEq1DW8bR64g0UHXoMJuX+QbyUx2puyoqpCi5nrwKl9Je4zAlfj5hDy+Q2I3T46Xh/yNS4gc68+tUJ+4ZQGU8wp9pGYd7cS+lUt7EYv15Q2Jv63n0UhESC5w2dV297/D4T2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPA5CUTn+IhIswoXxstiAiNGCzte9vcvsJrtCAWBf7A=;
 b=IbKTL0amQRV4WN3XOktwiVQx4u0bgBpggyoSJXFf02DTH+bh7B0wwHCwZKsmk711R/+PuP5EzjGVstrhz8na5fQiDtwegeNOZA0j5n/JpBR7pIZTX+z4CvBCdZU6lWGDvpuWyJQ0IUlBKTELffL31/shbtW2H3T2tqisyGz3Kt6gDWLRWcPiC7NdMmXo5k/YopAegUDaO3T6CCQ79Tar2lyFsw49pQLmhOrqrBCRouJIjG5HMgJfcgK942TBzyuYR+t/3GldqSNPxnvpmRrcLhkQRDfDUb/KMIjDKoWUzNf137gAQBNxpugoa9CK3k6NGAqMgRCJWAHq4jzlKbQbuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPA5CUTn+IhIswoXxstiAiNGCzte9vcvsJrtCAWBf7A=;
 b=vVxhqaN+icmPUsgobbxB+BXyJy7Tg8z/bNTE85BG6Kqf43daejZU4OUE2Y3VL0UApt4O+ccMRaeepTGmFdtqcQInmaZGpSDCFipSMRY8EKLkXU8omF1zvcJt/kxUC/mTaw5xJHAkCe7yO8vpDAGvx94KbvglKHtYidaT7Cd90TPYverFvObZTIr+wJc6F1maTpwdqyR5IJCC9DQWRjMWZJiTpFw9Brg04gcu9JABvcxe8L5SzHix6iXHuSsYxEbJVaZkz7UKK/V5DcvuWj5zN6LM2JnSUMShTNl1pIWkIT0O4aXyMBY+GRXuTyTz1k1gSaQ3Hi9y+RqWip/jztUovw==
Received: from SA1PR03CA0006.namprd03.prod.outlook.com (2603:10b6:806:2d3::19)
 by SJ0PR10MB4477.namprd10.prod.outlook.com (2603:10b6:a03:2df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 19:15:34 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:2d3:cafe::9f) by SA1PR03CA0006.outlook.office365.com
 (2603:10b6:806:2d3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 19:15:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 19:15:33 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 13:15:31 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 13:15:31 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 13:15:31 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7JFVPM2346552;
	Fri, 7 Nov 2025 13:15:31 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0B38A9ACF4; Fri,  7 Nov 2025 13:15:31 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202511070802
Date: Fri, 7 Nov 2025 13:15:31 -0600
Message-ID: <20251107191531.57095-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251107191326.481769-1-lcpdbld@list.ti.com>
References: <20251107191326.481769-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|SJ0PR10MB4477:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a66cc3b-0dc8-4b20-5a71-08de1e320680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?m0NLgu1M71HDCDJ5by+kOH+erWnJUi8Wg5/UpD11yWpGNZAMmjzjSF7dfuKx?=
 =?us-ascii?Q?EYFko3172Kg1bGMkur+jYaDMyiqInJTqYEolf2lqyw87o0kGx1a9Z/pBN9ya?=
 =?us-ascii?Q?6Bv7dPcPo6bneIms8WAnoVZVfzwyFhNOLV7798uMBXrGOJ8MKlG1WDEzapZl?=
 =?us-ascii?Q?q8lcI2JZwmiUUN1Ibnfh4gkHKGiPJN4wP4faS/ppq4xHl8YL55fYKa+I+J5n?=
 =?us-ascii?Q?QxuUUITBXRugT9KXnAaS9wZ8LapiBgB/sG00u0KL2i8TuFKLbIXWOlDFhpA7?=
 =?us-ascii?Q?vMrqtQt/IiEkKdqum9t0vuHv1vs0WuuboTTyCZwNJxUftOD7VzQ1g7njiXJV?=
 =?us-ascii?Q?l1dPsmFoN4tY2k3wFcpqpuk2WRSKzeQjtPOq6VlAZeWLIDWNkrEGihikxEhw?=
 =?us-ascii?Q?hP72CBhFK1wCAPvNOtA9asiqm4udtzgXkuAa2nrvfanQ0awbRdx4Dr3TwJrP?=
 =?us-ascii?Q?tAwknraUK/6zGYmhzcKeNYgbgofANErCkT/O5qmBdyJGBFmjG1LRAISi9FOl?=
 =?us-ascii?Q?yRi7BfvpMWcTHRJMLfxhEKFV/qvbCSs/GssDY/O/gYH/lU1fhT8ejSt+DPB8?=
 =?us-ascii?Q?XpsVmE65dwyTPkakyOTD9MbZ/OkauWa24vyPPOIvhVLvC3vsYX6ftm/EWjbA?=
 =?us-ascii?Q?i3+Urw9untVxsLyCHSRLlKXiss7lgShQnjKenHI77m4EPJr72wjQ0fb9/Zr1?=
 =?us-ascii?Q?fRkIQOHIFiWR/qcMjPpw9VB41zw/vtakDFbWG8GZnNjVAXCjmPLPeNJHF1pB?=
 =?us-ascii?Q?n6E9fOUEnuxr7a1aZhMBGgRe5yFg+AopbGdewmlm8hctO3WI3vKTZwaFsCIz?=
 =?us-ascii?Q?v9Tk7qIv2MbXuPc7EzbrhZRoE0OE5PGYRR9wUYBOQRgoqTl+nMQJhfr/vZ+h?=
 =?us-ascii?Q?DGvQMYn4IMqOdURpFkdXB9bKAnmSF2UvclW0DxnzxFOBNcGxsqPdUY0ENUj8?=
 =?us-ascii?Q?zO+O0cpB9DxNeaINzn2ID2sO3ZtZ/t86cX+0I0yDQw8VwPXxd6aLNp0MSgnt?=
 =?us-ascii?Q?Yx5zCAKWKitAb8j7IllNOjPaO/POlQKlo/3DK6STst41BWAf58qas/WMA3JT?=
 =?us-ascii?Q?qmOK5fXo85wBefCzBY6EjNfIIzdauZ+O4x2LllvMtEDgwq4YsYsYyqmrNh42?=
 =?us-ascii?Q?ec11ENW7mhhfMqJtOE+pKcbe1yART7Zb+1klWLxTAOcK9r0B0GLsw0G/98/k?=
 =?us-ascii?Q?qED9FGeiHQre4QOFdWBc+GREFrNAdNYmRn6lFhWSz177H6zI0Qv7+JTybXV+?=
 =?us-ascii?Q?iMfAPXdOYG/O0Eh5o0RPI0HDKl8gPGuOVrm08UNzsOB1zWjyT82ayKEFOacs?=
 =?us-ascii?Q?pXpu8g1b73YIOZvOe1YOLzmy7E+XFUYQ0c1+IvFXWMs83buEWZ12R9STBXlk?=
 =?us-ascii?Q?e7ycFw7RY7r0S9erG7FTfKcBb+TD6l9mlJKOtNHSV14t+Iom7oPL3Ty/1I3T?=
 =?us-ascii?Q?bAvtCXK5w/GQjxLDJF08mDCdZb/bqq1mJHUuKeyAi593HW6byzsthP/5CyvE?=
 =?us-ascii?Q?5WpkmciH8/Ng0JrtUr8qGslksl+UPrtd6BVMIatqy/YR+FxJ3AVmD3g+4H4y?=
 =?us-ascii?Q?nFwwNvLYOc6J9whGnIA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 19:15:33.8703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a66cc3b-0dc8-4b20-5a71-08de1e320680
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4477
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Nov 2025 19:15:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16732

meta-arago / na / 20251107191326.481769-1-lcpdbld

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
WARN - [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202=
511070802
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merg=
er: cicd.scarthgap.202511070802. (COMMIT-MESSAGE-2)
        patch



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
thgap.202511070802
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 7 Nov 2025 13:13:26 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 294aa288bd5d0552a3d0928dee4167b83=
0ee12ba

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: v4l-utils: Do the version bump in a yocto-check-layer com=
pliant manner
- Commit SHA: 9daed66f08d4ce57b85c3e9199ad0d96bb9a6e83

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




