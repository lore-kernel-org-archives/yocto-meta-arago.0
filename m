Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51012E95A6A
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 09:57:50 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61629.1767088661793520759
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Dec 2025 01:57:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=U17gdA5E;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.51, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXgUT1r3Zw9Jjaax9WvU5dSru2jfyHTuPxlKKOYL/BunioTu2x5BdfWrlBe8u5+7usQ0gLzQUI6vWOy8Yy8BYOoweF7Vott0U8pYeeafSmv871lkQ6gE2XVrXTK44lVyHfAsvsVnp+AddyMJ3EvBJ30y+36Cs9saM0WAq4cOGXfLoJYrjBTowrqBf+0AmERH/nyuAaPPwNhMWokToRnyZ1XfB9OrQ0PXAjk8eB5sPQRJZkiO2yOKA+AIeLOyV3huCyQSHa5/NCNM/7YI/al+vnTCo2YEdeIW8D8xeDhjfjyjzO9ocuuSZAUuNZhiqsJ6xE2/edDTZr0eJN7AIpXi6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrC29ovGZIvpFChOVKH5rOSM3draZIbqnHcW0HxL50I=;
 b=LN9WL6sE1yQTnRome3ChW7r8hsxUwXG3gsKD4SrHEss29p5kT978KO2rWkiWfHyvoSPr3BFJiOO4BjrB4jNI5G4K0ecLCVyCciPN1upAm0uqD/510hMwE+b227mdRvawWh0nuPIFlJAyK9abh8r5sph+8jJvsIQ+ig+ox8IX/IubMUIPls9z6IXCuzXTnGev40KzqOfkzv4K/kaAv8oZmcYUWVpyVYsP1ZDGPIuGFXgCqxqnL82AxagQrjWCI4646oeTwQsKiYykmiwmZov6WAm7KCwTmQrBYS6JiCHdhokN9mmkivLbfUP6J7MxITNj91zPd8WL+yPYyEgwBulR9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrC29ovGZIvpFChOVKH5rOSM3draZIbqnHcW0HxL50I=;
 b=U17gdA5EhgU0N0V1aIGM2UZ4wMNSPtoqJSQu8hJqb6rs9M6EnP66rMEZV/aseQBsAG9e+JlTkp5GqzRePOPjewA4SEAAaE2KhTMSHxClX+m68iqqDwPShZ4v3C2ZrY4i3WQI28GiWhHra5grMTnwjaL14Souli8WQhZkn62v0ZM=
Received: from BL0PR02CA0029.namprd02.prod.outlook.com (2603:10b6:207:3c::42)
 by CH3PR10MB7257.namprd10.prod.outlook.com (2603:10b6:610:128::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 09:57:37 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:207:3c:cafe::62) by BL0PR02CA0029.outlook.office365.com
 (2603:10b6:207:3c::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Tue,
 30 Dec 2025 09:57:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.0 via Frontend Transport; Tue, 30 Dec 2025 09:57:36 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 03:57:33 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 03:57:33 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 03:57:33 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [172.24.235.46])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU9vU0q566971;
	Tue, 30 Dec 2025 03:57:30 -0600
From: Moteen Shah <m-shah@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>, <m-shah@ti.com>,
	<gehariprasath@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
	<u-kumar1@ti.com>
