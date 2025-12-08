Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864EED3B7EA
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 21:20:38 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4027.1765228828187354141
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Dec 2025 13:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Fld2qh5e;
 spf=pass (domain: list.ti.com, ip: 52.101.48.46, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bh48AFMZkM+iE2kPotjipPPTqjpvPFfCac0N+v2yQvJmjCuTcLLoLHG0UQI9PYnmjdm8g66fGsHTAJOfUHPj6uY+oJBYiShaxlMzB4usHQeNnEAXJNU+w9pVFr2H4luPLQcHscMQUzqHR6POLcT3sDe2qgJ0yC1bCN9HBtY9Zjhhbt9yutsn/BRfGeVovKqHK5N/F4tfZ67qyehgt652h6rNw2tWnjs9KZLf0aX8Wd3/IBSeht0A4ZAO9Weh5IpX6pWe8sC9HWc+iIZYEam47MUGlCbm3xpN5LN/KlpTVmFRECI+P39Qj2XjkDsYDHWwMhDLySZnz/NdNtoeCfbVSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePSToZ1sN/KzDSvuMowMC+prZSt0k7qNmyZF2PU/v2c=;
 b=upQYqCWdvXeizTurraSKyPmaSXn4CBsg70lidYmBTRf/ZsP3bfdJkPDxpyPIUJWwFgX29cwtHmoKseh+XuRIbRkzVRbr4E+3COvUS4gHjfZvIeXvOputpXYiVsJJaot1P76T6mL9jyOxycD/N/TcvhkVZUw5cx4nL2dZ2YAw4c0YePFVf5lxYNeWTijGikOg4yDRA4aU3Dj14FD0tU9c+Vh6OJARMYEV+0kenjq9MdMmepdQgaUt+MvPbxVZ0yzfTTXhHGkp7gHJ/t0x2CHST7g76fFAfIEhlBFI3766aaAQsv+2MB6iPbTaa0UQNH9dZiXT5YHrDo176FSqGnueqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePSToZ1sN/KzDSvuMowMC+prZSt0k7qNmyZF2PU/v2c=;
 b=Fld2qh5efHdwJUs8dTD2SlfyhWkPC/v5fgOw8n0jUoxoLWQSGZlsQ3Qd0SuSCcxoQ5ad1DuaX5nmWXjpTFFPqD4HeopkNm2/mTq/v0wE+iPmAKstP+8eUI/RL+SRIpZLq9G+Hj+lKr3hwk6RW6U1VkbQ+TcSGLRsgGNQagrhwc0QLggzYaVT3+bnzZ9uKgiyUy2HoKCqrT2NEb7pt6vtEfGFnK2Dtc/1rh96CfMeYxeKILmUR80uq7g4Nwpzui5HqKpyddcALxFC0lTjHmHRG+sNOX2N7IenD8LLuAGwPfNNpF245DPZOGmQ4DdBQK3NM9kzw2ZNiugnnVdT5B3Jbw==
Received: from BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::12)
 by DS7PR10MB7154.namprd10.prod.outlook.com (2603:10b6:8:da::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.14; Mon, 8 Dec 2025 21:20:22 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::df) by BY1P220CA0010.outlook.office365.com
 (2603:10b6:a03:59d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 21:20:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 21:20:20 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:20:19 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:20:19 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 8 Dec 2025 15:20:19 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B8LKJen4079641;
	Mon, 8 Dec 2025 15:20:19 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1091B13F51E; Mon,  8 Dec 2025 15:20:19 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<denys@konsulko.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH] stb: Update false version v2.31 -> v2.30
