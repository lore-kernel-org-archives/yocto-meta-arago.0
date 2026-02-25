Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507B6F5543F
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 02:38:48 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37345.1771987122222154185
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 18:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=txkzVNcx;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.60, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myBRNlq/X0sfAADXsSEob7wXY8bRrsmDmhyqIIFSVKDOswFUTfLJxpXYzcdrQv2SFRW9bY6/e/yCvk7qaWXd+zfo/n19ZhsU3phWQg4J8r+GKjm6CcWAHb64Sy13GaWQNpCXk2kFrpy9co1fOBsbPLpCMCKBWBcVu5Jk8OYJai8m8erBmcXSjl3g7aj938qhAmLM9F9ppr7bFu9bNbbooPoUqy4SZ+6X5KYuQjwomPZcBCt0Sq7XbPGsfFbSUnOo1K7mgk/LJjySsJ6Hp6FMqJhIocrZWTZ4jzE7U3xz4MWBuwNXR/0yER8PLxYyYUWfv6Gih0rp0lMMPPNRFKSE0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Gu5BxFm/w+YGyVvtpa+eU1CG/jMBCt7Rrin2mB9r48=;
 b=B3hpy1dDFMp0vE9wE6+wzlZoiYuib4zLr7XLY+BR31aoI4VEDRhhHzXPb23Qrnn1X3ZvZW7XIRouRv1Z1NR35gxuVmrpgzufKvSFrrnVA4KzL0Zl6o1KMYGBf3n4rFKAq+weXzRwauRAMaKYf/GSwGzRiZw036oQ/t2jptuM1IFScCJMqJV502pkdJz3s8EqEJVHQZmj5CZ8pZb4qey/mmIwWGMPpg5TMRee2BffrR6iax2YutVyXZ7A9rkjbG7DJX3zoK5z7cQkp/LJcmwotpJFsP9dvuXZ1pxxHgCbVk2AJxB6vG/XJsgEJAyd9PjDdDbYMJb1bnbmSwEh3xbaqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Gu5BxFm/w+YGyVvtpa+eU1CG/jMBCt7Rrin2mB9r48=;
 b=txkzVNcxQgm4VVwA7nwvwhY1Pf0IBlaukIRRTjyN54mQM2d8SJ2/SR5SuQCwLVj1+sqZKIw1wRdiC6j9qx7RFpLQnaTpN0NEwSWnJvuGWDFRr+uWEhSL85xgCNivbPk0k4RpxeEu4DtFLEvpnKqIyAoLGvefiYVABwETyCWJ59U=
