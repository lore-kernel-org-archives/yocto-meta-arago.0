Return-Path: <s-vadapalli@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1ED9CF2588
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 06:21:54 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.744.1763533301809841065
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 22:21:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=DBzlC5Ms;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.54, mailfrom: s-vadapalli@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBP9CcjTu2SP8M1uZX3SyhAYcc2u9nR3OvvzHssh+hkv9K1IpG05ckf2FuQVV7ZXFaVkL9Td4A25iLbYp5Wy/ykV0DaxNhheRgvJt3QaDieKBi3XfSmz8lvS3ox9QJK+w44A8YcYqbbz/hNBVJJ8jCEHbOQxWZKPDhr7g90VpXEUZg5VMzGObuppYL51VoUNj4PdyooLvMIdJNOSLdHJZA1DIdQnJauOdRXnx2yB8mbFhAH2SqyHAwTi9zBDC16Knwt/dbym8BU3N0WUd9PR0tP5yh3Yw5eUoStzPdF9s48v622Hbwq1VyZQFatEWNL5trt9mEOVBgZ0C+tlhmu9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBfHzaNkSuGkh8+kfO/gusSBKvW+KLr//u35zaY4b28=;
 b=fsfo4ECZ9t38lK8HClDmL5s7waQQUsIhQH+xHtL0j+yGtUlM+hCfN10d+zTtxrVkhi+8aqi8DfQHWTOpQNaS3kRECX0TGeyjyvXNMyO2TNxv7uTOXyNrW2k2kGPxIb7HQMV0HMBlG485VnH4Z5aACl3lR1aF5TstI/hwVbcJ8isYMr9hwpCNL5qBm1bziX3JGamg9gJuJ+N1LdnMOVv/6wHA3ut4g0bUShHV33rHjlIjsO/0dJDGFcqs9ixFSVwBhP7g7SARg6bk6dyxfD+ANd9he/8o+DYF4ZgbwW3RigzigF2s2cO2oooBqceHFNjFGM3c5iIksKDKcXqqNIoLBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBfHzaNkSuGkh8+kfO/gusSBKvW+KLr//u35zaY4b28=;
 b=DBzlC5Mszaj8+SbOfHLCjJM/iwoW7a4Ll0N/fYQ7RdwJVaMq9a2+P0Au+k2lkiNkczPvO9ciZCWvHtkYeRq+RfL0Z6MDZNr+pzEoR3eDMkmvNDbgiTb07DmDz4Sh56mzklknpBIpzsbsxq4gRryu5uv4E049fMSLuhXVmar78uQ=
