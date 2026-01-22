Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FF5D6CFAA
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 01:33:24 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58019.1769131996399944382
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 17:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=am6S5NIn;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.48, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnyJPra19SdsHbxa682MrjVh2TUvmOwtYTxSw6w2V8hB6ixtiLSm8LrpDF6Y+1IRWVaUaGif2UQDtnS/5TnYPXy4FnnBFAiqpIis8TvtvpA3Qst5LRxGFQw9b1EydlV/hPk7RkKCJW7sanaOSVSS8SYPRG4d2pJM8LsvSiRkGhA+E2PcYsAyxyTD/NHbhNGBxXNpxOTBRDRrEoUoMqhXBvsPSSsM0ikxj2CsJ+efGLaElEsig5w0XDPX10v+mjpyputlAiwb9ubGwarPw71zhoNZewGNK12B29PyfL+jimzJ8LogHg6HBlhCUxIkbU2nSlApW/SpMNMouq35SMD7JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tO3RKJb51FDHg+ng6w29m9hOdoBpaTlgDG3K6T/YV2I=;
 b=SREvT9sCm1NxwTyENM1ddeNdj1d4EyZky5Vlt/+RWqDOP2ADE78GEvYq0sLxMZ/BiV3ftoc7atybB0qDVbIF+63OuoSco2yw3Ly9P/fj1V9ZBy3xC8zS8aoQQUmHQDieM2lUMvfh0Mt31ONAaEQ0hbjDk+tCfqIIe2G46mGOR9mTOhhzViwlml16kFKoWq92au+Y47oXmszOxTtsRrBAbuETVH/ZhFl06VTW5CvPV1E2PYPCXj3Vb/Kfp/LEo1p8l9SxHg+eaktPcM9geDRuc5kpRZHsCtC5XDHswdaP8yhojtc9X3Txgts+BjqWdU9u9A6TfK8IyYNeXcC03pD2OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tO3RKJb51FDHg+ng6w29m9hOdoBpaTlgDG3K6T/YV2I=;
 b=am6S5NInMRi764fbTOm8qjEfGHLphPFKoYIkrOoyTGNEXaPFEFXoO/Ja8fbJC+m9eXIRn6A9tUxIpAUZDa0C3LxCnA2kAQVAgJFkVb2tZ4MCtGWHeyLAJA9/PNOV96tdtlajQcpbrtPbNIkbJAdJykKxDqQ4OaAjotPrm24u7EU=
