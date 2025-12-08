Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768F7D3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 21:16:48 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3854.1765228599174860108
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Dec 2025 13:16:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=fxtwKxyX;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.10, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nisg18undvjzefh1O5rFu1NDeCi5DY/mevtQofLJ1j9NRdvsmkNoDYsOBVj1pgl2kgIwznYghCrlOTb9bp80eiq/DxHS08dYE0w1D0QOMHTJuN5nPOdfs3xIzJwhu+J6GI+UPh2Aszufyd3MXJgP1fp4elpyydSj0QLYv+OA0OiLO95myRDyufDByoXhWzTWgo4g+Nly+lgkVJXIo0GTWrwyh37Qq1cFqleiBxdhbkCeJ5+5rM99zu37tq+uR2nAvywpWlKM7xM750BogU4IMEBSpyRNo+Z2mvUV9SVyPBYUuKYAc9PuWqBtQGq7UI1qQmm49IMwF5OH+JELkkDEJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xdl08DWACrM29g8ZThld70MvMu1+Je3VxmcDRD0lxyk=;
 b=DO30Bnge9q2cF1+KhdbGvW/Yq6OtCH0k6w0xFviDUWkj117OUL1lwdGyGmwcS//1HcMfQYvQAHQN5ZXQPv+RHPFjKYshEVXTnpbs3SsETpafoHHxEl0qyLDnZ+ofej6KYUDNHbun8zNPS4nVQES2UtKf+v7EY9Kdg48pQuqfF+lZhEd6np3BRAq0u5w2Gw+oKuvMon/9ZGlVzU4q++ByN1bRkxwslBoYhYpIZy93McU44bhLX+7Qsb6bRPVqcyzrtDa7Vq7oorPlcX+cPmBDdMBy2MC/Dxp5+ecvEWuht41Ns7oVzxVBeFLGhnSMVJHG8fvuxOMPgYXJxlUcI3GU8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xdl08DWACrM29g8ZThld70MvMu1+Je3VxmcDRD0lxyk=;
 b=fxtwKxyXK9UUqQtOK1GDi1Nzsj2DogoN8T+WdKeNynAmcqlNnMSL0tQsNOdFuVSvw0bS51uHykzPMZUEIh7Xwiqsz02vo+LHuGnsoG4zkzsI4qV5agB4lZWSEjWV/iFfbqJ/ADJRInvsb8WRlrgUKXvt6lW1al0R0u3ifkatfLc=
