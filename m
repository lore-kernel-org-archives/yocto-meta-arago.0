Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AA6F4BB98
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 22:35:06 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32949.1771972501703593059
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 14:35:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=PrqXTh5O;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.29, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItvWbTdMetz5HZMZc0DVzfzyUsAtN/ohjUoMM5TEFHikWRVNQpHkYZIjbivlR2DbRjXuRibvU/Sf0J2I6QkxYd4TcHU9x5j4Akj2hp9VnTcHspPItW0GhmYF9Z2S1wJddS/pLQejMibjCoSBDgwklpPkUEwM3Foy9QJL2RnJp8S2zcjllH4WydSdCANft2zF7QprKnFHOA72pK1nQMqETGUPo0lFR2rRmIHwVnn4z1VBH88kVYuBL1i9QZ/qDKXSBSj74AjKmf0ae4e/prZx9tSk+Eorn/rf+ZhIF0pg71gOMgoLA4pcBWMX7vpu+ZT4tsXerxPOFm320dxDEDtz+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wODiv2vucfHtd0Ei2Z7hAA67ilQchkQYMrcnXuaDSak=;
 b=Xxc+iq7pedsqRad02cmRBBwuURd4USi6A2qVbmJQJj8K3eFkiVN3ip80yvTX8mSjJVpgKBSPlG+vOVJvzJtAbRPDhPU/N93LACaBnBPGqzUoKsv59HTGKQorLqSQHiztCZXmEmNxXXarZwEELX3xDwvnqYnaTRYgJqvbWkRrFNnqfwyU+r5SYO582ah406v21qYdNmbOOL/i4mQx8+tuoLFHV5URnIba/jfs2Sx2ECu6VCX1jtE6T40WD7eFhnoaLH5QFnUEgmE6caKF2sG6T9eNLWmyGPmYJG+A6mbLRurfln7E5adyFvtF+1/ClCUDZYMJb+yMt/KeYj6v//ug7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wODiv2vucfHtd0Ei2Z7hAA67ilQchkQYMrcnXuaDSak=;
 b=PrqXTh5O90y7c/fo4tv/LnPQLZBb7k0pGgxw5NMuSrp0YvX4fdVZcAuKa3ZUe+OAd+iCRbDhztc/rsgVo5+YelUkeIr94ch8yULfWPBWIAiVtXogHMzfj/aDMGO0HIEg+BPnRzwxBPbxMJZ0VCRu/9Dghex4Elbq1RnIGMHa9po=
