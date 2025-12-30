Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E653EE498F
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 16:51:54 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67890.1767113505423089275
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Dec 2025 08:51:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=AYiyj7M+;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.70, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Osmit0CIMyAPhweoGpLTOP3xZh9kCVwtjM97ABAu/xgwWlzU+so98nO4pik34gXxVqtwzuHtdCCV1KmIFHI0xF1bPIYHGO8ZvKDzYDvM1WTVYgsqlslnTtqioP7Rnf5iMnfN66GDwMkC2cd9B6L/K3RUgBaF20aLzyzHAM+MsTvca6C3tBuV8uFiptvospahCzptzYcbX6j0BTIscejLyXMh+lmuviYoG/Bxp1HarOJ7bkYtYrhvc+JG3qvmHrcy5jAFQPnh80cQC0VHoQnLGzHjKqAS/Dd2CD8wXc4xySs0WoMHx6pi0JJu+H0u0t7pz6WSKiDfMBtAwD1Vf7Btaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGDVBPMkv6PsSQzEl0CMi0dUbHrBm3vRk6cW27scxZk=;
 b=K22nPnWbxWN/UtE8gJm8djJVI3u7LuKxPf3/wxn3wOUCIVtFZRU/49WM1Vb2Os46y1u8Y8khmOmOspYPC+jcgDPIIFTtXNdlvbuXqiOjhDeLFUYlRDlGNGlAviUbXC4RN2HzHAFP3uTgcRC25CeziEVUutSyMtfDxnfn4GlHnNndGu6izP7MmrX+nDhuBjcEWszs09xEjvxn/OdkG7+BWONwG7CnB28uRv69ilBy4B0vwzCAiD1Ccn0CoVlCU1Cy5EJLSRwtTXl0gtMqBHVZt8EhTbGpB7jaeM95ElGY3RZBxmQq+gdJh+fsoQS54s8vPW1ypjlvu5wrCdZLd83yTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGDVBPMkv6PsSQzEl0CMi0dUbHrBm3vRk6cW27scxZk=;
 b=AYiyj7M+cCkvxUObUU7ReioQt4ypA7bZZeDkoZUH29yRjLzTVIkXVXsUbl1bqF8khAYTDDIh8GSU6JT5NqSvi+vOJVHnQqyqWE7/YH2TydT4ELHQBXWzfy2AFwuvyNWyONpkpJiz/ojNSVfVsSIAfBnD0lWq5etOlj4HuUkdLOA=
Received: from BY5PR04CA0023.namprd04.prod.outlook.com (2603:10b6:a03:1d0::33)
 by SN7PR10MB6979.namprd10.prod.outlook.com (2603:10b6:806:328::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 16:51:41 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::da) by BY5PR04CA0023.outlook.office365.com
 (2603:10b6:a03:1d0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Tue,
 30 Dec 2025 16:51:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 16:51:39 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 10:51:35 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 10:51:35 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 10:51:35 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BUGpZ9b997567;
	Tue, 30 Dec 2025 10:51:35 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vacwZ-0000000Ei0w-2J4D;
	Tue, 30 Dec 2025 10:51:35 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/4] cifs-utils: Remove bbappend and patch