Received: from SN7PR04CA0164.namprd04.prod.outlook.com (2603:10b6:806:125::19)
 by LV8PR10MB7990.namprd10.prod.outlook.com (2603:10b6:408:207::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 01:33:10 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:125:cafe::a5) by SN7PR04CA0164.outlook.office365.com
 (2603:10b6:806:125::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Fri,
 23 Jan 2026 01:33:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 01:33:09 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 16:42:13 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 16:42:12 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 16:42:12 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MMgCeC1160921;
	Thu, 22 Jan 2026 16:42:12 -0600
Message-ID: <7ce43428-3d8f-4f94-8aba-6ca0e3fbc8b2@ti.com>
Date: Thu, 22 Jan 2026 16:42:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/2] tisdk-default-image: Use core
 packagegroup to include valgrind
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260105222205.2503660-1-afd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260105222205.2503660-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|LV8PR10MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dba0a73-fa3c-4a7b-c18b-08de5a1f5d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TGxwTnNTVm9NWDZCYkZCMW9tNXI0cVNvSmIwNG8rZHphTjdSa0kreXZUMkl3?=
 =?utf-8?B?cDNzMHVMdkdDK3FMUStoNUhSWjFsSXNIMzdaSEN4L3NYK3JmY3FIMU9HckZx?=
 =?utf-8?B?YXQ1V1E2a3MyVTlEbThHSVB0MHhCWXBoQisrSUdjSDV0SjBmVUNnUXd6Vk9V?=
 =?utf-8?B?bDc3QWNXZzV3TEVDYzl4V2tmS3FBRnR1bkZ2aUkrREdGVlBDREVIaGZQcEMw?=
 =?utf-8?B?TXp6QU5HM043VEJJYXdqMldTekw1Z2E2UGdRRGRnSGloTjE2bWZ4NStFYlJ1?=
 =?utf-8?B?aklnekFNTVNiOVZMZGZBSTRWQ296eG1KY2huWHhsakxPbjl1U3pDSjRYM3hj?=
 =?utf-8?B?dkZ4VFNvcUVpL1NOTjl2Q3BCMlVubU1EQUlYQUoxZ0doZiszZ3NJdXpTdnJ5?=
 =?utf-8?B?OUZ0YlFtY01Kc1BRVWdDYnRrU1Q5aTFsdVdYN2FWVXJoTXczWFJHSFRuYnZP?=
 =?utf-8?B?bzdhUDljMTBwQnJTQk9mMXpRRkY0YkJ5TDMvUHJjYUhxd0VIL2RQeEdrR3I5?=
 =?utf-8?B?MjZlOTlPSmlma25iR0x3dmI1d0xuSFFoNjMzbEQ1WlNtQkhrQ0Q1ajR1NVdU?=
 =?utf-8?B?UHlyWUhzSnJSUXFFTEZYLzF4N1pHalpGN1NzVnJ4V2s3TnJIYTlXSjIwMStv?=
 =?utf-8?B?RyszeWVqaXlVREcvT1g5K3hrYXdqRHFPODg1dTBmN3FFY2NmcitWbktNVFZ0?=
 =?utf-8?B?cmlCakhKRWNrWjFCUVgwODBsVE1XQnd0bzZyTjdBQzhDL2NnMGxzS2szcGs4?=
 =?utf-8?B?ZURxSmxtYU45dTVaS3lwMWpSNFg5RE9TYWpFT1NaY1RDUmdaMG9uZmNLOEhB?=
 =?utf-8?B?TzRuRzZmamdJVjNVNjVSUzROQnVaR0YwbG9wQ0U1MEpLOVF0SmtBNWZzeEhU?=
 =?utf-8?B?aEVLUzRleEhndnVWWDREcVhCTm4yREVUcCt0T01aTW93S1pzQXhreEhNeVI0?=
 =?utf-8?B?WXRIMmsyYkFCaXdZeXI0dnVvbDFHaUY5RU9Fc3JOVHFEb2ZxY2xLUEJZcVY3?=
 =?utf-8?B?c0JScDlYZFIrRVlVSlVmUWhHeFB0cno4MEtMR09Fci9oYUg0TWVpM25Hb3VR?=
 =?utf-8?B?Z04xWUxNdHRxVmgyTURYYWtmeGlxMURubGRiK2RFYk1WaW5xVnliNHhBUElD?=
 =?utf-8?B?WHhKakxFaDBZK2JFdXpEWkJ2RkNzRGFmd1JaaWR1cER1di9lb1VKUDlscUxn?=
 =?utf-8?B?dTJzRDQ4REtldkNtd3E0SUh2K3VnUDZkak4xR2ZVckxmcDhUMy9aQ0F0Sjl4?=
 =?utf-8?B?b3NyaUozeUpnejZaZk1UeUdCQ3k2QmUrWXZyYkF5YS9rak53SzdGYU5xWEEv?=
 =?utf-8?B?bDZHeFZXTWFCTFRRL1pzZlpxZmpsRE1Cc1N4QXJmb3RCY2x5Slp2aWU3ck12?=
 =?utf-8?B?L1NSalphd2JJVXdWZjBkMTlFMUlJMzBMSWJQYnJIemlnMFA1S2dSbC9GSTcz?=
 =?utf-8?B?SDZVV1ltNmhsZTNJTDl3TFhIc0NHd2w4L3V6czRMVTd3SVNoRFkxSFp3MFBE?=
 =?utf-8?B?ZlVSTlpwZ2xpMG5USWl0bHZldXBSNDdadSswZCtXQ0xJRjZHK2N2WTE4SmRF?=
 =?utf-8?B?d1dDdEdON3JNT1hPa2M5ODRRZU8yWXFHbzdGUHZIVWY2bFZFRysyS3F4SW1a?=
 =?utf-8?B?VGJ4Q3NGK3kxL2RhZ2o2ZzBBcTR6NWdXQ1JkNXlMZnVuVWlWMEg5aCtVcFNs?=
 =?utf-8?B?cXArM3U4bkIrdE5qRDJ5bm1PWmxhREwyR3lXUGN4MThTNHloOXRaYWhCMUE1?=
 =?utf-8?B?VEdubzR3QnhWWDZONk1KZ1RPWEpxNys1TzBKUHVoUExDb2pEK0RDY0I3NS9K?=
 =?utf-8?B?QXRUbGk5ODNDRGN1MTVTVGVXeStmK1ZNNW5DREtUSDFZOVFYNkpZa0RmZkk1?=
 =?utf-8?B?VmJrbmc3ejE3ZkptaklzVzFCMkE0TmV6RkNNL1hibmNPL3ZoWEdwOHBTMlc4?=
 =?utf-8?B?YnJGNEo2WXNsZEM5K0pFVktMZ1NscW0yQTJhSGRFQ2FMMnVhLzIvUFYzbUkw?=
 =?utf-8?B?QmMvOUV4Ym1OVE5zcSsxTFdLUGZMSWV2L1ZFUnJ0SmQ5aTZ5SnNOa3BBTmNU?=
 =?utf-8?B?WFVOVC95NXZVQVYxdmV1T0JTU2wzSTRjV3pucW15U0RybDc3SXRwYThvczc3?=
 =?utf-8?B?NVRmaHBKS3dvK1A3aG9VRThIQ00zZzM5cUZ6SVpPQ3ZsUmYxVEJhZS9TQlJw?=
 =?utf-8?B?NUJPQVQwREM1bHlhcmVsTzdqMnd1bzZNeHFFZUVVTFp6c2dwYVlCVmpLekh4?=
 =?utf-8?B?NGJ6OGZNMDlBWndGbkt4OTZjWFh3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 01:33:09.2417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dba0a73-fa3c-4a7b-c18b-08de5a1f5d87
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7990
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 01:33:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17012



