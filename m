Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C65F7C44536
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 18:56:13 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19378.1769021764838757063
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 10:56:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=sp7v95qF;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.38, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfZVJSinqsaFkFzxkB7ihzMhCzd5xufaC8ePj0GrNIXwy9/xFeaMdU97Za51HoL0+lLIQCotLmaC29RIy4CgFyXyXmuoTLEhdrwUDACxmh4pgMeLJYMo1BeQxqCPQujSmz70vfBBCgiApEviLel6BFcyCInw3eSFpRxvEM0W+6kBj7XtBUCkyiQDO6sSx1zCpWO7PEa9Z3XmKdpyZE+SJpYW+K60hDQZI56BkNGIOK1uMGzAPknn3a4goPZjryG21HmM6lXRLMN/LXDe3rLVSUsTK5ZcpYgWljjHA16BLpaWNSC05h3eLMdw39lN2LrVt9jmHEBwZmkZCbhlSf1WfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+1a/rP5ERnf7BVxmfKRotNtTlGqGuCVhKm7TGmTY9U=;
 b=zCl/dEZp0tySkTiGE7rQ+Ia/Mu+79NS3wEi3J39PTac1FroAyu96chVNCRFH+DOlb4xqaXDd6BP1UvXH0Md4s6TarJZxrpcyJMnaOyQKF3gJw4oPpQXCasLlMEXek/GqnjZySZdQTa3XQRtX4F+uDa5GXpkbt1C3BVhuxNeF0GUzAWLEWDj9u6E9A+ChNaAJDtfsh9GSOa65YEQMRth3bZzF1E/jhAI6y6btcpO6ivBGY+NdR13UTr+P1KjBJTiyNvNg+u0aqaKNUPC0qhzR7LX8w6afrKGK8yCGsiC2cWTnmguXO5cXd3a+OgiobJtpkh5JovoJQcvT2CLUoYRi+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+1a/rP5ERnf7BVxmfKRotNtTlGqGuCVhKm7TGmTY9U=;
 b=sp7v95qFVYWLwcmK5KVlmNvdJrDeQlPQScznRI01vuBIlbF4JwYgUkWxB4z9pTZhZ99pb4bbK2spSN8O3oLwWPksS1tKxKAq1CMADsTYcBLBSFgj2ezzhNnhgD9i2R7LyuipxTvv6o5P6TOxU0ekVg7TE4Rpu37F7bmeLQuu2tU=
Received: from BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::7)
 by IA1PR10MB6733.namprd10.prod.outlook.com (2603:10b6:208:42f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 18:56:02 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::63) by BY1P220CA0009.outlook.office365.com
 (2603:10b6:a03:59d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 18:56:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 18:56:02 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 12:56:01 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 12:56:01 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 12:56:01 -0600
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LIu04j3358457;
	Wed, 21 Jan 2026 12:56:01 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH v2 1/5] arago-image.inc: Set IMAGE_FEATURES in each image recipe
