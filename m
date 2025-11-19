Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083A6CF58D6
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 19:57:31 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16247.1763582239906020867
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 11:57:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=nMSVJXBK;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 40.93.201.45, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uA25U/2x0rwB3fCuNmpbp6v06OyysRQ7kk1RN2gn+D00ItIKUSg91QuEhXVcAHAhZUxLLxrviH/ZOEuyMCQqBs2MdcyaY3XMcGSQoi6lgVvlvL75eyp2TAwCpIRAU2Y8+HyybNE8Pka+P3lWmprWnG+/06yJ5MGmcTOIa/Qh1VQ45PnViiuU6EiQG1YH2cqF7kFVKDstj4wmyldmyGr7gjJQn041s9nzeMCzB4Nv4jZ8ZRE1jHWWF3SglEBvWYGinZf/MeIMsY/LYhcGxaO/RL4iH1uVWB5OxK5LCSBCY7nnuCtgOW2JlHGhLwNiTTj8phsoquZjlEgE2PpTqsoUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4JCPVoltP2aAoa6Egc51XxX/ZCfZ4/VmdXdNvhNlNk=;
 b=CmSXH+cWo+vpH3OclgEqhatx6soknCBC35GOv66bXUQBMnpny/J55lBetdDqFnc4NPKH1xP1WLSroyzRghj+vrmYEuoLpJh3dYvxppEpSFjjh1VvIMyzYDKaxAvpHtvsUUYJEYxlItJ70WAIJ+7uM17SYJ7V2gnIGS+I7irfwKLWYj72nBUkk3Z2TTqh4h5NXRwmMB2k9YRqrYgqkhJv8yzeiB0+YLRn8JdNMs6zibc3wbw65pVgtLmrThaD+gU/sWinM/k/5M+4SzqWgc5ZOi010RFIEi+RYLPxW0ioXDp1D1nl93lpcKff7groQkTOpiWPLZpXvqYfzahn38h9pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4JCPVoltP2aAoa6Egc51XxX/ZCfZ4/VmdXdNvhNlNk=;
 b=nMSVJXBKRzKOUWeybe+LKdW8rZx1LzeIRR0B7K9YXmjGA+Fve4zGjI42xedz4SBhBqHOBIyF8xW1HdqbmOi9t5xNcW4qb/xPAdVKIZFBCrh2LaYrBp7dcBDjSKqjbQPTOR4ZlhWVtYTaN0nRJmvT6gb4/PM6tD00cqrgNcG6IYQ=
Received: from MN2PR14CA0027.namprd14.prod.outlook.com (2603:10b6:208:23e::32)
 by DM3PPFBBE6F5DB9.namprd10.prod.outlook.com (2603:10b6:f:fc00::c45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 19:57:16 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::9a) by MN2PR14CA0027.outlook.office365.com
 (2603:10b6:208:23e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 19:57:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 19:57:16 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 13:57:16 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 13:57:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 13:57:15 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJJvF882398172;
	Wed, 19 Nov 2025 13:57:15 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 19 Nov 2025 13:57:15 -0600
Message-ID: <DECXQ6GPF1SU.1SNYQ9LW3S469@ti.com>
From: Randolph Sapp <rs@ti.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <rs@ti.com>, <d-gole@ti.com>,
	<reatmon@ti.com>, <denis@denix.org>, <praneeth@ti.com>, <nsaulnier@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] udev-aragoconf: remove legacy
 usb rules
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251118215640.249268-2-rs@ti.com>
 <09b233298d3b995ec7b1f9595d3332491ccaf176.camel@ti.com>
