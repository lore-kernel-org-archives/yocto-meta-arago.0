Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A3DC624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:42:39 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13249.1788356557149804445
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 06:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=H1Eobd1A;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Wf69Eh+b;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 682CV2g7974125;
	Wed, 2 Sep 2026 08:42:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=gch2nV7Tuh6o+9x/kruZBhzfKa4mTxmIrPbN0r10+
	U0=; b=H1Eobd1AcbIXiUB58p0SefmVVRcqXD3niJ+GR6FXJ/6h4J4waU0TkTBNW
	XMmpqbbot7EEQOZgn3nBmw5EXtInSza35aFW/Q0pm/jmXrVJRF7x2zgsHHY03ZbI
	XKg32ynjA6ie/y0lxXNjl1IoBepoWmnbvK5/cYlPKIrRYole8Z4GdDP8x/e8MD9F
	pH5ABEkkdDf+SAI9eiOHZXIHIlg8mf9saDtdrfu8HapsmF4aU7gZVzYyKInlzP1+
	ltqfwFQ/4wwyUtU+9sQ1CyhA60g4RPs/i3Vh/xmcgd2YCHPMPpj2bYvK1jJsIKAQ
	wIis9/GWwuRxZqBGPcHPVJXJSrY7w==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010053.outbound.protection.outlook.com [52.101.193.53])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ge7cgcd3x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 08:42:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZzIpfI7J/gdYaRKBHITVFJ5ZQ6FJcwhzNc0fIvHi2DuGEiStUKDhdE9obs3pOWIvnZs4IfrRfXbTKkZk9XdsUArEEzCGKHxymWmHlbtmkchnsDIR//uFI9irWcJowf/1bV3xhLHLVEfyrgL+Y8r/qgFSuvtGu4oURS7YyV+bI+v2X90sXCs26dV2fv8s3VHN6F/yP+fw5PzIsYOqWFA0/GbiC+Qes3RBp3YlLCqkHIWiVmwvP32OIPjrnYtVIAFajZBZN0UOUY6S1JrM2qViTnsuxmw6KJ2A6JqpsElq+dl0leIS1Bozkp3snB1rJvoEnXAEfj8oyJOtJpm/ishVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gch2nV7Tuh6o+9x/kruZBhzfKa4mTxmIrPbN0r10+U0=;
 b=wwjYqIG/trCPovdzkRLsfoXlYaaoNX5ojlmOV1UFUsZ7ZyDqAOHUyfW9IVZfNfZECpIcdfnDcUdM3zLsl9/fiqLusZCqvkn7st3EISrbOKJ8huY3YNQIJ+dIyRCY+vrNQ4sqE1kgYTBeAq7UrHVE6/9vFZa5p5hmCe9dR9cMDHObShuLG8ehthdSpt6kzMatK792+asOrHqW1HpOKKrGa3iJueJJzgRU/PTRP/EBFj+kqb20E5c9ffiNM/QvEgE44u6CIzFpK8A1vVA2LJihlSj/5E5pxu+DievRh9Wq/Kx1ZcSWnXjp5uMr5dtBeJMWuw/Fi8p0vpA2/9n6og7Fug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gch2nV7Tuh6o+9x/kruZBhzfKa4mTxmIrPbN0r10+U0=;
 b=Wf69Eh+bYfxGTxUZzkNseWhzrBCA5HG8QHbEddkoYA/24w3ODNoccp2ZBZ4e2FNjWpqTYKGmQX0JG32jjwooVVO4cj14E/0tJWOo1IuX4mu6U15n0ZPUqwfi4mn802oUNOzIrkxZwoP/Zo5+Z/XjpqvI+gta/1QCQOsgp4BSZsY=
Received: from DS7P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::7) by
 PH0PR10MB6436.namprd10.prod.outlook.com (2603:10b6:510:21c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 13:42:29 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:8:223:cafe::46) by DS7P220CA0013.outlook.office365.com
 (2603:10b6:8:223::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 13:42:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 13:42:27 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 08:41:47 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 08:41:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 08:41:47 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682DfiSb3859848;
	Wed, 2 Sep 2026 08:41:45 -0500
Message-ID: <57362b89-8ef7-4ca7-8ace-274c98e9827d@ti.com>
Date: Wed, 2 Sep 2026 19:11:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] recipes-core/images: Build ti-core-initramfs alongside
 tisdk images
