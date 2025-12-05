Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AD1D2CE16
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 03:05:31 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62077.1764903924911293659
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 19:05:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=hcb9qm/m;
 spf=pass (domain: list.ti.com, ip: 40.93.196.42, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OW+l7EyaXjRTI9r4UE3p4nOxyWePenGu3XgA7qfyr7/eFtD5rVI1Q0BwX4zMLjBcrhciF0+z1TiE52jsrtzhvUeN9Wqm2keYi77kontpamLMNq98T6bgLqNwRyogHX8hHUNchTVE+RiRn7OQZIOh4cdnWupIzmhaMoCa/lQqokpwWGVksvYXFzve0yf1ZuBbOBprqhp+SPrVJUmxK5yVK536m5OLf8CH0yKn+sFUvHCRETXnsKO5dL6KAKI1BiGIT9uxV6FeeLR/GqXOhlcEBs4GHjJc7dDzAhz/6LdwKZcr5VFGd47m1mXiROMbLbEGrKN/pS9i0KD6KrAKdxjH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOx+/yQiOtiGsJSXdV1dRJnrRVebrLKaL8eYHBQ1ZfI=;
 b=yYgXmocN8sZ7azzI/SJpI6KlWe76ff+4C3YJir/6SyB2gYzC6erl66+8xpzVA85krmdHsjS+PQNu6x9UxxnZUxMnSkX7gswROSj5pEP3MOWUha724/G8g84IVvLYg5rSwXq5mye2F55hybONUF5Jc3EGmn7mwbs4T15m3vfMYtoyl62S1knAA11mVEvHyAFmRUba1NgqTvBBBl0A1K6hK1+mhanJTEDUR2S+ltGSkb/33ou9ocj9Nuqwjo097+a7l8xnUwI4dX3mKC4xbMvfJGsnq5zrsZ35XgyKdZ374U6YPVCY80Pi7p/56M4LtNC8XW8Nc3j7K3hny84kc6ZT2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOx+/yQiOtiGsJSXdV1dRJnrRVebrLKaL8eYHBQ1ZfI=;
 b=hcb9qm/mANp1creLD29dpXg3jcNptETzr4J08USZebTkhpCDlORUaAi6ZYExu4KvZnzJR8vS8MOIilDQ9BD6qQqxxGJCg125uvvipP/b4EIuZIIXn0L+4JWJpS7s1YMV2WBVLWsD/4iJDcwkUfxMHIS2/ycwrL7oJ0Tf+Pcl8Nfk04CDHlgY6TNN9pRKzyxaFKr/Doz83Wl3EVAbMcvcXnvkeIU2q9tFESJPSAxS0+TcPt6RJMDvFBHCKUYva94xGm0fJR/KU7r7uXI3NeKaW2zmeQItYDVYIZoP76FkFaEu1D3aKUdKw/8onKGbrV818Utthl1l2P+BnkgBRllF3w==
Received: from BYAPR03CA0024.namprd03.prod.outlook.com (2603:10b6:a02:a8::37)
 by DS0PR10MB6104.namprd10.prod.outlook.com (2603:10b6:8:c7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Fri, 5 Dec 2025 03:05:20 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::5a) by BYAPR03CA0024.outlook.office365.com
 (2603:10b6:a02:a8::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Fri, 5
 Dec 2025 03:05:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 03:05:19 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 21:05:12 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 21:05:11 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 4 Dec 2025 21:05:11 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B535BLb402822;
	Thu, 4 Dec 2025 21:05:11 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 914B3136627; Thu,  4 Dec 2025 21:05:11 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202512041635
Date: Thu, 4 Dec 2025 21:05:11 -0600
Message-ID: <20251205030511.1803916-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|DS0PR10MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: b5d43143-d5c7-4644-1d04-08de33ab1fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?66LUBIhkn23niYy/zrh8YmVPBpoh6YvCZC1E6DpUTkco598EjxsiaEde/gq0?=
 =?us-ascii?Q?e/0t2QB1A3yjMjUQbj4Q7/qpWx3dehfDK6+jWjgfFNqg1mUZ3OqRk0dsmn3+?=
 =?us-ascii?Q?pj09rHEAgYMdPw8QzqR7YpbC2UsOAAdpwbIu0FNpeyXjyiIlJuzrH1vsaPqt?=
 =?us-ascii?Q?4igg1BJTJjoWZr6ZbH0aATZfzrkEAyo6SALdfhmBaglci0xniWjJTSb+nX5V?=
 =?us-ascii?Q?HR1ys8xI8qUFpBO48yoAc1CfuCeVK3BIYmWPq+bDQ1tHNY1y5cA3RvGYIrny?=
 =?us-ascii?Q?35mB10GbZU/J2MtJYL/XClsH+bhKgvU2ZJOpcpocYZLxcsGfnvB+KB6OpyvR?=
 =?us-ascii?Q?+LcrX3vjkhNtsXMOCR3v2VOX14F13sAykaSL2BN8t9Ar6tMXc5Xq5VSJ3BZE?=
 =?us-ascii?Q?1gKOLzKenIZRMCzmuIwfVmLNzH5QpG7kszb6emOA6VHLLMyZCFUn30JvJUxK?=
 =?us-ascii?Q?aFtk5Hc4j8+OiA3pnS5NnxeZuAJU6a/1u5NaoocAXx+2oMuC8lRsIZTmIepk?=
 =?us-ascii?Q?Ay2/FLCqhgv7RQfkAG7bTBbNnH7/G2e0sdd1DSVIvhQ72LAwq7QYAYj78WV5?=
 =?us-ascii?Q?75rJ2/Ldt7/wTtErfGkjB0ti5OGQ2MWY/sipfFnNhAEiwVDdc/PtGtAPpJzP?=
 =?us-ascii?Q?WCMYrz6J9p1T0P8sM133mDjQECbRSG9OKW0frEB9NH6D63USfzQppDSX2CpQ?=
 =?us-ascii?Q?fPuIjpKveXeDaU3B+NujAqGMajGyAlZ8ZnhSD+4cQ4p2e4Rnzp9hwRlvSe89?=
 =?us-ascii?Q?i3G3wxBoU/3Ec0cYKbHBf9LzT3aIfdLq6WrbpHzrx8LiHLHryEf0Es0ZFxJB?=
 =?us-ascii?Q?QTNfEWuNQuijq4N6gRqugsyusL6ahTaAu3sflsBrS7vltL+g1H1euFv466tr?=
 =?us-ascii?Q?pwOe4PKDqkWffzBMcAuPSovXtISwMkBD4Ten2CCUX+DWJdBteuL1ZlkgzBwE?=
 =?us-ascii?Q?CwREvMohDu0Y66sqcy8ZJGwh0psluiQauYCMpV78YUppX8WguGXi5SrzQFO5?=
 =?us-ascii?Q?+4ck4JaKpnHhQ7lP+VkAtwV64O8HJ3DZ4bn2mu2bLJazwvrZfrQUKHrTeO+1?=
 =?us-ascii?Q?6QKSaH8sTnK3/a3XVaY3VMGNzerOwGAW6YPC7bBUlh9VcrCkpc5m/6e6rv9T?=
 =?us-ascii?Q?/99D2i/86s8BUzKJnZZZVNvcXglXaXAQKlZIZLRZe1qML7uE1jQoH78YhxA6?=
 =?us-ascii?Q?Plo+Dgfiu9it/Req+MT2+MmT7MUwkv9PPv063W6KnJAlsqxzoJFL411C4ZpH?=
 =?us-ascii?Q?Wy9RLdJLNHC50Sv40Qz4hAIA87xSwmci9K9DfdNORTZ+YqaiEL8tYISIeGP4?=
 =?us-ascii?Q?syWffUmKe23FR8MYACTNoGgqS4HMNjhiFe+rEBTo/dhJgKS1/kTX4iPaNMCZ?=
 =?us-ascii?Q?qW7nGAW+edrZzJlybXzeQik1g7s/6EJp7GIIx+QbDjkCmP0oo2zcit9YKUUW?=
 =?us-ascii?Q?8F7fx1PWK9Ion4tOr6hNl6DQW6Ukyh42a8AEXHKdaO9CvE49tMiDI80iVa9F?=
 =?us-ascii?Q?uLX3ZyIRNfg+9dm5kpE/af9XumDqTQhsjDPMF19es67LdkoNdquOdJobCKhS?=
 =?us-ascii?Q?En/Wd4cCI8MZdOAY+Dg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 03:05:19.9106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d43143-d5c7-4644-1d04-08de33ab1fe0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6104
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 05 Dec 2025 03:05:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16861

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3Ded7695d077a74c374a38bd1e605453c731ed31ca..d6180b2718b632cb8de3be30df98c=
33f9cad87a6

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 9bde2f5e..60d5d50a 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -12,7 +12,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "ed7695d077a74c374a38bd1e605453c731ed31ca"
+SRCREV =3D "d6180b2718b632cb8de3be30df98c33f9cad87a6"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


