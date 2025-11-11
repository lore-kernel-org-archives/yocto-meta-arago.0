Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27226CCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:00:37 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13355.1762851633596989676
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Nov 2025 01:00:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=uQdSyrCc;
 spf=pass (domain: list.ti.com, ip: 40.93.194.39, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwRzSoPEh4a32OcSQqM357q6yiXTDzhyA/9ViPrOBItETaGUA4fgKhMqSSAlhyZKl/EkEVazlOQ2UG92r/5kNbGPypVuK5lM9l2bs2qCn4sQJiNoqbBpbo+KM2ugTkBhCk7vnKg2pFTs4g2pG5Z8PZ1ST0bTB16ywlX7cAwC8/UzwYPYOdFqEwQhK+0wCGPWXBK1JjCVAQ7RXJVyiotHQxcx2AvWX1Tb4n0RpwRP7PlTWRdECg+cPRM1tnqdz8djp2gfcgIhaO1eeVE3Gsp0L4Bb3sAqkxIfRufiWMg05lUDaFYjx25IxsfCanJH4wvj3RcSiBkMGCS0513Mwd+ZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqKBLiRzYk13v0zBTAT0WlpMK6Bxzi/40xcFulnCc6g=;
 b=P7yz3fxzwN0SXn+exEKtX5Srh7XDNtFGwyUWHbK26zfYIhju/BQNxBSWLcoyfwhlrfiEuXjTy5M2SJ+IFcos2KQZdNxLYIqCkK+mniNDI1qcJvsuLm7n26wvykXcKBRVCJwB9alhulGrt2SuKXfe3+hmwxze3yUyQLNcgc58t2PbLZDyDZDFEKULPGGVjSnjR3SyfLQusMeeXoCobssyZi4gT95VRfJ4iN3bjJQdzM0Q6dIkzOKqd1kavJ+A8tlAbi0yWKKNBBr9N0ldhJYNRUxpBFmgydv94q2dMzGx74iL6/3/jDEjqyONzHXsTXcsq+z/ijaRVj/ya8Q2KiaUpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqKBLiRzYk13v0zBTAT0WlpMK6Bxzi/40xcFulnCc6g=;
 b=uQdSyrCcg4AVbfBkPCOHEbo1QQp3QKJjPnNlVvP9+oquOysidxSjkKkl2rII6/IIsOEpfBQCK9VVGBzwr0C3qf1A2gXc3vANvjS1EB9UqHgfuZlqO5CBGzv9GMfsV0bv+4odfCcIyxXjyyqbzzXR2qJpfXXyYWbQtZj8GV41J27D22YrV2KQ8nJozXBzOSNo0wmaykOh4hqw9LD3KqazGXh/bK3PtLPqkjgPA0+3u8ORfidRk2PxQ7TvutnrdgK5WoVeoug39+fkz/+BdeEsoHwimuAoci58lylEZVOjw72ewvtca4E3lwswQjTUHUHI6wJtomheaI5W9j4D+E55fg==
Received: from BY5PR16CA0030.namprd16.prod.outlook.com (2603:10b6:a03:1a0::43)
 by SJ5PPF15BB740B9.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::78d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 09:00:31 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::51) by BY5PR16CA0030.outlook.office365.com
 (2603:10b6:a03:1a0::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 09:00:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 09:00:29 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 03:00:23 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 03:00:23 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 03:00:23 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AB90Nj51741091;
	Tue, 11 Nov 2025 03:00:23 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 230782A67; Tue, 11 Nov 2025 03:00:23 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202511110100
Date: Tue, 11 Nov 2025 03:00:23 -0600
Message-ID: <20251111090023.3949493-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|SJ5PPF15BB740B9:EE_
X-MS-Office365-Filtering-Correlation-Id: f81f7da9-7974-4d84-4e3c-08de2100c3a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2KPHV4wBXsG9WyHpBtuWP+sG5qfd7uK2zrhlkDuIMkt5m2dYl6fCXa78tsSc?=
 =?us-ascii?Q?ui7BzLqLKO+9VT7aJxPTiHltOw++OnIYTWCktTiRIF9/3cqzBuWuwgbtkGp6?=
 =?us-ascii?Q?ibEDdtXibrU2thuvJRthUXKO2Rixzg3uul7/TI8XlNu2NizHZw55odDZ0RqD?=
 =?us-ascii?Q?KVfn2fG0nTY1llpkOp5pgDBgXZ1J+mBPZqq6+GrPapjnDzEDA3WycMaGNEUk?=
 =?us-ascii?Q?LMTG81IZ7uPkOcpxFxy0ZXSaGSPO/KtRYckfd5NGSQ6zcPdJInrufNrTed0x?=
 =?us-ascii?Q?S8755Lw8/5Wdv+Cy0LR2Z8HWizWUagPloP9F1Sy9sUzIoXLiMtKHAeelKLdM?=
 =?us-ascii?Q?cCB6BHTDFSgzr3PZWB5WiX9CNcBPqjdgVg7DTFvMrM0axoU5Aq15StBv24eg?=
 =?us-ascii?Q?/7oLJRsKtzmtorFlkVNg9Fqz+y2SE7Cv2Fep/DgjQeL39jNTv5S+WirT88sG?=
 =?us-ascii?Q?9ymmrZqf44l+Mxfz4KT5XH+7fd8roWhuul3kjb7M6wvWhRVyB8K+GsML0rUO?=
 =?us-ascii?Q?UcWpH/XTOmMro0RbqoYeiMBan/Oq6UmNnVUYR/0OFPqLNCOqzkhif+VwQQkm?=
 =?us-ascii?Q?BPub08purrjdqanj/IWh1m74X+UsZAf5Sx8Jko9eSF6919XJJQWgZSfeCueo?=
 =?us-ascii?Q?npNrIQiChkX+XR/JX3jb7PFQacbnUeDK2kyEp5UZM1jWFGI9EbVeC9qloTDo?=
 =?us-ascii?Q?2MQBQyr+YLq0sfpxQM3JE1YPy0aE6xjTgKwAf9svNcSBrouNaKeZGQ75xtUy?=
 =?us-ascii?Q?rJIJQmtXQez4GSMnYuGcgVw4pGR67HXJ9zey+IqppPesmRENqZ8rRyy4lMUz?=
 =?us-ascii?Q?z/i8/s8Vvs3Cz3yshdQ7t5ci2nLeLnE4Nr+yPwSZ4tiO2s1569IDT/EZwunn?=
 =?us-ascii?Q?ggUSnQRmZtAdtBu3crZ+lFT4I+X7jNUca5JEhf3FSTrr1vutl7lWl4HFr7Ha?=
 =?us-ascii?Q?/JdXZBmyIpI8e4qDn4QuZozbJ2QHhumjtnHGhFtimnBwNC8pxpGxzWyRV+rL?=
 =?us-ascii?Q?5v7mCDaDQ44PpVjO4A8SdbLIlCW/8StTh4QW5CbRcAMEDGIwloNVWS0HGzeS?=
 =?us-ascii?Q?S09mydZ1GqsMf5WOCIgy/cLuAcUcM++jlFjpmofUXVcj/okhD+jrHOewIdWe?=
 =?us-ascii?Q?iOT7Vz+y7AeUJyLnXysbGUi+KVDp0s9llw6lTCrfKs7+yE4GITRJSYGks3rr?=
 =?us-ascii?Q?h7TI30BYNJUNFrvVsloG/87tO1FUeP6qv8ZuQ5X30Fq+R4hsKZ2o/j2bF7MZ?=
 =?us-ascii?Q?+k+pOphZQiT2+KcfgRBqZbbadmHQrxEkWNv+oxfLF93jxHNolBPSxmfN/TJr?=
 =?us-ascii?Q?fwjY/Qj6DCXrejCw4NY7QeIgx0m47dUPgIc3ZTmt4RMQCQxPZd7cfIMOYPeL?=
 =?us-ascii?Q?aQmrKxEIfM5eVtb9nQUcfrwG952WT6g5tssuv95l9NkSQvBMcMfFZF3nraa0?=
 =?us-ascii?Q?9d6rfWh2/l2/Tsn32Gk5K4szMOI6wIiWMeKLYEjGQ35nTXx3DLNFb6Xv3NAi?=
 =?us-ascii?Q?RmIUki2PziiHSVinyMS7bdA2rWYmx2thmKsH1v/wr8adukC+1dPoboberH15?=
 =?us-ascii?Q?r9H1mpwiOZkSGPDbf74=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 09:00:29.7737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f81f7da9-7974-4d84-4e3c-08de2100c3a1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF15BB740B9
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Nov 2025 09:00:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16741

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3Dd025cd6ccd407e7022bfeaa46eba7c3c9d29d933..989e638943eaa6349e9e21ae37815=
9a635183d1d

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 523d8ff4..5c0d4ee4 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -9,7 +9,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "d025cd6ccd407e7022bfeaa46eba7c3c9d29d933"
+SRCREV =3D "989e638943eaa6349e9e21ae378159a635183d1d"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