In-Reply-To: <09b233298d3b995ec7b1f9595d3332491ccaf176.camel@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|DM3PPFBBE6F5DB9:EE_
X-MS-Office365-Filtering-Correlation-Id: 19be8348-7b13-4651-995b-08de27a5d724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q1dkd2EvWDFRNTdaY1FpOGpUUjdKbGwxQWI5UXNyZXdNYU1FUkpMRVZTdElJ?=
 =?utf-8?B?enRqK0FmekJGV1pURXlTdysxa1pkeVhpK1VhQTJsQkJUa3VESkkwb2lqZmtV?=
 =?utf-8?B?RFlJbk1Sdk02dFBRNnAwMGRlVWw3Z1BMaEVqbWJnS284ZURhLzRHd0EzNGRI?=
 =?utf-8?B?c3VkWms5bUVBTnh2TXZNT05IREJlVmtnOVVreGlFbWJ6SUsrcmF3T0lmWDhn?=
 =?utf-8?B?cVdKbUhPc2s3SlVYaWxSbVF3cS9YNC93SVJzVjVXd21HbXFHbmhrK2dMQ2hy?=
 =?utf-8?B?SVZxQXgrNEZVSytxYTdjVGVBcmpURFl6b0trQWpwMEpCODhaZzE0VnhJR2NY?=
 =?utf-8?B?cWYwVlg1Z2NsVGxTcVQ2Z2JkN0Z4V0laMlIwdTVuVmJ5RVZJMjdlNWNDc2gy?=
 =?utf-8?B?dGtZdUQwZ0Y0alJNZENBTlhGNFZ1all4aWhNWmt2dHBOdGkxMWNwV3dGeTNm?=
 =?utf-8?B?OEhNVEFtK255eEY5eU9objBQOWJtQTFBek1qdmhsR1plUkw1OW9lakRhTnA4?=
 =?utf-8?B?SkZSa0RGM1Q5VUwyemVNTjU3RnNrUDc3Wks2ZzBlVDlTbXJVWXU4aEJ2cjZr?=
 =?utf-8?B?T29PQjFPczA4dGpDTFJtSDRkbkwzMGVGQU1pYzJVVFR4NnRjcjRIbXpuWDV1?=
 =?utf-8?B?MmtMajNXK3hMVWxYWGVWUlJUWkw1cWxSd1BTVmd4SUtqVWtSYkFLY3ppaHFr?=
 =?utf-8?B?WmYrdmxZc2tOYTdYRG1YR3VGR2xtVFZHWmVjUWlQTG5SNDV5YlR2aDlIUVk3?=
 =?utf-8?B?cElhUW1oS0M2ZFROQjc4UDZaWDc0Q3orNTAxQWdzZmYydG04L3loSkYwbExW?=
 =?utf-8?B?cm5iQWx4VGora2dYMEx0Q3F6WHY5L0dJcVYvZEhETWo4Y2VSbkJqWmthMmtK?=
 =?utf-8?B?NGhTcnBUS283bXQ5TFlhYnkvazZhQVVzb0FUb1JEaFhjQ0swMVBSTDVPejZD?=
 =?utf-8?B?REtzZUNzdnQ3K3ljRVlhRjdub2Myc3dMdkRlQUs3WGFFTU1HL21nWFNNNmVI?=
 =?utf-8?B?ZHNJOVhLc3hnaUtVVGV0UC9ObG1HOHNDN1dsNUtuZDVzN3lod1pIRG82Rysw?=
 =?utf-8?B?ajZYdFo0VnZVYTh4Y1JHWjl1ZGw2L2NtZ0EvMHZuY1Rxc29iTXM1SG1OUWpX?=
 =?utf-8?B?ck03cGgrSXhGRUE5TVlVWVNIOGRjYjdVZXpIOFM0enJ6bkhDMjJreng2ODNq?=
 =?utf-8?B?Q2xiUENPQkh4RzBnUlZmQmd3WWZadWs4N3JWajdhVGdQbTBPZldTSVpmZmh0?=
 =?utf-8?B?eUJ5WHg5YXY2R2RoSWxRcXpQdjd1VEErdnloejd3VVVGYXJTU2ErYWFaTGpY?=
 =?utf-8?B?QzBLeHNCY0dWVGpzckEzSVkxczdaWkxBZGxNbk9aTnp4QTl4RXFMWjdEek5v?=
 =?utf-8?B?TEZ1cmNzYnZhUWJob3d4YVBnSHV3dTNlODhwTzhuQ01uSk9WSlpKaG4vcHJx?=
 =?utf-8?B?dnlmdFU4b1JnWWE4b1JxZWJuVlY4TjFLOW9lczFJV0xMVXRaNjY1WTI3Sy9i?=
 =?utf-8?B?L2c5RU9BYXFzVnRZa2RIUTJpbXcrMFZkUDJNTFF6aXl2cy9HRmFBWk4vMzk1?=
 =?utf-8?B?L1BYS1FKenVXNjNxbEhRTzNpRnozaUtNeGVWUlFwZW5ZVkE3bExpYTlKaW8x?=
 =?utf-8?B?SVR5OUI5eUU3ajhTbTN2WEtZN0UrNi9OZVduNk15SGRUNVlPbi9OeUFnU0k0?=
 =?utf-8?B?d0JwakFySzh2WUFxZ2ZIVFlYR3lqSG1QdVBXbmpwNkJuQzQ1QzZHL1czQ3Vi?=
 =?utf-8?B?ajRUWm5iUWxpNG4yallOa3NhTjF1bzhIZjdXTmROL2xWWEpLdWZZK3NmU3I2?=
 =?utf-8?B?Ty93ekZqeVFKdDRKaHVJT2x6VUszWFhuc1VJY3pkUm9GejNQb29uY25iWnJa?=
 =?utf-8?B?TmtUUks1Y01ZeUNiSDBVc0tObUx6clltRjc0dlFMWTBnZzlrN2hwSUVXOFQz?=
 =?utf-8?B?UmNqOVByYzNzdklOWVQwMnZ2dHpwRWpQZk9jMHlvUng0a0FSY2I2eWlxeGFs?=
 =?utf-8?B?YjVvbDVPWDN6RzJOUm9SYnJUMktKK2hVYlRuQVI5dExiMmhvODlzSFJldS83?=
 =?utf-8?B?TkpHTXFmYmdvRFh2MjhVbDNydkdDZEloYlhKOTVFeWZtbUVIZjNmRzF2eDBP?=
 =?utf-8?Q?qGs8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 19:57:16.4625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19be8348-7b13-4651-995b-08de27a5d724
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFBBE6F5DB9
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 19:57:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16799

