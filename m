Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAC8E83060
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 20:09:30 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2952.1770149366088300572
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 12:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=HymqUXlq;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.5, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N154qC1iQpQMCc5+gdrEZc/hPDMycMXsI5Fw1suw9eVOLPFY1v5FvO4ILV+qc5sqY91toBClXveBqUs6MiQ0XYkVCOO2V1duZwh2G3/f7QpuAmd8z21kEu3+PuaSVnStDmPAzRc2m0xnfNV9qwZSYt0OCjtcrU//pqwotWJIzXx5MA4/giw116H+au0ToyqxktXZ9TY/1w5sj7mnWNZH9BbrZbdPKAEvlbjbMkR/K85sDcakCaNWBmx9M4Ludd0Lgj2zwtaYuF5ekpU7FuZZlq2T0Vv/71oyJhFBdhqOLAHYD6GlVFCXv8Fi/AHBxmevpSKP8lfqLj68/so0jwtUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4cIvPQ8ND9xZ0j5pQDM23RoX+93sVyGNqe8v/XWoaE=;
 b=EaC3L9heiL7cxfJtv/j3GsdOVy8VAePY5pnbdD7gR5f4kXArIGZFlEqKh98bIhrqQry3Sm+51v9Puu92N9JPWZLsQgd8cCe9ZMzqPz9/nrfiLt5GKx3ZSGmwILRCUwpZg30zKGSx4Rorl04lwkN8D9X2Q7bfeGQftQ/fv+dqPVudb5bKJcfadKfpuf6qWJvZrwyhwHiB75C34qalMNdewXlQ9HKsr+NONydxdI/i7Ng2/8vHCCT5E7UN9zPSDuVb6ND17fqDSfB7EzNr/N0rGxRpzfBo/CJqsBMUqR53N5JlVFRmoCa/0aGDKBjJLD5CqeQKlYHxEvYv/BQAb28xUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4cIvPQ8ND9xZ0j5pQDM23RoX+93sVyGNqe8v/XWoaE=;
 b=HymqUXlqxS6kmmIHgKeZZH3LA/QK0ydstgIf2SwtftIlfD/IypWyu0gG+1KzO2kyqZGH4FEHCddJI3qBq4Av/vus0ujhlQGEr29P7euK9KUe4jJFACA5c83mpragZEnC45RR8WappKrD/DA3tm9z0No5D3EQ8JPZ32GJHDpkZnA=
