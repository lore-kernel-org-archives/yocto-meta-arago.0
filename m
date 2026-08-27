Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E13EC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 21:09:26 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.841.1787864960693490748
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 14:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=JLQqn6K4;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=CuuZkXPf;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RJJpau3901526;
	Thu, 27 Aug 2026 16:09:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=TrQGAV7TjqDDKlSSgFrWboKYCHBfOKYL6wKED2eIA
	/4=; b=JLQqn6K4ltjIwWaNW+5dwY/B/UnQAC3js9NnPzzDQdEZ98M7ZhJSFzKpk
	9gfzr3VfksZCfDAmV1vG1O3WxPuG2OCgLlPe3xhMIkjljKMviFETQRs57bAI0WLC
	GONCh3S07S4xAC0w6SThHltwyEanPpY5P//xkVLDMpfcDSZAVe6Ay2lz9V0rbEan
	kk3gJ1vfbzpI1DSUhqsELKtbrGjgOA6zqMcZKqRQHLGSAEpwW2NxXW6vJO4vRq6c
	qUKhPm6uKuZBxVDnXqLvYSzbx9/djR5TdHVWu2j4nm9szMjP6fF7QMyKsMBsg9T6
	hTcNMQirp3opzD0mZCkZIdcGdooNw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gajhhva5m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 16:09:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQltGYLi8Ul1iLmMo821zxAJDJuTWPh2rewmupDHZgifkMCdcPtORioJc+9ZqGRpQi1VtxeG5bIrQIwRSPX1Gs+q07WUSUo0pM10S++VMEIehmw92fTyNLMeYxNH16JWaDc1Gvxc1ww5TnAm/h8kqNKrc9v8FnyYBuZlMb/2Zeoxg8wiGXyMILKhN/ItX4CMj2E23B7+FtuuhQ6af3f+n1eBkjppHItaXTeNdHkUUqWcFxgrvEkRqBZiLuV3qyHwvcOI4uSnP6KxDNYLTynFhAHOt+5RxrNexyZaWMtbQs4jPbK/Yg7Yb8enyEWne1A+SLd06DzM2rV2c6WfAESr3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrQGAV7TjqDDKlSSgFrWboKYCHBfOKYL6wKED2eIA/4=;
 b=GUH+ZtWWqvVB3G9Ed1oJwuP6mQzCc1gb3ZZka87SkvWKk+0TU4SaPVbSTSfDx9gl/75hamATyws5OM5hMSIQnFoXfTWndrT5aArjFAkgwgcpbexA63wnwoKagtFpj8V1X9UEOYw1Gkf30rmQ17QXbD7UoLFit6itM0jG/9IexD9cD5DEun99Wtgxf1/PatuPAQ9f3VsqWjiCuhn2iBazY9eMf8uu7wMU7ODhEmtOrYB4+CoAkSpnVQxvzJQfYS9AZCXi30Xxq/LUifah0kWKObY+HzeJYJ3SgkedAvp/apsUFrDBTzRfpO0dWaRhQ+JpqEsE1rWAE+3i/eloHIT/Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrQGAV7TjqDDKlSSgFrWboKYCHBfOKYL6wKED2eIA/4=;
 b=CuuZkXPf4iEFzvIydUlGjYiztPLlf1O+XMenPADNWn7z3/XRdzeuMQ+xyDsAwhBKqyflQbnRa5zrPjLSpbGqRvSkARQZXdSdc55Gx75K1mkP8XnOmbwyfqKgFvbLqfK6TIKi5DIWZ0QMwASWGNfLDLsEEmtfHBeSCIGLZ1CbaCE=