Received: from BN8PR04CA0050.namprd04.prod.outlook.com (2603:10b6:408:d4::24)
 by DS0PR10MB6726.namprd10.prod.outlook.com (2603:10b6:8:139::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 21:16:34 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:d4:cafe::4b) by BN8PR04CA0050.outlook.office365.com
 (2603:10b6:408:d4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 21:16:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 21:16:33 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:16:29 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:16:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 8 Dec 2025 15:16:29 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B8LGT8m068998;
	Mon, 8 Dec 2025 15:16:29 -0600
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>
Subject: [meta-arago][master/scarthgap][PATCH] stb: Update false version v2.31 -> v2.30
Date: Mon, 8 Dec 2025 15:16:29 -0600
Message-ID: <20251208211629.3997641-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|DS0PR10MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: a540b732-1bfa-4b3f-a31d-08de369f107d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ApYDNKs5YT5ZA/7SjQ3PZgYH5xK8/+wbK8PZcF1kP+vN1XPYTm6ebs6SvM0H?=
 =?us-ascii?Q?A+lYCRK22J/IuN53JxYJsFnG7MK1OADBjytBY8/25LWya0xVnDqKJ+I0xOOM?=
 =?us-ascii?Q?OkYDnsZt7IhfrJueFkXcIxgMQmzYk6pc+wpBlHUKF8Sd80X2CcCvCzQzoIs/?=
 =?us-ascii?Q?D5t3NLRsvZB5MnJlH/L5P4mYNCCQtFNZutIoWZG7vZfoL4p99UokIyD/Pe3c?=
 =?us-ascii?Q?pyzpbgjLoiirqntD9hOz9ZzIMJo2WE4SiBN6earlv5MN1fkrbSDiRtqH6PPT?=
 =?us-ascii?Q?JOwusjw2VYnslVa1xIUK6yZJtjyIqm9CdLyVAu8/YFlCGPWDoGWItV7HQCcA?=
 =?us-ascii?Q?u4Wbha19JKQu8fp5YGfgqq0xZVyBeNiNmUNap0R/mUHILIeBXScgOXg7z7J4?=
 =?us-ascii?Q?TySj6ejnaYl+oCvyl2ipouaITXDlth/juEYDH+A6n/CDN9t37aZKek0Xc9zH?=
 =?us-ascii?Q?JKPvGTL00GD297bC85TvXkLNZCBVq6Juwxu6qLc2ebaLrRB/TBaWwm2VvyB/?=
 =?us-ascii?Q?2T9CURZ2EaGNgHG3d3aEFK3VK3nU6AIuptocIcpvjxFElhVOks5RerMVLkNA?=
 =?us-ascii?Q?7yuK1knB70X417U92qMHWxx6lWpwcFkx6i7xQMi7bZoDLMBqbdO4Elzdy2Gc?=
 =?us-ascii?Q?Saj8Jv3wvYi0+E4MO4x5QRNovJG+FFzvtXBERsCckSUsPMZxPBa5lcRwSq27?=
 =?us-ascii?Q?3qWv+HGe/nGcwNIwfmviaIaxvFKYsTBjr8QPJsBZpHR9+GcGL4F4bRvQFb+/?=
 =?us-ascii?Q?v4s/yUnsqiOvpaOlqErOb0TA/v9IbWiQxV1PHvfY1J1la0/0xZLs389M/Q7u?=
 =?us-ascii?Q?zwo20Gxaz8Dw17Lkb2xomZ0D9IW/ueMTQBSNq+QXb8rL3rgWjeeemhHYQZzq?=
 =?us-ascii?Q?YkoHlaxDo8Z2mb7QboJzzKg2B7wpQ/WvsJaKHPqF4x3u2G6JxJAwa/9gmsrF?=
 =?us-ascii?Q?9G4HSskUqZ51kFBXF39mcZbSstvHpAdxmTlKzybOGuif561UZXwEliMwdAyb?=
 =?us-ascii?Q?0ZSUt3ibXhHm3dsN0if79Dpef9i0j5N14UYu9JUhC0wVpVYqa9n8iZObpeGl?=
 =?us-ascii?Q?lhW6QrvEWyhKErlTCOeq072nACgS0utsFKGQOMe6o4hkRcrMhBJYEjIxYC0m?=
 =?us-ascii?Q?0pGk+ssxDtvl4Tzj3YJIIn8YYrNvCNss4dpi5le7DWJhu17pSQNUZHkCENo3?=
 =?us-ascii?Q?l6mPvnmkD9sRRpSnQJdveV9rC0oCtiq7zgj3pgWnxXUvns/h2V+o/Xz6eIph?=
 =?us-ascii?Q?0TmM4W0TS5MYXigl3S8sRVAI/6j9YvJ8jPu2YrChs1V3Mq3ozRqoKwnhe8Qb?=
 =?us-ascii?Q?Ikq3UFs8vS1nP8cdcZae894Nshs6kXorhFqJvj++2jAxZF4apMKc3/pjJcKL?=
 =?us-ascii?Q?2ZMZUw/cwKYVG3KLl1SaJ9n8qKVHKlbJcq1f2ejxJn7Ro4ycKDSc0a4uXAt3?=
 =?us-ascii?Q?/Ae920fvVkdQujhcamz1Yugc1m4VDxsSD3LK98FdmJ3cd3pw+inbuIQcpzGJ?=
 =?us-ascii?Q?k1ACI0WeLMbtv2W51zUFREB9deJXesPj9c+XrpkI6UI11kJxWO4pE9JnOWoq?=
 =?us-ascii?Q?ZYeLsKKbjsLX629JEXw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 21:16:33.6489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a540b732-1bfa-4b3f-a31d-08de369f107d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6726
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 08 Dec 2025 21:16:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16872

From: Antonios Christidis <a-christidis@ti.com>

stb is a header only library, that does not have an overall version.
Instead it tracks individual header versions. All header versions can be
found within the README. The header with the highest version is labled
v2.30. v2.31 has never existed.

Also update the commit sha.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-arago-extras/recipes-support/stb/stb_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-support/stb/stb_git.bb b/meta-arago-=
extras/recipes-support/stb/stb_git.bb
index 01443f7a..ecc9911c 100644
--- a/meta-arago-extras/recipes-support/stb/stb_git.bb
+++ b/meta-arago-extras/recipes-support/stb/stb_git.bb
@@ -1,11 +1,11 @@
 SUMMARY =3D "single-file public domain (or MIT licensed) libraries for C/C=
++"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://README.md;md5=3D42144ce827adcfa5170032f0ea03c=
227"
+LIC_FILES_CHKSUM =3D "file://README.md;md5=3Db499fad62f2f8e336bbea84cc94d1=
e60"
=20
-PV =3D "2.31"
+PV =3D "2.30"
=20
 BRANCH =3D "master"
-SRCREV =3D "e6afb9cbae4064da8c3e69af3ff5c4629579c1d2"
+SRCREV =3D "f1c79c02822848a9bed4315b12c8c8f3761e1296"
=20
 SRC_URI =3D " \
     git://github.com/nothings/stb.git;protocol=3Dhttps;branch=3D${BRANCH} =
\
--=20
2.34.1


