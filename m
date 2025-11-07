Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F174CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 17:25:34 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4707.1762536323372721896
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 09:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=HhToD1gM;
 spf=pass (domain: list.ti.com, ip: 52.101.85.3, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IlnIXcHsjrWq5zqjEYhEIFB1Z/YMmzZjatc01//cIsfgoncQy+mmsHIjqIj6tXJbFv1uiV1FaMjMQL/iZmlhhyrDh/5W1FVBDiqtbwdMPiM7cbJBNHU63a1qd9Ngna2TPhSKd+U1KCCYprmy30VX67cYqyrqIWCPR2HMIOm1toUqlOT1ORiDr3BfhrjAyRo9SXVi8hoFJoFIfSoaEQFJqQQ9KBbCyE5koGnP9kDvioctpL+X1HF71Z3s6vLARpuJEo1qbODwLLt0MC7OqBY+wUY525a65l1k4q2X4ktDsNVp+UJk5qJBhCkRYDAJ4f7w6iEBPmPl3rdNP1Ol6KiMZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLXRAHq7vcC7lsKJoVb+UORSMIQxZcAsJpMUamxZN8Q=;
 b=jUd2WH6gGeLnTMElyPFG3FtlTB/ssHF+ZSISk3EEX8hhHXtUD4DA+3Pmd5mJ/8tIxWpbbqilZq/o5U5GgY4cE8jxtt6jWFt7gBy0mr0Nh6a3Q1WiHEuZohWC/on48dpM5kHaUooP5uBNO2V8LYPRB7DAfS+4g9zPVJN+kJsdcYzxxtpEDSHTTqS63WpJmf7DrsteDSWqgRLpkoqqtIJlYrUsWmPJXywj2/Fk6FTOFk1OAfu1V/N4MsHdsE7BOeEqJZHmnwZRF12sD+VR3RcHMWcLEC3VOL6UBzYPxzruHAuYu7pm4svQ36K8OrE8T1SoYy8PAFnRfJI8BkxkhnRP2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLXRAHq7vcC7lsKJoVb+UORSMIQxZcAsJpMUamxZN8Q=;
 b=HhToD1gMPZbhR6as3qbOtw3U9BIqLFTDMO2hkkJFkCjv/cwOJU3MXZ1PzSITKtWW3jOVrGroyMzDKUjc9xBYesZp+WoXwKVtRYAJtp7cLr5DNnQT4jcPpEsu2hXf7rotUXUrKWSxsy/7heDPoUfeA8TSOkYJAp8YkJN1MbMWod4kq9lExnHcHlopV2UWvvnvFfJNTkKt9xESeIyBQmyHC72SGzR2zp0DW63opX+cXhJYFQNDBbw6AW9bGNF33iPuALT/igG6CAqSaHjO2HPmjMxZIAR/41Gft3zzoWXgBuqJSTJmm0qBt/yJXUP25TX7G9KyhJo8YznKXAq5UURGVA==
Received: from BY3PR05CA0059.namprd05.prod.outlook.com (2603:10b6:a03:39b::34)
 by DS0PR10MB6726.namprd10.prod.outlook.com (2603:10b6:8:139::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 17:25:18 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::e6) by BY3PR05CA0059.outlook.office365.com
 (2603:10b6:a03:39b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.6 via Frontend Transport; Fri, 7
 Nov 2025 17:25:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 17:25:17 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 11:25:13 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 11:25:13 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 11:25:13 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7HPDOg2251546;
	Fri, 7 Nov 2025 11:25:13 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 830589ACF4; Fri,  7 Nov 2025 11:25:13 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] cpuloadgen: Remove this utility
Date: Fri, 7 Nov 2025 11:25:13 -0600
Message-ID: <20251107172513.42431-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251107172409.1248314-1-afd@ti.com>
References: <20251107172409.1248314-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|DS0PR10MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: e9e8135d-84a7-439f-1772-08de1e229ed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a1MdDG5PRsqQ9h8sBUmw9frmLd3/t9w1qaVCCnZk6VZNMzR1xptTAh0AwbCf?=
 =?us-ascii?Q?djKQOOr9tWxl0AkUqGNWU2pp1KsjQK2VdFN40O+fYaopwvxAzGTSUFGgmuke?=
 =?us-ascii?Q?IFLgjVt6My+Fad90LELImBDeYnsKRdso8G6iFGXdtzdBqzcb6qvFLk7oyO7H?=
 =?us-ascii?Q?HFmEeYT30lJuZYVN6XpjDJwLNXP40H0ctH3p+0DrYAnsaNYaeqp6P5AJmO+7?=
 =?us-ascii?Q?N7KJYXvUhXHfO9SKuiedCr+oWSvT6CspLeTis4kSMcJpWr0Ax/jyueCew3b3?=
 =?us-ascii?Q?lZPlrXK7Jgpr9TARnava4FdgPbQfc9FyUU8LBI9Bwf5cM5k+DPeV4KPTGuSF?=
 =?us-ascii?Q?777bXWfr4Itpz1QbuBlmiBYh+1KzG3dPGSCmk8SXd0qQlkI/yKlbFvCl9qxb?=
 =?us-ascii?Q?OSoQ/Dsn08TlrLBDqIuVz2AUbiihtcNVZHGo47ENX6Qya94LVz/4wBPd1fd/?=
 =?us-ascii?Q?ZAoxYPCjJpuAkWVJ/EuMTSTiBu0z4Y7g8RawMiTBPqjUyOKeuLoE+2Z2v0lO?=
 =?us-ascii?Q?Ycv5EDPVBIKf8L8PIlWLz6GtPT+WlJsyufk/0VhMeCxeQ+yFkM9wHSrLAuBF?=
 =?us-ascii?Q?wM1zxkZKFDjylnb78N/xIhr9zBHJv6nRryyZ2Faqs982EBTCFmgAZCw0twMg?=
 =?us-ascii?Q?RyFx1V6qkS+ArnDIL6Cw1+CAmkw7d3WP6tF/70t3x3TJ0hJc6L5NlBmsnZR2?=
 =?us-ascii?Q?+WaQd8ZUq5J5sFIQi6ys2DS9qf3ZX/yDZol+hUora4WjxBktBZh9RfTueDFu?=
 =?us-ascii?Q?WzHVh3DfplsAKsawnsr8/HcYsPUdNVhDAjoUJJ0WDirJW2J4v8r4kXC3d2ay?=
 =?us-ascii?Q?32z1YuIoUn0HXOtI6oq8dzQH20ws7HNJjB6SGAeZlk3sD87CeuAw2jbckDuY?=
 =?us-ascii?Q?noN10ZtmSNmhDB3P2kSzIusIcrnLR0gaCAXr5jwv2qDyI1IGhfhG3Hs7zZsr?=
 =?us-ascii?Q?nbXno2InPRWZ2lY2jKf/1OwaL1vvhXMhrxhmq3WW7MaU1wFGZYU6kSad3y7C?=
 =?us-ascii?Q?HvIVKmRZK0KlKNDVl6ypEldN67M93gYc7Unp5jPawdekRBqwP5U7cZVKAu01?=
 =?us-ascii?Q?hDnghY2LVZ1kOj7ksIiovMd8BNB7Sq1Lt6VfoB5ZxRVybvY2+NgbVc+yn+dy?=
 =?us-ascii?Q?1IyxrUdFoQ1jgY0GDCZSrlVnAHs2eKiT4TCgtRYa34Sh3OCqwTV5OvmvERb0?=
 =?us-ascii?Q?42oX7TwuELTaxpC4afedX9Gh8sUjD0jEcp2zLwOoQb1tB1//3kCTuwh+/WjE?=
 =?us-ascii?Q?r+9YGxsKurPYX9uejrZ2fC1aQ0LCo365YSaH8KfQEP6CO4HtXNVCwQvpi9BT?=
 =?us-ascii?Q?5YhdH0+70Fd7/kCtx7sIXmnDI+fTGLzmsy05xlMPN3wgZBC3DKl8V4ZI2aNU?=
 =?us-ascii?Q?1TLWG836vzS2sbU8zNLDcuETDm2ZcYAvge9cFa40tjeffFkQyszy30c4+0vC?=
 =?us-ascii?Q?Vfhd/0nFbod2aJ3plZkfnOYPWc2uPIRBSI+wb6lCxZ/RwIQgXGDqHJwIaWhh?=
 =?us-ascii?Q?8dD2IfTy7F7RbiiT8/uPPUZtqwvxa3ZUI5wLaJpO57ju/vpizQXBGepOhtvv?=
 =?us-ascii?Q?0gOXqZjA46+9mv4d670=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:25:17.4828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e8135d-84a7-439f-1772-08de1e229ed9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6726
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Nov 2025 17:25:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16729

meta-arago / na / 20251107172409.1248314-1-afd

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH] cpuloadgen: Remove this utility
    ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-=
UPDATE-1)
        patch