Received: from SJ0PR13CA0033.namprd13.prod.outlook.com (2603:10b6:a03:2c2::8)
 by PH3PPF57C8E5D36.namprd10.prod.outlook.com (2603:10b6:518:1::7a4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Thu, 27 Aug
 2026 21:09:11 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::a0) by SJ0PR13CA0033.outlook.office365.com
 (2603:10b6:a03:2c2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8 via Frontend Transport; Thu, 27
 Aug 2026 21:09:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 27 Aug 2026 21:09:09 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 16:08:25 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 16:08:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 16:08:25 -0500
Received: from [10.249.64.139] ([10.249.64.139])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67RL8Phg2566465;
	Thu, 27 Aug 2026 16:08:25 -0500
Message-ID: <4e87a573-85e4-4e72-b1fe-81c49bd53517@ti.com>
Date: Thu, 27 Aug 2026 16:08:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] linux-libc-headers: add
 DMA_HEAP_IOCTL_EXPORT uapi patch
To: Andrew Davis <afd@ti.com>, <gehariprasath@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <u-kumar1@ti.com>
References: <20260827150719.821469-1-gehariprasath@ti.com>
 <6aa57f3e-0274-4c7b-acda-d3937d542c27@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <6aa57f3e-0274-4c7b-acda-d3937d542c27@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|PH3PPF57C8E5D36:EE_
