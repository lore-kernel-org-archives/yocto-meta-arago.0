Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9639EC61DFD
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 21:03:57 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6618.1788210232797503282
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 14:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=pqfcqNCD;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=OgUx4sxk;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67VIRnXK1643241;
	Mon, 31 Aug 2026 16:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=dVBrI0+RWdblQhajzp5gC2HaQ5lTEpo4whyRc58pz
	08=; b=pqfcqNCDu73X5iHaFGr/EqGMSIQScxEH0YR1pAlBuLYzTTdY9EeCJwc/b
	4fLAJ3IjD2Rke7haUNacdhv01GL3FyCYH18fNiwmP2RGQyvyvdj+TuHmEJo1T6IT
	7txYGDIiLfduf4/e8y6uOI+fGlu63/3IyxEmnrdNPZgjaNLYL/ixHcAb54wHbUfV
	x9jSGouilpDAnfsiCCu5YMxpKtVDRzRIFpHauZ7BvspMXtx2Q9InRMy4v5dtRS0X
	/qgEiWG7gvMxULLkyGK2kFqHlPXnGzNqo/z0LvkvVasHlb7kSaZ7O8g4/gpyYl7R
	AQX5Uj+DQhQgf+RvZDB8qXZMyx8FQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011015.outbound.protection.outlook.com [40.93.194.15])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gd44ncx46-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 16:03:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwaG684UVT8EVqtUUC+jVLLZdzfVVZG6a9I10gZeHab6utbyGk8d5fPkibJjfZD6fByfuAUPhNahiFeV3A45N6JprIdLfaH1bxK2JxS2m13gTeAfspFb2fhzpUtHSQtMpXmYZR/Y3KoqiQHZq/Xl03SzhdRVOOvewfGQEuI6oIhwd4/xInYk71vxTX3chwqsW+EaP0K9uc9pEo7BF28Zemn1QaY8YoGcjYHHiqz1SjExS7Aboh3hNDptWCjxws9pUJOP7ydsWyX1TBXXZC6Gex5OCy1Vl4OxJzvbGSjjeGD2zY4bnv1NLswZMg5IjdeQVdeQT580MdTDb8nJefbNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVBrI0+RWdblQhajzp5gC2HaQ5lTEpo4whyRc58pz08=;
 b=ioHrE7DQVQ/et+JUlMzD0Dn3KgxBmVTWITnDGtHyKNL9315DJ1Y0SB2FRGHZi0aoYEjfEUpTtaDRHyW4ecXSYSy3NLCA0Sk2dWhMG20VvX1yJUZ3omtSA2cpIttwG9LkEqCK9/wTDUobd7FHgICMQEvhlpJt1e0uDHfXWVCIMkIa8rG3hfbBbdNclTxr+JcMi/0jjqq9yBNjlakomRHvKNBKh0BB8/asH8zSOqynipB7bUW3SyC1CQkpXa9dS6qOta+y/4/mKMRYGhPmv/ga4KJeJX37n2iufLKPiKQKShRVSq1Eqw6gbr6exZvCaswg/X9dpPzNqII/0WX5IM2SWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVBrI0+RWdblQhajzp5gC2HaQ5lTEpo4whyRc58pz08=;
 b=OgUx4sxkJbFsQBBx3XaHVSvAvN9FprqjrnYmOjDHq9CYJb/FgkpLJBhm5ggMeVPmW0u181theHYbRQEDDJK6HF4+6IffN1ZulDGUaBkalxH1GXdXwdj6IpV4vRRjpZsraTAhLP28Mm6P2Mw6V45J+n5DRJo0SLjZc3w7uwyqZRg=
