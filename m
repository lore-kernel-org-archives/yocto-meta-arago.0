Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4018DF5513A
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 06:03:10 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8117.1773036179002247483
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 08 Mar 2026 23:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=EDE8flTO;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.69, mailfrom: c-shilwant@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0RcvZaa2Y+YJn55J6tYKpgG9NLuyqpGlxsxMvuLPOr6UhjTH1sGA9PX5Uk2wrof9ZhoBEkwps6xmKhvIEfJibO/xhsJqZf9YMSQEhMvtbAdYOIbu4RQjEjAeSXaST5i9KEJWnryqWChC80tVfxvtzLVW/vTb1wkByhs5exXeHGKj2g9XneLV9OVc7u0zq6t/zy2MFufEhfFTXJKjN5K7pBdojfJH7i5ocv1L8NI4JGKkAK1P5nRsMlakvz/KI4soxxD5EcGEYRKQ9tb9m796uw9P1yf1e8/XoDn6lFy8w5QL5svIlSRQwBbzWNLWH03XOLt/oSUFAF2tRlSLqfNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BzrLLRBnLxidHSmymL6housB2DY3W1fMxFhVo7dC8E=;
 b=p+8YFq+lI+Zjp/0GdAbTonb311o402RT1K4fGy7645EugEjFL7EmmrV1DHVTlIpxrUhiHoup/scWIYjcGArbrJe2wAaII+PlpbkT39ooDQx1lPJNeMdPyqmjszXm0Ts1z480Rr5CXTEShlEexIPrS9aZ9AghxWnkElUDoTXdW0jmm3OmElozUoBNSL5n29f8xdr0E93t2z+fSZpXqpgOOF1mnZm6b2h13WSjuWabGiSM7NKCZUcxZjsnTQ0ga605zZOaH5w7AH5U0TWemRbr8xOQbrMzoXjgQi9T3oMOafImqFCRIt4mbDNElNiv5JYcEHO0OHGevshU3wY7vLjKpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BzrLLRBnLxidHSmymL6housB2DY3W1fMxFhVo7dC8E=;
 b=EDE8flTOwbn2g4Z2AiqvSJxWFg21HwzAmlrvihlR/S11UySnA/zaGHkAAeKBQmqRV8XfnOVNALOxNQTOfzpXSmcuLgbsNgCG5T0JhAZH2SIBlTxq6J+TNdyOK235FdNSvXXN2l1KPK38kNkt6/GZH/qszcFUVAA14uViqemdE0s=
Received: from PH7P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::21)
 by SA1PR10MB997582.namprd10.prod.outlook.com (2603:10b6:806:4b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Mon, 9 Mar
 2026 06:02:57 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:510:32a:cafe::16) by PH7P221CA0026.outlook.office365.com
 (2603:10b6:510:32a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Mon,
 9 Mar 2026 06:02:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 06:02:55 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 01:02:49 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 01:02:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 01:02:48 -0500
Received: from [10.24.73.51] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.73.51])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62962k1g535731;
	Mon, 9 Mar 2026 01:02:47 -0500
Message-ID: <afa1c4f9-5121-4fb8-be3e-dc64744d4063@ti.com>
Date: Mon, 9 Mar 2026 11:32:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/1] nnstreamer: Skip buildpaths QA
 check
To: Pratham Deshmukh <p-deshmukh@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <denys@ti.com>, <v-singh1@ti.com>
References: <20260309053346.3827889-1-p-deshmukh@ti.com>
 <20260309053346.3827889-2-p-deshmukh@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20260309053346.3827889-2-p-deshmukh@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|SA1PR10MB997582:EE_