X-MS-Office365-Filtering-Correlation-Id: 385d118d-bd94-4f90-3420-08df047f703e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|3023799007|18002099003|22082099003|4143699003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	jrn4G3v0AixmYiY/KP/fRvfNcnxBx33Sii9K4zz/B/IVuTfWXYb/CGvvf2FBzk95s7k0F4S/0TXYSR4OxkaxKehiWzMLUPfSfSSwTN3dLDOpVc/+Lo6DYnsWN96xzzcjxhVOsCITtYi4c4foCT5CT4DwwIQzTOiO57misnnwVzjz2EgtADUaqla/Oc2A16vWajgYGaWkW7qXIPgShEdzUYpWKkgVH2c7G/l5Z/aYg82y70nXVfIWzkIiBsTQaA0yVHHSVg0rm9X5liXpgNPTEWEWBunml4Z4drK15tBQoHuCvpgfPMjgmG0wBcAIbpBmAXe8MOb6RHhN1tUgMf0m4nyb4IBfVba8U5c4uhUTa4sTrXvwNc/Nt2wUW4OgmtZdiXK+rEd4vwQf363i4pOIw1yXLgsSKI1HETwAvl4UenCyqfzfRE/9PHiZtEMjJnppHK9aXVix/eXtW0PkxKYnqVwWS9PEa2DdTPfcX09LXHEx2UR5KE3BsDS8zbyJmhsqwHEWGvK1AQSSucIadpO/uAi7CBEw2E/PcwrB9/5xcVtH4VnPfgD6QukMhxQS64ac0ZtGzOvl3XzZoVfa0wcbwdvNdryGQbKdxIE3MC/0U+6Vk7uw90DxD/mIYlTkJYGEVv326fJafxD8Rf+Gx3Okw9DFa45h0Ie8/JqFdcj2OF8=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(3023799007)(18002099003)(22082099003)(4143699003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	aT6DqgcHdbFee1CsQUPB4CKCVzpN9hP2VYh4Slsl7FoAL6NpeOam6V9ihp2+2jHTz+5flAIhQF2gUOw42riGmPlt0DH+Wkl3SaRFFO2nJTVohMxXN3Y5+U+l23So+tdKBDZ+T26DLVtI+eJmxsEz4ym1gjdEV8svmWssgOTcXcOpZo8bk0ZWdmzFBqZ287ULbjZDEHs7yo3LoNCnGFKJdWoIFewau5J+hFVXSoCjf77F+Xu/1SNdw2NcMy43bMxvTkM6gs/t2BIvoqIqPpBtABowXIYBuyEmocxyuzFd+lD72k7XGCPx5WGAe2hB97RaiuIWYQ6nlMIJNl6jE4n3fPFACx6Ahj97wTmEDooQY0W7b4a4PgFOhnb5fgS3KVCa7cOHkCytDIwugAMhM3p1+gAdDp9vpkxeK1hCYlzQ5TvlaFcUIaXNrCEWrhGHJmfW
X-Exchange-RoutingPolicyChecked: 
	lmraSZ6q6F2zlC+QLoPa4U9WY+dSHe+ljs5QrUqsmexBlZbWprm1C5o5k8C9uAVtFjGa2W61Y9/6wltyyy/6OJfiQT0Hmq37Q22WcDK0l+KdaQ8CUtD37/e0/oC0h3fkR2fSQLFBxFZyAOxDIGB69G0hEKnxdq1zGcIhYxQ6OE9mKvIsaibjxbQ7BLcuwbEuX3b9VUjDtQweTK1k7IGsOc9/ssNAXPkR5SJ3m09laVwem55x11WTq3KxfdFh7MvRjtFAp23MrNgwCVNdQWD7zJnR1qoOAhNAwgV5da4nHC98m4Ks98HPEtLWhEglqP25BH/U9PyL0q+laBKrw7fiHw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 21:09:09.9140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 385d118d-bd94-4f90-3420-08df047f703e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF57C8E5D36
X-Authority-Analysis: v=2.4 cv=Fu01OWrq c=1 sm=1 tr=0 ts=6a90a77e cx=c_pps
 a=eZ5Ua+8tQ3RPWrQJUiaIvA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=WfHZuIUsAAAA:20 a=vFMwHQQjAAAA:20
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=g9-ZRdwzqNu2fZUab8EA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: euFzpkW_k4WNYFac-N8zDWjGPRAFYnGz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE3OCBTYWx0ZWRfX0UX2nZ73/BCc
 ONwbNyhUFK24MsODZyEHxeUNuZA7074IJX8V394MrhnCxf8jj6j3Xv2S9jreqVLrHO6hRQtoKcC
 3UYSyiRZmmPflSW9YFptcp3L5RJWXFIrQMFgK9Ph4Fq8P+LQPKeCVSb6ZoT3bekh0spokjGHnib
 kTVvdnyQxYVHH9orrJmdlKxBdbh5woLOUTqscW2ykOzE5F4FikQ14zjcI50J1TAaB9W8umfqq1G
 n6JgXIUgnhayMGTRjPgUvGZvYJKDVtxgq0uW0uVTmPeMprJ4oHJOwF2weBQajfZbxWE5Vd1mWlj
 UG1wvFGO/cl/GkJXzEV1RcmbmwWdSLRAAQPir/1fHSbaa7EcDtMK9algVDpOjrgJhBL83mXEIog
 2e5mjE7QcWvuoeKEKoRqlVqocXhSIh4k9+cUMWkOwSbiuX3tk8sK4/O9SHHVvBNofnU8kFBWMmr
 MBbp/aQc4mfiiZEBnvQ==
X-Proofpoint-GUID: euFzpkW_k4WNYFac-N8zDWjGPRAFYnGz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE3OCBTYWx0ZWRfXyEA8hU0TK0IU
 pxjTYhRDUF5o7TzoXDeAKer2Md5qRUQR1zhs5brpJzFLvucVmFPiUaZNY8QZj0WFrt9X7U4rPSr
 KaKovVx6fGelgGd5kHcEtAlaLh8jArQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_08,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270178
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Aug 2026 21:09:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17611



On 8/27/2026 11:51 AM, Andrew Davis wrote:
> On 8/27/26 10:07 AM, Hari Prasath via lists.yoctoproject.org wrote:
>> Copy the TI vendor kernel dma-heap.h header, which has the
>> DMA_HEAP_IOCTL_EXPORT ioctl that the default linux-libc-headers
>> doesn't have.
>>
>> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
>> ---
> 
> https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc#L7
> 

Hari, what happened to doing this like what NXP did?  Install this 
header into a different subdir in /usr/include?

https://github.com/nxp-imx/meta-imx/blob/wrynose-6.18.20-2.0.0/meta-imx-bsp/recipes-kernel/linux/linux-imx-headers_6.18.bb

I don't think doing it this way is going to be the right way of doing it.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

