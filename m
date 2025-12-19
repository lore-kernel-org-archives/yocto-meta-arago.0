Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999FDD7878F
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 15:31:00 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19232.1766158254443722044
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 07:30:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=xYxVakXd;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.20, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eu7v0n5vnGekFfd34yIsojKNaHy/jeYIkJfFQXQ3P6tQjN5s2erP2o8f7v6DTjpZnyo7rPbTYlPTGWAlKpWXHQCXEpDdWQ1+ujTU7X0cNoRiJavXFVudsbqvxpmmNy+FXUGj/78cH1v/dLh7cPK+3Sny0wxpTSViNW7MjwNMzi62iYT9Sju+C5F/XiTbg4PFhCeJ4T2CCWG82VA9iU6KG1TorUPZ64rhRtfOuct9K8F/O2Jwny5EkFLY1/UDk8NmBlncMRxoh7/c4kWqsDUmJ9X8QMl8CgIsKhIsLjJmewzgQjg76CwWVrxyj2st72f9/Q0V5TzUK1/Uf1tUj9Ok7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qq0ltRaS9C6Y4ho4Eugr6P25qSSumVV0eBEQJoUcwB0=;
 b=iFWqnALQEze+1gy30qJLC6RgiFfTeDAOv/j7seeYidKTwylnHN3hVN+/UHBOgNADOfFzwmmxhK8BpYJhPDbZyCXib1hhv+q/dZpYIpk9GOoyfSfX1QVUFUv114Wj5LCbyN8tsPtUJ6dVNGTTVgaqrvSdZiJd/kXtwtFRv5a3YjVsDITZlTTaOmfWXlpXkgpRiuZG+OfPqtVSbh/U+bsjEil0RS8RZjXxCEKbhs/OaiYzIlHGBOiq6WhKRFVyRmjUfMNSLiSwDrvmrtHoY8aEz9xcVZXCTpWcGicTfknGPEjC4+F2r3jzTy6tcgDJsy/iJkK8KhB342ifncYYRzuU7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qq0ltRaS9C6Y4ho4Eugr6P25qSSumVV0eBEQJoUcwB0=;
 b=xYxVakXdKOkPdD5ZOjhuxU6ampuQTOkiWMyZJK2dpdS2/OA+1x8jUGXJRsfLrkfJVK8TvhQi4TjtsNlLaJSx5p+FRIPhGE49yMYMtcNErA3AqwWwFBD+WB9b2aiWxWhplePVLcJiqk9zMNIE9uNPeB+Y+0TRcbIJCbyNH/EDwFk=
Received: from MN2PR22CA0030.namprd22.prod.outlook.com (2603:10b6:208:238::35)
 by IA1PR10MB7516.namprd10.prod.outlook.com (2603:10b6:208:44f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 15:30:49 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:208:238:cafe::1a) by MN2PR22CA0030.outlook.office365.com
 (2603:10b6:208:238::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 15:30:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 15:30:47 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 09:30:43 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 09:30:42 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 09:30:42 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJFUgG91061710;
	Fri, 19 Dec 2025 09:30:42 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vWcRG-00000000VxH-3OyZ;
	Fri, 19 Dec 2025 09:30:42 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] tisdk-core-bundle: Update trusted-firmware-a locations
