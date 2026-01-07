Return-Path: <a-dutta@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903D8CF6BED
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 05:22:12 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8718.1767763322197658151
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 21:22:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=oPKwxfFR;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.41, mailfrom: a-dutta@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+4/EW0VC4x0L6cEq4KNPfmeMaFvUaFryoxpBKci1N1nZcnEJkScEfs6OFr883gY25Ysbk6EVmz/ZHD2PTKSwT4zAGbJsD00/QTxsobWEvu31WSBhrlCWY6AGGbZIc1TyVtNzX0C3rDyGkhmIb7A8Dx7WhFFJdSTGKS7p5lTpGDzNA1WEbTLBQqVPJbWgNPlLlI+diaqqO7otd+d2DGvtbIQGln9c2j5kZt71fcQnfbH8b8AmOz/UXOGgKqFABb6LFkv78DOUsiUy3VQTl5tsewHO0oAYJh5nwgvyu0gmNwfLN3slkByBjRITt92BNeqm98B0i5C5WJMVE8NsYlj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Zz4sSjSMXzP3BvoJEHtwAYz1A8bFgeA2F1ygxD9stg=;
 b=t5WU62ETGhsuWpMmM7HjPrMzE7N6Gcx5kNTxTEmE21sfhDrl7aCsQ5c28ukjs/cRWXThhL06oGR4qWrO9Bx2CdCHBPRilkYriGIMuYTyZxF+Qw6IPFK5H1VPeDzbt9YbTSTG/tNI2KvZYGX9yVP05DdVfC1K4e19FAmNhmA52Yn0mmtmcMGKGeeOLvgZMWHldlM0Rie93qczm7wSCx2bK27Q43geKcESpU8kLdlj2Fvh++12rUbCCriPrh832E/DwwoHn3Dwo5LQ+qEotUTrHf9IIAJ1CbUsKAaWtN7eRhJyeplOPJnxAfSafOBnhQTa3JCEPaYsActjGU2Fak+9yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Zz4sSjSMXzP3BvoJEHtwAYz1A8bFgeA2F1ygxD9stg=;
 b=oPKwxfFRGxjr6gXzKtz6mHmy3dXqcdB0dG5RN7y4gx1Ndak0m8zBaash7ayUb3Ow/RUt8LZdpREF99JGuC27TUeCb+xQW4zcXOVBRG/IB+SumtjuPhYeJpIWLB/rENGFsNvDW8sKkHswTd3/AXnrtVOOMcabRq/vQLdgtgEZiYI=
Received: from CH3P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::34)
 by PH0PR10MB5817.namprd10.prod.outlook.com (2603:10b6:510:12a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 05:22:00 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::19) by CH3P221CA0014.outlook.office365.com
 (2603:10b6:610:1e7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 05:21:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 05:21:57 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 23:21:57 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 23:21:57 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 23:21:57 -0600
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [172.24.235.228])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6075LtPs4053159;
	Tue, 6 Jan 2026 23:21:55 -0600
