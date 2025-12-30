Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D1DE95A89
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 12:32:31 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63250.1767097942089218383
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Dec 2025 04:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=KtlijLxM;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.43, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOPurpRSdBcqZJUUuOs0PrL80nBN+14g/k9ybamvX6uB2AnGAUdWJkhKjeyTIfQMemLew7vMqcveyLZUhtuvnsQaUQ1xpzdN+TRdCvGSyth8b9IhLYjF622su6LGgD+uqCkHqXcf6lDSa4TRFYB/zKRNyb6IXB+/hJKbuBA3GKT/p6RoQXK+3a9wL8Gr2B+Efe9rKnOCvGes5aXfffNmDEsevP+cpLynIN5JdOnQrdMwbfbtmX1DC0J2KfA6LaBD6oOrh2JnGwMGAOJ7W5jnlsmaDAFxXtqNJYx7PnUToIXMRPXIss7Yp0lnargXsy+27oMuxuymOaIi3bE/LY+xvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSPK7olQTMySuMuA+nCznprJBf1YCFyr78Zpa9k3+Pk=;
 b=cJrVNLh6MsH+IPZFNbt8X/ETTC+IK9rMVUKrKCgAJgUu4B7VvnCbmPsKex9BX6AdTspG3ffCnR8nk2yCbOqUN9FUvEawO0ZXTgHyz6pVhxhAzbJc8rscj/0mSEe/lAQpSC6UhPEuIDkUck/DRxpOzOdNSjqAmA2y38ck5vYDyUrNfMvCwFEUlaE/WTX0tNNaUw5O0hUBweNyspm47q11liQcCn609RiKCEezkbSqYhVYMl0QykujbL0zm/k262rbKQMsbQuOTyTZ5oKFrrTwCKTgFjR4wBxv4OC+2t00EuE3d7R1g+bqylYe9rXxHdceYjlnBFgV+iwDBduIISTlOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSPK7olQTMySuMuA+nCznprJBf1YCFyr78Zpa9k3+Pk=;
 b=KtlijLxMOiOsPpP+hcp0cnKDa7XgCj8cx0zuZMiGrX6bb+/JAU1uMJWEnAY3NmBRiBdVs18MyFu9ANgSJ80d6OWB46Mx3HZA+dLKYpfRk1zgTCP8SlJWtoZdg4F42rKezqvPZTSFZxIra9QLi7FBqwIpbInnHuw4PeblM0JmkqY=
Received: from BYAPR06CA0043.namprd06.prod.outlook.com (2603:10b6:a03:14b::20)
 by IA1PR10MB7240.namprd10.prod.outlook.com (2603:10b6:208:3f5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 12:32:18 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:14b:cafe::e8) by BYAPR06CA0043.outlook.office365.com
 (2603:10b6:a03:14b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 12:32:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 12:32:16 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 06:32:12 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 06:32:12 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 06:32:12 -0600
Received: from [172.24.235.46] (moteen-ubuntu-desk.dhcp.ti.com [172.24.235.46])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BUCW9EI726180;
	Tue, 30 Dec 2025 06:32:10 -0600
Message-ID: <9df5011b-16e8-455b-a66f-971b20762f7a@ti.com>
Date: Tue, 30 Dec 2025 18:02:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH] cifs-utils: Remove bbappend and patches
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <a-limaye@ti.com>, <gehariprasath@ti.com>,
	<praneeth@ti.com>, <denys@konsulko.com>, <u-kumar1@ti.com>
