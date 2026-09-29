Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 403BCCA5FA7
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 20:10:16 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5612.1790712607326970256
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Sep 2026 13:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=F3cipti6;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=QrDPwTaG;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TGJsrR486747
	for <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 15:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=p6iGLoMNLsPpvmCD9fam2XWebbaWghUeCskUxNA8G
	Q4=; b=F3cipti6/PFgbbwNTjebmevuJorkFWGJU/U3DJ9ULsxnwST4Yn403PDy1
	nNQzr1RRIqX8KfHtiJ76kai7z2EWm81ZJQnf60zMmaqE3jERIroiwf3TW7a2qlFw
	oqUQBPBpph37RmCjoPEZ6zESUXw17G+X3OkZQy1exxwmdzMrHQcu0ZDlZYjSRT3W
	XNIFMwWs3bYUo+hnZvvEkB13/fccxYiVfflyTZ5bmWLSQwPFSZkw0RmujRMNThf0
	9Gmn12tiinZySL2+AY3iJ/YKrd99h0CChJ0o3Xh8u+bBpUaZahyZWimbiGdeU7zk
	J8MOCxYu2xnoB1IzxJf+oNYhl8RLw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010049.outbound.protection.outlook.com [52.101.201.49])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0cpc38hh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 15:10:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKUAug7iC5wD8Y9jbj/hSASvzBv637KBycc20VmGX3dcOTWoapbzFfHjkDeLmTnhDc9i9CTu5ci7QOkpA3rHNCqtuuGOfcU1pdi9R1/0dOUe0IdfDGLlRnfcALtB4YnzbpdJn6n74NQf1TYOUmLQf33+iHOBocJ2GOGWoLWkpa0jAcqeWmce7Kj4EH+5cCQ6E8pMZXAA4w5daHyss8MCIyqM/pN/UB6cVCdRy9ELOnSXkJW/bpWBuJP6sCTklGYL7dm8KmUFL7gVbGSo3Yjybh3w7nIyzeoC48+DCYNQxXLZXuvJidV5wivcMe7Ozpl2C3/CeaosulVUgAO42/Wr7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6iGLoMNLsPpvmCD9fam2XWebbaWghUeCskUxNA8GQ4=;
 b=DPiK4ESSUSYEQxjubf04vpZbqDeYQv8vKG4V9N1KVx8UnWCti/pxtBN7goffvIOy/L8sHInjLFZtEzLQjmm26lUiEAhvmpQz/3ZLDReK6n0p1L157DIB+7yd5lyoaN7+VJP30gGmVbbijs4vKxx7JsUAVyZa4Je0JvKbysNFiX+rWxPKOSKv9y0D0cLtGggf7E/L0Am90GDR3UnVmBEFqfYlQ8GBpGEmqPsOVewJvmZByCavpKd6RILd2naeJuD1niy/ZR8EMf4zgBaJuI3kUAxITsaR+W2ZVxKRzT9cX7GhKWulos13TJ3/jDkr4zsHT/5t93qlUeWboyPH8Gk/aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6iGLoMNLsPpvmCD9fam2XWebbaWghUeCskUxNA8GQ4=;
 b=QrDPwTaGGZ+30rOt7eGh6R0Vf7dZbTYlbVBIkHpnIM1Ql4UyWJi7xJQ/RMC8FsvOlxvQ3cBl9+PnXGJuWe1K1Fixgg31fc/elzpfJhXl1+td99eg56S9n8MWBBcS+fGVY3SKon3ntXNyZlvoy48NUB3WP0pnNUnllG02s5EUcfg=
