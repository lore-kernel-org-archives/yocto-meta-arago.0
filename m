Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFA1C982F3
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 19:03:26 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4825.1768590202454737026
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 11:03:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=SLOtZKpB;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.28, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azyHSnAXIsWT62v9Xo00PQzEsyG4qw57LgowhVoXl68McRNrhPl6wyjF2eNMCxY+BTWJgmplfZKD7Irw88EET9grEPnpD8I1VqgA+bXnGl7gZnZUZaeDBuBvaemsBXvPa+lJxvNOL41KZKCIJIA+Ejr9bFG8fShOGD3nNCIEoDqp1znski/tlZazzC0FPOLE6p4WSA9N5HVBFpBGCiEkNTzbNBYnrhI0tht7q03WSw2aL9bRJMQDc7GQ9Rd+AwVoglBrPbjv/lDmgU5lYT+m4iIgca2M8XvSJk5ury8CBGkaMzuc05icwaF89bi+UaE15ucfS4RiABpPVuKJCS43sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dujaOmxbB2THJ6xGM8qgxpsZHjAJ8/Fkx9a7L3PYdZE=;
 b=lmhqGAj8lQiJiMS683zHUn8wZhYIC7mrpX9VoebxNllhHAcUQ7im//yoHFI7/wvN1tMOs10UTG/eZb74/GWc80xICTEByzQ987+2w0YH7hbxEzs9JcSh59PPZ+h56xVUQeSNPUB8UmH/U3iMz6ppttdAm1a+vq2CulRwcdADD6Vv3r0KDynKKszaAd1aNM1LoG99NZwIluSLPGBrdkScqRvMnQ5ElStvXF03nRuPtA0RIA3IGapbB3r5gQJye8hEn5X/jb4tgsbCz9MlbQ7BRx6c87rGyZhbf7C8mBViuMDtWcjVH8dvAxF2q6HJC0aqwKV2ygP8hgsW8Qhx6rR99g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dujaOmxbB2THJ6xGM8qgxpsZHjAJ8/Fkx9a7L3PYdZE=;
 b=SLOtZKpBHjnYP2kAcvqYqpbMREsC0s/uNlqXM/sda3DjjKpyNnCKAnv8uLa9uOEgSB0/9iwKhWEY5pD2qQVcieSGGoIIrZSuwcw8ibxvMFtg6eRM5IipS01yRlpwpupOwm4Elf0b6bN67Sel/uxjj7zBJLcZW0NW4wrKylPb5Ik=
Received: from PH8P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::8)
 by SJ0PR10MB4608.namprd10.prod.outlook.com (2603:10b6:a03:2d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 16 Jan
 2026 19:03:19 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:510:348:cafe::f2) by PH8P220CA0027.outlook.office365.com
 (2603:10b6:510:348::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.9 via Frontend Transport; Fri,
 16 Jan 2026 19:03:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 19:03:18 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:03:18 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:03:18 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 13:03:18 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GJ3ILu3745555;
	Fri, 16 Jan 2026 13:03:18 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vgp6L-0000000Cm5h-42oU;
	Fri, 16 Jan 2026 13:03:17 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v5] packagegroup-arago-console: Remove unneeded alsa-utils-* packages