References: <20251230095729.175372-1-m-shah@ti.com>
 <a70bc14a-60fd-4a2b-93b4-0e53b9d1be48@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <a70bc14a-60fd-4a2b-93b4-0e53b9d1be48@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|IA1PR10MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: 5efded51-c969-406b-126d-08de479f77cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CfJ8O0NTVPeTb2Hexj3VN6c+wzBsd5wWcc9Xhvtwz18xI+kw8xaidx3heul6?=
 =?us-ascii?Q?JGE2VvjGmHK+VycXv41D013VKKFY86DS2RXUuhyX14UeCrISYhP2y/ayuu17?=
 =?us-ascii?Q?khw4KlNoYtn34SomqYLECQX/0JfNe3eiG00N1LHkTk6+UjCLHphjE6LzUDo+?=
 =?us-ascii?Q?a0iT5rxc1Is2TM3VlrAKlB90NgyTwzQLDDvd1Dsyi0/cJDuv0LRF5eH09Dxl?=
 =?us-ascii?Q?dOPDLCGK/rmaxjnPadnYIw6PHDzpsszbk1QbQNbt+4gSo0CvI8DUjvPKQDP2?=
 =?us-ascii?Q?TpAWl7WqXYVfgl0iTtopVEpIqpU9Dx+ZQWDHQymns8ZiVx1ubQwblNCQRSJr?=
 =?us-ascii?Q?/98+YQQw3qBcUe08/oHDp0ChlHzx8M8wk23hI3TE1sIFvyCA/+r4po179tQh?=
 =?us-ascii?Q?OzbRbdu9Lg/7d9rsCTxJKLigP870nAQbNcIKUAwa9L9OFHmgdqldOR08vw6n?=
 =?us-ascii?Q?u2xj+YorI/1JQTQPCRMpTqvdgYgL6R8o9esmut+cHwwLG0MVdTwq91YL8ksB?=
 =?us-ascii?Q?Co6F1yKUOvzISrJtXN4ZCRCIEylegON2ZIEUdLYaPG3jOXVlja38BKDJVMwF?=
 =?us-ascii?Q?+qSLT3yIV+kW2u/2azt7Rq5EWSTTc61GePiO+8wBgz7rbozFyEsGaR2JNz5Z?=
 =?us-ascii?Q?0GMRpHj/zlpK9kKlEUdvcc7rpEVx0i5QZM5Dvvpz9Qa9hYYUjymqWJujHruy?=
 =?us-ascii?Q?f0dy/xbPvzrv9HCGp6Jei/jolOZl0sR8KurYOz57kYRwhHqftNLdPf89WqG1?=
 =?us-ascii?Q?gkk1hF1Ox+6OO1Ub7qOCg1ojw4DgJ+BG9EjbItigVZIIMie+Puqf0M7+/xkS?=
 =?us-ascii?Q?7HBrEA3MO7VB4ms0zyixrB2SoS0YyaM1mIERPa+YMhxZJuOiZx0ca+eDe0HK?=
 =?us-ascii?Q?o65C5m3NzAHeNls55Hqxxgo07dBN1iangovJrBzwShXAaJDV/InHATRmXFyD?=
 =?us-ascii?Q?ugzrz4fwCsnIdRkgvA7bUE5TjcWouccY7hYehZu0u6BPAHHxSLylCemSJaRf?=
 =?us-ascii?Q?ajOWSwW26HIHV1lEr/IIQh5E+2VKHsgQTUecF6/lCzWmY96GnvmdMHQiis8q?=
 =?us-ascii?Q?pVkoCg+luR+OPLEC92NdhhEz4dQOwgwEVcWBo9dIsNqdyiL8mI1iG++pfAll?=
 =?us-ascii?Q?aFQNoBd6v7SB4BpXcY3PXwWn6hYdtx7nfO9tDqIaFQZlkxdb9gLWqz7zrgGZ?=
 =?us-ascii?Q?yMsjPa4U1Cq7i2qmrdXiFploPvAQxsMnKRL9WPl+ayl4AHl51aHtg7jDQXAJ?=
 =?us-ascii?Q?xAq99msaQZG6jpdtMjvfPCpCL0JsQmx3aVU8+yAvxPrOzs+E4azs7iuvRVnp?=
 =?us-ascii?Q?lZjwhHaSpEc84f4Sl+levJDIFrFaOBQRei+wtYSVS9EOpXYdovpRssO+Pmmy?=
 =?us-ascii?Q?pHwzvHn3rtOjy8yGrXvBNLn49pIimfIz9aJN5sMRyzuG0gJW0Rg2D5QwjgDG?=
 =?us-ascii?Q?0Dq8VzSeN8b5ba+HwzXSLz0ZYsa80US5QZZYG/nhhNouc95jg9V1hJOa4Ri5?=
 =?us-ascii?Q?aQZnoPJxhUMtKWbDhRgQDkHYb2ESvM8/YyoBTcGWRv58HTzoVmJyYSB6Npeb?=
 =?us-ascii?Q?25JQX9+hnpjDLuZabuw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 12:32:16.7624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efded51-c969-406b-126d-08de479f77cb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7240
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Dec 2025 12:32:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16905

Hey Chirag,

On 30/12/25 16:15, Chirag Shilwant wrote:
> Hi Moteen,
>
> On 30/12/25 15:27, Moteen Shah wrote:
>> meta-arago maintained a downstream patch to modify the build
>> configuration in cifs-utils [0]. This change has since been upstreamed
>> and merged into the cifs-utils repository [1].
>>
>> With the patch now in upstream, the bbappend and associated files are
>> obsolete. We can rely on the cifs-utils recipe from meta-openembedded
>> without local changes.
>>
>> [0]https://git.ti.com/cgit/arago-project/meta-arago/tree/meta-arago-dist=
ro/recipes-support/cifs/cifs-utils/0001-cifs-utils-Make-automake-treat-sbin=
-as-exec-not-data.patch=20
>>
>
>
> better to switch the above reference to [0]?, as the above link may be=20
> broken once this patch is merged.
>
>
> [0] -=20
> https://git.ti.com/cgit/arago-project/meta-arago/commit?id=3D80145206de6c=
81efc0d0ac6ddbeeb5abf3b52581
>
>
> --=20
> Chirag