Subject: [master][PATCH] cifs-utils: Remove bbappend and patches
Date: Tue, 30 Dec 2025 15:27:29 +0530
Message-ID: <20251230095729.175372-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|CH3PR10MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: 13882c69-f80a-4e22-5ce9-08de4789dc34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?766oZjboQymm1WViK3H49up3nplEOea9PsV6TJKVYPMdT/7UiDLqfbmgv/gi?=
 =?us-ascii?Q?JjBSyvzTwcv7oRQrAisVt6XlTpjR0VsE01YkhJg7p3APLpOzf16uJ9mMGAD1?=
 =?us-ascii?Q?GkPa8wMDd5B5oZ2XvRsF4sS37mjkdPVofRvNvu5DGp3Nwl2CZk+I3B5TVFqk?=
 =?us-ascii?Q?2HaCTCEUJW6pGjEZhWzQInQZx8yXlHD4spnhs5u0YGn8NgJ0Z+0jXA+muIL+?=
 =?us-ascii?Q?8CYzbAmC/EqWxGp8ih/kUw918Lajw0Hiarq1wFPMwR51+uv54vgCJYiNRQ6L?=
 =?us-ascii?Q?1WincjdYU6J7hwhcOZzHwaqz2lCHHFASl5xW9IIlliccRNJgbNOTuhKRyvJ4?=
 =?us-ascii?Q?h6TPxyy2U3JoFlOK5woe+yPUJxZqgFI6HxHihJP+sqPgLf+DP0TrJmTWqevu?=
 =?us-ascii?Q?T2TDKzd9SaMhQd1bjPvLQAnRI7YMv4EjUAkDV3eQTzQhkUphG4tphZMn22QL?=
 =?us-ascii?Q?Uqk3Kdt2NsXPGGrqVzPAZ72WhhalhtB1l+24I77W5ZJQmycpRhWBQnvKorok?=
 =?us-ascii?Q?qTZdUt/BqCP30SsB758mCUin70Djfm1UnHDvQkcE+v6OFv4GhOOTEmTvrJKa?=
 =?us-ascii?Q?s/T2e8ld4pUdRbxUyi7qLFdpbPz3P16H28buaZPAokK6dKw0S+XJZLuyeUUI?=
 =?us-ascii?Q?y6OBZvI7QXi+tEyJezfVosVh/aw55V7f9z2VQfaDocWYw29kFl5/SGPr2ugm?=
 =?us-ascii?Q?Rt/B9Xng1mT6vUDcxuUZrVZmibbfZsPLgOEisXO9VLEyYrhuo2l63yZG7pMJ?=
 =?us-ascii?Q?EJPYzSvS91WnNJF6fsKwVJj/dxxCnnE6N5kbU3ANJTwuARXziDc+k0GGZ/TA?=
 =?us-ascii?Q?fncgFdy3He29Ylu8oCzav1xRxt/TA7W89O9hZm3chdNtwtj8pilg/mqgj8Bi?=
 =?us-ascii?Q?ORChKMaMLnZ4wPSpro6Sck3AmZY4s5XE53qYT8s95briM2dMEpaf/qS38DRM?=
 =?us-ascii?Q?pxlV1kZC2BX45/+GnIDsE/tQ+ta3Vssj0ixuKfxpx5HgyuJ24wPAfUYMrhrr?=
 =?us-ascii?Q?ZZnAZs6hAqpQwaqWW/38YqzrPXcDoqrBtrm5x4uVYOBbsOxlZRTvoiDNQWRy?=
 =?us-ascii?Q?HNKH3K1L+N9dAqcdOj3KIOl9CvTHlepbtMNwt5S8FB7wNAQ2nzDtZZkk1WKp?=
 =?us-ascii?Q?wSb7kp3xjv3eLn4UYQqx1nJ8U0JfUusYeteOrF1HRfqgE9949m36alxS+Roc?=
 =?us-ascii?Q?nLPK7bCi/5eKFqa+FGeC6r8Ymw0chZ3sZObVwkrzXG3xrLI2zHq7w+4tf2PH?=
 =?us-ascii?Q?hFiB1XOnIg8ZJVAO3kkRrD0v0YUsptc1ERovaaLTsZpZ0ZZ3mCBVPNCxGrv1?=
 =?us-ascii?Q?0e0TneydnjaV3l9RCeT5ufKxrinV1pztwxx3mAXLWFmBLmoPfKZB6wwj1u0P?=
 =?us-ascii?Q?ggaUxsCByj4uZ10oe2oFEp4TxsD5jfgmwfPRSstJTPSmxiBBBgHyJYEJzLEm?=
 =?us-ascii?Q?6f7V166HbAFnGuQPFFCg9UgP4zaFdePe7+ziiQHIGSJgTBsdPhQmmpyPLK2b?=
 =?us-ascii?Q?PvOOcGcbLzIb8GMvjxlvas2vqORvLXCMdk6DsAQ0ZZ73/Q0rURiOubYSgvJ1?=
 =?us-ascii?Q?tYBDqPvtvWFeS1SnOTg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 09:57:36.2474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13882c69-f80a-4e22-5ce9-08de4789dc34
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7257
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Dec 2025 09:57:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16903

meta-arago maintained a downstream patch to modify the build
configuration in cifs-utils [0]. This change has since been upstreamed
and merged into the cifs-utils repository [1].

With the patch now in upstream, the bbappend and associated files are
obsolete. We can rely on the cifs-utils recipe from meta-openembedded
without local changes.

[0]https://git.ti.com/cgit/arago-project/meta-arago/tree/meta-arago-distro/=
recipes-support/cifs/cifs-utils/0001-cifs-utils-Make-automake-treat-sbin-as=
-exec-not-data.patch

[1]https://github.com/piastry/cifs-utils/commit/25d6552c7d8b9fe2ca9dbf85c74=
c9330e4dd7770

Signed-off-by: Moteen Shah <m-shah@ti.com>
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
2.34.1