Date: Mon, 8 Dec 2025 15:20:19 -0600
Message-ID: <20251208212019.1685767-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251208211629.3997641-1-a-christidis@ti.com>
References: <20251208211629.3997641-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|DS7PR10MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b5dddc-f42e-4cb3-fc71-08de369f979c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?r6fkfpnczF/V/3xCeFV/wtx90SJHLsZH6dXoGwKxlska0nbcCUtFhmW/crNO?=
 =?us-ascii?Q?LTema3l7/ibvKLxqu4ZzgJGgaKXM+PYfcH1JsSOXpAvxb6Ymchq7D9Ggdr9+?=
 =?us-ascii?Q?XTjTQl1j49Xe6khQoMPEs5Wi0xq+STr6hfh9vyfIb4IK9fvHyxrkf/0jD5Y0?=
 =?us-ascii?Q?/Q7UkDw1KGCI26jQgy39n/eUSPdaMh3ZmA61cxEHTg0wRvaWFQWQTSnuP9E/?=
 =?us-ascii?Q?7IoEhKoW5eS6k0fyMvLJfcQT6mV7fvtiq0WkDiiZ3m0PIKvjl8KfCbziomic?=
 =?us-ascii?Q?dg7V5UomiPAzM2xfh6v2rc1RjMMoIhQdgbdqEB9bDr5S6iURqh8LUSHhDK5e?=
 =?us-ascii?Q?i4uzrqxDq2oAHkuW/2SCx3rgjLvuPV3Hmubf2e9jqo6fVEOH2kir4HjAqOxU?=
 =?us-ascii?Q?7xtH5vXX7GAtn6itQMVZBFT/jJoSfYFczN0oMIEtWP/hGD/iai46lbqioh2/?=
 =?us-ascii?Q?x1xO/IN0qj5S5GjNSIunkpQ4gbckkKngSJVIuWmKSGcLIlXjzPJQD/NABZMy?=
 =?us-ascii?Q?B6ivSX3ljOyomEikwXOiYP2c70QEhJi6VCpTa3YKomUFInvZNNN1k53xEooX?=
 =?us-ascii?Q?wAnEevvFLM6XnsJylCbmEY/IHFrOXZQSk7ap4WHMG072Ihg4l0v/HCP7+Hm0?=
 =?us-ascii?Q?2HJD73UJ1Mmc5VV2fUXX/8TSUZ7q1XO3qhwVDG/elcO8NymJ4McBNTcAjR25?=
 =?us-ascii?Q?CsjDPpBu607ykcq4++n5U2H8nOHsgHKg3Zs4K3sM+eDyZ4KRxzdsKlF+j8yj?=
 =?us-ascii?Q?knNRVBbg0SXK+Sg4+36k/Z/rt+20mJQ+lZ7pBtwxB8BZnGCoC8w0sELxgVX3?=
 =?us-ascii?Q?KjbUcoPIExL1HK2ylORv6lA1FNJQoedQ9rWIJnnzGMZ3TLYbpUPO8o0a74V8?=
 =?us-ascii?Q?z3jer9s09xgKtnheEA4oUdEKD8N1zumub+CamatzIUQCjiNUylsymKU6ORSd?=
 =?us-ascii?Q?IaURmsLhpzmXBwP2E6nMJYnH8gaTP0HLPkjOH89QaCwoFvMsMRvkUqWNSLKr?=
 =?us-ascii?Q?NqymiAUnv/P/BSqcyRCKo1G0L1Nyia/hvfDa2IV6WjEidG8jWNmV6PiPtTB3?=
 =?us-ascii?Q?qkRJyJdppnj1Ww3irN5HydS7FtH44CkOVGa5QhHhmidx+4QZwD/hb0Dde6up?=
 =?us-ascii?Q?5wYpQJK5pZkWQFIE9SrKd5eUIdMqjzGBfArs0pygJYjGvvSUe/me7yWkU0/w?=
 =?us-ascii?Q?Jz37M0DJN+Nh0KFkZ5jyi7TMn7SCdDFgzP7Ku2n6XOjHWWL8wt0xzPKm2r60?=
 =?us-ascii?Q?o+LSAWNsPQb4+rHWJkzUKPd88bNmRcNUk6qr++81EBfPkpHnzMLwN+7eR7Qx?=
 =?us-ascii?Q?0cZP7ZAhEaL40wFQq6Jtwm4OjU9YMWUoegbJMZIQ6gxtaord4U/DLO9TY/op?=
 =?us-ascii?Q?M6cV8ISR5vBO2bkIo3F+7xDI0NsKdnTkqrgiB2DkZNHSS3AJpwyzirFlemlu?=
 =?us-ascii?Q?V1SxCPpUe+6YdBFSq7Ji8RdtfiaRNA+j4yp53VBWB64hh7UZcBi7jY4nBGJW?=
 =?us-ascii?Q?VYufKa4EtjBJnjMYMxkI7YdZ0NvDOgOzR+18bAYD4Nj9HOcKOcBmqTM/ST6W?=
 =?us-ascii?Q?VwgkAWW8aOFvF2tj7cI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 21:20:20.3231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b5dddc-f42e-4cb3-fc71-08de369f979c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7154
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 08 Dec 2025 21:20:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16873

meta-arago / na / 20251208211629.3997641-1-a-christidis

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
FAIL - [meta-arago][master/scarthgap][PATCH] stb: Update false version v2.3=
1 -> v2.30
    ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-=
UPDATE-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