From: Anurag Dutta <a-dutta@ti.com>
To: <reatmon@ti.com>
CC: <gehariprasath@ti.com>, <a-limaye@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] meta-arago-test: recipes-core: Add udev rules for MCAN to meta-arago-test
Date: Wed, 7 Jan 2026 10:51:54 +0530
Message-ID: <20260107052154.1598698-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|PH0PR10MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: ca092414-79d3-4f59-4be0-08de4dacaddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?i2fOl1CphwSz8XUPqMYc/U1l7jgvJR5TnOU73asmWnpTTggBxIyOoPWtsgnk?=
 =?us-ascii?Q?1/t9Ofe7CN7YKX2JkOPuXADvmYFf35VKMvQakL7vydVRYFE7BRUmY/ii9Uku?=
 =?us-ascii?Q?bYhTUTA/6Sykme23g1vTaHourIYMvu6+x3X95oi9vc0kaiOpVkbN45S/6nxD?=
 =?us-ascii?Q?xlq9x2Ed9praoEKNuRJpwaSzBDSPw1IcTVg+rKsV+bVGRLEfdDCyETWQuPEs?=
 =?us-ascii?Q?CbFyAPDSDI1HdZocKs0LXmgJXVas6jR/emOJVXcyGxIgQLeblz0HOLk1X/5l?=
 =?us-ascii?Q?qqgG5fsW1P8F1a/Vwcza6F1ZwEgPe2c8Xv6QSUzlxrxpj5oyWsLA5UySj9uT?=
 =?us-ascii?Q?fA7vUAGIAZQCCkwbI7xIZAvtQweaSPFb82PXTUYGuN+w7oX6DQVcDAq4DXUA?=
 =?us-ascii?Q?XZBLLnMoc5hwGkcmZM9ABEIJcJiARNdSZDK4X9Vm9zUhj+ICsw+xJHjSIFco?=
 =?us-ascii?Q?6sqSLNBhlBabmPGjOGCx15SsI5qeirguHXwR1jACHEc0KxCZQ0CltP2MHMid?=
 =?us-ascii?Q?M6ZWTLJZtzMNdMJ4yVvbSmuM+S0ihAUgTo0Fi+LBBXKValRopz0eQF3cwVQK?=
 =?us-ascii?Q?LsRxIwTXUkopJAyyiwp+W+rzB7XLqS5mZ5IjlmwIWcPgpVAwD4kSBZ4UoV+L?=
 =?us-ascii?Q?WP5ZaReM+/ypc4xjX0CFQH9BmZvM5LkTx2vJ2qwJeuuli+2qCnvrtxUArjGc?=
 =?us-ascii?Q?Gc8k8QVx4LcXWb68bcQorpSdhyQiav/YuqsCcDigPQsuWMQjiMYuuHZB2wq3?=
 =?us-ascii?Q?EI1UHWbV/eJt9rKgpUbIMgRYC2Y2Ttf956JCV1SblxdRIkkOPc/wqiS3NTP5?=
 =?us-ascii?Q?LVZzSY/EF4KBeExwy0VE2FA6jqQr+2aTEJAZ/zJlNZmMiW/Hn2lDaDMrjkJW?=
 =?us-ascii?Q?7uFX7lXfpSLauW9DMF4AgPxYlrdazUVLiQd1g2Xq4oAtkRNNUft7O5a7BJ/M?=
 =?us-ascii?Q?AvX75C+ArkJBzJkWMsXsg1L4TM0sjyy0EOF4lstNfjqNRXJxZ77MZNWJC3Xl?=
 =?us-ascii?Q?DeQVF5NfsIRiBg5rIKvJizCuC8gStSgqucvvYDlrV1MVwYWzBSgkvZ554sbt?=
 =?us-ascii?Q?p5AorfDUB0cETJt+IqvB8bIcQ8XOJzO7LmhrveqGiwgAYEknt1BxcRaFGRWa?=
 =?us-ascii?Q?ShEA18tThuxzzOP1YUKW9Ra35CJOLZbkVq3CgwpNp2UDE7lbk2bE0tDEdwcU?=
 =?us-ascii?Q?66rqAICbs4Up4SnW9NcAOugklFONA9NhzIEjEwvCRvaeByBC4YptO/JCbZyo?=
 =?us-ascii?Q?olTTpDKPv0DRVZ/1Cp1kzHpUJe/g+QkD9uyUa41dRfjQCTcfW2rPKVC+1pUO?=
 =?us-ascii?Q?Irg07pDJoKaDgzm3q7AtQR1V1sjWVb4Y3FyEXjX57PbMlxMdXzC4Mhvszzaz?=
 =?us-ascii?Q?2bU1SOwfe9GHtM1BtpZbfQBsqzUhI1zpWA4Yz3I9iU6UxuoQ+D45Yqxw9jME?=
 =?us-ascii?Q?Lmi4dRGI8zvgeHKSt0f8ImestjKbPQ++3NgcY2pOSaC2TEciFbxRixF/lvIV?=
 =?us-ascii?Q?Tdi7/+rAhK0PM04s5ROut/Rnfz6RBBOYby66viTLZHlcslcsOgT1RNxhUvjg?=
 =?us-ascii?Q?gjVY046Elf8ZYkDRMS0=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 05:21:57.8746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca092414-79d3-4f59-4be0-08de4dacaddb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5817
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Jan 2026 05:22:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16935

