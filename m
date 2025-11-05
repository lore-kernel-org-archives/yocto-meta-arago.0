Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D64CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 15:50:37 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12910.1762357828051266281
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 07:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=N6cZV7lV;
 spf=pass (domain: list.ti.com, ip: 52.101.43.13, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+I2vr7YY7kCx3jqDS1Jx86punBYH0fEx7ZhSZYSNOIASBsa59CHKZ2eZJcdU4W8Djprf4nGQp/t/PKz0glGrA9/L5Od5lKQ0JXGR/kLfy5eA1snNmPuBWqeNhXOaukviPTLcINo2bjonHbdDbyC++xVvJiubahyNU+PE+xelnOvQlgcJkcVNlFLBwopSBbULF/DpaaTWO1QtjUpglNr5LRXHkO6KSh6g6y92JBdd8EqK4lQsm1sToDrPI6/vKHrNJfGaHNZlYAyZYHU0BkEIZZChipyJ2zaB+k+DUpqEw+zcF5ezzKN36WxS/qz9LydAUYvzYXD3BFk4B6/s/kYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1z9fBf9I63HBlU1FeHiWfc5hVsNizPnNWeTM31T6Mqc=;
 b=EQmAiKYQY41t/eC6vVFnfpewNmSEiNfmYLWUrFX1MfhfcRXhCBwaPfOHbzXgKdbFxDPmBDRqrxNo85FHamVuChCbLmt20yCuJVTEJub8B/dRrpHyK9d+zR5QbC4O3M8W5n8qLW2WUMN7LS53jB5IceJ1g3hzIeLt6+lXixEISFtOriLTPrw91OBksnQASCrmh2YCp2TCiLgtRngHpSwXg2PGS9feYv8PcEM+pwdKJtPC4wpzPTkdqGR/VzUz9GMLScM35MzpPSVl6QTt57rmDX025xmjJGBNIWW0SkPrEkL6iFQnZuGIWl0zTY5yLQicE5mn4dqAZDRpsFpxYPvG1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1z9fBf9I63HBlU1FeHiWfc5hVsNizPnNWeTM31T6Mqc=;
 b=N6cZV7lVz+cNj3dmzp2+2A9arheBLsuD194ekGopWRQva2pK4F76YXS/No12nyKDuLogUkyHHL2yvlHJ48umNWH13dfL24x1H91C12aSSPMRrx7iX3pTQR844VFleKAq8FY1KMddByytPyGOIh+BbDzyXYOvzl+bL5cDkFr9Dyo+PDH7yyV1S4ObZGuCHbxM6MTXOM9Kyz8AAbXoSPwShVpgmCZyXB1FcWtIxe1iRtIk5N3lFDbuAWRZLuF7YDgWcTR/veTyOz4DBozVWZg0pVJoeDcpfFQ3H6hQURQXrm4aCO8vyDCdr6NQYPjR3OtOmj08gcleV3i4iMe+98cOiQ==
Received: from BL1PR13CA0132.namprd13.prod.outlook.com (2603:10b6:208:2bb::17)
 by IA1PR10MB7200.namprd10.prod.outlook.com (2603:10b6:208:3f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 15:50:25 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:208:2bb:cafe::18) by BL1PR13CA0132.outlook.office365.com
 (2603:10b6:208:2bb::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Wed, 5
 Nov 2025 15:50:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.0 via Frontend Transport; Wed, 5 Nov 2025 15:50:23 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 09:50:21 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 09:50:20 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 09:50:20 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A5FoKgb087144;
	Wed, 5 Nov 2025 09:50:20 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id CBC0B142D3E; Wed,  5 Nov 2025 09:50:20 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] websocketd: Update to latest go build methodology
Date: Wed, 5 Nov 2025 09:50:20 -0600
Message-ID: <20251105155020.638790-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251105154712.22069-1-reatmon@ti.com>
References: <20251105154712.22069-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|IA1PR10MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c80f6b4-18e0-4126-b9e0-08de1c830831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|376014|34020700016|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SQe3T1E1XV04m7Ejl1GVrhOKwJuboBfX00s8nEMl2SSljqiljvqu3g4Bfk4Y?=
 =?us-ascii?Q?HNYCX7HII5XRjOLyxKfAgyuTC/2NJR/UM6Mh3ol5eRsubOWENvQKtQuv8n2v?=
 =?us-ascii?Q?zvCVmZFe6YJ38aE7fwfufU6y/DF0642CJwKVYiB7HphyK017nrlHAYYmLt4r?=
 =?us-ascii?Q?eb4K+/X1FqWXYVj78uOACaZBrUSR9KhQetb12JFvhuKyULCfkslyAbKMSOTb?=
 =?us-ascii?Q?nDG6zAKw9F0Gw7OTGDBhvRX0i0++o1XJOvA+dUr/wbMCrKFxfrpzCzFk6EiJ?=
 =?us-ascii?Q?b+CeHkra8OfCMQ5TX4z114h/W0kkN6lyx++GsTlTHXeaML2CNLddBFAQ6Eig?=
 =?us-ascii?Q?JG7Fdbn0kztz9kBpah15KX3XvTLSqEalHXTeh8nOYIOc5Iz7CT1W0oFcG57t?=
 =?us-ascii?Q?kJIEzvYN8JdcXN+yaSPA10m47GTnIZIIUNBK/U5YjvjKRA8R/uOCCaf701tM?=
 =?us-ascii?Q?xpfih/Su147cw+0PhzfA1Bhl/cGgd68j1IoKix/os/cjf6jo9quqAYakziyY?=
 =?us-ascii?Q?ovt2NZUcsIZBFTE8tuUEY6tyOnAXH1T2H2fWSggYY6cHdYK219ZJI6pEwmqa?=
 =?us-ascii?Q?GRVQUXs4QRODPaj+7Xu/I7qRe8YE1gskM5O8+2E924WXNIi6noTB0scT06eW?=
 =?us-ascii?Q?5qRzeyK0g1mNSCztR1nqJhcsPsXtvJSpbVnlnO6OHRteDSFLTj6zurw3kJHL?=
 =?us-ascii?Q?SKdCtfwEWC5u3weypGGoEedrx1OTTHBgyUG9OGobJLJG54MuY1cGz9ZcsLwq?=
 =?us-ascii?Q?I5/jK7miWHhHkNsYBLeqLtE01sg3T25z/0anlrL1jg9riEf4xmcI+GgYtrEv?=
 =?us-ascii?Q?knrCAHfyKE4N31vkuSeZDqGYFsXioG0pNGUDfEPArndBa9cqR9Ip8Itv6zph?=
 =?us-ascii?Q?0CtWDV3Eo2tlSCxzPcauLrhZF7pYQEfRPtrvCRFWwpBOWLZiyRKdVGDcP4Wj?=
 =?us-ascii?Q?h6Oum8lGijbM3CvFzq7l1/C/7hOb3CmM3m5IDai0+0z4v5gxn8tQOdFF0AQx?=
 =?us-ascii?Q?lCrPMgvFMva3522zjN86XgAI97u5I3HBBC8J/HUxLFMlXbhMXY7CHnVxEljx?=
 =?us-ascii?Q?bph5rZgy1DJcWtzc5T810i7StAKtH/HRI4jmgp3KbVHkumqBAnz1HprTj+po?=
 =?us-ascii?Q?Z9tx6qFlSzXK2qOZ+HtdjWfKcjS5f0svjxMTFUu6Zqym1mzVGcsObijRobW4?=
 =?us-ascii?Q?F9UA3WGc1TyKmdFeaZ/3L5TTjZH+/FIalI+lvF0QVQjsIbaRFC+X02Y5fqUg?=
 =?us-ascii?Q?Z/INHBOe10AMFKw37fQslkIRu91L3Gf5yXAFZ1ZGrxnQ6/0P1NinpqTxKEFJ?=
 =?us-ascii?Q?HP9otvdSrjLcD7vm/1of0dN4dJfKVNVt7AzPULtsIvAz6nZ6AfVpNJ02TgeG?=
 =?us-ascii?Q?RAQqcq/ft8UuPL2k3YOkvVKaeSYQ+JYfzOhjcQ0tU3Nd+AhvlZyhkr7ag8Hm?=
 =?us-ascii?Q?Qr6vcka3HMj8kVsW31e6NR5MYuuHu+eN1gsqoIlb8hcyOX58jPoOkovF7IX7?=
 =?us-ascii?Q?E1if2Tvf76EFtX09EJY+ORY4A4ELRNIGY5ngopyfGtSDktcFGj0FnE7fqLw1?=
 =?us-ascii?Q?HtBcasUcN+aSB5OxAuE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(376014)(34020700016)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:50:23.6368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c80f6b4-18e0-4126-b9e0-08de1c830831
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7200
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Nov 2025 15:50:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16721

meta-arago / na / 20251105154712.22069-1-reatmon

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH] websocketd: Update to latest go build=
 methodology
    WARN: Commit message should not include directory path to recipe: webso=
cketd: Update to latest go build methodology.
              websocketd: (COMMIT-MESSAGE-3)
        patch



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] websocketd: Update to latest=
 go build methodology
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
+From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 5 Nov 2025 09:47:12 -0600
+Date: Tue, 4 Nov 2025 16:33:03 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d0f48634833f33cbda09bef9b95783c7f=
f670115

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202511050400
- Commit SHA: fdd334241193ab16c2b2a3088168de0c5a6f7562

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