Date: Wed, 21 Jan 2026 12:55:54 -0600
Message-ID: <20260121185558.1330658-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|IA1PR10MB6733:EE_
X-MS-Office365-Filtering-Correlation-Id: 39360236-655d-45f9-1512-08de591eb91c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?spWVF21imIWyNWcv51h4ITMYbRp+E9YJ+0o/AcjIVzWJpv6lYIrrGFc6AJj9?=
 =?us-ascii?Q?i8W2qLIoHBStqY14/OtSgxgdnzGerID86nIJD6vyG1BXEG1+RSGpO83Qj3+o?=
 =?us-ascii?Q?6SEB9yTV/E44QouaGzk/DMmM4Btt2mpeFNnjgCEqsPnx9zMTclyjo/2ueuhE?=
 =?us-ascii?Q?7Hs0Ud2Hm+H5spjNHNcd2kZTHfQt2zShNFw0jVA4TPAJTdHHCLD4GD3KxqvV?=
 =?us-ascii?Q?XUyl90QagKOgaTiwA0qM4GPxVgo5uyCNabdWTK4eHYWGpdYPKdkUOdhxbIpG?=
 =?us-ascii?Q?LXrLCrcy+9NECpLBYoqUX94oq8iM+j9eU3sJVJmpAPZNW98CSBxUGH16h1HL?=
 =?us-ascii?Q?HrP8sDNE8kKFPLe0cwjRF2nlmxMQ9GxDE1ACxqCnPfTN51RUa3W5rEud89dT?=
 =?us-ascii?Q?pkD860SLJiJzpJAbC2Jr7h1Nyx14frVZGhu6co9PBFD+8ZSdS5uQnLM43BdC?=
 =?us-ascii?Q?+bLGuCYpGJdYwUe46QlljZdNU4P99QPqVHj/urcOk2jqFOE5VKs22fie8v4l?=
 =?us-ascii?Q?NeXu2mQQ6AYxiJsTkTkdtl2Dt9sHk/ulSPMsxzV+9mzzovSn553E3T6tkjg7?=
 =?us-ascii?Q?j+kvtpZb7KFHF6HeutwILuhtF6bS/EmparWLuyQXQY+1hM4SB9thbCn+5n8/?=
 =?us-ascii?Q?G+ANgPj1IgCHAv1J5A7amiaRfTj56B8ZgbnWAUWEQoEEWcQ6O6vfm9ad5nDR?=
 =?us-ascii?Q?JdzPYgpDRrxySQP4AZkGu/SSZrgw1lPhQc68tZbQM48jr1tVxmmai4kxD7xs?=
 =?us-ascii?Q?i7gW+qEO6iqYyFpI86WrEPaKSd1OhInUDU6erCNCtGaYBm7EFLOxWbSgvLcD?=
 =?us-ascii?Q?c+aSFpyQ04imcNuVvy0lL442PXIhbN9RkOW2DL0oCnmNCN/n3MFMWJXJljC/?=
 =?us-ascii?Q?iRhNJJCJ22TIwVMLdfhlvYsSsHsfbF5/LcTgWsdbFfFLSpZmwQy4HfscOGB/?=
 =?us-ascii?Q?jhvdwoHUm43txv84VR2byBp0uEz45CRT1KvzV8LDfrrGdzMwRNRqCncrVCM/?=
 =?us-ascii?Q?n+N591kOorO7JPzzI5tlK6GOzjt4/NFguLr32qMRLW+ibPU1g3au4NGMQhe/?=
 =?us-ascii?Q?QCN9FwVjzuKdcDuQGj2sAi3DUup1z20Gp5L6MjtL3KsqLq0zZgDY92L0Jhw2?=
 =?us-ascii?Q?hPwPYYcl3hWxWLYfHAg3dCb1y5xtJ4OCPdfABBoHX0AKlJxftD7xGXxnfD5U?=
 =?us-ascii?Q?6uiqUOlIbooslDJ2Q+FD+lWGe5ozo6NU+NYQLnmJmRrRO9TcgYnVKXS8fIHU?=
 =?us-ascii?Q?b3ryRYiLewKdRIfQEb0fO8nNXjQjmt/G2H0VKJnz6DS4FvZQFf/JLml4pGw3?=
 =?us-ascii?Q?CcNPoZ0X7fnMAASzaPRE2Vrrys0itpyuGE4P5F5aYEQJDZqVpj1kT/9RpOSc?=
 =?us-ascii?Q?usBHeWycsa7Tz3A/A5cPvm9+XAuPgaJieKgjnTeiKRn+PpOv/qUlfCtdrBrm?=
 =?us-ascii?Q?cSiXlOReZw8o33o7PebaFQ3zLn6w7cFYGYcPVBbkcvsmRsXhfldrw0qvKMKA?=
 =?us-ascii?Q?Ke8QQ68V4xZ4t5cGeKYbNvv8QQI94nOA8TgP7o2d3MomSe3O/Rhk7ost8Adz?=
 =?us-ascii?Q?Hkq35RjuuMqjvANaVrBtNRK3mhSvU6YLAB25Qr1CYl04CSfPPIlJO+8Lmr83?=
 =?us-ascii?Q?r5ZLnOGw2YYJ9ks8UXysBR2kYeo1kLG8yXmhg4tbPzdLHuDV35CGLcakR14t?=
 =?us-ascii?Q?voi9dQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 18:56:02.2071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39360236-655d-45f9-1512-08de591eb91c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6733
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 Jan 2026 18:56:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16998

The "common" IMAGE_FEATURES found in arago-image.inc are not all that
common after all and end up being removed or replace in most images.
Move the image feature assignment out into the image recipes.

