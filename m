Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31367C61DC4
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 16:51:47 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.951.1787849503142602337
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 09:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Z+DriXRB;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=VM8a/4T0;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: afd@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFnd8o3143025;
	Thu, 27 Aug 2026 11:51:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=r1U1wXghiVWCghA3Iot7ReUzxdZsFFo2256L04Nsa
	ws=; b=Z+DriXRBgT/8952HwUHIzAZGN22NMb2vLP2LO0hEhY7iEEgnuxYfQEYYs
	KXcUyXpEDEekkKSz0NCc3iU0U8Bfp3ItWdRj0OjCkk0kfmOA8SoKaHGvoZq7cGiv
	xz9bTVXLNzFCw8ipkSwewA9nsGBn3D11MVVIFDfUnn1ymaFJ8JDoevaLOefviDUy
	I72gCRj61JcyvR7gtzX+N+Zrg1XhK0UjAOwQV2pOXjfNIMFlqusIwq2Z+SlVKUGT
	ETJ71aCfhW1YnRLIxsenzD4cTp1K2hWZERXhD0Ktre2hakH/lXUSrLFz3f4h0gdn
	X/myUg1go5kONZ6g8K5agQ0vaovMA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010036.outbound.protection.outlook.com [52.101.46.36])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gakag2bn0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 11:51:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTxJ1S/0WlUpMueOVayIddROdxcfZ94dghZgtqY4v1Rzph9pcVsL8PytgaLWQmltNUYC4AUbYRtTc65Qgd9tzsWF2g87KAL+tkrpx8Fsn2ul8+mbzIBUkXsjZh4CD+8SgiAkNBgcUf16T+zl7NZpcBzWXz1KD917FjZ6EQx5krc+QO/pa29wa8WKoJNHGkrLY+gn7O7wE7PnV2jR7SBRKCT/j2MDqx3u5dF0uzltr4nS1bTMUTloQ4yEQjy1V2s1a2T6qHCX8/0sbKjp7u47wkXoLnqUmDOsnsMf4h/O365816oYVjxmoJb08WFfFdxGCE5Tu84leADs/NQtQVopYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1U1wXghiVWCghA3Iot7ReUzxdZsFFo2256L04Nsaws=;
 b=LrcMuLTiZhKNVLqweW5ed0fPJCprsdQF0AlIa/E10CCBLJCqhkMBxCRDxQ3bggGnNDBOGlGI94SOHs1Mp1cCvgSAsYAAOyyIeDvLpqXD/6M7lY5+kMZfp3QSuZ8jQhnM0QaYUl3Xrlfb6QJ41wRz3INg4tjdC0Ip6Z+UVgjgjsytuwJg2D4U7oW2gBjoSCP2U/V5Qr9DaG0qh+poeEnPqdK2wDCe8g+M5FE0FSSlJ6QoIzVshEwE6Ve6ObBM7xVOO8ZQPcYvXrvdqwBzaA4qrCV/30TIKK5UCeK3NYp1kx+zAKH+nNLh2+LyFbwVncuTC/3ouvLtHAjW8eOwfxY+6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1U1wXghiVWCghA3Iot7ReUzxdZsFFo2256L04Nsaws=;
 b=VM8a/4T0PzF8oy33NJJKtC9iNDIx7GDWTBsCoyP81qrODiow03ZifQUUgs6htSHe8uhyPOYH1CWL/O4ybu0A30eLJkMn7HsglvTEFvJ4V2EJapk4+ELhLd2D8S76vm5BZRwdcuxWtNo36WXIdpLPMB74g9FXvegbDHeAJ8s0J6w=
Received: from SJ0PR13CA0235.namprd13.prod.outlook.com (2603:10b6:a03:2c1::30)
 by BY5PR10MB4164.namprd10.prod.outlook.com (2603:10b6:a03:210::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Thu, 27 Aug
 2026 16:51:36 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::2c) by SJ0PR13CA0235.outlook.office365.com
 (2603:10b6:a03:2c1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.7 via Frontend Transport; Thu, 27
 Aug 2026 16:51:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 27 Aug 2026 16:51:36 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 11:51:10 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 11:51:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 11:51:10 -0500
Received: from [10.249.32.233] ([10.249.32.233])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67RGp9P22217104;
	Thu, 27 Aug 2026 11:51:09 -0500
Message-ID: <6aa57f3e-0274-4c7b-acda-d3937d542c27@ti.com>
Date: Thu, 27 Aug 2026 11:51:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] linux-libc-headers: add
 DMA_HEAP_IOCTL_EXPORT uapi patch