On Wed Nov 19, 2025 at 12:21 AM CST, Siddharth Vadapalli wrote:
> On Tue, 2025-11-18 at 15:56 -0600, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> These rules do not match the current structure of the USB DEVPATH and
>> are not actually fired.
>>=20
>> They were initially cited as being help scripts, but I think users
>> should attempt to gracefully bring down the gadget interface on their
>> own instead of relying on a script that will attempt to reload it post
>> mode change.
>>=20
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>
> Additionally, 'configfs' is used for configuring USB Gadget drivers using
> the libcomposite driver. The Gadget Zero 'g_zero' and other USB Gadgets
> should be enabled via 'configfs' as documented at:
> https://docs.kernel.org/usb/gadget_configfs.html
>
> Loading individual Gadget drivers via 'modprobe' is deprecated in favor o=
f
> the above.
>
> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>
> Regards,
> Siddharth.

Thanks for the review Siddharth. Could you or someone familiar with the cur=
rent
USB tooling update the documentation for the DWC3 [1]? I'm not sure if it w=
as
never correctly imported from the processor wiki or what, but it appears th=
ere a
sections missing and the content present appears disjointed.

A lot of it can be reduced to links to the upstream DWC3 docs [2] and linke=
d
gadget configfs. At the moment the only thing that even mentions gadget con=
figfs
is the AM62_DWC3 document, and it only does so because of a kconfig code
snippet.

[1] https://github.com/TexasInstruments/processor-sdk-doc/blob/master/sourc=
e/linux/Foundational_Components/Kernel/Kernel_Drivers/USB/DWC3.rst
[2] https://docs.kernel.org/driver-api/usb/dwc3.html

