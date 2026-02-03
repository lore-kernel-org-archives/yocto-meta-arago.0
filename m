Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600BAE87852
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 18:07:10 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77.1770142025390966390
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 10:07:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=q+6JYfec;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.18, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MC5a3T3uGTo/su3Dp6i1rG0R98KT5ZCBbmJgZO5RQj6qQNYuqr/cI88O92TLEB5usHIJfD902f/IT84ddtLnPJL7xFWkcyEwsEfaynJORuB0IzFx6euHPyqX47+34IFlHta4/4taz7VdpAlVqtgg87CnuPPM3h0uIf46zzmKymXnT1IBqeTB2bteXpRaHkz0crtjHa/SQqg9T1YCy1XIda0GD42+hg20V3YveZVTmTymvt08F8dThPBJe5afbLFEx1RsuQU/in3XZ4EPeRMh8/8xX5TVJ1Xv7EXmYzJjtnQ7ran0XXiCtbXGhs+I2fHDa3XEvgjlKwoRdlaoLtIoNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNrybvILo9cYMCXX23GLjduWFC/bRw1pxeG6r0+a2B4=;
 b=Hy9ixgUGGymvWBq5wF/fpghre9iGsE5dmXILz5fC0cALGtTk7Y5DDMnKUiNA2e1SEK3SI9v1EhvkQxOS1l9jpOW+QS5HYh+1aRoe67LHxQmXjboQxSejuKduqmnsq+faoM3o06pXFufF2CxC862sRyTA3m2xk03KEmWWy6tfw8agu2shgxAuw8aV86sgmsX9Z8og/cvKYGYrCGO/K3yPwlv5my0g83as1njqDeBC7jANc90ha3V/KL1xLqk2YaiPlzcupxXFEF4wzSROIphZ9OYV/VTZ7KATL1v8t+DSVp9ihkEBLTQx4ZE9Ds9PEAok1TCU1l8tRJGhwNq/BccuLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNrybvILo9cYMCXX23GLjduWFC/bRw1pxeG6r0+a2B4=;
 b=q+6JYfecBwOYBDAK8lDjeAi6BM4Cc5/L7PWurYX6iVOgd3VuK/fmfEF7LnRyxqasT9QmIDc4VjguFJiCHxXX/9WoIvuklWMtldPdFlBPf1kWEsdCR2RpFoO/y1STbnqxIang0zEshRNgqjKVyJ8BYE1YHaa2R2dt2YD1l40I+D4=
Received: from SA1P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::23)
 by SA1PR10MB997628.namprd10.prod.outlook.com (2603:10b6:806:4b6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 18:07:03 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:22c:cafe::86) by SA1P222CA0014.outlook.office365.com
 (2603:10b6:806:22c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 18:07:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 18:07:02 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 12:07:02 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 12:07:01 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 12:07:01 -0600
Received: from [10.249.64.47] ([10.249.64.47])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 613I71wp3937986;
	Tue, 3 Feb 2026 12:07:01 -0600
Message-ID: <3b100130-a5b8-458a-8c0d-9bffbd47410e@ti.com>
Date: Tue, 3 Feb 2026 12:07:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 2/2] meta-arago-distro: Remove
 tisdk name from Arago packagegroups
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260130220830.2173125-1-afd@ti.com>
 <20260130220830.2173125-3-afd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260130220830.2173125-3-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|SA1PR10MB997628:EE_