Date: Fri, 19 Dec 2025 09:30:42 -0600
Message-ID: <20251219153042.122828-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|IA1PR10MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: 01cf5dc0-8bd7-4b21-f28a-08de3f1395a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ExsW4tcTyP2kDW5grkSXZIGsYuifmuwLb5EIF3qS6R+UsSgWL2mo3Xr+nfyU?=
 =?us-ascii?Q?S9rjyC08FAAaGaWBpqpFGQ/M/UJP+McG2vPxSQUMfAFpz2kKCbFoYLjQHI6s?=
 =?us-ascii?Q?9EVvpB889C9vo8XmAWA3MaAJi16Qa2y8BG/DyZhtTWY+LsZnMVTm2mMFX47i?=
 =?us-ascii?Q?lqNnMHUk2cTlgFO8VaeZAJrdL9339Jghl07mcPup+AsPZ2XxbSRpW6fmDs3N?=
 =?us-ascii?Q?kYS/t9TuR+zH0QqBIcIbqYiCVkg5/9KDm18OORjpUiPh2ZdYAWXnp8L1stKX?=
 =?us-ascii?Q?nVOO5mYB+aYWqr1/wSdHJVMN9ayf15q1wKlvyNcGVeSxN4ct4sRh6Ld5ybyK?=
 =?us-ascii?Q?Cho5Ql9ETKsn+tuQCLjtzL/dj6ghEBCC3waz14lggc3PX4CsKJtUGTMJ2IOz?=
 =?us-ascii?Q?YvWw0+fIF3Gf8lFgn0QYATRtbcULbnyBxiWK3h3HCnbNz+GXIZtGyJBiIipZ?=
 =?us-ascii?Q?7Oqul5vjw4SiQuHrntZzV+1bP06ErVUz5axXINYHtdXK/BMxvioW8CAO2Yh5?=
 =?us-ascii?Q?wXNO27KQFe6weC7O5A/HSM5vB0DMwzWD6K+9KMYKQ1inq5oLY8D/PaYr9sii?=
 =?us-ascii?Q?SeUrWgUiD4rfOI290eIjhQ62Ea7BDYy94MIwxjLTiqFbh/qWS+lmBuDiY40h?=
 =?us-ascii?Q?As7uzRzGtLhRW7YgZ5rhjxEM/mrHD+KrMbK2nZocWXtHf22dCFK8l2ggw0G2?=
 =?us-ascii?Q?YlLJPJhxAmoZeiACVxVlSCQ18yNcVH+yJEBwx2XyeYq0aycXsMPz0P3pAtiQ?=
 =?us-ascii?Q?q3XGiE+j3bxEJWfJ9X59ijcE1FPsDe9BILSXWaFx2OZnW0LDZcNrXH31gVv5?=
 =?us-ascii?Q?mZNlkeMFQMIr0p6nlqwMlCEG//brm0hO+/foihfpVndl88+i1xcyEx9JIB8X?=
 =?us-ascii?Q?pcyjjfXEZYEpfWybBXlpJemK+F2vLHHBVwvYn1PMgk+NTNm91hlrRw1i0VfA?=
 =?us-ascii?Q?XRRieI1ReHn7JJ5tVWwBVzb9qovU/VpG44/3fjPSCl7+wlVrKSMrIpJce8aE?=
 =?us-ascii?Q?vYK7ECUxnrB0RlzCsiTqXQB7XQaxYNfeKvR/MbfruboZm1+0I3py1EoGzU3n?=
 =?us-ascii?Q?+w8auj5iyNVPv/CoHxtKDufm002whHrWsC8a4Lvp2V2ysXA9FjOlZV5NedM6?=
 =?us-ascii?Q?jP+yg3dU1myOtWtmbKsIXNGtdTp99u4kj0ejx9fnasiGIgR3ZfUrj5Ej3Q5F?=
 =?us-ascii?Q?C6qAY3vxzmHAVpmVZ08dbq3gJpowuaesfFZT+xY33e+E00WRwdr9r7NOF7Cr?=
 =?us-ascii?Q?9PqA1ScvabddAaFXCPOhTJdo+SL6BksT+ZDw6lFbfFqIFTzC6AynPQTvJ4Pe?=
 =?us-ascii?Q?GGr09XqWFMHIc6w72oAbwMew7FFvf0BmAurxBdTWqvZwXRJvrN+wZrt4Vd5Z?=
 =?us-ascii?Q?R60uY7Kw9GFfD8lpwjaSEKUbOE7++4kl9gHKYvFPwJcc7S6she8eKxz1hu6t?=
 =?us-ascii?Q?tgwbqPRiIF/k8aECbqgJEO5zJMmFJSW1l4QxiuJAVSVCqMvPq40svvVYWoOz?=
 =?us-ascii?Q?Ua8uiKrMA/VrehxqpdP54dbv29TjYReWxMEbvRLAIiSoysvKCunI/jlDU772?=
 =?us-ascii?Q?Jsypzd+FCXRfFKcWkbo=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:30:47.9860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cf5dc0-8bd7-4b21-f28a-08de3f1395a7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7516
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Dec 2025 15:31:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16897

A recent change in meta-arm installs all of files into a
trusted-firmware-a directory.  The core bundle needs to add that
directory to the file list.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/m=
eta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 6c2afb9d..ed2eb5ae 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -10,8 +10,8 @@ require tisdk-core-bundle.inc
 DEPLOY_SPL_NAME:omapl138 =3D ""
 DEPLOY_SPL_NAME:k3 =3D "tispl.bin tiboot3.bin"
=20
-DEPLOY_IMAGES_NAME:k3 =3D "bl31.bin bl32.bin Image fitImage fitImage-its-$=
{MACHINE}"
-DEPLOY_IMAGES_NAME:append:am62lxx =3D " bl1.bin"
+DEPLOY_IMAGES_NAME:k3 =3D "trusted-firmware-a/bl31.bin optee/bl32.bin Imag=
e fitImage fitImage-its-${MACHINE}"
+DEPLOY_IMAGES_NAME:append:am62lxx =3D " trusted-firmware-a/bl1.bin"
 DEPLOY_IMAGES_NAME:append:am65xx =3D " sysfw.itb"
 DEPLOY_IMAGES_NAME:append:j721e =3D " sysfw.itb"
 DEPLOY_IMAGES_NAME:append:am65xx-evm =3D " sysfw-am65x_sr2-gp-evm.itb"
--=20
2.43.0