Received: from CH0PR03CA0203.namprd03.prod.outlook.com (2603:10b6:610:e4::28)
 by CO1PR10MB4611.namprd10.prod.outlook.com (2603:10b6:303:92::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Tue, 24 Feb
 2026 22:34:58 +0000
Received: from DS2PEPF000061C2.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::b2) by CH0PR03CA0203.outlook.office365.com
 (2603:10b6:610:e4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend
 Transport; Tue, 24 Feb 2026 22:34:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF000061C2.mail.protection.outlook.com (10.167.23.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 22:34:56 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 16:34:56 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 16:34:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 16:34:55 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OMYtCI3019770;
	Tue, 24 Feb 2026 16:34:55 -0600
Message-ID: <8be01b3d-de3f-496b-8a9e-3de6b9006c70@ti.com>
Date: Tue, 24 Feb 2026 16:34:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] arago.conf: Remove duplicate include
 for yocto-space-optimize.inc
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <20260224223148.1564416-1-reatmon@ti.com>
 <20260224223325.GR11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260224223325.GR11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C2:EE_|CO1PR10MB4611:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a0797a-fec4-4a64-2764-08de73f4efde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|34070700014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OHZRU3BJaHJBSzdZemNDR2F6dmR1NTZOQk43WThnMXZ6MUZsZmViVjhFMWla?=
 =?utf-8?B?c0J1RHVudUg2K0RET3N1R1dnV2Q4V1diWnNRQmxKaWJRZ3RlcndTSWZZOXYy?=
 =?utf-8?B?aE5pWjMzTHUvamN1TzJudEo5c0NadFF1cXFlNzhHRUpCZWdtem0zSk5rOWF4?=
 =?utf-8?B?dDZUdTF3cHdlTnF2eHBKaGo2ejNEeXVrYVpoQitiVEZ3MGd6WlIwWXoyNDVY?=
 =?utf-8?B?RWhGbWNoUFlSQXgya0djeUltUGs4UHZheFJtNnh1cjNyMXIzZWlTN3VpVDIw?=
 =?utf-8?B?dDRuR0p0Y1NzeUNUUStvMnJjWTB1MDgyUUx1NVR3NERuM0JnaTBvL1J5WGRi?=
 =?utf-8?B?dzJKcWxFZUwwYzM1Y3ZnRktBaUdmeHhSTmUrTVFjdXlwV0FKSUtrbCtOOE1u?=
 =?utf-8?B?UldJVGhGV1RDZXBPODZRRm16Q1JWVVU0ZExPTkpxeUlEemROSStxSHpkYmFO?=
 =?utf-8?B?Yk1QS2JCQ3JWMU11NGFNbVRoOUwweEIzaEYwK2owUDdxY204NXNFZTBTN3Vn?=
 =?utf-8?B?dE1KNDM0ZHVEOFBhKzAzWnZDTmVhdEhnMGpEZGFWeGNzeWhuSlM4Qzl2YVZt?=
 =?utf-8?B?SjBDemwzelA2a2dSUkoyUDlHeG9LOTFRNmVKYXliL3ZGcUxKaEJlTGVsUmpC?=
 =?utf-8?B?T3F0OUZYNlBXVWFla2pCNC9qNDEwWHJGYWhVQUJ1d09RSklQaHNSNlkrQldV?=
 =?utf-8?B?SUphU0QwNFRnVE15ZFN4aUY0Z0JwZllucGtqcVErVmdMTUVDblpXSm9aM3hJ?=
 =?utf-8?B?aG1Bd2oxajFEaXdZWHRMb09XTFNvd1c0L0FVQldsSTZvWXg3YldtNHQzU2hS?=
 =?utf-8?B?Z0gxQm9YMUdqUlF6SVM5bVd6ZG93dnF4dkhCdnM1MU0xbWxGRm8vL29LaXRq?=
 =?utf-8?B?WGVCSFRjSFpBSXdrVy9SRndXczNWNG1nemZBb3RGU1FBM2ZubUtTZEFRdlh3?=
 =?utf-8?B?Zkh4dmJiKzA0Tkx0akEyUjQvdTJ3SnRtYlJmbFA1V1BiL3hQRHVOZVdadmlX?=
 =?utf-8?B?TXRYSndhbnlvOTYvYlFBem5mWEl6eGxHNy94aUJ1RXF3Q1pWbGdaSGw2ZjU0?=
 =?utf-8?B?bUpxZlJJMXYycWRRRFgyODkwYkhsODA5UDdSUHZsQXNWbHo2UVFMRENxKzkw?=
 =?utf-8?B?Q1N2cUZaVlFLTnpTUWNOVERZSEs1Z3FGVWgyR05HYmRoakwrYWJZZlJtdGRG?=
 =?utf-8?B?emZYZnF0UUkwTjBRWG42aURrY0NjcURQenhNMEZtNDE2ZTVqMXNVbGlXc1M1?=
 =?utf-8?B?VitDWXdFQWxwRTRjM3ZBbUh0QzE3SE1jUnJzTHhQVGFhSnRWWWRscXJpYU5B?=
 =?utf-8?B?YkJwN3BhMkF5K1JvNmZ3T2dSbVFCOFF1aUQ2aEtJV2N5NWsvTGVxaEdJLzJE?=
 =?utf-8?B?bHgzOC83dUJhNEJmMFJBS2wwRmYrZ2Q1aDJCbm9xYXpybENiMWZMK3I4elMy?=
 =?utf-8?B?UmtYVWQvWjJkSXNpeTZ2aUNqU1o4TnE3eU01MkV2STNZMGdZVmV1clRsNDUy?=
 =?utf-8?B?ckNoaVgvdEthNmZ4T29ubEpkYTVrS2pmVGp5RkwzNG9WTnJ1WWJXd2NXaTlM?=
 =?utf-8?B?UE9RakkvL3dLallOaFBWZjZ3dndQK05DNEhUVjJTVjBNTjBuYWdqNXRZWGxa?=
 =?utf-8?B?N1VIbWxOeDFpdkFGV2FldXFldUp0dXVrRmJlckF4b0I3aEdZQkZuQUFjS0Rn?=
 =?utf-8?B?N1RPNS8rZEF4bnMrVFZ5OTdFUnBCWkJTU0R1d1JHUmlISHhiWHdwUE9YVlhW?=
 =?utf-8?B?aU5MTk9OK2NxVzNVeFlERW1Ed3VRS1FBMTBZWlZlRjdQQ1A1U2MrYUJLNXFX?=
 =?utf-8?B?RzR5RmdMb3kxdGNVZWk1Ky9UcnA1OTg2ckVFU0ErTTRxMUlCODd5RzgrZkV3?=
 =?utf-8?B?VzVjRVFob1ZUSDhZcWM0c0FuUTJMRkVDOXB4QTNEMkhldXhtT1d2U3Zmb0xy?=
 =?utf-8?B?a3pDVEJTTnY0SDJONUlpOVNRQWpyY2MrSmcrVXM4aFk5VXpzcnp3TUp3cmFJ?=
 =?utf-8?B?NkZ4a244ak1MZ1p3RkxVQlVqTjNZM09JSnRBT3ZMbGRHV3N3Q1ZrQTYvNzA1?=
 =?utf-8?B?NFZpaFhMcysyRG9ETFgvQjZwUzdTb3UvVU5HQnVUMEhjR0w3U2lWL0NMa3o0?=
 =?utf-8?B?Z1lKWkNaeGxNVnpWK3FHdU5xR3pvZGQyRHpZOTZvcE00K1lsZ05OTlFKU1BR?=
 =?utf-8?B?RnFlREw5ajYrdmZPL0U5ZTNHRVNxT09WNWt4S2JYeTFMTnovdGtFUWkwajFZ?=
 =?utf-8?B?WFRGT1lzVGFhMDNtNTAzckZBTzhRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(34070700014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+qHUVTEJzIarJc/fuABhnCMZatCNSP6jNlCghG5JydZGR4OWocxGK0Dxr96QIAyNhMkqa2q/7bHABWpM9KzyhHsBOM+6SQia18TIBFYyJ/fgvxDVzK4AefIfxcqXv6f+eJuMHUZgrXIYVCANcSgBf3km+8AAp4+vKacn2OYRV324L81SR/3Fxq8YaqZEBbSDnvu8k29fgXzbGMjPAuasl2nTZ3tlHZBxOIH7IUKlh3XUm6O0zr1PksexRftBbRgEoAyKAw7EctRK+EzTjdtPn6KxIVIdjniGqw5Cc490UENX0P8VT9K5e5dny287umCt/eTi8TmLToTL+hdwF2sOwgX/3f1hch/Gc3QLUaDCX2dlIGhY2TyFLCOYDDHo7d3dL/5SlO2vZIyyphUO9/Sy8jYZOV8KnRFHx31kgvobsZIUodtAz2Qxx+07p0UZxHM1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:34:56.5734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a0797a-fec4-4a64-2764-08de73f4efde
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4611
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 Feb 2026 22:35:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17139



On 2/24/2026 4:33 PM, Denys Dmytriyenko wrote:
> On Tue, Feb 24, 2026 at 04:31:47PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> As of [1], yocto-space-optimize.inc is now included by default.  So we
>> can drop our duplicate require and fix a warning message:
>>
>> WARNING: Duplicate inclusion for <snip>/oe-core/meta/conf/distro/include/yocto-space-optimize.inc in <snip>/oe-core/meta/conf/distro/defaultsetup.conf
>>
>> [1] https://git.openembedded.org/openembedded-core/commit/?id=175fcf9fad699dd122680d3f6961af9bf8487046
> 
> Yeah, I had a revert pending for this, blocked by iperf breakage - ACK.

That's what happens when you ask me to look at the build failures. =)  I 
find all of the issues.


> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-arago-distro/conf/distro/arago.conf | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
>> index 4ec091e4..17c6fed8 100644
>> --- a/meta-arago-distro/conf/distro/arago.conf
>> +++ b/meta-arago-distro/conf/distro/arago.conf
>> @@ -6,8 +6,6 @@ BUILD_VARIANT = "${@['prod','rt'][int(d.getVar('ARAGO_RT_ENABLE'))]}"
>>   TISDK_VERSION ?= "live"
>>   FEEDURIPREFIX ?= "builds/${DISTRO}-master/${BUILD_VARIANT}/${MACHINE}/latest/packages/"
>>   
>> -require conf/distro/include/yocto-space-optimize.inc
>> -
>>   OPKG_ARGS:remove = "--prefer-arch-to-version"
>>   
>>   TI_MIRROR = "http://software-dl.ti.com/processor-sdk-mirror/sources/"
>> -- 
>> 2.43.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