X-MS-Office365-Filtering-Correlation-Id: a621a2c7-fa1b-4cf4-bdf2-08de634f087f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SDN5NFdOUmlVUWZud0xnTE8vWGx1REFrS3dTNjRwMEl0aWhTK0NYOHdBOGFO?=
 =?utf-8?B?SkprRFFCc2JSQmx0ZHI5ejkra2ROZDhvNTY4Vy80cUdJc3VHeXZVOWdlVWRm?=
 =?utf-8?B?YTVVd2tKakQ2cTVRc2xxU0NHc3g2UEtGczFtU1dHZ0FNUy9aUzlaRFd5bG8z?=
 =?utf-8?B?anFxbkcxNTRIcWc1R2JjK0NtUmF6aVQ1ZURSWFBpS1Bycm1CMzFvVmdMcjk3?=
 =?utf-8?B?V3c2SFNBM2NBVEw4REJTTGZCc1VUa0FmcmpOdnF4enE4cVFCYVB6RlUwYVk2?=
 =?utf-8?B?Vk91c2kzSGJkcVBmVXVMMmNQSVJLaE94dzVHMExrT25hZFo4Q3M5UWN6VUda?=
 =?utf-8?B?dlpBV2ZJMlhvemhISmIvUnRTUEdUSUhiRHVQK041a2VIYjdpaEw4MU1uZzhq?=
 =?utf-8?B?U0RtSjVhK2t3U0Q0MVN5NXpVVGFZZVBwUC9ZelU2YnJhOGk4N2R0MFFhV2Ex?=
 =?utf-8?B?cXdBZW56aElOcC9xSjFEQjJFd3ZuaS9HQ1NVa2ZFTkZSTHFzMFBuWmFFRlFi?=
 =?utf-8?B?Vm9vRURoNDlIQ0dEd3VZZ1dMRFNEdTIvL090bnBpQUFuYkQzSW9SNmI2eFJV?=
 =?utf-8?B?eHBZSjNrekVtMEs3Z2VhTDlydExHTDE1WnI2Rm53V1RIQWQxQk9ic1g2dlZo?=
 =?utf-8?B?d2RXY0xZYTluelhyL1Ewc1NZVmdJcElsWGIrU1Qxdld1ay9Ma3Ryb2MrMHNG?=
 =?utf-8?B?SERFSy9sWit1eTlsREZUdjlXUzBhNXlzdEdGT00xOFFaTE5GYjAyaWg1NDdZ?=
 =?utf-8?B?a1EzMXRTcXkvMWVQWEk5VzdzdGNJU2dwTm96T0M5UWplQndPaVNSa08wQlVV?=
 =?utf-8?B?bjZnV0xjYkNoOHl5U0Qrdk9HRDVxM3o2eXNrVXNPUmVTanRiQWtOekd5ZWE2?=
 =?utf-8?B?eGQ5QXZVanNEUXJZUG1aNVFFWjFiMHV1d0d1b0k3ak9HTmc2TXZGcWxVZ2xC?=
 =?utf-8?B?UkFSQ1hmUjRQbDhNd09jV2dGdkJma3FCOTVBVXVCclFZemVkQ1N5dnQrQXNM?=
 =?utf-8?B?QlprY3J3b2VFWk5UU1JxcENIN3d2dVR0TUxhdUFaUnU0MTh6bzdEbzFtYm95?=
 =?utf-8?B?NnZ1ajFaQU83TzFmUEN6TTZyTnlMZHNxcHJ2aDZJSCtadkN0OVFBemdhTUtG?=
 =?utf-8?B?aHQvTjlHdU1CUmpkVWRmbis2dWs0WUJiV2RWRldtTW9xQitNYTlSRUppSkJT?=
 =?utf-8?B?MjdHM3VzMHRlek84Qi85cTZqM0xwV09WY3lDQUlmOVRLTTUxVjE4Mmg1ZTVv?=
 =?utf-8?B?ZW9ISEhXZUh0cHRTNndYOHZxWW8vZ0RGWXZXNS94SWVTSUNvcnhudGI4cGlT?=
 =?utf-8?B?SlZnb0hBNFBhMHhaN01UVjVFRnQ5ZkVYNG41Tm9IZ2Uwb0EzdjdhM1Fhb2d1?=
 =?utf-8?B?dXZOakM2NjNFSldHVjg5VWZmWjNscXRhTkNXeFhtQUVoTnl3K3RYWjlkTitm?=
 =?utf-8?B?b1ppc3JEUUMxVExkSkRFUmtVYnZjVk41c0hnTXlGNEVRekVaUURZOE9zWTFx?=
 =?utf-8?B?bWVsQ0tjRWJ0TXZmM3creGRrWlFwOERuTE5GeFo3aW5OVW5qbXR0WUY0dlhu?=
 =?utf-8?B?Q01YaVJsWXNPSm5yWEp1eGpUUnRJTlV4WlNlS2ZqWTAxMW9pUHVlUUFYelRu?=
 =?utf-8?B?ZTNNZDJCVXY3VVFQbWN1YXhuM0srd0t1cCtkTUhmQzVReWZRcHQyYk94WmNL?=
 =?utf-8?B?KyttbnFCWkIwWDFEcjZqZ1REOXRiZno3elNYcHp3ZlNMQ1MxcHB3dkorRFRR?=
 =?utf-8?B?b2R6a1d0dzhWR2JXdHhmZnJIMVF3OVl4Y2dpMXc2NDQxRS9mbEZCYVVTeWFo?=
 =?utf-8?B?QkphZVJtcGhhZG5xYk4wSlo0Q0duYmpHbkRMTkRTZmpEa2Z6aTMzeERaNVFM?=
 =?utf-8?B?SkZYM1dCRW9WYXBxbkgzZWY5WFNWL2ZjcCtaUXEyN0pqN3J0Vld0WkhVZ0JK?=
 =?utf-8?B?QmZrK0lKdXNqNU5HR0FaTjFCZWVDUlJsdHRaUUxadkFEbHlldUtKYWJnRDk1?=
 =?utf-8?B?SUozMllZNHdDakFaNXRWQVhqdWcyczlYKzZDMEh6cGJ1Zy91ZVB3T3lweGY1?=
 =?utf-8?B?NERCSXFsT0NIUm15cGN5ZDk3V2w4OTY3ei9mdTlrQ0xDWlNlUERQckNDNU01?=
 =?utf-8?B?NTZYcDdWZHY2TSt2Mk1PMEdwZU5FckdXUlRTQ2VpUUtKb0ZRaTl4ZGtsbFAw?=
 =?utf-8?B?eS9OcFhUZUN5Wkw0YUM5U1lxMGdhOG5mZ2hlYllmby9JL3lNMTA3SDdrSXg4?=
 =?utf-8?B?MXcvMXdtL3pZbnZrTGxYcHkreGJnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Xq55ecXYHv4jOvE0DNZ4GiRE0n3esn+v/O8c616oUCrtgaGNZv/M8sEigyKbrnYM818CZRhmU3TXcuuNCeLqjSk/a1ozgf3WXetgMn6CS/ehjop2Us21styWVEphDGHJRtrRtkFX0A6Z8HkX6Mgca41dPLPBX/FfYZacVdrBSV68gSn3vcHDYmryPkW+8bW513q6soxYf8/z7lwF77JXxk1AM/ku9+C3HIH3tNwAPph2nQ5K+K3bszx0f2FAR8NCXHr7Skyybcnf4+f78To9aAMMk46j+hMMK5Ooo4poL/SsSb5/UeKwhLj4QF4WfUYWGXIwmhdYILfECpWXbr87A1m5//OCmRI36jahA5l8uQB34QyjAgTyERrFkNpA7au3tOLa8Hl+yuOnBRTzjFB0iHwqF0thVs+XJmo8NY2avNOICS7uTwZm4waZQRjmrLQM
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 18:07:02.8581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a621a2c7-fa1b-4cf4-bdf2-08de634f087f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997628
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Feb 2026 18:07:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17069