Date: Tue, 30 Dec 2025 10:51:29 -0600
Message-ID: <20251230165135.3505628-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|SN7PR10MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: 695e4f83-c3c4-44f4-4845-08de47c3b417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v+7BSEHLpoHbp6RQktsglHw9jW00zSnsH2y9ugmTwVSzJ7g+fEhhx79oySlk?=
 =?us-ascii?Q?717D/EEtoIo7yYP6dPsgAW6GsFDlC7akp9B42kajpZ1dgu7WH97khYWA2FvI?=
 =?us-ascii?Q?5esAvONa53BmsXVM3pMvZjmJwpAKfwnSJI1hmBjpwRCDgvAnr6kO/p0dQIVe?=
 =?us-ascii?Q?phnfVxOVzNKcyM31QmCzeOzlM03lSXcxf6lPAottNK2PW5scZ9GuscSKnuxD?=
 =?us-ascii?Q?GHfALtXdVITwrYNrjdE3AmhZC60c2JzRpDqxe9cVWSC3lVKYptXwiGT2YKes?=
 =?us-ascii?Q?UC+se2nhtYsP8WM0nhaFD8bAc/QkIYWyBSTLmbLdAsrUkNikn7o341wI+hvU?=
 =?us-ascii?Q?qF60Ll0zpoLZ6FlUkhpF1xDgP7uRN8GT0f+vLK0w8RxFJ4j8iknMTakrE5pZ?=
 =?us-ascii?Q?7pXqbjv5ZA2e1/BsrmPKreFQQEbR5TFWrjXivorNwwlfmEisuZ9yjov4AIBe?=
 =?us-ascii?Q?rp5nn1u7QGj2oG6ENA6w0GWx55gd3SYEVyCBJVKK1VFM4su9UcXIPPO58XuQ?=
 =?us-ascii?Q?ftXXCuqzbKo/J2DhHb7Jjzo9uesSe3HsGesOyybYFk7tF714dlPbeSls0zWP?=
 =?us-ascii?Q?tSkGD6pPGgWjRMeGjpw0DYVzyMtcwEPfhHeW0z7wVkSxBz77rMUoNIcho6uk?=
 =?us-ascii?Q?ZNcwloIrZr/Z5AcrqW/vzQIkYCzBDol2h/jAQpFAJpjlfZct1yAv2YvSunrS?=
 =?us-ascii?Q?ikDQwbbS6FSDxup/Gpvq3Lhq8/7EeueqiVYAIY3Uh8AebRnLSjez3U+7FHP7?=
 =?us-ascii?Q?JYaPQNUmFaKFKcFdcObvHr3N+V04snnaqWKSJth3naHr0npsuyKcHlrpLevx?=
 =?us-ascii?Q?HsqAKc7iK/feFxdCQR8MkUX2k8Oc+OJqR60D7Grz6HhjhLtT8DqjPTT08X/7?=
 =?us-ascii?Q?49uwUc7oayFtMcuxWvgQZHVyhx3BIpL+7T7w1c6yJMRDeicEwdiWaHN1jh4P?=
 =?us-ascii?Q?qaljWtMLnzkQUu3zGmbGODijXDvAspcv/S1dP4IpxYTMIbiDKkISYL7rU3Wj?=
 =?us-ascii?Q?JFS2hB7hj/vwKH8aaHDeppk5i3Jv/FKGhbhpl9CW9wdmeVXo3qGoeYvoZi29?=
 =?us-ascii?Q?Klv6twrGVM58ybKZzEM/YJ8WREWCDHubnotS+9CVKboFrMw44FC5gyqFUaKr?=
 =?us-ascii?Q?hwYIkqo+uy+0oWIcweO8iF5jSwRuPqHC3CR5GIyLnDvnvr8fqPR+ncRUcy2l?=
 =?us-ascii?Q?xm7Z+lChzOG9b/64FU8kHjPEnci+AwUcll2e6egqL4zyS4Gnq0ALEjGi9a+a?=
 =?us-ascii?Q?d/E9/lzU3cWojDwShxDhnwOZkPLSS6nO1IckOMhfFZUct7CnTtNj8w0uew1g?=
 =?us-ascii?Q?05+QB3S0xojzsNdtAvnMSzrvSxDV+wDp5B6c5aGKJMyN1Ng0mz+AOSP/QM7c?=
 =?us-ascii?Q?YljTYUawfjNU2pLjIpGOgSVQLf6t5AIs8Vg+lsxp3+x/uBGmg+mpqq8qNm4k?=
 =?us-ascii?Q?atA1hszT278+2xbaBCy1eP53V9y63Gc5XtxYP7P/VdqZb4l7Yvek/40t6DUw?=
 =?us-ascii?Q?jKV2yc46QSoVxBGzy3/jCe18Ogf5jghnr6TuAcK1i2YtX/tieXQVKFesagJY?=
 =?us-ascii?Q?YbgED0l3x94NJRKg2KA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 16:51:39.8117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 695e4f83-c3c4-44f4-4845-08de47c3b417
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6979
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Dec 2025 16:51:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16911