Received: from BYAPR02CA0035.namprd02.prod.outlook.com (2603:10b6:a02:ee::48)
 by SJ0PR10MB4416.namprd10.prod.outlook.com (2603:10b6:a03:2ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 20:09:23 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::bc) by BYAPR02CA0035.outlook.office365.com
 (2603:10b6:a02:ee::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 20:09:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 20:09:22 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:09:17 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:09:17 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 14:09:17 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 613K9HeI308701;
	Tue, 3 Feb 2026 14:09:17 -0600
Message-ID: <9af17047-093e-4495-922b-bbc091e52b44@ti.com>
Date: Tue, 3 Feb 2026 14:09:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 2/2] meta-arago-distro: Remove
 tisdk name from Arago packagegroups
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260130220830.2173125-1-afd@ti.com>
 <20260130220830.2173125-3-afd@ti.com>
 <3b100130-a5b8-458a-8c0d-9bffbd47410e@ti.com>
 <ddeb60f2-b8a6-4d7d-861b-36f11012afa7@ti.com>
 <20260203193031.GY11121@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260203193031.GY11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|SJ0PR10MB4416:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ed9135-00cb-4a4f-18aa-08de63601f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UDdIbFVwVHZDdlduZlNrYlFNYUdVTm5qcm5SakxnMkJEK3dnaDlRRHhCQkR0?=
 =?utf-8?B?T2lQcFpyVXU0OFRidWUwa1RBREVrOWtnZUxLRTUwZk81S014WUwzUXNQbDRs?=
 =?utf-8?B?bmFJV0RZaDBVcGd4NlNYVlRGc0hQbGR0NFJWemxObDBickNGaDR4dUhCYXpu?=
 =?utf-8?B?RmV2U3BBZmQ2UzJkNzVmSERqOUFTUC8vQi9NU3Q5blFCU3REYlBFTjFaR0xo?=
 =?utf-8?B?T3R1L2IvZFdiTGJNcllSUmc3MFZlcytJYTd2VGpSUEkrN2ZUQmZBbmFNWDFx?=
 =?utf-8?B?eVVTS3ByVTJZYVhUbkdDZ2xqUDQvN3hLSSs3eUZDUUJKYi9xZUJTQzBIQkJi?=
 =?utf-8?B?VG9Zd1BickpjSzFnNVJSZ1pzVzNlOEVkejRGYWZsS3dIODlETVhxOGdjbkI1?=
 =?utf-8?B?S3lPRVZtRi9WaURoRW5jYXZEa2E0MWFRY3BBTUF2c1dxZDBUQTVTQ04xcHA1?=
 =?utf-8?B?TkxxRmhvVldnc3l4aU5SRWdZVlhJSDlKMVExMUNpbFZiWmlqYlZHRmladTIw?=
 =?utf-8?B?K21OeEZYNE1pbEFHbElHdGU0dTRvdnRLdU9YSnFVSmhLL2FZaFlHclV0UG81?=
 =?utf-8?B?SmFiNjI4S2FWRjNYK2UvV0RZQ2hBMCtXelRuUGpkS25hd1QyYzJFTzZsR25U?=
 =?utf-8?B?QlJYd0hMMXpYYVV6OUZGS29HbUZWV3ZuY0lCQjMwTUxLczZENHRkVjNWSUdS?=
 =?utf-8?B?TFRWRHJwS3lMZ3MxU1lLTmZaeWZlUDJTNHFyK3BNelpYN0dzSmJXVlhtOEZr?=
 =?utf-8?B?TjJydzU0d3cxR2JjYkoyT2p0UlhxaFdKWWJzb1ZtTVIzMHFqL0l5c3ZCMENS?=
 =?utf-8?B?K2dsWWZ3VlBzSTQwSk4rT0dUOTBYQXRZZm5ZRzV3MTlQa1R4TDY5Y1MrQTFH?=
 =?utf-8?B?UmF1ajR2WDFFdFFod2RCL21ianpXRTJoZUxDWlNBQU9nQ3VTaG0rR2pPd1NX?=
 =?utf-8?B?N21PUGZlbXA0RVB4NlBWSU9kUWIxcEpUUHkrQSs0SVU4R09VV3c3S1NyRHlU?=
 =?utf-8?B?QjVUdGNXOFQ3SnJHalNZZW84czRBME9lM3J4L1pNVkp1UERLQU5oUXpuUkd4?=
 =?utf-8?B?SnpiVjI1ZUhkZHNXQmJGLzJscEJ1ZUFrZENnQ3VkVXAreTJoalYzeFJ6UGZy?=
 =?utf-8?B?bDkvYU1VVDY4Z2VWZ0FKSEJrejNuT3d5WjhOcVZiODJVNVhpS2EyaUNCc1d5?=
 =?utf-8?B?YzBSNU16RVhCVExUaTgrWGpaK2pjQzFpdHVMdHdPTDM0cG1RQlRBTkREU3g2?=
 =?utf-8?B?N3FxRjJMUU12Mlp3TDkwMGpRd2xsdHQzeTZaUlA3VFEwZW9FVWVmYndPeXM1?=
 =?utf-8?B?bi9BTDVqdnQ0VjJxWFB4QVhBN0NJQ0U1VmlWWmdaUmdlMVYxU0VJQ0YvS0cw?=
 =?utf-8?B?QjdkS250bFprN1pKUFExRWd1L0ptQThBZVBGS3A3Y1Z5SVpSall5RDhhNkJl?=
 =?utf-8?B?SzhEVmdqKzVEa1FTWUM0OGxzNTltRmlndytzQ0gwZzVIRWpTZXZxaWdYS1pn?=
 =?utf-8?B?T2NkSlpnY2RpRjlqSkJ0a2pJalhIUGVCenQ3RVJ4V3hud0U3WVppV0h6UnFZ?=
 =?utf-8?B?SDVFUVk4NGxiZTFCeCtHQk5HRlVFUUd3Y25CaS9Id2ZVSzFiUS93dmIvc3ZB?=
 =?utf-8?B?RDFRSWdvQzRnc3o5WjZEdkxRRERzd3VYTXlhMlN2cTUyMkcwNTZmdkllTDJ2?=
 =?utf-8?B?Z3hsSDltQ28ycUM1VUoyVUlJVnNGME45VEZkZ3ZwRXg0Z20wY3oySXVMaWtY?=
 =?utf-8?B?Z1hxczA0UFBKK0RpZ0w0TmxXUmp4WW8xd0QrMWpmZTNLakZ3Mzl5WEh5V0R3?=
 =?utf-8?B?ZHczRlljTzl3YXk2djR0N3MyaWtnSDJiZUhaazRReTRsUVhHTFJJRU5uaFFI?=
 =?utf-8?B?VTdnRkFqTHFzTkRRM2poSmNNWHFFQmF2VjF4UlVtNVRYWSsrMWJEdk1HRGww?=
 =?utf-8?B?bHpmeUNsdVoxMzhKYTFEcWEzUUhzb3Z5WXRZbHl3RXQwNCtyaSttdXVkaWlZ?=
 =?utf-8?B?L0h0bDZVaWZ6V25RbmxWMUZyRTlaaWpQK0w0a3ZyY1VERFFNNzkyNEJzdjc1?=
 =?utf-8?B?TnF1NHBxT3hqUFIzZi80VDlFSGRNZldQaURKQVBMOUFmYUpsNktISkRVeVFT?=
 =?utf-8?B?L3BjKzhOcjF2S1JRdzVRNlV4QmJBUmZaczBaQzlWbUVNOWhFSWd3K2MyM1Ey?=
 =?utf-8?B?SkE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HsWhgcI0Ob8uMHpZUx2kTOIsz0RCnp1c0Owlot57vZq0IFEGIBaipPo2pOvT0R76gpLBKpwIibJHCG6pBPUTnWqceP9hacKiXNxQ4HMZL++ac0n4KngZ3S6ygGn1fZeI/11WaMqQBUUGTdxXEDL2IEfdMvZEX20xvLSxQMD5XJOVUOxIEMD4OWb4Dn7sCIvZEpObxcuXx6kBrcjW6uCCiMUS+K4pDS5LcDrKeh9j9hbpw2N0CAwzAUNFK5mOJT2iS17WGHgqvyM+8aOh3jjJx0XgqeWbDQnny5tHC7WhbasqnZmXQ/z29uiQCuge6Gl3/BeEYBgbWQHxce3260/b22Qe2EckpEwFscIysmXQ0W6VidBN5RPfw1phbgVDk8b/z1UCw1dBw+twKZmf+MpxUaIxts9tDifyh5bW+nJqwaZKiqRVJO85lvGh03YAFPXY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 20:09:22.5458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ed9135-00cb-4a4f-18aa-08de63601f52
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4416
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Feb 2026 20:09:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17074