Oh thanks for catching, will respin with an updated link

Regards,
Moteen

>
>
>>
>> [1]https://github.com/piastry/cifs-utils/commit/25d6552c7d8b9fe2ca9dbf85=
c74c9330e4dd7770=20
>>
>>
>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>> ---
>> =C2=A0 .../recipes-support/cifs/cifs-utils-arago.inc |=C2=A0 4 ---
>> =C2=A0 ...automake-treat-sbin-as-exec-not-data.patch | 35 --------------=
-----
>> =C2=A0 .../cifs/cifs-utils_7.0.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ---
>> =C2=A0 3 files changed, 43 deletions(-)
>> =C2=A0 delete mode 100644=20
>> meta-arago-distro/recipes-support/cifs/cifs-utils-arago.inc
>> =C2=A0 delete mode 100644=20
>> meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-utils-Make-a=
utomake-treat-sbin-as-exec-not-data.patch
>> =C2=A0 delete mode 100644=20
>> meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.bbappend
>>
>> diff --git=20
>> a/meta-arago-distro/recipes-support/cifs/cifs-utils-arago.inc=20
>> b/meta-arago-distro/recipes-support/cifs/cifs-utils-arago.inc
>> deleted file mode 100644
>> index 87b49cc6..00000000
>> --- a/meta-arago-distro/recipes-support/cifs/cifs-utils-arago.inc
>> +++ /dev/null
>> @@ -1,4 +0,0 @@
>> -FILESEXTRAPATHS:prepend :=3D "${THISDIR}/cifs-utils:"
>> -
>> -SRC_URI +=3D=20
>> "file://0001-cifs-utils-Make-automake-treat-sbin-as-exec-not-data.patch"
>> -
>> diff --git=20
>> a/meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-utils-Make=
-automake-treat-sbin-as-exec-not-data.patch=20
>> b/meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-utils-Make=
-automake-treat-sbin-as-exec-not-data.patch=20
>>
>> deleted file mode 100644
>> index dd9c7958..00000000
>> ---=20
>> a/meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-utils-Make=
-automake-treat-sbin-as-exec-not-data.patch
>> +++ /dev/null
>> @@ -1,35 +0,0 @@
>> -From fd5f395514256572c451127006a68483106cf2b8 Mon Sep 17 00:00:00 2001
>> -From: Daniel Parks <danielrparks@ti.com>
>> -Date: Fri, 3 Jun 2022 15:34:59 -0500
>> -Subject: [PATCH] cifs-utils: Make automake treat /sbin as exec, not=20
>> data
>> -
>> -Otherwise, $(DESTDIR)/sbin doesn't get created until install-data on a
>> --j1 build and install-exec-hook can fail because it might not exist.
>> -
>> -Steps to reproduce this bug:
>> -$ autoreconf -i
>> -$ ./configure
>> -$ mkdir image
>> -$ make DESTDIR=3Dimage install -j1
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Daniel Parks <danielrparks@ti.com>
>> ----
>> - Makefile.am | 4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/Makefile.am b/Makefile.am
>> -index e9be6b3..edb1b7f 100644
>> ---- a/Makefile.am
>> -+++ b/Makefile.am
>> -@@ -1,8 +1,8 @@
>> - AM_CFLAGS =3D -Wall -Wextra -D_FORTIFY_SOURCE=3D2 $(PIE_CFLAGS)=20
>> $(RELRO_CFLAGS)
>> - ACLOCAL_AMFLAGS =3D -I aclocal
>> -
>> --root_sbindir =3D $(ROOTSBINDIR)
>> --root_sbin_PROGRAMS =3D mount.cifs
>> -+root_exec_sbindir =3D $(ROOTSBINDIR)
>> -+root_exec_sbin_PROGRAMS =3D mount.cifs
>> - mount_cifs_SOURCES =3D mount.cifs.c mtab.c resolve_host.c util.c
>> - mount_cifs_LDADD =3D $(LIBCAP) $(CAPNG_LDADD) $(RT_LDADD)
>> - include_HEADERS =3D cifsidmap.h
>> diff --git=20
>> a/meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.bbappend=20
>> b/meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.bbappend
>> deleted file mode 100644
>> index 4c9ce8db..00000000
>> --- a/meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.bbappend
>> +++ /dev/null
>> @@ -1,4 +0,0 @@
>> -CIFS_UTILS_ARAGO =3D ""
>> -CIFS_UTILS_ARAGO:arago =3D "cifs-utils-arago.inc"
>> -
>> -require ${CIFS_UTILS_ARAGO}