Received: from BL1PR13CA0027.namprd13.prod.outlook.com (2603:10b6:208:256::32)
 by SA2PR10MB4715.namprd10.prod.outlook.com (2603:10b6:806:fb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 02:38:39 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::22) by BL1PR13CA0027.outlook.office365.com
 (2603:10b6:208:256::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 02:38:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 02:38:39 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:38:34 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:38:34 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 20:38:34 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61P2cY0P3335531;
	Tue, 24 Feb 2026 20:38:34 -0600
Message-ID: <54a31620-0e97-4ee4-8579-246364995069@ti.com>
Date: Tue, 24 Feb 2026 20:38:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] arago.conf: Tweak a couple of
 settings following oe-core changes
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <18975B6BCB26C6EA.1454197@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <18975B6BCB26C6EA.1454197@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|SA2PR10MB4715:EE_
X-MS-Office365-Filtering-Correlation-Id: d7f92bf0-7bda-4c2b-5bc4-08de7416fbd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|34070700014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c1NQdjd4NnJ5OURlZWhzZnNRUGNNU2wyYS9xU2RFV3M4YUQyTW5EL2tYR29S?=
 =?utf-8?B?V1p3Qi9kSTYxbUxBdmd4S25JTTIyNmJ5OVFYSDZiOUxXSjhiM2haVTZxZGE4?=
 =?utf-8?B?V3NtNEVsS0Z4OGhkeFVrcWx0MWxtbGRWTFRWUWd1MG9MTGNBejVLWjFoL3pO?=
 =?utf-8?B?cVgxUWxWT2RncnN6NzhzcWRVejFyZXcyZitkOTFMd09SMnZYNlI1UWhDN2Jp?=
 =?utf-8?B?NlhySEJLOGkyTFBEdkZFNXkvSHlDWWswOFVUTWlFaTBUN0xIQ3o3bERUdTln?=
 =?utf-8?B?VGNYbTlMS29DRmZ0bjdQRjE1QkRiUVM0UzhFRm0rWTRlMnVaZ1Y5akg5dFRB?=
 =?utf-8?B?T2loRDJtb21jTkNWNGZlZUJwMEZVdW5vT3hmVHd4bUtTbmFabElOM3RuSzBK?=
 =?utf-8?B?VGZPSm5NNWVjUVpQTjR0b3dWd3JIOFNwS2xUTGhVSDRWT0lSOUNxNlFjZDBD?=
 =?utf-8?B?ei93UXpTWEFzd3FRaFdCWTFlOTBYUG9sY3FYdk4wY09jaXFmNVVuVGVvQy9t?=
 =?utf-8?B?OFJGcHBJRnRjNER4U1M4N1Y0VzdoT00zQVVRK1dSUzlVeno2TS8rUDNxOGla?=
 =?utf-8?B?MDEzbVdTazJIUU5PckhKeFc0M0E1WVVWYzRiRms5UWc2Rkw0MWlCdEpTRWdX?=
 =?utf-8?B?QmJKWmxnajkzQktPZTJqSjdjL3cwaTNIQ29MUy9HY2ozMXNSU2JRbDJrSWhJ?=
 =?utf-8?B?L2JhQ0lPMkZFeVVXRSsvNlpMUzNhaVdBZkVSRkN0SFR4V1FTcTh0STBpcVBR?=
 =?utf-8?B?bVhBamtZRGJTSVFGWHFITmtsMCtIeHVQSGo1clFPSUR0ZjVRSFppSDYwUlds?=
 =?utf-8?B?c1lWUjZCaXJXMENQNFJkN1dERFNjdk03M0Z5RE9zODNvTGIxb0RRbE1oS0w2?=
 =?utf-8?B?d0NvcWlRcmppYTEvTXQxVE5XbEwzOE5tSUt4S0JNZ1prdStZZTFmN3FEMllY?=
 =?utf-8?B?akJiWUtFY2ViWFVhclY5QnkxTEhmSnk0enhyaXpuVzV1dDhiMDFkdXFiaWl3?=
 =?utf-8?B?RFlPTTBCYStqNzJFdGVnR1pFbjlTL3pGRWdpeVBDRFJlZTAzRDRzMFJCWlgz?=
 =?utf-8?B?QVlRRkNBVEtqcTB5ZkdyaDFIVURuQUo2bVRod2hrY1NxeWxnM0k1Tmcwa21M?=
 =?utf-8?B?eU1PbE5kb0dmVWpQVVE0Y1JQd2pMSkFUR3g0aUhSWlVraXBLdmkvSjZWTmZw?=
 =?utf-8?B?aWtRejk5dDJPQm93TlB1QmgxOVJqcE11SzBtOFQ3REV4V0VxRUNiZWRQMk1C?=
 =?utf-8?B?VmRHWVFKNEdyblY4amgzdlE5UzdVaWNzTDk0ZkFZcUVtTEdsY3dQVCthNHdR?=
 =?utf-8?B?TG9LMXZrUGlCY3BxK2NWVFJJTFlCb2dUQ3RvU040YUdFM3NSNXRqa1kzMnNp?=
 =?utf-8?B?MDNtNDc0eDAzUk5mR3BBb0dvc1hiT1dmZ3ZRSGI0S2luZ1diSTh2OTd1c3hi?=
 =?utf-8?B?VTk0VGR4K0NzZDAzTVZoZ3YrMElBYnlVcnBRczBCWndjczd5N3hkeXE3clMv?=
 =?utf-8?B?SlhseW04aEJyaEUvdnpWV0VWdkl5RGlyTEJsR21jQm5QYzFtTGl6dFJkVTVp?=
 =?utf-8?B?YU8xOWV1RWlxWFFSbXRxQ0s4U1daNGVCVUtsMG9IcXkvekF6RDVLU0MwTXZT?=
 =?utf-8?B?citiRzFXWmx0djg0RWl3RDZZRVZ6bWkybVBVeWJZaUVhUFFWejlPQVluQWVK?=
 =?utf-8?B?SzJ4UjVtdFJZbGRhdzYzSld5OXhXMmsrRWpHTDEyZGRCRzVucHR5STFGbCtJ?=
 =?utf-8?B?aXV1blJlS2g1YnV0UEhEM0s0NlZ0QmovMnpWdW1KTHBHZzg1UytBb2FZSkdS?=
 =?utf-8?B?bzVINHo4c2xXcjlsVDl3SGREcGVlSll4V0dkdzgxTnF0Q0NiK3BBZXhDMWFX?=
 =?utf-8?B?VStqeXpsSkdYb2Y0UUVTSW9nOWNYRTVsRXVmRGJtTlBvdEFIR09ZTXBaRFFn?=
 =?utf-8?B?ekcwVEVDWXc5MmE4QVhkdnNwV044K1BUM3Fvc1g5WS9oajNXdmdvWjA3LzVM?=
 =?utf-8?B?dzVNaDRCMytmandlY1RXdGs1VWRRMnpNSU1BVTIzeUxybkhGUEhLWkdIMHoz?=
 =?utf-8?B?U2llb0s1cEVWRlRkb2wxaEMvSHNsUCs2bzlLdUNLM2ZoNC9JK0duNDNSUmtX?=
 =?utf-8?B?NmZQaTdGbkgxaEljNjhQYUluYlZnRUlQUmtwd2R3KytCQmd4aUJIeHMwS3pt?=
 =?utf-8?B?cUZtOTQ2RWt3ZVh4bFBQSTN1UUdMdkhVVlpuZzBZT1lqblJZRmwrOUJlVEIx?=
 =?utf-8?B?UFhiQW10azVpR08xWU9HY0RxekpnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(34070700014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+EZ0/hK0WddMGQn60QcChAYmvqdwBEuFWI/kA5ZhbExgF2Dx0WZXTOieyQgY9tep95WW/9YWDdT3W+LAQjt4p8M9g2jWRJHktpX9fzliEcKHrG1+NGr8addkcXojMRG2SU3xy3S53hvAyoXHUI4mGT09fisRQdp9dRNcK6xtFQ2Rko1TWPIKhcZekJV3zwimtBenQEBvmX3fii1GWu0kcUA8VEWv09tNiPNFmB6V3eseniOQcQp3gAwnq+elI91izK/idCjXrS2WVS761FCdyH35LryzdhmPVnY+wxCAu/hqfxLn5J+Abhws/vNjcbKvyLXDxehFkuDVU0DyN/8S8ZDhesB2FXTjOMVHo6yoTEwE1E29LLmuz1KWiYgGvrWuorqOBK1WL/L4ZLtpei6ZQIo9SX1D8Ds7VRF5wpKAv/e5avul5+ULGUWd2i8+nba4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 02:38:39.4855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f92bf0-7bda-4c2b-5bc4-08de7416fbd0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4715
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Feb 2026 02:38:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17143


I'm moving these changes into the recipes themselves since there are 
examples from meta-openembedded and oe-core doing that.


On 2/24/2026 8:10 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> oe-core has made some changes to default values for all distros [1] [2].
> Target a few specific packages at the Arago level to back out those
> defaults and allow packages to build.  The changes fall into two types:
> 
> - Disable static libraries
> [1] https://git.openembedded.org/openembedded-core/commit/?id=03fc931bfe9ea3fa9f33553e6020cbc067b24291
> 
> - Enable tighter compile time security
> [2] https://git.openembedded.org/openembedded-core/commit/?id=4c2d64c10a5b0437ab1ea04df22386f0f95124d1
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 17c6fed8..691f9068 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -153,3 +153,13 @@ LICENSE_FLAGS_ACCEPTED = "commercial_ffmpeg commercial_gstreamer1.0-libav"
>   # We are working to reproduce this error and submit bug reports for this
>   # issue.
>   DEFAULTTUNE:armv7a = "armv7athf"
> +
> +# Some packages ship static libraries which are disabled by default.
> +# Add support back in for these packages.
> +DISABLE_STATIC:pn-ti-ipc = ""
> +DISABLE_STATIC:pn-ti-rpmsg-char = ""
> +
> +# oe-core enabled tighter security checks at the distro level by default,
> +# but a couple of packages in meta-ti cannot compile with those.
> +SECURITY_STRINGFORMAT:pn-dsptop = ""
> +lcl_maybe_fortify:pn-gdbc6x = ""

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