On 2/3/26 1:30 PM, Denys Dmytriyenko wrote:
> On Tue, Feb 03, 2026 at 12:58:52PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> On 2/3/26 12:07 PM, Ryan Eatmon wrote:
>>>
>>> There are still a few remaining files with tisdk in the name after this patch:
>>>
>>>> find . -name "*tisdk*"
>>> ./meta-arago-distro/recipes-tisdk
>>> ./meta-arago-distro/recipes-tisdk/tisdk-uenv
>>> ./meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
>>> ./meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv
>>
>> This recipe I've been wanting to remove for other reasons (DEPLOYDIR messiness), plan
>> is either merge this into the U-Boot recipe as it is the consumer of the deployed
>> uEnv.txt. Or just move it to meta-tisdk where is actually used for something.
>> (the version of uEnv.txt in meta-arago is just an empty placeholder file).
>>
>>> ./meta-arago-distro/classes/tisdk-sw-manifest.bbclass
>>> ./meta-arago-distro/classes/tisdk-bundle.bbclass
>>> ./meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
>>> ./meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc
>>> ./meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb
>>> ./meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
>>> ./meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
>>>
>>>
>>
>> To be honest I don't know enough about the original intent of the Arago toolchain
>> and bundle to feel safe messing with them. I think they should either move into
>> meta-tisdk, or just be removed depending on discussions on switching to the Yocto
>> provided "Standard SDK"[0]. But that would be a project outside of this renaming
> 
> What exactly do you mean "switching to the Yocto provided Standard SDK"??
> 

I mean switching to exactly what Yocto provides, nothing custom.

> Arago does produce a slightly extended and slightly customized "Standard SDK"
> from OE/Yocto perspective. Since that comes from meta-toolchain*, those terms
> are sometimes interchangeable...
> 
> Moreover, Arago produces 2 Standard SDKs - one for Linux Cortex-A and another
> for baremetal Cortex-R. They get named as devkits though, because from TI's
> perspective, the "released" SDK is a bundle of devkits, pre-built binaries
> and collateral, such as SW manifest in TI own format. That's the point of
> tisdk-bundle.bbclass and tisdk-sw-manifest.bbclass
> 
> So, everyhting is pretty "Standard" from OE/Yocto perspective. The only
> "Custom" part is bundling several separate pieces together into a single
> "release" tarball (product teams may create InstallShield executable of it).
> 

So then let's leave that for the product teams if they choose to continue
to do these odd (just my opinion) executable bundle SDK things. We don't
release Core/Arago SDKs that way, so why does this live here in meta-arago?

> Besides the 2 bbclasses, the rest of the recipes just slightly extend and
> slightly customize existing meta-toolchain* flow and are within the existing
> "Standard SDK" framework.

You say "slightly" but the files relating to this make up more than 10% of all
of meta-arago by lines. And they are some dense scripting which I have no good
way of knowing what is still used by downstream product SDKs or not.

Andrew

> 
> 
>> PR.
>>
>> Andrew
>>
>> [0] https://docs.yoctoproject.org/sdk-manual/using.html
>>
>>> Are we planning on addressing the above as well at some point?


