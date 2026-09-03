Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BC2C61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:00:39 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3330.1788426037782343885
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 03 Sep 2026 02:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=HLy6mDXL;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=AQilQf5D;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: y-hegde@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835jNrW295469;
	Thu, 3 Sep 2026 04:00:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=N0te0dUU39nRL0t
	RkNl0Y08SyBt4/jSuR4/dnnXqBQE=; b=HLy6mDXLCLBR9ykgD6onfKzJxYdIGAb
	A50h4Z6Ez/Cxz3SqJxEqtH4NxjqHrJiTjEUn8PCGHXWU4/Rkl2qDbcuslTNQn+OU
	TqsWtSfy1I/kZoQNQVsQ0nResGDUALxWgWcpLAfqN5BWkBC6yQlaj7wh7CwZYE2L
	B1qBcVyG8RsRkX4m2FnwTRSe3Egh77vpfGjqx+HWkeH0arX89hmor5N9uSITnjHU
	RcFiTzvtBMngZVqQxrA+CT/Zdk0kG1KQJPBZ+jyvYHQkVz219zmSBFw/DB+ebcvt
	1103pFw6268ylbzNoauNQSoDgQbWEMxqNBK1t3MwjK8hmbQLOSbfDgA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010016.outbound.protection.outlook.com [52.101.85.16])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gen86pcq7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 04:00:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efAa9BD8E6o7Wj6kKewo5alqTjXPERrrVOMUbyAoSVO83sWM9rC+fhWFSpTPWx0LXEE8KUl1AXRn5xw6KXWyBJOFgMywLcbBePZJL01wZhEu26HaXDyASzFIyj0Qlchp3MpMYzprymbyA6vvIMWc+tt7PK7PptfpNbb0QQuouQyYh3TAg5m09rkFTE8ztD4UQvn3sxafSJYVhkXg/MmVh3JMo6fPkyZ5zg4eOu2AFFHrEM9pOQE7F/oez3fDU7oM23QzDoYdZdbPHOvcn1JFSoqNT/MqlwR5xYzkjDXd8+cd70kNEtYWPyUo7ogOfWMN8s2b8HU79qQp+q2cgaQp4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0te0dUU39nRL0tRkNl0Y08SyBt4/jSuR4/dnnXqBQE=;
 b=mZqAcqKUHPv7tBtSwbm+3+fs9CAe3PJbbldB02bf+B8D6rNykJfTCsshF52KtyLjqul5IidpmBBioBSElOqt38LQaYBjNrbz6xUFRbuTg2+fLqCTKFFf9CYvnU96dOW0Y6Hs4SYpKym1ukmguWH9DdauXwA75u0sNOt+vRP9CyPUIT2TXfUdTekLbjVENrIQf+cv0l3VyeVHaGlDacI48+NVaWErNQZT3G5idytI8RYSY7K812QCSMfB3Vr/j3LYXXrYKOrOD9RG/F9FHo6Bm0LyndcyFCVNSEpYBTLEW7oerjwodZ98pwLMPk6NDYt+TFcPnLn4IET83r1cXyqHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0te0dUU39nRL0tRkNl0Y08SyBt4/jSuR4/dnnXqBQE=;
 b=AQilQf5DXmLcg2PSPPIsoZcR4+ogJva3DDKUWENBShn5xbthos1USRVPK2v37cFT7qW2JpyqXG8OVGPPtG1vjtNUtsNELjulyvYSmSnuA+kvThMrkOQkg5dM7qGxVtTndMr1K3ofjR6ynKo9T8DGKznEJQUHMQTvt0eMImMpjzo=