To: PRC Automation <prc@list.ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <u-kumar1@ti.com>,
        <s-vadapalli@ti.com>, <a-limaye@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
References: <20260902132838.2135551-1-m-shah@ti.com>
 <20260902133233.3997540-1-prc@list.ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20260902133233.3997540-1-prc@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|PH0PR10MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b5e4bad-3e2c-419a-31b6-08df08f80748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|10067099003|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	9rNaVBTUlubi35NiMa2Sh83VajLJllVjc8CDK69EJKpvbFxd8+8qDNVvZYtQ2VEEekZkByseBh301EdDbySeHIZcpLXFW1DOINoChyq/KavGGsWNXd5tTY0B5iTmJJkmdmIpVz2cqBgw+r70Pvx05rcNFSZtJ4Zw8KZ/B/Yqtl9/FB8oWr0DfPRLJDoGGqbXZk6JRobgAzNjFIldI5QWQjLQTIcpg7442hxUPImjzZLGBrR28qzIeYuYjeL0xeLx+hcs41moX9ufnTEIbGPM6RG4ahvsj1wBIydQSvo6vvkxGCTgsxRgRKF3AIyuLyCnOD38spn8RPwaMclxArbz8cfCvZJOEK5VQRHjtkSPSy7WTGsuQQYvsWe0l0xi3mm0Le6No7IQO83arnFkBmxxmFC46ZjxYOivtWAFVw4FWdBCQK5hGM1G5kU7gjR3kkRbzA0D0LMdybaovOCXDNqoRGOveLNF6bQan4LpjUQir2p1CYUUNTtuokx/S6xQPEzyfa8bh+a2tV617wm0rtXMPl/CtHMLamaDKoOZc3Yt4DSrrJEaqqr3xQCJQ3EcnbSbh9pBgBgp5B0TztSwWph4upZbaj3Lqvv+psBD4xNxWcqLIflORC86rzoS8WCCXpotasze5PGyFrx/YW/s9GIqGA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(10067099003)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PsHgC4sSS94czCWLvq2c2gz0kWm4g7QeiIVbZX6rfBYl30DzBlYavPpYwCjJ41NFN8V4C1IowJJKDRJ3etsf51o9AmesGV5CVKKe5sh/2V0SrxSucCGDqOM03Cnwk5e21c75+qWq/sMEKHIQ8e7XsbqESdzqQDK+QHCcilXR2LdYdyeYo4NbNuL+RkkyVA2F3sVySWyNPE1aj+ny2Sv1aN/D0ZH0SNR5z0kl4G7P50bZJ1ih3LYeLPelWZj/Sjb+TgIp/cOO1A6JBIvNaSRATinmBhWy9zt9ybGbFpmPU5ntpVn6vFNAhtx4rehfx4POwlfIms/LtjEePqnk+/2YnFB8uFrfmyp34Yp7RIN46i2ZKNJv0jA0YXD+3A1+OisFNBNlcb3OaLPs5n1/SyQyrYxHUf9ZtaCigrZdhmNu8OEiASxAJ8q3CtvWipmKpypc
X-Exchange-RoutingPolicyChecked: 
	UGgY3axGoL2A3Eiz2roP2uXTidClRELfYAHIKy5Xhyv92hT0p5WT4Fzk8A+29rB1Tpy6IRn1w7fMNUzQqYkPx90J6o6xGqL5OhOFmr1L2KWjz+XhMc2yeueXEiqRQOZsGJyKSKPB9aX15BWZxUnkjEzHURQc2xGfvzkA/YKcLUi2B5o+l4lhFdNY62+6GtfwfO4xTFv2jOYRKlIZpYeSvgxFlBuEVFgRhw8bry1Mjq2oDFC6ZHMa2Wplle5UhT6ipU+0gk83gvchdEmaRoHsa6CuLHPuur/FPSKPJHWBgIYuGwc88cFr0cpvRSdLbJL+v1EjkOEtaeH+i8t/8rIePw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:42:27.5955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5e4bad-3e2c-419a-31b6-08df08f80748
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6436
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyMSBTYWx0ZWRfXz2Y2Rz/pXdor
 kjwoaEL0Z+Oe6TRzTSBfgmSbT734ehFa20va1ilP9yHJc04cnEinMgefd2gM8g5BoqYVltsih7o
 2y2eFY9r4Wv3q0fMGJDOmNQTB83whu0=
