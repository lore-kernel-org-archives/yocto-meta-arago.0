Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E033D6CFBB
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 05:00:05 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61739.1769144396385269000
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 20:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Ylcw/sa6;
 spf=pass (domain: list.ti.com, ip: 52.101.46.63, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkEZe3wmV0WME2iZAXDsZcP0WHZHRaXvaUXamX9A5bkbL3OvNXA/AauoXx0IoGHf6iO/sj9j1EuTJG91UM0TuD0yhf1kMzScr5TntontarU711N3iYKQaVzUXt6Xk0YalbHtHflkRBnvdnjXupJ+PSQPg/5HeBEg9239hweGv2wyRgQ2rDXdhrk1e6uUX4QG2GooNndxsoKCW4GTGqEj3bIDxM1BHdmj+lnKmFJQiCqGy9LpPCIVIO6zXXaL5Wffll0BX4rH1c8hiXpExfjIUSdoPp7JTeV3lU9k071RYA+aOn1UzbCNSLKjUystBupA7J6G7YpwLV0Nmftb09wefw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46egwASmstItKyWD+0T9ow6oiv2msPrTGFJBS0izoAQ=;
 b=X6gGPAb5zK1CHFvXfEN4PJ8f4WsY4IcsVDzi7Ob35OJd07dvP1zuFd3yQALrmXjNuBFsVgMY9rV1bQB0d66hyGsaaor++I/QOV2ScS79YQdr0W6j7V3tmnCnmNSAXOTpLoCQmyarXf/Iyzp3rhWDGXkpoC0GBNo8ITOGOZLy68Cp5TWI+LNJCDc6gEky1Vyc81Eup5H4M9EwtqFy1A8qUqwdHCR6OIwT5NoAnn/fAOU5MzJXJ5rBQTt9rwfS5e8qpexJZCh19mBqwAXoHfeOM/tC6/hCKj0lvy6CczkFUaPovepfsxcb/VAgaTjo7n/yxO6cpwYf8GBEP79AWu7U5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46egwASmstItKyWD+0T9ow6oiv2msPrTGFJBS0izoAQ=;
 b=Ylcw/sa6mUCAunDBacJT1PPfzagoOt6dSSfU3pjpwzSpjkZLms20dUHbe637ONG/MifI9us91e22D7Rf4e0pURYPEO967EyDILG2+D8KRxdyLF3mESIJKq32d0byGtH3vNZStVzbhAShvGJ+8F4OSnODfeRpYJ1N+Nn6cu3e1BwLdkLWZJ7ZI7EHEB5eHRmBF555Hr5lXF9QhxG/v+D7NpjIP1lwDTEW/Gha0XS6WeYSBhPHOe9wXdGVdsX5bjBNw1qtvhOWnthZ/1rcf39dg8u/hZ0nlxqZyTP4d6d+pvOWhHK/+ZFad6rPGN4SirvtBtAQBdFDCnn/E2nVzS0K8A==
Received: from SJ0PR03CA0344.namprd03.prod.outlook.com (2603:10b6:a03:39c::19)
 by IA4PR10MB8494.namprd10.prod.outlook.com (2603:10b6:208:564::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 04:59:46 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::c4) by SJ0PR03CA0344.outlook.office365.com
 (2603:10b6:a03:39c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 04:59:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 04:59:45 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:59:45 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:59:44 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 22:59:44 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60N4xiPJ1609627;
	Thu, 22 Jan 2026 22:59:44 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C4BC7138B5A; Thu, 22 Jan 2026 22:59:44 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Vishnu Singh <v-singh1@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: Re: [master][PATCH 0/2] Add Zeroconf networking support for Dante DEP
Date: Thu, 22 Jan 2026 22:59:44 -0600
Message-ID: <20260123045944.1791289-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260123042741.10313-1-v-singh1@ti.com>
References: <20260123042741.10313-1-v-singh1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|IA4PR10MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: b3739676-c444-43c2-c565-08de5a3c3a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hwz5Xwx0OlxcRd8r5ytP2IVBcHm6+MIxIwsb8YudBLF8EMl1o9plb77+lZp+?=
 =?us-ascii?Q?IHAMb5anbLxCekqdSLEFS09//dfHhHBUNwUBC99BELS/ajSNy/GE3DOvCC0Z?=
 =?us-ascii?Q?XDb3MXXw1lW3jICVr72MJdjCZ7pupjKZL/ZgUmVOi1tHoK6HUxB9iIy9YKJL?=
 =?us-ascii?Q?KWOe6LNMo7tJNnvwbAI9Yxyj5OW9gHItRqruiAk8kX0sD7YwzFHHHxkfZK9m?=
 =?us-ascii?Q?H8KUe1Nqkb3JH2RVg2Hg0EvjsHEtRlBZYcLs1Q/Ix0a5/gFqtb2LCCYqkQUp?=
 =?us-ascii?Q?G46EIKlQn/wpFinTB19zQrXshJPAQ6KBbK7qo4u+ZbYxMcBZi5pN4LI83WLK?=
 =?us-ascii?Q?wCj8lUdMxB5Kmc6uDW9yoLNLCTtp/KxbUUzHP4ogaPtVcT8xv2VdU5zYAenC?=
 =?us-ascii?Q?2jwir7qeTxFwvoONKyio7OSY5yGXbWjVijG701bptRYiy2aEy75F9KxWuvGk?=
 =?us-ascii?Q?aPja0iBjJyjmMmadTy3elxPr3jYlbZj39UoBktld49qVk6op0nqod9qTg8Ve?=
 =?us-ascii?Q?2dB1Rnn3PyH26ZMcCjFovotf/6784RkOBMQlbbk83fKzWrimMkoJrnRAkyic?=
 =?us-ascii?Q?7Kn7mjJ7beH1rxc50dHZvBERahIO0tty7u7Z7Yyy2BtTI+1eiLNf7Wx/Wfwb?=
 =?us-ascii?Q?oyUSm5r5zUVA2HIKetNNbVQj1QisjiWcgUwpUGkyHU6X4g1C5ACMFLHLViy4?=
 =?us-ascii?Q?LKeJENBH79S2d56ZafmNE58Nb6CQ7v71lCosde5F2NgouAxb9UxmwIl4amC6?=
 =?us-ascii?Q?LLk/pH+8yHCHBgQBfzHx7h75DYKAJMt6JQAsEZJKCtq5QtyBsWEuDdX7i1g0?=
 =?us-ascii?Q?Pa9nETL5SAOwW5IGYWJnuWN8tIK3wvT0Ka0kX8XuwzQEZ3ilcdW1H7na9V4a?=
 =?us-ascii?Q?xSIiOFYxGaAlcYhkwdQ0ZgxsBekfZejeZfmDRn9+Xh3NTPNHRp89HpciU9Tk?=
 =?us-ascii?Q?ucT/POvC5d4NYOxUZXWeqIHnoE3cV8g4FG/kX78v+yirUXXQ7QtNcmjohtSv?=
 =?us-ascii?Q?UdV8PnsqenSMvCuuGGqYjKUs6oNqC95rKJn+057YUH5YUwE79bsDztpD4gVy?=
 =?us-ascii?Q?VoLKkEY0ZhBiFR2Fl2/qWMtmV9+T5DLz7LAGFFDNBifgmzVYYGRcecJyNj0S?=
 =?us-ascii?Q?6hnsvYFVSVrRGZCbaf2W7C0zNkTXPBU40UpBFqpPX/9zIJP0q3v7CJAi7y4Z?=
 =?us-ascii?Q?rybl57KKp+IrlzBVntshyegHcC5UIqChyG6u/uFsahhli3elkqjSnyc4lWtS?=
 =?us-ascii?Q?HaL6Nab0FOirBFIY2PTY0JXKgiSIeHqoCYV2Beux7C0RBhylTSPZAovJD/Gn?=
 =?us-ascii?Q?fqx8XHx/pru0EEJrC+yhK086/SuTuAms6OnbiXn64ynaXWXEQacEEif3kDHG?=
 =?us-ascii?Q?DYjxp+uqwP8+Mopy1naql29hyZEbzcfTAq4SzsVFvISFZYXKviKL8bTooqVh?=
 =?us-ascii?Q?BAdBZ0ZPX4MGDRdIYw7DUjKQcU/CGPJibx0cerFWIJpZ6qLrY4GgiC3G4wa2?=
 =?us-ascii?Q?EQBgbzTVZCdNlucqKOSqmHgZQmrn8Fu8WYCMOiYs47oGNKmyHEfa0/jox+UU?=
 =?us-ascii?Q?XTil64uuwtEauKZBPu/gWQePlOG4sixD/AQ83RJ/GcWZpxRAES5t2X1MGNFu?=
 =?us-ascii?Q?UEmzr5lud0MpyJLne5s89z/TPNFkmb18rveDgLC3ZMrihllQbjitecFYenep?=
 =?us-ascii?Q?gR6enA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 04:59:45.6178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3739676-c444-43c2-c565-08de5a3c3a65
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8494
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 05:00:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17020

meta-arago / na / 20260123042741.10313-1-v-singh1

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
WARN - [master][PATCH 2/2] systemd-networkd: Enable IPv4 Link-Local address=
ing for Ethernet interfaces
    WARN: Commit message does not include file/recipe name: systemd-network=
d: Enable IPv4 Link-Local addressing for Ethernet interfaces. (COMMIT-MESSA=
GE-2)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [master][PATCH 0/2] Add Zeroconf networking support for Dan=
te DEP
- Submitter: From: vishnu singh <v-singh1@ti.com>
From: Vishnu Singh <v-singh1@ti.com>
- Date: Date: Fri, 23 Jan 2026 09:57:39 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 3c85dee6265f28fada243e37edac1627b=
d8269a8

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Commit Subject: meson: Add patch to fix Qt6 private header detection for =
cross-compilation
- Commit SHA: 1d3940fb66f2a19f94bb86eabcbfb9d19a8b5eef

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