Received: from BY3PR03CA0013.namprd03.prod.outlook.com (2603:10b6:a03:39a::18)
 by PH7PR10MB6155.namprd10.prod.outlook.com (2603:10b6:510:1f4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 09:00:28 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a03:39a:cafe::8e) by BY3PR03CA0013.outlook.office365.com
 (2603:10b6:a03:39a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 09:00:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Thu, 3 Sep 2026 09:00:27 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 03:59:57 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 03:59:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 03:59:57 -0500
Received: from localhost (uda1250336.dhcp.ti.com [10.24.51.123])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6838xuaa2274375;
	Thu, 3 Sep 2026 03:59:56 -0500
Date: Thu, 3 Sep 2026 14:29:55 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: <m-shah@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <u-kumar1@ti.com>,
        <s-vadapalli@ti.com>, <a-limaye@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: Re: [meta-arago] [PATCH] recipes-core/images: Build
 ti-core-initramfs alongside tisdk images
Message-ID: <20260903085955.xndzk7kynrhaza3k@uda1250336>
References: <20260902132838.2135551-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260902132838.2135551-1-m-shah@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|PH7PR10MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: de48ddb6-7a39-424e-67c3-08df0999cc5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|22082099003|10067099003|56012099006|5023799004|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	ZU3Ma2vm4bJkP2Nlr26r5Lun7BLvb9R/yvbX0oaa9lzRHVlQOE7KKLeE6ouzcEe7+s0gZbe/ctjOzgBF23QCxbF6eiByODov25RtQozwuRADXjn6ZkNKoz0QUCy+JSut0VG4ck7mVeDkDof3NflAEPs44qy4REzjjtt/URsUzysFf9Elpiy7RH89UBSNcb6eQ//oGryUldU6cBR0MorfV++3Zo908UT2lvziJVLATj5djj6Z9zN2uSSjtJt3A5KmjZqLLIIS/bo/PiI1vTWEYsVKriar58/zPl8DSlGrqaV7Aq6tn7qOGDXK6nO+vBgAS9tZI0sYGv3rw0iPF69xBzujcEbHS67k87CzgQNZKl2ZR4yPqKUrWzv2Xn44yNDhxQNTAGMVphlkrfAyW6lQpxAsjViRRblTOkq9hIlnnQ1714GJ3lAT7dOdoWo6gB3Zon9ygmtHwjVFcFyXBLyWG63DyCtxtpWhM2j3aoTO0USORSpA6wkr9HQ6JBXTGdUEZo4cRlTNjWDETjfYlBUgdcF4cn6dgh2oKekq61VSfyBe9IbAEjVdlH5ZSZFy4Ob9yjnAtS3YofK1jX00khnQ7jlGEKrI0BejCoI/iEKsq8EAbow56+3p03Do8fc96WU4F2VWC3CSMAy7c+f+dXpyWA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(22082099003)(10067099003)(56012099006)(5023799004)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	W5Z+oCmL0aYOW4wOmGjgpyZAYKRslGZg2X4yHf5mfCtOy1oqnv8Ys1OSQ+e6suLcDmKntZ5T1fT9JiOQgHcJ+GH+XEhY5q2kxgq5qHwr9mS5Gvc8eNKrWcU2njJnfN2LVinjCfzv1ntdXUqtj/CTW7SXNOgtBXdUTAn6UMRlVXTtXWUVTQPa7OLmU47G+csPdY0BrOAjxHetsGCl32awiO2iGSXEc+MFj+HLyzegkOd6QNAYnEnFBoGm7ICPChTHDEiE/PSxbqrIBk5xtcb03KQ7CBIyGXHk6yMrjDtf1zGxxDJS10HdmAazjCJy4LlCO6iz3y8KGyc8LP6R13gqHaqNS8BBBAe5xF3Lhn7l0ykpkvOU5Ww8M3tBpv+Tjsr20YUGUyYNJkAppHO52/Rm+IOyYrn7ba8iwuyZt3jU3riIvXb47ApJA0BaRBbY5CkG
X-Exchange-RoutingPolicyChecked: 
	EZnwt/e0D51JbLjI5ijk1CtcwNWBBLWFCPzbOHFG4pNvj72kJYHKTf7Ls9DE5//2hegLLU3SObUFlh1X7ZIKgdi4ZgKqSGIDLtM5wQMRgmN11eZQ3Pd4ltMQNWbSuCwwqzR2ivGSr5Kq0EWhyQc9W/nhoOABj2QKMmx6tyhlqVc4tx1usZNHaxjDTXV1yp09DbbbnUtyMmsEJMIO4TWicRcjLaCG7ZyUVtcnlDJGZsKQBJCsfGj6umL1dH3FUNR5Qgs/mQ9YfpUmbNs/ri/cRQeO1XpGRUZWn0CCFDjqsnZwhKJDlm4UnY9OWbfXxO3kUFOwhkOJTNeKtUo0OG3ySQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 09:00:27.1849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de48ddb6-7a39-424e-67c3-08df0999cc5d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6155
X-Proofpoint-GUID: EW6p34FRNEBl-33gWRz1e_8iDIJC5Ar6
X-Proofpoint-ORIG-GUID: EW6p34FRNEBl-33gWRz1e_8iDIJC5Ar6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX9m6tDJS3/fax
 aR9Tatl5CwJUqNKO1Orfv/vFEgI14l8/kCnKNPFJwABcPgNMjjizMB33J58+TYZslwwwWIuosPM
 ZIbBadArNiTMtmg5FjQ7H0anEBBaf0s=
X-Authority-Analysis: v=2.4 cv=HcMkiCE8 c=1 sm=1 tr=0 ts=6a993733 cx=c_pps
 a=4V0jRqm32qvR0De7z9omKQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=kIct_dqK8YH0UJNUH30A:9 a=CjuIK1q_8ugA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX8TaqbR0Z2Vzc
 0APTc4gynaS/c2g6JamF9u8wYvn8isU4h2KIRNdjD5qf5nAaU8E3lTHn0hAuYLYlUL5RoYDwpHz
 wVoapp0PhQ4mfgjBfzkuHRMQtCuZ0rk7aPngZZ2WeXI8oH7DbUD+GiVTuQd00SWGc6dXquJ6THA
 EaeLihwWaikz7+fSsvnNCuyKwSHuqLYTNRXl+aMHn+313k/UHvHlMKMMTTfdMkztVG6GFihG9UZ
 eJ/lQStt0NfxX9ySVMl1/J+3EwTuIHNlIbYEzmIw3vBNIyKd7yV3cBOkNV+i35IZzYq/BSpBMbN
 9aaMVdI1xEB9FP2+968QDsFeeV4w9sJ/+t+wKmFsX/RHR4m+3adUOB/IlBrNxnMirwlb24zEgtF
 ufjQYT48t2IzO1H7+Cnbiqx2L8ci9qB0ZnIDcXVa0zSq7RSigeYDPntVl5NLH8+Wue3J9tJIiJf
 1vm5c/OnVx8GEFU6AwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030077
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 03 Sep 2026 09:00:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17650

Hi Moteen, Thanks for the patch

On 18:58-20260902, Moteen Shah via lists.yoctoproject.org wrote:
> Neither image sets TI_CORE_INITRAMFS_KERNEL_MODULES or
> TI_CORE_INITRAMFS_EXTRA_INSTALL for j722s, so the machine-wide
> TI_CORE_INITRAMFS_ENABLED gate in meta-ti-bsp stays off by default for
> this machine. Force ti-core-initramfs to build via an explicit
> do_build dependency in arago-image.inc, the common include every
> tisdk-*-image recipe require.
> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>

I am not sure why this patch is needed. Why does j722s need an 
empty initramfs to be built? Why does j722s need a empt initramfs?
- If it geniunely needs to be built, this fix should belong to j722s machine config by
  setting the appropriate variables, so it is limited to j722s only.
- If it not to be built, then the gate is working correctly and there is
  nothing to fix. 

-- Yogesh

> ---
> This patch has a dependency on the following series: 
> https://lists.yoctoproject.org/g/meta-ti/message/20235
> 
>  meta-arago-distro/recipes-core/images/arago-image.inc | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
> index 37b20850..398e299f 100644
> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> @@ -30,3 +30,7 @@ BAD_RECOMMENDATIONS += " \
>  BAD_RECOMMENDATIONS += "${@oe.utils.conditional("INIT_MANAGER", "sysvinit", "", "busybox-syslog", d)}"
>  
>  inherit core-image remove-net-rules
> +
> +# Force ti-core-initramfs to build alongside every image based on this common include.
> +
> +do_build[depends] += "ti-core-initramfs:do_image_complete"