Date: Fri, 16 Jan 2026 13:03:17 -0600
Message-ID: <20260116190317.3044790-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|SJ0PR10MB4608:EE_
X-MS-Office365-Filtering-Correlation-Id: e8bc0ceb-dc1f-437f-8c63-08de5531e946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|34020700016|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7gQcw4OBWU2Vvr0zT7tg7qBp/vHxtPnBp0Lh7pnpWGFSKRZyM7fiNU6CSQLW?=
 =?us-ascii?Q?ZU+CtpwukZKz2AX0cAxmoCAjcY0xd3DZCwKZXytgcDL/F/aMtnHoc8Ip/Aah?=
 =?us-ascii?Q?LvnV9JxIPDvRm40GUAGKH/MGPM/dMbeEYxuivhJycFTrlWhteiHHj1cUJfpo?=
 =?us-ascii?Q?7EfzI5ScQ65WpQG/WZhxN+mPCJoALtvDAFff4qu5gO0IKjYVX0W6ZsPgiHLm?=
 =?us-ascii?Q?QGaY83Qvm+pXH/mKsgtaCps77eVymwbVnRFcBTfpIBVCNDCzpkL2e2+oLKab?=
 =?us-ascii?Q?Km8E0XFAqYyOPgbnUfVbu26bmFtWVttW8mlTsR3lV4QCHtj8MFN34fE7YUPY?=
 =?us-ascii?Q?DU5xDTpCx9gLNazEIUpMzNw/9iG6+AyPBwDATcrIBgndHGr93gIX7M1XR9fb?=
 =?us-ascii?Q?NTtfCxexSpZQ1e7ea9pkd6SZUPjsjDTdicWNgpCMzDJxsWagr25AkluES05O?=
 =?us-ascii?Q?b7bFvV+nwaGHlUtuhEnSqTZtAc1Wn0MditHmrXE5MCrxk3Lul08mTs5viceZ?=
 =?us-ascii?Q?+UnTMdLSJDUTPlGnfwTYWY/3PeLRxlkCEvojklbLEcMaGx+DfTgJTMrFyNjk?=
 =?us-ascii?Q?Me9eZEFl0SWmD2g4gJ/Fd/c9HTjeIjWGMIMFN5gRZKiFvrh/L/2x6STCmIYi?=
 =?us-ascii?Q?M7C4TPAAYD4pWFCAtwmrFyTHFj5/dLDZ6G+vw8qeWbC8Y1HQuv21XKLbCLiX?=
 =?us-ascii?Q?73jH8VpIv7HqPlA1H20RYKa+7HSUp6nOyku7flcs99p6g12EdEQycO8gTd2j?=
 =?us-ascii?Q?Zo1swx3uTLimuJwlX0/KlVJ1cisnQKnmG78G5Z/D2xrPe+CxQfvj2nueu5f7?=
 =?us-ascii?Q?XJrpMoFMyoHCrV4/s+KW5qZbPGZ05uUyLhfSIK/D140VwElx3gJEuPFcOtZe?=
 =?us-ascii?Q?cblyS4wfK097T4wqkJXz488/DQKaA6V+TRzsrKQlcCRxCmHe/t8F/6vqaSSX?=
 =?us-ascii?Q?daxOLm2FXO6limgvgBukzMESbH32eTrApdnLfLyeqoIVKVpWrYICmmg3PL4j?=
 =?us-ascii?Q?UjFD1i94NbQqOGW2dfJp3AYD37WAFbUszBS4tB1AKqq8BdZRXW1YJhylf2Ap?=
 =?us-ascii?Q?AYniVQOcleQuTLHjlS/t8yh2fPEHz1PdtHR53MRA/cYyq1XM9YNGHW8GbuHK?=
 =?us-ascii?Q?KsU6EOmVIobD72nuLmXoskFNC8/St411TseE3x5I06YnGCtusgUjlU2xzRAA?=
 =?us-ascii?Q?j6gpe40RuU8Kq3JjkYRnKcKgNh5f81JhKUs6uynggkcPP94KUYL+z7zsDYI3?=
 =?us-ascii?Q?E3rM96uWwKVJQTYbKLWww3QeIT6qeQQv1DWLyKO7jc7Em6+gjxPFmId1xdjh?=
 =?us-ascii?Q?YC1wXSFb9DqZNX9cqvzusrIGvVnniT9FyBueueKNfgKVwAvKUxiiYW1SFsBt?=
 =?us-ascii?Q?plu4+kHtvsmSB+Prx5EqWrNH4403B9fb4L6gBFDCA/hb1OvbggNOs3ssTj3o?=
 =?us-ascii?Q?afJl4EAZVSL+PiWeyMgndy2aAEs4tN4i27YPwM7bfN45+2wHINc8ag6ATe7A?=
 =?us-ascii?Q?eXOnGdb9SRbcTlblc5DvuBc9MfkRMcjWvmlErGIUR0jSCNNLvWOKzGe7tg8A?=
 =?us-ascii?Q?Bmf65p5UbqEoUhFqzfga8+vncI7cMtuwEY6RQeimGljeekeGV08s3qR1daOg?=
 =?us-ascii?Q?ch6uYQXjUCBUmtigyfaIbLNhotdaHiViiJ5W4s6L8u4Va7ppPg51whQLG3Pg?=
 =?us-ascii?Q?Nkdtpw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 19:03:18.7766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8bc0ceb-dc1f-437f-8c63-08de5531e946
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4608
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 19:03:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16979

The alsa-utils package depends on the alsa-utils-* packages, so listing
them separately is pointless.  Remove them.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v5: With alsa-utils already in the list we don't even need the others...
    rework whole patch.
v4: More package name changes after more testing.
v3: Fix commit subject.
v2: Added three more packages in place of alsa-utils-scripts.

 .../packagegroups/packagegroup-arago-console.bb          | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-console.bb
index f6ec0a05..86cb7585 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-conso=
le.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-conso=
le.bb
@@ -6,20 +6,11 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
-# alsa-utils-alsamixer depends on ncurses
 ARAGO_ALSA_EXTRA =3D "\
     alsa-conf \
     alsa-conf-base \
     alsa-server \
     alsa-utils \
-    alsa-utils-aconnect \
-    alsa-utils-scripts \
-    alsa-utils-alsactl \
-    alsa-utils-alsamixer \
-    alsa-utils-amixer \
-    alsa-utils-iecset \
-    alsa-utils-midi \
-    alsa-utils-speakertest \
     alsa-state \
     "
=20
--=20
2.43.0