To: <gehariprasath@ti.com>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <u-kumar1@ti.com>
References: <20260827150719.821469-1-gehariprasath@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260827150719.821469-1-gehariprasath@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|BY5PR10MB4164:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c4c8921-6b61-4e5b-0f93-08df045b7545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|10067099003|6133799003|18002099003|22082099003|5023799004|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	8w4EHQep9TQADfZH0do1FbTKmO5cCF7YRfed1aVZ5nHRhiSUDzkaandT2viTZch9wVLdJM7JJytFBHGpUQzpE9Grcaio9ch2gGzr7CZipPSNIs61tJnmMPnUwYXL3E3IsGdXZ90R56wrAJPESZx2mp2B46xlbDF4NB2uqne2TQgwXY68I32xWf7aam95jqPitPc5RN4/G3PDDdryzKz2u+c3aDk1N8cNt1B4FuegpPRRe94L+GyNloRuxeot8VhnzgRzGVpQ5GqqO2EkIF/FHt+U+rdVBueiWa0vLBKTkUOrttNHkG6BRkfleAXcBXdXTT7uzHXFqarLP54TFl2YWAMQXu0kaiq0he9EBbcQUj8SbndtO9t+TudT7rPWGu/Q2bj/YVPbTiH5TsnHCMt0OQRveEJzDWPN+8MpdbYcE/JVfi3SAF+37iZanaiiXPrlPcXylfgnd1FvdC1jzHQJJu9S1MhE/iuZp8x9jgNNuusmoYr6M4vqAF0bqebeXsEj+XVx/mLJuO0hW1sGpA70haPNo6+ep7XrZNGb2bhrZ0+Z80fNCGnYE9sZIBZz4NpzLOAx6mWTMy+HpD510bKhXue+JofLUbre/ZanukCvUNvNu9pHqummA3goJeCbP9OeqOXb4v4LNqVn8engGnvtUp3eAERAUbuSGaBtZNjsbRo=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(10067099003)(6133799003)(18002099003)(22082099003)(5023799004)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	karj8aQfhNLaXRuKr9oYvRenNPzucdDBkVDMpDRuxN++RGmwzIndqD1kSJGFJyhW4wUTq+Pv79KOufStuMzEMCyjlUKIKE3GiOpnkfpJaKTvlesZwPbg77YUr+nURsDrcXm4x+tWtUqE58tuiuoMhexKTDgEYqbK8/rOFxemVFPLjzh3hWQHMUc8hx4cCJK1CSw9+ZFQi2Yigy7Sf/9+N1J3MqWrVR1ddRqUu0R75mrpZq97+dNwppcQjMuhbRWmlXiHAax9YrJ8JGO6k6qW1bBLGyf9OQCWP6D9D+7mIJo2iHtpuxh5XpYk75MslePsbh2e2JaPCPibYrGzfu2tbMKnXyWrILe66JCb/VhEe97yBY0Gk9Skz9M+QKZk4YnOIzw4pwczqzn0lMknApfWWBKLekW4cgxNoXZZ1p91uwmivU7PkS+xfo/VUP9rtWbB
X-Exchange-RoutingPolicyChecked: 
	aKuFsUCCcIRAUsj88iDxsjGSj4fvaJbZgrlfI7GRonYcCYRA1GI9mvTqymVk2f6SRHhtY0H3Dnsd6u5lYU1sbyvkIPVm7LCaU6DL5H8n69Qwt+Whesa8UCJVAMl8Tkm8GYD1AKR+HVSoVa+pVM2uGXVJhMwmSjL6tEvUTijdQiXbzOQ6mhb9bUyeNlMKyHxt9zWyIr9nezVuD9Rbi5iKth8IC23Xvi8WgEeTxEENYWnwWkF15amZ88O+PhHWRUVCEnO+kNdEe35TFRqnfd0C/RJXMpVxuqwSJsgzgfi37KMfqGdQR3RcrIiRLyvhqw6KWQdkerb/B8RRdua240WqjA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 16:51:36.4520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4c8921-6b61-4e5b-0f93-08df045b7545
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4164
X-Proofpoint-ORIG-GUID: nJ56bc5Obaykgb0uaVQXvACSDGlc2c7S
X-Proofpoint-GUID: nJ56bc5Obaykgb0uaVQXvACSDGlc2c7S
X-Authority-Analysis: v=2.4 cv=VrMTxe2n c=1 sm=1 tr=0 ts=6a906b1d cx=c_pps
 a=8DpcgsHgAViCMqsLoRaOsQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=WfHZuIUsAAAA:20
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=dz_TglDLipMWlE-js2YA:9
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=bn7x_FpfJtc3yKQXRW3z:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MiBTYWx0ZWRfXzpr5ODt7CUt6
 w/3ELyia6SfSa8+jhJ/O73whRmbDZO0E4i4V/xGhS0nz6ANLgPIyHdWCutLRYwi9gDK4MMYLYmo
 49/Xbmzyr7vCR3J4uL2FlMSen7cxDR1GcwSC2m7SXFDV8c/TAxHlhB+eWAeBWl+AOlP68Mh6ERo
 JEBjsd4sL2g7Ijh0/lszxzkGQ2OoSR8/E124bp+Nvk7nsviwleoKOG5kZH3GisEGpOuGvYHcdaT
 owbhzFlpHsNQHVPI01VklHBghVaJXDH5Q2Wr8pg0jyBMN5etDycaOLgNJC4NlwdC2WO1lRWPRJK
 nTfI2YplNl8vhYZWn4XPsGTdmdNXnnZZcUWKa3j33ueGq0caRvsd35qwiFYXgeBz2RzG/zQojCx
 6pzuktqIh7AkrizhUWjV2oHbVyjoft3Zk0rlRyTggCiBK0BAfcqw1PVtLl4mUh1rs7+s8oUW8zh
 +fuuLXx9uufP2wmXj+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MiBTYWx0ZWRfX/PvKo7uhMesd
 M5C9twjkDeA2JRvsHIOKrLlxdHioftRWcoT9u/ku/6oMbM5ABM6wA3+OQ6bJYXWG1M+LirtsZsR
 m0vJ8JyeIJStcCja1BGGXOTXCt829lc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270142
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Aug 2026 16:51:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17609