X-MS-Office365-Filtering-Correlation-Id: 444ac854-9873-4738-9d68-08de7da181e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	v7z9mDt5+0bRMGqKpL8Ue/WZldN4Bjt0j2pWnmY0+fIXCUg6EVO+reXIQNL2Ruv5PApUYFiMcx9lXI/sMOwMpmmtlPpME5r8Ade5P//swRhv1/o6M6paUtEKTotqi5M4Vf+zZcPpjuSO0o+46qf/c3jdr0jIDGnL60mEskrRsWiXWuQZMdeK1gHoWHYaYDVfEht9JTEvqSUqH1wphPS4fpjsVwFP/pUG1l3xmIu8Y6XhEEE+sxfAdBZDRkbnNUIfD1YBeChjLZGhI12WfdEVkY62lUrkYIWDLU+UGlmN0DizLv1EkKh96AI3d3l9w63l6RvCtVLM7hKgX03DyIl3jL2NHpfdXm5zcfu609x14FvJY1+8rahCNy5fygOq6k0Pwc17HVOK02eh55jIMAf25SbcXMUmR1E4NdhXGJyOcSDnuEdt/ZsrXAb04C9gjJZr1jQTYUGztBgx9wxYqanFcjoSqJZzl7yRKYK3Agxjj476eEK38xvq2k5dyGDtAvkI4PMc+hOdWNoNBDHK8n30QPa6/4yRFjWdfx0uEPPSo9+bMz+SM+VS1QEgLDW/oXYwzg/qvsaDHCnrSB5/o3EVxuedu8t4ARdPoibMOcYws4LqmBqRkwbnfehjn12jZpjkK+8W5FZKnaUwEN99zCzEVZ32VKPXzm0f/R4+1IurcdmdiU81wjjEMIneBGeWi84dqpQCOKU8/aggqcWGtudeuT9wR5yVBKz8q9fWudSfzQwr4arZ+kfRWFbqP7uRSSSsXAnJGhyIqeyQaVOpog4ghA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HmKwtwyv4J9uYPs07w4S6Let5U+w6CFpf0SOxsQr9y5XVAmi8/EUazoJHb4Q8EOHWN6r7JCnaUwbT0FYd8ki4R87gNdRWJiQuV7HmycKn203jipH0sWuaOKjX4uFYeDNp89k1546IX9vT0N8Pn8r0RSXkF5hD778z60qNy7on6RT7z+uPDFJz/tVutahKK5QbOT62qTqCyF5GzkLIryvlde6OOj6coqJnSVJQSxg1+VJRtiNSm8pv/CcvIsrjnxkOr3IdmTZ6AZqD9EHYwFij3Zt/c1aK+re9WJ0jMIHRdADY+5qn5M9tjZqurzYysEPrTETB5KksqkroaGELgxMyclARHeD5TTMl6DxtheFpO84XyPyL/ryKXlr5CXZusITYLYjeWavZbAgcos5tueIx78DuFcK/aufghQkhhd0sj3bu0NC7VUTkIdQiw/ZZSdr
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 06:02:55.5005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 444ac854-9873-4738-9d68-08de7da181e5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997582
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 06:03:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17284

Hi Pratham,

On 09/03/26 11:03, Pratham Deshmukh wrote:
> The nnstreamer-src package contains debug source files that reference
> TMPDIR paths, causing QA buildpaths errors during do_package_qa.
> Skip the buildpaths check for the source package to resolve the
> build failure.


Fixes: 319271fe5fc8bc3016b1eb765784076af666b61b ("nnstreamer: upgrade 
2.4.4 -> 2.6.0")


at this place, add the above in your commit message


--
Chirag


>
> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> ---
>   .../recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb           | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> index c62589ac..74d72d9e 100644
> --- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> @@ -64,6 +64,8 @@ FILES:${PN}-tests += "\
>   "
>   INSANE_SKIP:${PN}-tests += "buildpaths"
>   
> +INSANE_SKIP:${PN}-src += "buildpaths"
> +
>   FILES:${PN}-dev = "\
>   	${includedir}/nnstreamer/* \
>   	${libdir}/pkgconfig/*.pc \

