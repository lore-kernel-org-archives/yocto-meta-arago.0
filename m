Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4C1D29FB0
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 18:44:29 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51311.1764873865267720489
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 10:44:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=XOpCZ+6k;
 spf=pass (domain: list.ti.com, ip: 40.93.201.66, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDXS1ROhpZaCxUf/rsuw29fprQWN1vsCOrCi4xZDccRT+YiHlJ0MumP6gyXLuYJm0RbSlsxJ+PmEnQ7O3qCVuq8hs/FyBbv3+k13bWO6hrdbTA+ocduRRINvVxnfIAs1WNfv6wq6sSCZ+JsB4JK5jeqINGEpz6M6pVZBfzXFPH36MTXIW1FJn4t4MbleOFFeT0v5SNlndkjeHRcGgLZos4+BchukLYb1j95QK6NpbFFWaoDVVTApSzDDdikxxOkh/nGnIPdslu/Muk9LQGHioXIAHdqJGCc2abWkqFlka0+eIjyiawO/UC/wmQPU2jpreeeA91GOe3T7BCqvFoqrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8eetEznH0h8TaevkFffGEtggGQRH6L+tmHwujIMwhM=;
 b=RItIGR4dfY7KEAx6w8kG46RnCoRIbJtTtwBVHj4dCydeRAorvWNHKLwMTFC0K/MIDrfPw7L+y+Z+GZJ56WkgMB95zn65B5nJfhHpo88j5qLoqBX5ekhEe67cuhZNODIIusWbfTEnccHHX74OGuJCOzIQN0U6m4wBDKhAI6COHh8e6H6RvX/qWDcs3xkOww5BSHtLdOVMzoepWJquv0J0s5Q3jEtEeixX+pnT4C8FKlLJ6PncpDf+ej60fN1oBERlS6xQbX+gSM7CinDm15fNMLKf2bzs4HTnnw60pFHvoffomK4xqJSds6nbTS/b0wjHM4XlTeTXHLccZm0czw/McQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8eetEznH0h8TaevkFffGEtggGQRH6L+tmHwujIMwhM=;
 b=XOpCZ+6k9ib41wwMBaLGfFetySvAcD6Wp+fAI4/S4dIne8aqt0OVehPAh0OLrKgj2mGU0+np5gPOZHZjWRSbWgR6ypxCMIJjjYx/7C73TmnW+l/QVnxCG8+Qsh488b8xGUPcUHZ/57ORzzis+K2mLe2I5ZSFmpk1JPgQ6/HlJJyXNb4XUeIDl4nq2lnfi53GkbSA4hGWuqa/Vn1gYp10YxTJSeZentNY8qdsQ8Vlu8ZaJgENKPSiFSE/J9tdUgKdz6PkDIbBW0uflz90CdGifkhUvevOZqjF6klZu7sPfUjdfJtYQmzZ51geATpnYwNq2XYaGvcvv9evxhuehfofCQ==
Received: from SA9P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::8) by
 CO1PR10MB4673.namprd10.prod.outlook.com (2603:10b6:303:91::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Thu, 4 Dec 2025 18:44:22 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:806:25:cafe::66) by SA9P221CA0003.outlook.office365.com
 (2603:10b6:806:25::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Thu,
 4 Dec 2025 18:44:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 4 Dec 2025 18:44:20 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 12:44:16 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 12:44:15 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 4 Dec 2025 12:44:15 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B4IiFMT2011029;
	Thu, 4 Dec 2025 12:44:15 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id B7DE7D6F28; Thu,  4 Dec 2025 12:44:15 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202512040100
Date: Thu, 4 Dec 2025 12:44:15 -0600
Message-ID: <20251204184415.2553201-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251204181816.2021485-1-lcpdbld@list.ti.com>
References: <20251204181816.2021485-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|CO1PR10MB4673:EE_
X-MS-Office365-Filtering-Correlation-Id: c5afe60b-ac7e-42b1-75e6-08de336522dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B/FXMDEhr7aZk0EcXC3dbxe29r3XawOfVK16QY6nzS4cz3wpNPeAB6TAaly3?=
 =?us-ascii?Q?evbd1wI/rnvyPOpktYhYhI/XOBiPEbw+a/R3cGfmcPqBt/IVldLWCVUdoZiz?=
 =?us-ascii?Q?OOurRWss+RsJnrVGmrNvTXlsEOk4KrGun2VPNxETDgy0CRvXwJdeAJFx0sND?=
 =?us-ascii?Q?0FqbQTtw26PWSfUA8K37AWuB2erv6OgxrxvyDe0UeO9JqPv6Ej8k4JZsL3PL?=
 =?us-ascii?Q?FzFlZWQKM34GU5avWlkie1DaaHaJEaKsyx7cURvq6D+ltDNltx68Lm559zxi?=
 =?us-ascii?Q?kwYyTEKBIc1KVQBVNW15JIPBg7DTdeIVxnXNyPmlJjFaFRU27XkwUPw08Xck?=
 =?us-ascii?Q?NorEjR1UxmTwJNeeUym2mEX/GTil8xVsQ72qYo3ekDm/VaEZxOzsgqtsUKbg?=
 =?us-ascii?Q?Cp8lB1gROC38r4zjQr4uRfUgfs1NiIKpbwKliJfwZvsZ7QbrhQSE3brjDChj?=
 =?us-ascii?Q?Hgvh7lRlYN8/+kklVJt6fj1CywFIAGxHelnZ1T904ZbMgujmrgLYM3Quvp5e?=
 =?us-ascii?Q?XIXbLb51NIBBDBYwN+UNdBandphUsHIwrULzh2nkia2tqTqjEq1tzKs+fK35?=
 =?us-ascii?Q?8WYzLJFzowMnS3eVqZOpKHCKMlJS5WrhgkQwbdZ9kvzpnMJ9V8SqeUyY8ez7?=
 =?us-ascii?Q?odo2O5KSdByHq3lgfz86WhFI7FaQq7ZgKT2BQ1UgRuwqvogE0rteC/u+NncM?=
 =?us-ascii?Q?OsNY5P9Qpy5OihWkJlzK3wYsNAOxZnpRxLgun9lfSDCjPLo+PIXHvYJNy/Tz?=
 =?us-ascii?Q?yShMYPi589+IOxEcPi8NA8wNnVH6Bgl7N7tqcF/tNwtyHH+ZYOkpObtrTpul?=
 =?us-ascii?Q?3gAaWl8fWwDM5fF/IIlHlMzqJewbAn65lM+E7KpeO5ZXyeJFS8VPyiyD6Lpq?=
 =?us-ascii?Q?QRwFDx0okV+BvorweIUXh4u/sI4ppIuFgQhu3aN6wDA5uBMKY9O0HNG4w/qn?=
 =?us-ascii?Q?9PsyOF+lBWhZoUWRfwSQkXuNiXOj88WmyH6fs+j3iwVw09ggH6IbbaCPZ4cr?=
 =?us-ascii?Q?1sKrpE5HMMJ7IJ4H3/pnbN8NurS/umB6N++0fSyzBofht+gy32cVzY9u1R5C?=
 =?us-ascii?Q?FxfSks8s0DCnLG9CqAqPFwQco7IsvBhV+WlQrJ0BGTuMMEkRG2Qj52DbLdio?=
 =?us-ascii?Q?AGVDBS6fJv0wqt8eCAk+48DLxSX0cWEnZnK0Dk7I2RJ9FY7QojMNgpy5P8z8?=
 =?us-ascii?Q?yoaGSVRG8juGnOWRvWuVGHuJk/Cuh9IPOLr6NbTPJjBptePUZ1h0UHRpXZj3?=
 =?us-ascii?Q?d/BC3GzaXnrYUeNW6g0nGmEIVePYqM9AmUxaMl06+3hf8fQxwBs46f+03639?=
 =?us-ascii?Q?bWjHaiSPN5a8cTD1hqjsK/KNgAb0pj7/YQRVAQgIl085+BTYHVlvuVDvCwad?=
 =?us-ascii?Q?zfFnsSzyXsLxW+h2TYvADRcwXw114nub3e6c7fObVxljr1xKXv1+KzHWkfiR?=
 =?us-ascii?Q?RdMS9ZPvivPBJhHQYK87dab8b6ReGyG+pMJBl1uKD7OrwoPC1t1eAWYn+Zpz?=
 =?us-ascii?Q?S50ryaNz7ONgBZcnUXioGukdNCxe2ITQHdF/P18S4lDAF3axSg1w5gIDyT5W?=
 =?us-ascii?Q?LBUJppChDgPHbcRWWfE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 18:44:20.2317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5afe60b-ac7e-42b1-75e6-08de336522dd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4673
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 04 Dec 2025 18:44:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16860

meta-arago / na / 20251204181816.2021485-1-lcpdbld

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
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.=
202512040100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 4 Dec 2025 12:18:16 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fc997af84752c5a764faa9a9de9c02723=
92515df

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: coremark: Clean up buildpaths QA error
- Commit SHA: c83b07375c396612ec06fdeae23eb062f2ce0c4b

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
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