X-Authority-Analysis: v=2.4 cv=Ka3idwYD c=1 sm=1 tr=0 ts=6a9827cb cx=c_pps
 a=XYxO6LlR7Df2C67LKP0s0A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=_ADwOaQVhxaMFNA7qCQA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: _WkUJsrxBSMOfdA7OP_3JVk3UTdXQADV
X-Proofpoint-GUID: _WkUJsrxBSMOfdA7OP_3JVk3UTdXQADV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyMSBTYWx0ZWRfX6A6noukjONOy
 VWTHyFjCKoIF2UiwZgCBd2/WedUCHFf4IOeff9aZ5sodLGxu29AsDb5I2XX9yVIi105xVo3REbM
 TSuOTXEsJkMQTzn1TAtRE/7jXxVOS/R3kU1TL72zzCdemwDlQPIXfeXjh7//vYObNZYmd7Xrupk
 MFs5C43WPyntD7XCa341fbvepmmReCXAz9hr5aLMIOvbzNgaGjheh/hykX8wscYFYJiqqBgBzp2
 snC/ic5WeLG3XOYF11Y5hTE4wFZ7WtdvIs0f2rFYQxWMcjWLKFEryzFMRZGST9Yw4BJxnpV6ctL
 DhV8RDyPLC4cUDjGIQkk1cdpu1G/BuI42Hz4ZOwsnGDX7t2En+uO4seQ6quqKEk+/DVGo25z1VT
 XLECiD5YQYAtUHz0yKLvEmVRH5RRlVBX4+j0xsXbfoKvEymD0n5P6aCsE797AIn9sYeEcG4Odbd
 MDH3GduhtxDBubdcC3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020121
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 02 Sep 2026 13:42:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17645

I will resend the series with the right tags, missed adding those.

Regards,
Moteen

On 02/09/26 19:02, PRC Automation wrote:
> meta-arago / na / 20260902132838.2135551-1-m-shah
>
> PRC Results: FAIL
>
> =========================================================
>    check-yocto-patches: PASS
> =========================================================
> Patches
> ----------------------------------------
> WARN - [PATCH] recipes-core/images: Build ti-core-initramfs alongside tisdk images
>      WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
>          patch:86
>              Subject: [PATCH] recipes-core/images: Build ti-core-initramfs alongside tisdk images
>      
>      For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
>
>
>
> =========================================================
>    apply-yocto-patch: FAIL
> =========================================================
> master
> =====================
> Summary:
> - Patch Series: [PATCH] recipes-core/images: Build ti-core-initramfs alongside tisdk images
> - Submitter: From: Moteen Shah <m-shah@ti.com>
> - Date: Date: Wed, 2 Sep 2026 18:58:38 +0530
> - Num Patches: 1
> - Mailing List (public inbox) Commit SHA: 96aa2a6657c423398618f3fba7ffd61eaecddbd5
>
> Applied to:
> - Repository: lcpd-prc-meta-arago
> - Base Branch: master
> - Commit Author: Ryan Eatmon <reatmon@ti.com>
> - Commit Subject: gstreamer1.0-plugins-good: Drop unneeded patches
> - Commit SHA: 0122872fbf4cf57798351d7d0ef8f9a6a3712423
>
> Patches
> ----------------------------------------
> FAIL - [PATCH] recipes-core/images: Build ti-core-initramfs alongside tisdk images
>      error: patch failed: meta-arago-distro/recipes-core/images/arago-image.inc:30
>      error: meta-arago-distro/recipes-core/images/arago-image.inc: patch does not apply
>      Applying: recipes-core/images: Build ti-core-initramfs alongside tisdk images
>      Patch failed at 0001 recipes-core/images: Build ti-core-initramfs alongside tisdk images
>
>
>

