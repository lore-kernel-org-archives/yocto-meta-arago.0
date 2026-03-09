Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A02EEF36E3
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 06:19:00 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8169.1773037136334174896
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 08 Mar 2026 23:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Yo/fdzxk;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.20, mailfrom: c-shilwant@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7VA5cuIDZaKR3iLBFNwtGEbZwmC2v1Px5Bv75Kp0NvYJsakNNohilvh5t2fDuOIKt6k6wr3a25aNK2nXqglcBdPmYZBEL8dMxBwf1MGvm7zVBoETo7HEvTMNqdtn9H0FU0sCDkDX2BBYufH+cyA8K7CNhKRLpWBQQ24uiaara5+RwZEdxksUO2DGQGkI/MalDHNqMzfq2JPOkup0kA/fqEyR9Bq6S47hRznPJb5caZhteEJGUuozApDblpxbasekyZ/bG3eTLexHPoCTzZpeA1mxduqPwl/Cu3KOFARhaKGWyIxpnPTimqFm26VQFjHfy7ACp3xURswYYM+jzZMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTNbRCrET3HDxB8QZk/RSWxKjNK4c5/DK/12dpuSE0M=;
 b=Th9n5EoqA/LzA/zzakbZZfffZxallEuuutR4kmfaxanECCSXPqoe9YvnmcXf8FtZzZnyO1dM7LqkPKrZaG2fW/iD+ZVUs2jwDwtKuFzwfbJzI6+KlBzB28D5OB+cUGjBmNJ6p3Ct5vH+Gmm0w0jN8gAp3ZT8dWnjplBw5doMFguSoaVWFO/J/9qdk0i1L+TqJzqxeWjlza7U0or9/A5McRWlymcY6vGMtONJhGN0FYOtvXdQA60RGOwoPx+6hKGE0t3/rSW5CKXNI0B+7dg3PJGyY+wXB7BEE3JSVtUSTHLcUVvE3DZfPSK4CBvOM8ovG4C5f1LSONe1mOxScsje+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTNbRCrET3HDxB8QZk/RSWxKjNK4c5/DK/12dpuSE0M=;
 b=Yo/fdzxkrAlQl3tmUKaIdDLqZaxOBW/PZk1/UyNYpe3SkdqhAerszvt5Rx02t0Ot7ICfZQYd+MKVe/DnR5Uz+tdSmuE5nXCYUOlPECzmB9z2pSUgjw9oz0swHHD/OeOw0T1hhRzhwXAaLrW4Z8V9gdJWiRVtamEHdPPBxYi0Ybs=
Received: from BL1PR13CA0301.namprd13.prod.outlook.com (2603:10b6:208:2c1::6)
 by MW5PR10MB5691.namprd10.prod.outlook.com (2603:10b6:303:19c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 06:18:54 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::d9) by BL1PR13CA0301.outlook.office365.com
 (2603:10b6:208:2c1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Mon,
 9 Mar 2026 06:18:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 06:18:52 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 01:18:49 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 01:18:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 01:18:49 -0500
Received: from [10.24.73.51] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.73.51])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6296IlB6053973;
	Mon, 9 Mar 2026 01:18:47 -0500
Message-ID: <ebae09cb-424e-44ad-a20b-bd363740f05c@ti.com>
Date: Mon, 9 Mar 2026 11:48:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 1/1] nnstreamer: Skip buildpaths QA
 check for source package
To: Pratham Deshmukh <p-deshmukh@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <denys@ti.com>, <v-singh1@ti.com>
References: <20260309061254.3942533-1-p-deshmukh@ti.com>
 <20260309061254.3942533-2-p-deshmukh@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20260309061254.3942533-2-p-deshmukh@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|MW5PR10MB5691:EE_
X-MS-Office365-Filtering-Correlation-Id: d48373df-3c14-49aa-776b-08de7da3bc34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|7142099003;
X-Microsoft-Antispam-Message-Info: 
	Mc10mBhiADoYATaTz2rU44mHqSCpUIMIyKaFPOnxP6gXP9pXzr/6I4QjWfPdylRuE5lQmJ94yT3/grrD1aut/Ol+LINScHAduqVb+IpR1Yu8XP5O2mD+IjbNKxi4r1k6T+HvlQeDYJ9dSehc0Mnj29ya7eNVpEOfCiUHUtoDHnJh+2Og6qDLjM2PBa3vKT6IopZgeq9eVKzw9dsKilAcnLB/XAarL9kIVJzdHfyxrJJKKsXxoWuqp+lQpHo0qhBb/rMJTN3TUHTtzcVK1d3z4EHYKkPLWEjXuVR/h0qK9GVdYg7OKZ6ebT9lVGI6RHcwyEKzaV0prKgH0PcKykz8a4GVOTQJlaccCJutb6okTQd/R2zRtX1DrDkRU2/ou1xhQUAy9qn+kkdPARABoBPLvMk32ZwHqWInAWOKPliYFf3OAwItLTfanEzCGyvB19e7HsDvqxnv8sjcsccpe/MFQXU+m3NYPEmzNcohroFRqxAs7bdnUHBWkgZWrKgwb0DPCD02gR+WmViBMPR0sn8pHJrKDq7CIq6kKXTwT8RtUpWiCSleuIqcE+amztblaUvVV9vxBrWtL/i57ne8LkVjtQapqch+Jxx+ZEInHXGZyww3IuvUJktId783DjSr4mQgQ6ZYNVhvVuQ8xmpHybMO+A5pU8hYqhmGUpwBXv/sui/WfoF06BwFMABeEEOCZbLHeGF8/d4ewXCej+mIrX9SDincBCKdf6wH6ZGo/YpMklnxD2S9XDj2tjjhEXtmW9Hhj1pvVW+gAu2j+7JYltYx+g==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	K3nvER9hXVER2Jc9EIYOG0wxFF7bhwqGTHgmmTixF69gUSXXGqM/UJ+Yb+sxDrtd1qxiR7INafzsrDV2fL+JWpB5rxb83P7bzCrnoGRenfYv8bvXxGmrQqZhsj//IuiK60V9RHbNNPgmuNA6+tNVZ9g/+ym2p+yypCk9uqxkx4Wi0DZJEWKeaRNU+HUa90kOvHfTm9tlqUSFHSpDvFwV+NmbPjhHx3oT2saSE02PHXL8qhZpe8RdNb7kc9BxBkAqxq4SC4o96wlTVgi4hny5dmaaXmYTbN0tTB+a1LFGAcGd5g0z/6v/fNFyWrR3zv9H/iiBJY2ik47D9zNFgCjdXUzib2weX9DK5VGWhEuW6ASQT2eicuVb9ZCqADYjmD8uimJ5OBYPCmpU4EdEGTd22IxDNJsSMRFJ415kmlBxMV5qiSIiD+28lzq6DvIFVgNW
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 06:18:52.2782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d48373df-3c14-49aa-776b-08de7da3bc34
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5691
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 06:19:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17287


On 09/03/26 11:42, Pratham Deshmukh wrote:
> The nnstreamer-src package contains debug source files that reference
> TMPDIR paths, causing QA buildpaths errors during do_package_qa.
> Skip the buildpaths check for the source package to resolve the
> build failure.
>
> Fixes: 319271fe5fc8bc3016b1eb765784076af666b61b ("nnstreamer: upgrade 2.4.4 -> 2.6.0")
>
> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>


Acked-by: Chirag Shilwant <c-shilwant@ti.com>


> ---
> Change Logs:
> v1 -> v2:
>   - Added fix commit hash in the commit message.
>
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

