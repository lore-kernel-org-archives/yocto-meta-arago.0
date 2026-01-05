Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6697AC982C0
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 20:05:23 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73683.1767643512982451640
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 12:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=XAIEIygw;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.60, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDJ87PNy8dNcH4y1kaD5rE2fNk8kdiw+iTH7nWK8pZFHp6LMIt+hxQXDFQfa3X8g7Ncl6cUYIJlXxVFWOdFoPiNOtcIo/XM157gbVIBO6WvK8gLGWj1oVFXRoEIYcUyKT6KK6ogK2Zu8rSWJgbrtulVdsZGRTYngpw8bj2RdjCO3Vda590q7V9vN7U6nQHq8WIDbO6lh19ZD0pJCX7O3xHL3b2AhW8FrP7JDX54395kHmRz1lZ7PwfgGXMhuKmEz2YrKClU2YU6c5rRca9Ycjeiwux0p5u/qosbQv7qEngTBDSjaGHdy4HsAksNWJ+r/bs8fJ4Un0hUOxG2bJmYjow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkdF6bCl3xDvjooS3l9+IoqpobSHLIZYCv9L/3tiXNY=;
 b=Z2HTdDJKQFqr7eefkQA/d07bhThNWQoRGQ397rsb7A+5ax3PXMNZ1KXLuq0N65qf7fWu7Dvcr6v9G3QFsXVk9N5h7pqM3RkZfSrBB7JJBJd2HK3qvSzpRy3JTdieL97L8EOhBk0MfIIGe4g/Ck0r56he8RJ7HRf8JH7Tqm0uE7Z+64+QNxqb1BEkr5Qwt/6bNyBnh0Q/RWry60CFARciwjyzFQndppoPy4QFTPsXI9QEwfEMMLEFv/gXeByy0lcb8x2AfcNoYNGz3oW4TIrr5dgu/2AzzYxYdZXc30asep8Q5M1OP8MspcjVrct7oBFEtV1Y8l0hcBHLGZRDSi3akQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkdF6bCl3xDvjooS3l9+IoqpobSHLIZYCv9L/3tiXNY=;
 b=XAIEIygwiZs/bgvtX46TzQHc8empG1/bDevyBOABE7kcocKzRNeXr/RLcoHlIYQRCoY6n5+GczPQ9XbY8iyOzAsNDrXuQvU6OxRH6TZAtRj4sQ6huWnb/UTpe2SvEUrEtUxp6w+EIOmTYdjjNCHpuqXJnjVkchOP/9HkVqBxNNA=
Received: from PH7P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::10)
 by IA0PR10MB6794.namprd10.prod.outlook.com (2603:10b6:208:43a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 20:05:10 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:510:32a:cafe::70) by PH7P221CA0007.outlook.office365.com
 (2603:10b6:510:32a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 20:05:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Mon, 5 Jan 2026 20:05:09 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 14:05:04 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 14:05:04 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 14:05:04 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605K53BZ1831190;
	Mon, 5 Jan 2026 14:05:04 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 2/5] arago-image.inc: Do not set inode size on ext2.gz