The only thing arago-tiny-image.inc did was include arago-image.inc and
modify the IMAGE_FEATURES, so this can be removed and arago-image.inc
can be included directly.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-image.inc        | 2 --
 meta-arago-distro/recipes-core/images/arago-tiny-image.inc   | 5 -----
 meta-arago-distro/recipes-core/images/tisdk-base-image.bb    | 2 ++
 .../recipes-core/images/tisdk-bootstrap-base-image.bb        | 4 +++-
 .../recipes-core/images/tisdk-bootstrap-image.bb             | 4 +++-
 meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 2 ++
 .../recipes-core/images/tisdk-thinlinux-image.bb             | 2 ++
 meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb    | 4 +---
 8 files changed, 13 insertions(+), 12 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/images/arago-tiny-image.=
inc

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-a=
rago-distro/recipes-core/images/arago-image.inc
index 37b20850..33dca89b 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -4,8 +4,6 @@ LICENSE =3D "MIT"
=20
 COMPATIBLE_MACHINE =3D "ti-soc"
=20
-IMAGE_FEATURES +=3D "package-management splash"
-
 # 4KB per 1 inode should be enough
 EXTRA_IMAGECMD:ext2.gz +=3D "-i 4096"
=20
diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc b/m=
eta-arago-distro/recipes-core/images/arago-tiny-image.inc
deleted file mode 100644
index 6c726c4d..00000000
--- a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-
-require arago-image.inc
-
-IMAGE_FEATURES:remove =3D "splash"
-
diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb b/me=
ta-arago-distro/recipes-core/images/tisdk-base-image.bb
index f5d5f29b..f6a33f13 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
@@ -5,6 +5,8 @@ DESCRIPTION =3D "Arago SDK base image suitable for initramf=
s containing\
=20
 require arago-image.inc
=20
+IMAGE_FEATURES +=3D "package-management splash"
+
 IMAGE_FSTYPES +=3D "cpio.xz"
=20
 ARAGO_BASE_IMAGE_EXTRA_INSTALL ?=3D ""
diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-ima=
ge.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
index ce3b008e..12ea697a 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
@@ -8,7 +8,9 @@ DESCRIPTION =3D "Image meant for basic system verification =
of linux kernel.\
  maybe used for basic platform bringup (bootstrap) activities.\
 "
=20
-require arago-tiny-image.inc
+require arago-image.inc
+
+IMAGE_FEATURES +=3D "package-management"
=20
 IMAGE_FSTYPES +=3D "cpio cpio.xz"
=20
diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb=
 b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
index 5fe0463d..f39e2e35 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
@@ -8,7 +8,9 @@ DESCRIPTION =3D "This image is a complete package containin=
g a rootfs\
  content.\
 "
=20
-require arago-tiny-image.inc
+require arago-image.inc
+
+IMAGE_FEATURES +=3D "package-management"
=20
 ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL ?=3D ""
=20
diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b=
/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index bc067857..077fe05f 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -5,6 +5,8 @@ DESCRIPTION =3D "Complete Arago TI SDK filesystem image con=
taining complete\
=20
 require arago-image.inc
=20
+IMAGE_FEATURES +=3D "package-management splash"
+
 ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL ?=3D ""
=20
 # we're assuming some display manager is being installed with opengl
diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb=
 b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
index 5d1c26d8..1eb864a6 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
@@ -5,6 +5,8 @@ DESCRIPTION =3D "Minimal bootable image with container to s=
tart the next\
=20
 require arago-image.inc
=20
+IMAGE_FEATURES +=3D "package-management splash"
+
 # Allow users to tack on additional packages as interesting.
 ARAGO_THIN_IMAGE_EXTRA_INSTALL ?=3D ""
=20
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/me=
ta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index 0bb6b798..8e7712a8 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -10,9 +10,7 @@ DESCRIPTION =3D "Image meant for basic boot of linux kern=
el. Intended as\
=20
 ARAGO_TINY_IMAGE_EXTRA_INSTALL ?=3D ""
=20
-require arago-tiny-image.inc
-
-IMAGE_FEATURES:remove =3D "package-management"
+require arago-image.inc
=20
 IMAGE_INSTALL +=3D " \
 	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
--=20
2.39.2