On 8/27/26 10:07 AM, Hari Prasath via lists.yoctoproject.org wrote:
> Copy the TI vendor kernel dma-heap.h header, which has the
> DMA_HEAP_IOCTL_EXPORT ioctl that the default linux-libc-headers
> doesn't have.
> 
> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
> ---

https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc#L7

>   .../0001-dma-heap-add-export-ioctl.patch      | 58 +++++++++++++++++++
>   .../linux-libc-headers_%.bbappend             | 10 ++++
>   2 files changed, 68 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-dma-heap-add-export-ioctl.patch
>   create mode 100644 meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-dma-heap-add-export-ioctl.patch b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-dma-heap-add-export-ioctl.patch
> new file mode 100644
> index 00000000..e96c9ff0
> --- /dev/null
> +++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-dma-heap-add-export-ioctl.patch
> @@ -0,0 +1,58 @@
> +From: Andrew Davis <afd@ti.com>
> +Subject: [PATCH] dma-buf: heaps: expose DMA_HEAP_IOCTL_EXPORT uapi
> +
> +Mirrors ti-linux-kernel commit 8715cc31cfe8a191ade660ff787fedbadcb187d4
> +("TI: HACK: dma-buf: heaps: Add Heap export from offset IOCTL"), limited
> +to the include/uapi/linux/dma-heap.h hunk. The kernel already ships this
> +ioctl; linux-libc-headers fetches its own independent pristine tarball
> +and knows nothing about it, so userspace can't see the symbol without
> +this patch.
> +
> +Upstream-Status: Inappropriate [TI kernel hack, not upstream]
> +Signed-off-by: Andrew Davis <afd@ti.com>
> +Signed-off-by: Udit Kumar <u-kumar1@ti.com>
> +
> +diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.h
> +index a4cf716a49fa6..db749800b6c16 100644
> +--- a/include/uapi/linux/dma-heap.h
> ++++ b/include/uapi/linux/dma-heap.h
> +@@ -39,6 +39,25 @@ struct dma_heap_allocation_data {
> + 	__u64 heap_flags;
> + };
> +
> ++/**
> ++ * struct dma_heap_export_data - metadata passed from userspace for export
> ++ * @offset:		offset from heap base
> ++ * @len:		size of the allocation
> ++ * @fd:			will be populated with a fd which provides the
> ++ *			handle to the allocated dma-buf
> ++ * @fd_flags:		file descriptor flags used when allocating
> ++ * @heap_flags:		flags passed to heap
> ++ *
> ++ * Provided by userspace as an argument to the ioctl
> ++ */
> ++struct dma_heap_export_data {
> ++	__u64 offset;
> ++	__u64 len;
> ++	__u32 fd;
> ++	__u32 fd_flags;
> ++	__u64 heap_flags;
> ++};
> ++
> + #define DMA_HEAP_IOC_MAGIC		'H'
> +
> + /**
> +@@ -50,4 +69,13 @@ struct dma_heap_allocation_data {
> + #define DMA_HEAP_IOCTL_ALLOC	_IOWR(DMA_HEAP_IOC_MAGIC, 0x0,\
> + 				      struct dma_heap_allocation_data)
> +
> ++/**
> ++ * DOC: DMA_HEAP_IOCTL_EXPORT - allocate memory at offset
> ++ *
> ++ * Takes a dma_heap_export_data struct and returns it with the fd field
> ++ * populated with the dmabuf handle of the export.
> ++ */
> ++#define DMA_HEAP_IOCTL_EXPORT	_IOWR(DMA_HEAP_IOC_MAGIC, 0x1,\
> ++				      struct dma_heap_export_data)
> ++
> + #endif /* _UAPI_LINUX_DMABUF_POOL_H */
> diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_%.bbappend b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_%.bbappend
> new file mode 100644
> index 00000000..7f0345ab
> --- /dev/null
> +++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_%.bbappend
> @@ -0,0 +1,10 @@
> +# linux-libc-headers fetches its own pristine kernel.org tarball, independent
> +# of ti-linux-kernel, so it doesn't see TI's out-of-tree dma-heap ioctl even
> +# though the running kernel already has it. This carries a minimal, purely
> +# additive patch (no existing symbols touched) so that ioctl is visible to
> +# userspace via /usr/include/linux/dma-heap.h without re-sourcing the whole
> +# recipe from our kernel tree.
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
> +
> +SRC_URI += "file://0001-dma-heap-add-export-ioctl.patch"