Move udev rules from meta-arago-distro to meta-arago-test so that MCAN test=
s
run successfully with other distros such as "poky" as well.

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---

Link to v1 : https://lore.kernel.org/all/20260106060815.868724-1-a-dutta@ti=
.com/

Changelog: v2:
1. moved all the rules from meta-arago-distro to meta-arago-test
2. removed udev* from meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-base.bb

 .../recipes-core/packagegroups/packagegroup-arago-base.bb       | 2 --
 meta-arago-test/recipes-core/packagegroups/ti-test.bb           | 1 +
 .../recipes-core/udev/udev-aragoconf/37-can-am62.rules          | 0
 .../recipes-core/udev/udev-aragoconf/37-can-dra7.rules          | 0
 .../recipes-core/udev/udev-aragoconf/37-can-j7.rules            | 0
 .../recipes-core/udev/udev-aragoconf/37-can-ti33x.rules         | 0
 .../recipes-core/udev/udev-aragoconf/50-arago.rules             | 0
 .../recipes-core/udev/udev-aragoconf_1.bb                       | 0
 8 files changed, 1 insertion(+), 2 deletions(-)
 rename {meta-arago-distro =3D> meta-arago-test}/recipes-core/udev/udev-ara=
goconf/37-can-am62.rules (100%)
 rename {meta-arago-distro =3D> meta-arago-test}/recipes-core/udev/udev-ara=
goconf/37-can-dra7.rules (100%)
 rename {meta-arago-distro =3D> meta-arago-test}/recipes-core/udev/udev-ara=
goconf/37-can-j7.rules (100%)
 rename {meta-arago-distro =3D> meta-arago-test}/recipes-core/udev/udev-ara=
goconf/37-can-ti33x.rules (100%)
 rename {meta-arago-distro =3D> meta-arago-test}/recipes-core/udev/udev-ara=
goconf/50-arago.rules (100%)
 rename {meta-arago-distro =3D> meta-arago-test}/recipes-core/udev/udev-ara=
goconf_1.bb (100%)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-base.bb
index b80697e5..6df03e60 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.=
bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.=
bb
@@ -21,8 +21,6 @@ ARAGO_BASE =3D "\
     ethtool \
     bash \
     opkg-bash-completion \
-    udev-extraconf \
-    udev-aragoconf \
     libgpiod \
     libgpiod-tools \
 "
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index dad5571c..47f8fcac 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -104,6 +104,7 @@ TI_TEST_TI_TOOLS =3D " \
     input-utils \
     ltp-ddt \
     openssl-perf \
+    udev-aragoconf \
     uvc-gadget \
 "
=20
diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-am62=
.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-am62.rules
similarity index 100%
rename from meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-am62.=
rules
rename to meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-am62.rule=
s
diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-dra7=
.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-dra7.rules
similarity index 100%
rename from meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-dra7.=
rules
rename to meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-dra7.rule=
s
diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-j7.r=
ules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-j7.rules
similarity index 100%
rename from meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-j7.ru=
les
rename to meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-j7.rules
diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-ti33=
x.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-ti33x.rul=
es
similarity index 100%
rename from meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-ti33x=
.rules
rename to meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-ti33x.rul=
es
diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.ru=
les b/meta-arago-test/recipes-core/udev/udev-aragoconf/50-arago.rules
similarity index 100%
rename from meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.rul=
es
rename to meta-arago-test/recipes-core/udev/udev-aragoconf/50-arago.rules
diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb b/meta=
-arago-test/recipes-core/udev/udev-aragoconf_1.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb
rename to meta-arago-test/recipes-core/udev/udev-aragoconf_1.bb
--=20
2.34.1