Date: Mon, 5 Jan 2026 14:04:53 -0600
Message-ID: <20260105200456.2472163-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260105200456.2472163-1-afd@ti.com>
References: <20260105200456.2472163-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|IA0PR10MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: faa4a52d-1205-4843-d326-08de4c95ba3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ccj/2EU76XWWoCc4oGSsShTb3Xi52kpuShILcvWSvKw6cDT+8dvlrRrLWBF5?=
 =?us-ascii?Q?Gr5LTOWBtkftIvRVHrNu4EoiFkV7x293+cJ1lw8UB5BnXF7SkEvHD1Pa/ttE?=
 =?us-ascii?Q?00VniXNrd8iUsx8gKfleoT9MT4KJirwTSrMujp8xuwDcRSkBLH66/wG0GMmb?=
 =?us-ascii?Q?QeNcEvg1NIDPXhnpnCX+rgViiTSWn3Ob6zuvm9HAdRRcCHFEB2F1Rm9R0Sz1?=
 =?us-ascii?Q?3DT89YIxUIr1nNB/h2hh/UEwi6QYlqQs/2bqScBMYjSE5pmxoEQH55p5DaFJ?=
 =?us-ascii?Q?BCC/Cph9Tqh+ydOGUgw3K4osf3taz4X5C6699p8c1WlOO44eUs/rv7uM8IAL?=
 =?us-ascii?Q?OXqS+AxledcgN1UxuQ4qq2OOm/CknJLo1H5Epk4vtiumfd2KaE60r6U7xp0v?=
 =?us-ascii?Q?FHXGA9jcXNZESlhSB/MT7nAsMjykzXlXdmNIznPrrk6veBI9jZJupfS8FDlT?=
 =?us-ascii?Q?xyfJeFM9i0HohJUNeuWblTLWBC5D/1a6Ki3NBdj4tcK2l6HYH7X3Dlyy92Vk?=
 =?us-ascii?Q?sVrGvJoTH+qYtbQeYVymFhnbBMRAy7VmcDevmF1qc5lWPYwCplfg0RZitDkY?=
 =?us-ascii?Q?OvQ8Um5g137DUgPmAPAWVWgm5W6BAHkbWDaeWt/vXuKi4jV+pZthVpbKg6K8?=
 =?us-ascii?Q?r0EMdNoAmfjK2AQnh1FfiKYL3Zmohc0ixnIpiOMgzf7rwkR3QjAXvGnz6sK0?=
 =?us-ascii?Q?DO7O8XWN37WzzsoPZJab5QNFa/4EJKmY9xTLyvaKf5cg4jF32N8c7k+29Md1?=
 =?us-ascii?Q?5Y6ZWWqxHVD4l2fCMNA25fSyEI81tnrH/T6wYgqyiMOuqg0ITT/XNONMpFDa?=
 =?us-ascii?Q?BcILAWXSZU9CtlV538ySrbZmRJ7zC8+yfhPfu/lM7e7QjLH6iJOsBolpQLn4?=
 =?us-ascii?Q?EwZ9ahzqr9a2aE6zUGJwT9zSxzFw1IUMTarwo3xf2faTCd7/A5kmfZ67j9Ei?=
 =?us-ascii?Q?F/iU0dcuJ3h7kpIJQzKasPd+77rKjDz9MpV3wxU7FDkCST42a4AIHlVMtWhl?=
 =?us-ascii?Q?teVvYMn3sqfda0k5lUAN6L4MXygzXzUUuhvM61OpmwnGElC0JXrQ2xaMlGqE?=
 =?us-ascii?Q?xfcq9PDIpjHigtHlHk/1Pyf9+uun1z/NG+L2oGVlrKm+OvZSOs6svSyZKgch?=
 =?us-ascii?Q?LN8FSDuElLkNxReaUiZAhs6nmensTpAuxtqEWQIUYBZqLLZ2sV7PMsNrsJ5M?=
 =?us-ascii?Q?GBf0yGg5V2yEedg2ErocAkIKIRtXIyC3t6kZ2CQNJALfjIJLYNLtRLbUj9FA?=
 =?us-ascii?Q?JopR7dM4sBZdNROKtSeczkFaDHX7pA/EjCR7a9n2PEY3kuAcFcjh+XCSJriM?=
 =?us-ascii?Q?vraq9+ssgXrRkELFK5PaeLppyUkEO8DlR4gj6qFcmWhebthECjLFAfj4I3G5?=
 =?us-ascii?Q?IRWDHBEurlLup6hKEaGAmOJ9RX2MkeLEDIcewwC39ZjGDCvCG/qlXLvK6ty9?=
 =?us-ascii?Q?Ei0p8Rk1xy/ZA9F+QrJxTy1SR9aiIabl7ss8zPiNQiL1dp9RPiaU5WGadQEI?=
 =?us-ascii?Q?ZBccKUrxa8Wx0oIsXuniWadvLEJT/33XDl1AViKp6bgBZeBW08R6NqZyrkrK?=
 =?us-ascii?Q?NVUlv16zAuBbZs09KY4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 20:05:09.0483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faa4a52d-1205-4843-d326-08de4c95ba3e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6794
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Jan 2026 20:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16915

This should have been set on "ext2" not "ext2.gz". It is also the default
now for "ext2" in oe-core anyway. Drop this line.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-image.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-a=
rago-distro/recipes-core/images/arago-image.inc
index 33dca89b..f4f74310 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -4,9 +4,6 @@ LICENSE =3D "MIT"
=20
 COMPATIBLE_MACHINE =3D "ti-soc"
=20
-# 4KB per 1 inode should be enough
-EXTRA_IMAGECMD:ext2.gz +=3D "-i 4096"
-
 IMAGE_INSTALL =3D " \
 	packagegroup-core-boot \
 	${CORE_IMAGE_EXTRA_INSTALL} \
--=20
2.39.2