There are still a few remaining files with tisdk in the name after this 
patch:

 > find . -name "*tisdk*"
./meta-arago-distro/recipes-tisdk
./meta-arago-distro/recipes-tisdk/tisdk-uenv
./meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
./meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv
./meta-arago-distro/classes/tisdk-sw-manifest.bbclass
./meta-arago-distro/classes/tisdk-bundle.bbclass
./meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
./meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc
./meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb
./meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
./meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb


Are we planning on addressing the above as well at some point?



On 1/30/2026 4:08 PM, Andrew Davis wrote:
> These packagegroups are all "arago" packagegroups, the tisdk in the
> name is a leftover from when the TI Core SDK was generated directly
> from Arago. Some packagegroups already do not have this in their names
> but many still do, update the names to be uniformly "arago".
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   .../recipes-core/images/arago-default-image.bb   | 16 ++++++++--------
>   .../recipes-core/images/arago-thinlinux-image.bb |  6 +++---
>   ...b => packagegroup-arago-addons-sdk-target.bb} |  0
>   ...dk-addons.bb => packagegroup-arago-addons.bb} |  0
>   ...b => packagegroup-arago-base-server-extra.bb} |  0
>   ...ackagegroup-arago-connectivity-sdk-target.bb} |  0
>   ...ity.bb => packagegroup-arago-connectivity.bb} |  0
>   ...b => packagegroup-arago-crypto-sdk-target.bb} |  0
>   ...dk-crypto.bb => packagegroup-arago-crypto.bb} |  0
>   ...=> packagegroup-arago-graphics-sdk-target.bb} |  0
>   ...raphics.bb => packagegroup-arago-graphics.bb} |  0
>   ...t.bb => packagegroup-arago-gtk-sdk-target.bb} |  0
>   ...go-tisdk-gtk.bb => packagegroup-arago-gtk.bb} |  0
>   ... packagegroup-arago-multimedia-sdk-target.bb} |  0
>   ...media.bb => packagegroup-arago-multimedia.bb} |  0
>   ...-sysrepo.bb => packagegroup-arago-sysrepo.bb} |  0
>   .../packagegroup-arago-toolchain-tisdk-target.bb | 12 ++++++------
>   .../recipes-core/packagegroups/ti-world.bb       | 16 ++++++++--------
>   18 files changed, 25 insertions(+), 25 deletions(-)
>   rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-addons-sdk-target.bb => packagegroup-arago-addons-sdk-target.bb} (100%)
>   rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-addons.bb => packagegroup-arago-addons.bb} (100%)
>   rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-base-tisdk-server-extra.bb => packagegroup-arago-base-server-extra.bb} (100%)
>   rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-connectivity-sdk-target.bb => packagegroup-arago-connectivity-sdk-target.bb} (100%)
>   rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-connectivity.bb => packagegroup-arago-connectivity.bb} (100%)
>   rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-crypto-sdk-target.bb => packagegroup-arago-crypto-sdk-target.bb} (100%)
>   rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-crypto.bb => packagegroup-arago-crypto.bb} (100%)
>   rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-graphics-sdk-target.bb => packagegroup-arago-graphics-sdk-target.bb} (100%)
>   rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-graphics.bb => packagegroup-arago-graphics.bb} (100%)
>   rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-gtk-sdk-target.bb => packagegroup-arago-gtk-sdk-target.bb} (100%)
>   rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-gtk.bb => packagegroup-arago-gtk.bb} (100%)
>   rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-multimedia-sdk-target.bb => packagegroup-arago-multimedia-sdk-target.bb} (100%)
>   rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-multimedia.bb => packagegroup-arago-multimedia.bb} (100%)
>   rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-sysrepo.bb => packagegroup-arago-sysrepo.bb} (100%)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-default-image.bb b/meta-arago-distro/recipes-core/images/arago-default-image.bb
> index becd3e9b..7804e7bc 100644
> --- a/meta-arago-distro/recipes-core/images/arago-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/arago-default-image.bb
> @@ -17,17 +17,17 @@ IMAGE_INSTALL += "\
>       packagegroup-arago-console \
>       ti-test \
>       ti-test-extras \
> -    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk','',d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-graphics','',d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-gtk','',d)} \
>       ${@bb.utils.contains('DISTRO_FEATURES','opencl','packagegroup-arago-opencl','',d)} \
>       ${@bb.utils.contains('DISTRO_FEATURES','vulkan','packagegroup-arago-vulkan','',d)} \
> -    packagegroup-arago-tisdk-connectivity \
> -    packagegroup-arago-tisdk-crypto \
> -    packagegroup-arago-tisdk-multimedia \
> -    packagegroup-arago-tisdk-addons \
> -    packagegroup-arago-tisdk-addons-extra \
> +    packagegroup-arago-connectivity \
> +    packagegroup-arago-crypto \
> +    packagegroup-arago-multimedia \
> +    packagegroup-arago-addons \
> +    packagegroup-arago-addons-extra \
>       ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
> -    packagegroup-arago-tisdk-sysrepo \
> +    packagegroup-arago-sysrepo \
>   "
>   
>   DEVTOOLS = " \
> diff --git a/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb b/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
> index a30acbfb..a7ed2e8d 100644
> --- a/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
> +++ b/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
> @@ -16,9 +16,9 @@ SYSTEMD_DEFAULT_TARGET = "${@bb.utils.contains('DISTRO_FEATURES','opengl','graph
>   IMAGE_INSTALL += "\
>       packagegroup-arago-base \
>       packagegroup-arago-console \
> -    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
> -    packagegroup-arago-tisdk-connectivity \
> -    packagegroup-arago-tisdk-crypto \
> +    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-graphics','',d)} \
> +    packagegroup-arago-connectivity \
> +    packagegroup-arago-crypto \
>       docker \
>       ${ARAGO_THIN_IMAGE_EXTRA_INSTALL} \
>   "
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addons-sdk-target.bb
> similarity index 100%
> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addons-sdk-target.bb
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addons.bb
> similarity index 100%
> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addons.bb
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-server-extra.bb
> similarity index 100%
> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-server-extra.bb
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity-sdk-target.bb
> similarity index 100%
> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity-sdk-target.bb
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb
> similarity index 100%
> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-crypto-sdk-target.bb
> similarity index 100%
> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-crypto-sdk-target.bb
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-crypto.bb
> similarity index 100%
> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-crypto.bb
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics-sdk-target.bb
> similarity index 100%
> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics-sdk-target.bb
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics.bb
> similarity index 100%
> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics.bb
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk-sdk-target.bb
> similarity index 100%
> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk-sdk-target.bb
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk.bb
> similarity index 100%
> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk.bb
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia-sdk-target.bb
> similarity index 100%
> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia-sdk-target.bb
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia.bb
> similarity index 100%
> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia.bb
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysrepo.bb
> similarity index 100%
> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb
> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysrepo.bb
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
> index d3a90595..2baa1045 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
> @@ -8,20 +8,20 @@ inherit packagegroup
>   
>   TISDK_TOOLCHAIN_BASE_TARGET = "\
>       packagegroup-arago-standalone-sdk-target \
> -    packagegroup-arago-tisdk-multimedia-sdk-target \
> +    packagegroup-arago-multimedia-sdk-target \
>   "
>   
>   TISDK_TOOLCHAIN_EXTRA_TARGET = "\
> -    packagegroup-arago-tisdk-connectivity-sdk-target \
> -    packagegroup-arago-tisdk-crypto-sdk-target \
> +    packagegroup-arago-connectivity-sdk-target \
> +    packagegroup-arago-crypto-sdk-target \
>   "
>   TISDK_TOOLCHAIN_EXTRA_TARGET:omapl138 = ""
>   
>   RDEPENDS:${PN} = "\
> -    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk-sdk-target','',d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-gtk-sdk-target','',d)} \
>       ${TISDK_TOOLCHAIN_BASE_TARGET} \
>       ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
> -    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics-sdk-target','',d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-graphics-sdk-target','',d)} \
>       ${@bb.utils.contains('DISTRO_FEATURES','opencl','packagegroup-arago-opencl-sdk-target','',d)} \
> -    packagegroup-arago-tisdk-addons-sdk-target \
> +    packagegroup-arago-addons-sdk-target \
>   "
> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> index 25642831..86ba27c2 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> @@ -30,14 +30,14 @@ RDEPENDS:${PN} = "\
>       packagegroup-arago-base \
>       packagegroup-arago-console \
>       ti-test \
> -    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk','',d)} \
> -    packagegroup-arago-tisdk-connectivity \
> -    packagegroup-arago-tisdk-crypto \
> -    packagegroup-arago-tisdk-multimedia \
> -    packagegroup-arago-tisdk-addons \
> -    packagegroup-arago-tisdk-addons-extra \
> -    ${@bb.utils.contains('DISTRO_FEATURES','opengl','','packagegroup-arago-base-tisdk-server-extra',d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-graphics','',d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-gtk','',d)} \
> +    packagegroup-arago-connectivity \
> +    packagegroup-arago-crypto \
> +    packagegroup-arago-multimedia \
> +    packagegroup-arago-addons \
> +    packagegroup-arago-addons-extra \
> +    ${@bb.utils.contains('DISTRO_FEATURES','opengl','','packagegroup-arago-base-server-extra',d)} \
>       ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON2APPS}", "", d)} \
>       ${DEVTOOLS} \
>       ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