Received: from BN9PR03CA0652.namprd03.prod.outlook.com (2603:10b6:408:13b::27)
 by DM4PR10MB7451.namprd10.prod.outlook.com (2603:10b6:8:18e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 06:21:35 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:13b:cafe::7) by BN9PR03CA0652.outlook.office365.com
 (2603:10b6:408:13b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 06:21:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 06:21:34 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 00:21:26 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 00:21:25 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 00:21:25 -0600
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJ6LNuX1360341;
	Wed, 19 Nov 2025 00:21:24 -0600
Message-ID: <09b233298d3b995ec7b1f9595d3332491ccaf176.camel@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH] udev-aragoconf: remove legacy
 usb rules
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <rs@ti.com>, <d-gole@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <s-vadapalli@ti.com>
Date: Wed, 19 Nov 2025 11:51:41 +0530
In-Reply-To: <20251118215640.249268-2-rs@ti.com>
References: <20251118215640.249268-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|DM4PR10MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: c5efc937-31cd-492f-92e2-08de2733e364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dkhhdncyU2N3VW1Gem02QXNJVXpJOVI2SkRVVVAxaExySmVUVTRWaDdCNzlz?=
 =?utf-8?B?SWN5SW5STXBwck1pNTB2U3ZGQTR1OUg0VjYrdzZMMWNHMnFZRXJWRnNuQjJ2?=
 =?utf-8?B?WkdVdlhEMEhPTzVFQmY4aUQ4QmlBcVM1LzA5MXVRVFJCWS84OHJ5Q0d4QmJK?=
 =?utf-8?B?ekdIaGh2UE1Cank0dGp3dmFod3c2N1BPazl4SlplZGtBRkxQMXJkOWxpbGk4?=
 =?utf-8?B?OVBDczdlcFJOMGVoSzhFRHFjN0JkdHB1aWRVa3QvOUpFRXV3N1ZWNHljTEhO?=
 =?utf-8?B?cm9aVXgvUlR1Q092SXdyTlAwRDZSVU80bE9HZXhHSEl4NVBRdXBncXR2UktV?=
 =?utf-8?B?RnpZRURxOEZUOUtPTlkwQzhPVXo3S3JWMjhqYmRWRm5MalBhbFNkQi9OeXor?=
 =?utf-8?B?MG9lVTNaYkl5Qk15emhVRzFsYlk1bW9QVkJ2TUV5ak5qNjlxRmhkc0NReU12?=
 =?utf-8?B?WGR0V1QranludXFPUkNBakYyb2xQZTV4ZnFuc1BabURJLzhsa1c1eWM0dHQz?=
 =?utf-8?B?emZuWDE5M3RmVUg4MzdLL2Z2QlAxY2d0OW1qalU1V2FTN3ZUa3RyaGlEZktI?=
 =?utf-8?B?dk9VZDVlbGRORVNhWGpmY0gzbUQzdGpJdVBDZkFBbzIwRHZzekM1TnE1VHpV?=
 =?utf-8?B?dFZNVGUyTnUwNjRGaWViMUVDaTNrQU91Rit5Q0hBcGwzK3JCK2lON1VMOU4r?=
 =?utf-8?B?cHlGYkRjWmZaTnpWaVk4dVQ5eTFVTVhodkRyVXMxL0s1Qi91ZUF0cnFoMzRX?=
 =?utf-8?B?OGlkaklNSFB3RHpQL0FoSDhqSmFFNmFubWhvYmxtb0J6WUtpL1Z3eDduTkpL?=
 =?utf-8?B?b3FHQUhaaHM1VGh2b1JHMGV5ZE03Q3M1ZTQ2eTFEemk5UG90V3Q3RUlyNWNY?=
 =?utf-8?B?ZDlaQjdqeGpUVldPNmN6cUx2NG5vQ3NVbytwbDU2Ynh4c3RXdDlaaHd0RlFT?=
 =?utf-8?B?azN3S0kyY0tVZGd1T2NXZDJkT0Z0TmlXcFQwT3RTSFZ5OStQWkdic2wrRG5w?=
 =?utf-8?B?ekdkeXZBYlFrbThQUDRqZzg5Qm1VOU0wV2R0SnZoNHczN29kbnl5VE10R0ow?=
 =?utf-8?B?RzJQM2tzZFZ0NTFhWU8wK2hOYlcrT0MxUStmYktDYVZnWWJ6WU4wSldPUWs4?=
 =?utf-8?B?dk9EbXp2Vi9adUc2SVlOSFVzMU1SaFVkOHl6SnROSExCdTloQWt1R0dSNEpT?=
 =?utf-8?B?UUIwN1QwTlBIcWRLWmZrSVJpejVTNVJnRSt3eVNTZFpLaXpYYW1rTWd3WTJE?=
 =?utf-8?B?ZnZvZkI2UW4rSjFZMU9rTENuMEtIbnlhbFF0QzVTZFRFSzQ3ZzRvTUlYdW5F?=
 =?utf-8?B?ZEdqUVFLdUhkNkthSk44cXhSN1dQMDdOMmZLN1huNE1QM3B1S3JsNGpUSFhn?=
 =?utf-8?B?WlAxMUxnRXZYTTJSVExpcFpuSEpzbmFSSlIyVVdOSEw1SjRDdkQ5UzE2Vnc2?=
 =?utf-8?B?QkhpM0FjbTU1YXc5Y0FDZngySEQxQStWVnJabVRycWxaVFM3NXl0bDgyRTcr?=
 =?utf-8?B?QTZiaVE5WUwyVUROL240SHVYc2hnNkZtNnZOdkVEeEhrUEU3MFZXTlF6ZUhM?=
 =?utf-8?B?MFVwUm93N1pJNmZ6bDdxWUgrY1VPSnNxYUhaNnFwTzhsTEtRL1B0ZW1RVTdW?=
 =?utf-8?B?TnJHWTVsOFBZd1lVOURJNGEzTmdjRWFuSno4b0RtaDM3d0IwekdPTzJ0dzVl?=
 =?utf-8?B?eFRWMFd4KzFGZk5CblhGSTk4UlR3VEFLcGc5UGVaM2JqQkExYW1VejlyYVFv?=
 =?utf-8?B?NTFGS2J0NUJvMnNNek5LOWhxdUsvb3M4cFZycHJNYit4SlA5RXZETG16aWVk?=
 =?utf-8?B?WWY1N1BPYUtBdWZPS1c0dkljY3dMeWxlNWN6NFVsbnRYeWlmaUxDVVI1bmRz?=
 =?utf-8?B?ZEw0WnVGVW9DbXlpTHYwSlF3aUU5Y0taYVV2dlhCeUZ3RWVWUzFydXdsSlJu?=
 =?utf-8?B?ZzJXcHZISnVobDlMaHVINDlBWGtVOXBOcElEUThsWFBCUFJPbVN5L0xtT2Ji?=
 =?utf-8?B?ZXpVd0s0bzZtSXIrT1NjODlYYlEyajhuTURqUWdQaWE2RVU3T25HNlhEMGtJ?=
 =?utf-8?B?d1pkTit6ZFNuOFRwTFJ5NEg3d2ltUEwvLzBtbDM0STZISWZMV3N1bXRBZEFD?=
 =?utf-8?Q?RT7Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 06:21:34.3798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5efc937-31cd-492f-92e2-08de2733e364
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7451
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 06:21:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16792

On Tue, 2025-11-18 at 15:56 -0600, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
>=20
> These rules do not match the current structure of the USB DEVPATH and
> are not actually fired.
>=20
> They were initially cited as being help scripts, but I think users
> should attempt to gracefully bring down the gadget interface on their
> own instead of relying on a script that will attempt to reload it post
> mode change.
>=20
> Signed-off-by: Randolph Sapp <rs@ti.com>

Additionally, 'configfs' is used for configuring USB Gadget drivers using
the libcomposite driver. The Gadget Zero 'g_zero' and other USB Gadgets
should be enabled via 'configfs' as documented at:
https://docs.kernel.org/usb/gadget_configfs.html

Loading individual Gadget drivers via 'modprobe' is deprecated in favor of
the above.

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