Received: from BN9PR03CA0522.namprd03.prod.outlook.com (2603:10b6:408:131::17)
 by PH7PR10MB5769.namprd10.prod.outlook.com (2603:10b6:510:125::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Tue, 29 Sep
 2026 20:10:01 +0000
Received: from BN2PEPF0000A801.namprd02.prod.outlook.com
 (2603:10b6:408:131:cafe::49) by BN9PR03CA0522.outlook.office365.com
 (2603:10b6:408:131::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Tue,
 29 Sep 2026 20:10:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF0000A801.mail.protection.outlook.com (10.167.245.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:09:59 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:09:30 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:09:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:09:30 -0500
Received: from [10.249.33.162] ([10.249.33.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TK9Usu1677259;
	Tue, 29 Sep 2026 15:09:30 -0500
Message-ID: <fbc5a626-3032-40a1-8766-9782beca1ad6@ti.com>
Date: Tue, 29 Sep 2026 15:09:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/wrynose][PATCH v6] chromium: restrict
 force-h264-youtube extension to supported boards
To: Thorsten Lannynd <t-lannynd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>
References: <20260929194855.2797852-1-t-lannynd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260929194855.2797852-1-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A801:EE_|PH7PR10MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc5eed6-dfd4-46d6-dcfb-08df1e65a3ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|260925022911599003|260925021311599003|3023799007|18002099003|10067099003|56012099006|22082099003|260925021911599003;
X-Microsoft-Antispam-Message-Info: 
	+rRU75vFKZLbnii6JJ8nYdz0seNLxZzxFv/8lD+R/6u0RAN2WJsDvAMTlOW5bppKKGNVapP36Kiq21htz6vmV2gLhP7GAaxidzjzShgAsWOlQZViT39LixKZD0NVMIJgWG+IuslhyxnzNahdOykycGq6X/+1lHWce7ygex5ZdoeOlLaJqDmrq7Lg7ePpXdHqMffQ1Uln7+QrdFv4433WJLE0G1mnSfYV/D6Ia3rHOBW6fw7oAoY1VPgGZwRRXTUDG3yGc61DHNULwlbVUqdJSH7PqYq6lxlAG85YIuDgXKjMlHbeFvtUOsN5MVkDz0UyHoOit8KoyvX8wwEn37lQsSnPtC3YK5lKVf3EvZ0s8yCJJjtBKcDUzgrV60VO4gDsg9Wbcey1KSEyBb48CVqTCyW7Lqhd6tY+6QL7TJtChbbOckMuh1tKYTHTxUFYtNfpez6WaIWWdk4Ug88IMp3oGGIfQxzzkKk76cTKA35bOVdUe1vod0HfUNGsfS8iOxVZu64ZYpek/o7VCkFUcJWxGopici91/QuxNDVdkm2Th19HJ2nTNWd0pgsDpyLy3sjemggxZ/LAxmxv4QcexGKo8UJmBzIK6ebxKXa5T72Oe1obfV28NcSODKjrPutoeR7uTdnuifSfDmLbCIsYclSkE/SD9ubeZBn6N7VVWFK/eCx0C1cfzPdrEE0rwC6m0u0PKKObM5lnztwr11Unhkz1mA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(260925022911599003)(260925021311599003)(3023799007)(18002099003)(10067099003)(56012099006)(22082099003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Q6wHvuQEMWtfYLUxI+q+9uXJFHYTYcR6oG76+g2q3UIZIyhFgE6+t+dg6wkFJPerapbOK6Q4kgxTjfQM6XNGS/zS3r6ofafqIldisJHAEpvw30ina+vrg+/ZKaejO9ypeDHynP9qBy2y73h9k+tuC7gBgYtI3ErzlO6DS5rkm/L/uEIG6WuCVq4jl+htweCCmZB+xWgnoq4lvuRqxzol+RDAcNVTvc449ov1+e/eWDj300Sq+1qv/LsEGGTWME8c9GusDRXokA72rLRR9Ta7ldPbV0IgQ5GwRvWiYBTapajCXE7XDlhZjEpSBm76SbUoGAbkf1RykjUtpeARmkEb0g/zl1lh/5XSpjfHfGZvJjvA7WvEjFu2dvu+BMcCucYIWSPXg9hTPJcsBbKdfLqkotaMuHReof6z3siLY+O08Iu5SfROeA4S6I0I4ZBpAD2+
X-Exchange-RoutingPolicyChecked: 
	DDO10OozWSpYuTgDi+w7JZ6DyVHY203Qd59bcQdbl61kpi4t3W3C2/pDRA2wT203e6LrRmy9ZRsL90StFSGZbtm0JyWvVI0eRQ52C+3kPE1nz8OZtBBBi55zlgk1mymoYTqhiSfHV0qcZi9ZWwAhz0RxRRFvW8SLzMQ34XT3RnE/ze2MKuHV1mByVuUpvqXhzvCOqATRlMl//WTMIMLodfbh5QugwuXz/kpENewhvpy8N1sR4LUZo3BDY6WkPmjM3NLuUWvSe6NOffFbJUXgu1cOI+KIgvVigLmQn/i9m0WN7BI7smJlL5v8tQqa46eauLO2KY2S6AXhGJu5GPhyjA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:09:59.9551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc5eed6-dfd4-46d6-dcfb-08df1e65a3ed
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000A801.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5769
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfXxvzQ3nX2Hlt/
 lxzUN2SaMfnXC4Zkc4BS5GbANCmRLILWWuLmAfx7FBl2hWOf50pY2oUFdbKFFinVkEnGeLi5YXn
 Xq0hAYQ1ZDkl95C80u9S9OJAYGuapC4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfXzTczCKXUtIrU
 oOQZn6ql/RM8SXRFYuazhZRqGucwNWAUJbUMzGO//MflCO9E/ApWAeSH2sQnyhtIZCltg3Bsqsp
 6Z0YP99lzhTJpDI+AmkSOr5wi+3ZtyQ+SUd4edgcLndMRQV5QxyUWYjlVM42EvrtQzMSWnZEt62
 sVXYVysS47+8ibxKWA4iLwUDEnrhe7kHwtf/ZsfI+NNYLsnebYyBbZbL2ODO0/MOQJ0loct0j8E
 1Ij172jF9RcA+AlnUYHXFOY5EqKw/NPd/H3D2rDfPDQHSNQ6it/7+VDI/Y3/Hsb5AkDfFP08vSx
 4dzq6t0BD6Jg4AeDtZHsk0qb2xQxNzhh3mYKqKwo6Cf30YhqdYa3tpHgcKGkkQ5QRTVl1pwo+3F
 pwV8dBh3BiCu70D9o0JZ7zjc8V1Djqlq/UCnU6mJzgMFxaEMDjVDNH003RbTPbx4xriBSv0jkjk
 mQ2pFfv5Z4SJvJ1+VJA==
X-Authority-Analysis: v=2.4 cv=Y4xtIReN c=1 sm=1 tr=0 ts=6abc1b1d cx=c_pps
 a=Gv32SYzo0qTo49aZOIuVGw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=R37zpcw9pllq4qZg_VwA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: BHod4v4r2LoAkazI_2H-WeNY5wYEnpos
X-Proofpoint-ORIG-GUID: BHod4v4r2LoAkazI_2H-WeNY5wYEnpos
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 20:10:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17715


Ok.  This is a petty request.  Given that the change to chromium is now 
generic, can we split the patch into two.  First patch is to chromium 
for the wrapper.  Second patch adds chromium-extension-force-h264-youtube.



On 9/29/2026 2:48 PM, Thorsten Lannynd wrote:
> Split force-h264-youtube into its own package, enabled only on boards that
> support H264 YouTube hardware accelerated playback.
> 
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
> v6:
> - Shorten commit message title
> 
> v5:
> - Use generic approach to loading extensions by creating arago subdirectory
>    and loading all extensions that live in the subdirectory
> 
> v4:
> - Add branch and layer to subject line
> 
> v3:
> - Separate the extension into its own package and install on boards with
>    Wave5 firmware
> - Enable extension if extension directory exists
> 
> v2:
> - Shorten commit message title
> 
>   .../force_h264.js                             |  0
>   .../manifest.json                             |  0
>   ...mium-extension-force-h264-youtube_1.0.0.bb | 24 +++++++++++++
>   .../chromium/chromium-ozone-wayland-arago.inc | 14 +-------
>   ...-Auto-load-arago-extensions-at-runti.patch | 34 +++++++++++++++++++
>   5 files changed, 59 insertions(+), 13 deletions(-)
>   rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/{chromium/chromium-ozone-wayland/force-h264-youtube => chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube}/force_h264.js (100%)
>   rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/{chromium/chromium-ozone-wayland/force-h264-youtube => chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube}/manifest.json (100%)
>   create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb
>   create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch
> 
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/force_h264.js
> similarity index 100%
> rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
> rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/force_h264.js
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/manifest.json
> similarity index 100%
> rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
> rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/manifest.json
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb
> new file mode 100644
> index 00000000..bdc3d223
> --- /dev/null
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "Chromium extension that forces YouTube to use H.264 codec"
> +LICENSE = "CLOSED"
> +
> +python () {
> +    if not bb.utils.contains("MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS", "cnm-wave-fw", True, False, d):
> +        raise bb.parse.SkipRecipe("cnm-wave-fw not in MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS")
> +}
> +
> +RDEPENDS:${PN} = "chromium-ozone-wayland"
> +
> +SRC_URI = "file://force_h264.js \
> +           file://manifest.json \
> +           "
> +
> +EXTENSION_DIR = "${libdir}/chromium/extensions/arago/force-h264-youtube"
> +
> +do_install() {
> +    install -d ${D}${EXTENSION_DIR}
> +    install -m 0644 ${WORKDIR}/force_h264.js \
> +                    ${WORKDIR}/manifest.json \
> +                    ${D}${EXTENSION_DIR}/
> +}
> +
> +FILES:${PN} = "${EXTENSION_DIR}"
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> index d8eb0204..40b74c18 100644
> --- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> @@ -1,7 +1,5 @@
>   PR:append = ".arago0"
>   
> -EXTENSION_DIR = "/usr/lib/chromium/extensions/force-h264-youtube"
> -
>   FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland:"
>   
>   PACKAGECONFIG:append = " proprietary-codecs"
> @@ -11,15 +9,5 @@ SRC_URI:append = " \
>                     file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch \
>                     file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch \
>                     file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patch \
> -                  file://force-h264-youtube/force_h264.js \
> -                  file://force-h264-youtube/manifest.json \
> +                  file://0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch \
>                     "
> -
> -do_install:append() {
> -    install -d ${D}${EXTENSION_DIR}
> -    install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.js \
> -                    ${WORKDIR}/sources/force-h264-youtube/manifest.json \
> -                    ${D}${EXTENSION_DIR}/
> -}
> -
> -FILES:${PN}:append = " ${EXTENSION_DIR}"
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch
> new file mode 100644
> index 00000000..90323537
> --- /dev/null
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch
> @@ -0,0 +1,34 @@
> +From 5bcdc4db88d908abdeba11270740864a13bafad1 Mon Sep 17 00:00:00 2001
> +From: Thorsten Lannynd <t-lannynd@ti.com>
> +Date: Mon, 28 Sep 2026 13:22:56 -0500
> +Subject: [PATCH] chromium: wrapper: Auto-load arago extensions at runtime
> +
> +Upstream-Status: Inappropriate [TI-specific extension directory]
> +
> +Scan $HERE/extensions/arago/ at runtime and pass any installed
> +subdirectories through --load-extension, allowing all TI extensions to be
> +enabled by default.
> +
> +Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> +---
> + chrome/installer/linux/common/wrapper | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/chrome/installer/linux/common/wrapper b/chrome/installer/linux/common/wrapper
> +index 3547069c2a..76588abda8 100755
> +--- a/chrome/installer/linux/common/wrapper
> ++++ b/chrome/installer/linux/common/wrapper
> +@@ -28,5 +28,11 @@ exec 2> >(exec cat >&2)
> +
> + CHROME_EXTRA_ARGS=""
> +
> ++# Auto-load arago extensions at runtime
> ++for _ext in "$HERE/extensions/arago"/*/; do
> ++    [ -d "$_ext" ] && _ext_list="${_ext_list:+$_ext_list,}${_ext%/}"
> ++done
> ++[ -n "$_ext_list" ] && CHROME_EXTRA_ARGS="$CHROME_EXTRA_ARGS --load-extension=$_ext_list"
> ++
> + # Note: exec -a below is a bashism.
> + exec -a "$0" "$HERE/@@PROGNAME@@" ${CHROME_EXTRA_ARGS} "$@"
> +--
> +2.34.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