Received: from IA4P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::12)
 by BN0PR10MB4952.namprd10.prod.outlook.com (2603:10b6:408:122::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 31 Aug
 2026 21:03:46 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:558:cafe::29) by IA4P220CA0003.outlook.office365.com
 (2603:10b6:208:558::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 21:03:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 21:03:45 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 16:02:59 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 16:02:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 16:02:58 -0500
Received: from [10.249.32.236] ([10.249.32.236])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67VL2wht481263;
	Mon, 31 Aug 2026 16:02:58 -0500
Message-ID: <503db6fe-43a7-457b-9d22-199cc94d329a@ti.com>
Date: Mon, 31 Aug 2026 16:02:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master][PATCH] open62541: update bbappend for new
 version
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
References: <20260831210210.1908432-1-denis@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260831210210.1908432-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|BN0PR10MB4952:EE_
X-MS-Office365-Filtering-Correlation-Id: b861c574-2f1b-4d74-d81f-08df07a358b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|13003099007|18002099003|22082099003|10067099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	EuEe38xOEF2W3Dkc14yp2P1egZppC8RB7SQ3izsQ++ljfz9PiQi4hNPw2HfqSeQMGI3pTSpInv4wuOe2r2srf1OnO5cBX4bta939neWG4PaJOVGkChQhjZFaENfRkIp+BnWQ8Fs0x6LIh7tSbc7uRvtgtFaQYoIMf2sZzAaz/Q06brQz0RvYP5ZF8WS+QYxebuf5Ie5kRDfVhMraUVa6mBwhUmHRPhMtRCsSoUHnx2IdYiwFoECWlhTa5S9uBCwvrVxTryesQlOrfrqUADKhFefbZsosyuJxl3gFY+Tv82fFRpS/4c3mKV+qLZBZ1YgmUVoKtQlwK2v80ov1uJYfcML/A7w1d/arGDtUIF2/oYJ2XVHcVPB1MMCJ6OIIAqssqhPHrcpAhl5A3tukgNdz6b4oyQUFVUm5p17IOhdOAX1JvgYiCM2SRpOzrM15AByn/JHpBnoGP0FuLHDqb5SCarDZ/2nt4MMz4mxaaNCOuNrH/ZKJsoi8+GxNJTK1l7INzwDezKsruGdmaDMXhsNCfYwuEAFBYBDr3rrCY+v6tDpt4kRf7b6aalerNmm90EFtL9Svf+1+EKNhYIDfAynsjpk03+9cqWq1LsNh9F0ZO29OYG9d9308JbM8z6TLmIODc1MQUuQ1n6I/ktFWgF17UmmqKJRIJnqTY6Bel9nJNChMZquxLgs8uPPxrJz8YvLhbgwsdXr8HXz31TmxqAkJcg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(13003099007)(18002099003)(22082099003)(10067099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	S2TA9qDuXbClCMKFYBhrrVqdZOIafZYQRpyWrt4shlAS8665y3WI+rVjnzQuptpmEipH47QrLsYwkgl/41GnAdZ33qvOXXP39wAmUZFdjT7VQgFKaLiI0YI3rUdB0ITTWoo0UDlAh1G1UA1IjOYH4ZJGpfhgZDbOCME9mvCHGihHbr5N1C+EbiE3GMx3VeBN93ilXNjy7ndwaVDpOANOEBa3mbn6sVlOcfYSBlOcWeHYPIsYXtRqn+bjlRbf9mvvGbi+EVcgsGoM/A4STnliEZEDXWVz6S4GfItDc2w/0qcL/XjCV/lqRhxZYD1Qm+bNRxmGryVsEvp54gytHIKG3+C9LHI0BbxlMFRcUbfhtAOxkCGcGGu39xwWKa2+duCIw3VmG+pqRSUpTwhP3Bjql2kSn+uwc92ANs0ebRuPD5eg/ytxV6GRBmr5dLa+mnNO
X-Exchange-RoutingPolicyChecked: 
	ygS6Zr7oSIT32QOSOSYOShajlbV5k0swgjxgrfK7caElQo7ko1/3KmlbiHmwGHVKTn8e6s0Vt11DcCPfGVL/tm0i9N8MiXQqofTPWf7eU47cbiv7sJ1ncn3I0Z0y+ZDN0BRYcRJqYiE9xQpHk6CEg2m5+iAzFdcR1oCchZQl0nldi0FeHRdHt3ZtcPK4/SW6NXS1IAo2U4cCBMwCNXqKIL9c4GRFMXOkvvedcUPUL6Jh5/xE26Qneop9NObj5JpLCbv1Sr8d9469Bl5gGiHnE/loqh1kXANozu/dolZXVPhqdetGw72PNy9tCmpNgo5mZjlEHzdrjIJu5QqO4zB9Qg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 21:03:45.7960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b861c574-2f1b-4d74-d81f-08df07a358b2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4952
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE4MiBTYWx0ZWRfXwNstbmh9OYJ1
 A837a7OJ1z8kK2GMNOKokwJmd5UvdUmP0rpUOD/ybjUXUAwusgfIUzvS08bjHsoNCSbz5t5OwIk
 yQloabNGU5kGuSSuRmktnQZfH31gowMd+vOCWQb/0PJpfAroTesDrZ7GrYl6LcIe/gYRZ/SY0/J
 meoR05frdsb47bpucUBQrJto04VnkFu8j+ZAk2U0OilHAH1YKZ3CLoHts2tRBlc2gjTC42vpOVZ
 8Zm2gqQFgmZ4yAJ4rneGY3S0NJ/reWiOBbkSHXhhArmJNTBib2uQ9t4dMSi660IDAupL8ld3t1Q
 +vhNNgZZZegM+vNOAeEOZ/tJCKDJ2uXENEjO/ycBr11Sfehc0eXFnjNm+gSQJK1c8qHYb8bWXLW
 1EqEzWrMuozhQM1HF9AXb/w46JgxWreXc+QH97X7DiATXTfqOPLen1rpSSli7Uc44DMzy2iuuSE
 VYB8iZ1YpHNKYt4EEIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE4MiBTYWx0ZWRfXzxD1vWNYt8C4
 f4Wau0yWYcIzVMD1ODMetr97TB/dl6kg54G08KPq+VMxEjUgsScugEOMrxpAw9AKWCeE+fjC+Q4
 cTS6o18vAS+UCRv4yvgm/1RqJET/J0M=
X-Proofpoint-ORIG-GUID: MTPU2pXSNZHHuIw2-QaUDRfY3mUH_6yX
X-Proofpoint-GUID: MTPU2pXSNZHHuIw2-QaUDRfY3mUH_6yX
X-Authority-Analysis: v=2.4 cv=T7W8ifKQ c=1 sm=1 tr=0 ts=6a95ec35 cx=c_pps
 a=awRqKgK+okXhs1gjjWqUCg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=Q4-j1AaZAAAA:8 a=k-42gJp3AAAA:8 a=sozttTNsAAAA:8
 a=PPGx7YFxt3aF7CplQ7sA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310182
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 31 Aug 2026 21:03:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17630


Beat ya!

On 8/31/2026 4:02 PM, Denys Dmytriyenko wrote:
> From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
> 
> meta-openembedded has bumped the version recently [1], update our
> bbappend accordingly.
> 
> [1] https://git.openembedded.org/meta-openembedded/commit/?id=b6c09f6630d5e88a993252cb7e5ee23aec9fd569
> 
> Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
> ---
>   .../{open62541_1.5.6.bbappend => open62541_1.5.7.bbappend}        | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename meta-arago-extras/recipes-connectivity/open62541/{open62541_1.5.6.bbappend => open62541_1.5.7.bbappend} (100%)
> 
> diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.6.bbappend b/meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.7.bbappend
> similarity index 100%
> rename from meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.6.bbappend
> rename to meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.7.bbappend

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

