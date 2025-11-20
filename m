Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68122CFA451
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 23:09:43 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.846.1763680182085158405
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Nov 2025 15:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=X9RcNC7W;
 spf=pass (domain: list.ti.com, ip: 52.101.85.32, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sT3280NLebCYQSi+WEW+JSOeyDdsmD7z9Uh0pnU/TIqoQ0p52lVrgf1IVTtpGAx3cN5O2IZODHHeEUaluI5/NPqVfiAU+Z00mz+sQQhcXP9NTmZwomLlnZvZfE7d3JzHpz6zrQ1vtoKadxOG2AyftBfroA0/dMsv3ZhD2SOP6GM+EmV6Y9GcUcxwzmAA3i/mYZMVnZ2KSAqFiHp+4rOd7DOmdrrR1lDup3sU1Ubv06nq/Aaaoz0P+xgl/AajRyIIm/wlldUZVl9racZLF1/auIpI8eNPImYiJBA9wAaBntRqO13uW6Jq1RLWUCJD1zPCD/+MrJG6X6yCWLCxrqdnKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAYgm9WYxrR6uiq9RqR1NqNMFstIvamFCHp8s69l6Vc=;
 b=mXJFE4wvkNgWjiPsf2Mu8gZG//ce/0VFhN3nSwU0cAz6pFS+mMaPC1IYmRLJUGxNpo7TO2LkGxgx+ok3xtvVW5OWpsWl8fQto+4PjWujBZtFdXiZohK9zDmefQC5kn7EZr9mJNy23XgL2axeWhxrENmY+7TaG2TCWmATuhnJL/vg0cQaSlw4gauMr0sTonA96XZa0ADkAwlY+4Oiv3/5SP0VFi22m14sHcCEXKFe7DWueyJ+qnAAmzLwxssYy7puV3hpwvzOyAtAORTH/Y6jVCZhV1ePbI28aci1FzEPbYgZzsxIs9j22pkj6iRKRUQD4LnG8GoJV/dR4VO6ZjlRFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAYgm9WYxrR6uiq9RqR1NqNMFstIvamFCHp8s69l6Vc=;
 b=X9RcNC7WOiXuLGwwib/VhAVmiuVXaIdC2ZiT/EhfAc38xpI/CQiZ1sbplY9W0jItb/rsxZTYTagss9MWkLbsXFzl/eem/28UzmGjSGhobnVgaWqBq/AtpkckqwwteXbfP4dzXwj2PFLnsjlcAHa3UR4ny263qBymmbUeqUpsupNo/eKmF74KiEm9O1L2+QJlNTEQk63aqlTZBIM6I9Sq6FzpBvrwakImiznKgxeeakKMfwN7jCdXNG3Ho4g67tXgtZ0yM28SUTCI70BYoyq7PAMFA5O5UhoZ6Jll45/L2X3Uxb323zYWuRyehBhz9daCBvMy8coYPktcfh+ptojTYQ==
Received: from MW4PR04CA0050.namprd04.prod.outlook.com (2603:10b6:303:6a::25)
 by MN6PR10MB8046.namprd10.prod.outlook.com (2603:10b6:208:4fe::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 23:09:38 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:303:6a:cafe::b9) by MW4PR04CA0050.outlook.office365.com
 (2603:10b6:303:6a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 23:09:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 23:09:36 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 17:09:32 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 17:09:32 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 17:09:32 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AKN9Wwe3134784;
	Thu, 20 Nov 2025 17:09:32 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 0C7032A6F; Thu, 20 Nov 2025 17:09:32 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202511200845
Date: Thu, 20 Nov 2025 17:09:32 -0600
Message-ID: <20251120230932.1485293-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|MN6PR10MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 375358a0-9af7-4866-fb2b-08de2889dfe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bNcBH8iwJiVyyFAFOwMVpfWCajLsNGJWJ2il8SEy7muUCufQlcJTuTbCZqbo?=
 =?us-ascii?Q?Dq3Tlx+ZxhHwIcWtC2O1HlnGRBjhRyRtuVEpMApHzxk6+UaN4S5UC59G9iYN?=
 =?us-ascii?Q?kbuia3srX14LNzslxBVbygqe9zkvimjUIx9JjFzfmP6ge055tenFeDJv5VWF?=
 =?us-ascii?Q?lFvmDnHOrAlAnQfhN/kECJGaNp1nb27D1YuhZUGoglv8Q7fvMZkxiZb2tLcL?=
 =?us-ascii?Q?x+TgFyXFc0o7P45vBrvuQ8O2BQW+6YBnlcec2cA3pKcp92uvCAYjPNBMMYqt?=
 =?us-ascii?Q?uJ64+ylxX7a8S9Edj2GSvfzQz+qEUo+FpHWw0flHF2bYTCwqsHRZl79vtz0t?=
 =?us-ascii?Q?49lweof/7C1vpV22lqAa7F2hMoipBBE6Ui1eXW+2Qq5/ZqtQg31VdpiF+CT8?=
 =?us-ascii?Q?3ilcTbSQO7ZzUOzbvGCBc0qtWsqBLyZKtDPMKqE3co9TFidfpAPVyaDOjruX?=
 =?us-ascii?Q?W4PJDyFg7TfkTj6HTkr3OBxdOtuT3I7eN8sPDRZhElrA4qSlsNZvqz9MwTII?=
 =?us-ascii?Q?m4KmrD8SdTnGzNFcJfC0JDJGAH9A+sI6DUty/qdwkgP0dgAA8BsyWJU6O9E1?=
 =?us-ascii?Q?n5iTt/bTjBpVwT9OJSZOKmIPOIqlVzfyxfWh0v3g/Y8HN1Cc5T2Gj0ziw2Wc?=
 =?us-ascii?Q?PMHOohowQl/2RawRNV+oq1rvoyzUKPQ9JN/ZnYz2wEg/AtbAwN9YI1wi2Zjf?=
 =?us-ascii?Q?K9dAYIZV6FzjZ9gmavukOk35J3lseni4XWAcN6p+XIWCNQK+lBS4Hn8Hbmpp?=
 =?us-ascii?Q?P9FL0Z9TRsZ//7gyrrJUQHO06G19UoPcJ6fwc8hush58nbtoM6hlSILQlEto?=
 =?us-ascii?Q?UlHBZ5hySfs2pw5zf1hcphuNtC9jHeJmOJ1JfhuzHXYCGpJdvphlaXltuUa3?=
 =?us-ascii?Q?VrkWvmj/So2purgfvi5c5aIaNfMT/vmmYVOAUNAqUJgdX3L380RzJI63C7N+?=
 =?us-ascii?Q?TYNdMTVFTwxnkUSQwZjyGSDTkTSIyVF9FDUOvSmWJUE1aWxhiJ593kTYa0/y?=
 =?us-ascii?Q?5wp3vEh8RpqiMFQYcatkNDfQ7dGuSwTT/vouke9enxhH13zPJHalwoFuIMKU?=
 =?us-ascii?Q?SkQhZ1Tv+F80dbRnnLRgk92egJ2AEM5/h/NBszvnEJRq6h1JgxDTzRlo6KJn?=
 =?us-ascii?Q?K0kPx42NMFw4eUb7YgqvQIlB4NkhbHXo1lUAARIgt0wJ3Ap7lSf5WYv4Ledd?=
 =?us-ascii?Q?oGqXZy0vMdi4LGadF+slcwDcVZuo6Xz0a6gzs7NW8aTwaikwMIKoKM+OzSnx?=
 =?us-ascii?Q?kpDSvo/XmNaKUlK3Y8B8NiHbcHoNTpoCA6KD/4km81bWZJNHxEcRMiiBrInV?=
 =?us-ascii?Q?4oDtYhGb6xfLrG61vmFrztAPo5/58cqgr9buzMgSkkPmXVoLmfEwcUcEOAsS?=
 =?us-ascii?Q?d1ZCBqQrfsZeiho0qT9L3ljlT5AJWuSzyw97dlgqDLmSf1xfgnRloifh8DF5?=
 =?us-ascii?Q?+2TxRDN4TXyUaELci26OZjkS6fDYKz7HviNpb6UjEqFrKqFua35bwxD5NVB6?=
 =?us-ascii?Q?9Y5TJ6fNs9Eu+XKvhQHC3I2LB4zXcxx/nm9i08yVojmni5zGrfpUrlq2cm/E?=
 =?us-ascii?Q?gmWC/s1qpZGpkPCwnH4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 23:09:36.3813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 375358a0-9af7-4866-fb2b-08de2889dfe4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8046
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Nov 2025 23:09:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16817

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3Ddc8865d0938e9eb37d662f61eb2db899c7b64bee..ed7695d077a74c374a38bd1e60545=
3c731ed31ca

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index bfa6e449..9bde2f5e 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -12,7 +12,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "dc8865d0938e9eb37d662f61eb2db899c7b64bee"
+SRCREV =3D "ed7695d077a74c374a38bd1e605453c731ed31ca"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