The only reason for this bbappend was to apply the patch, but the patch
has been incorporated upstream.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-support/cifs/cifs-utils-arago.inc |  4 ---
 ...automake-treat-sbin-as-exec-not-data.patch | 35 -------------------
 .../cifs/cifs-utils_7.0.bbappend              |  4 ---
 3 files changed, 43 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-support/cifs/cifs-utils-arago=
.inc
 delete mode 100644 meta-arago-distro/recipes-support/cifs/cifs-utils/0001-=
cifs-utils-Make-automake-treat-sbin-as-exec-not-data.patch
 delete mode 100644 meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.b=
bappend

diff --git a/meta-arago-distro/recipes-support/cifs/cifs-utils-arago.inc b/=
meta-arago-distro/recipes-support/cifs/cifs-utils-arago.inc
deleted file mode 100644
index 87b49cc6..00000000
--- a/meta-arago-distro/recipes-support/cifs/cifs-utils-arago.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/cifs-utils:"
-
-SRC_URI +=3D "file://0001-cifs-utils-Make-automake-treat-sbin-as-exec-not-=
data.patch"
-
diff --git a/meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-ut=
ils-Make-automake-treat-sbin-as-exec-not-data.patch b/meta-arago-distro/rec=
ipes-support/cifs/cifs-utils/0001-cifs-utils-Make-automake-treat-sbin-as-ex=
ec-not-data.patch
deleted file mode 100644
index dd9c7958..00000000
--- a/meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-utils-Mak=
e-automake-treat-sbin-as-exec-not-data.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From fd5f395514256572c451127006a68483106cf2b8 Mon Sep 17 00:00:00 2001
-From: Daniel Parks <danielrparks@ti.com>
-Date: Fri, 3 Jun 2022 15:34:59 -0500
-Subject: [PATCH] cifs-utils: Make automake treat /sbin as exec, not data
-
-Otherwise, $(DESTDIR)/sbin doesn't get created until install-data on a
--j1 build and install-exec-hook can fail because it might not exist.
-
-Steps to reproduce this bug:
-$ autoreconf -i
-$ ./configure
-$ mkdir image
-$ make DESTDIR=3Dimage install -j1
-
-Upstream-Status: Pending
-Signed-off-by: Daniel Parks <danielrparks@ti.com>
----
- Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index e9be6b3..edb1b7f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,8 +1,8 @@
- AM_CFLAGS =3D -Wall -Wextra -D_FORTIFY_SOURCE=3D2 $(PIE_CFLAGS) $(RELRO_C=
FLAGS)
- ACLOCAL_AMFLAGS =3D -I aclocal
-=20
--root_sbindir =3D $(ROOTSBINDIR)
--root_sbin_PROGRAMS =3D mount.cifs
-+root_exec_sbindir =3D $(ROOTSBINDIR)
-+root_exec_sbin_PROGRAMS =3D mount.cifs
- mount_cifs_SOURCES =3D mount.cifs.c mtab.c resolve_host.c util.c
- mount_cifs_LDADD =3D $(LIBCAP) $(CAPNG_LDADD) $(RT_LDADD)
- include_HEADERS =3D cifsidmap.h
diff --git a/meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.bbappend=
 b/meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.bbappend
deleted file mode 100644
index 4c9ce8db..00000000
--- a/meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-CIFS_UTILS_ARAGO =3D ""
-CIFS_UTILS_ARAGO:arago =3D "cifs-utils-arago.inc"
-
-require ${CIFS_UTILS_ARAGO}
--=20
2.43.0