Build issue with this patch.  Including that packagegroup includes the 
lttng package which is a tracing tool.  That code requires that the 
kernel have CONFIG_TRACEPOINTS turned on to compile, but it is not 
turned on for our kernels.

We need to resolve this issue before we can take this patch series.

scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62pxx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttng-tracepoint.c: 
In function 'lttng_tracepoint_coming':
/scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62pxx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttng-tracepoint.c:227:36: 
error: 'struct module' has no member named 'num_tracepoints'
   227 |         for (i = 0; i < tp_mod->mod->num_tracepoints; i++) {
       |                                    ^~
/scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62pxx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttng-tracepoint.c:232:61: 
error: 'struct module' has no member named 'tracepoints_ptrs'
   232 |                 tp = 
lttng_tracepoint_ptr_deref(&tp_mod->mod->tracepoints_ptrs[i]);
       |                                                             ^~
/scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62pxx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttng-tracepoint.c: 
In function 'lttng_tracepoint_going':
/scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62pxx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttng-tracepoint.c:268:36: 
error: 'struct module' has no member named 'num_tracepoints'
   268 |         for (i = 0; i < tp_mod->mod->num_tracepoints; i++) {
       |                                    ^~
/scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62pxx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttng-tracepoint.c:273:61: 
error: 'struct module' has no member named 'tracepoints_ptrs'
   273 |                 tp = 
lttng_tracepoint_ptr_deref(&tp_mod->mod->tracepoints_ptrs[i]);
       |                                                             ^~




On 1/5/2026 4:22 PM, Andrew Davis wrote:
> This packagegroup includes valgrind and handles the arch compatibility
> selection for us.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> index bc067857..a35e8321 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> @@ -34,12 +34,12 @@ DEVTOOLS = " \
>       linux-libc-headers-dev \
>       build-essential \
>       packagegroup-core-tools-debug \
> +    packagegroup-core-tools-profile \
>       git \
>       dtc \
>   "
>   
>   IMAGE_INSTALL += "\
>       ${DEVTOOLS} \
> -    ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
>       docker \
>   "

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

