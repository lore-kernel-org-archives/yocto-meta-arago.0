Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A86C624D3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 14:05:49 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13732.1788357945567376163
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 07:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=aXa9eWPA;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=b/s7EHip;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 682CV2lx974125;
	Wed, 2 Sep 2026 09:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=/T9pc4zImVfAAxA1Cwh6g38DdAdbP/i1eiULjccwn
	uc=; b=aXa9eWPAtUa0YCbPYanvpSiszgKaYC1Q0lq368aXaYN0zEIZQKNj9MNGg
	J0SATQ4IpKgMSD9h8xzg+XRf11QOwaOhK7KY+6LLLsRNor3qtoiaAEAQxBGH4HJi
	NIJP74Jn86CVi7+r9gRF1cB6pMkan74urTAgDm6Qn0KUzeLb7ULPNaRvBT9hNBaI
	5JWekRYdD8Kl+khkHzuFiC8QCqVOdy7NPs1IlWtu5vu+S+VNPih279IDAh+tN/Y6
	mLbQJBafUrv+vxpMN0R5YZf/l0VMAqaDzxUBS7EH/0uEB6p91xc8Iokjgdlq5fLx
	Xi2Qo/CykGkJz8XutUaX8HOlqvaWQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013009.outbound.protection.outlook.com [40.93.196.9])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ge7cgchxk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 09:05:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDFIlFVk4B2Ca5M/kP+Rz2dN26t6gfQN9qmEwP2Vie09WEA/fkJasaLeFJCtv6X/gXPlhpVhu8LJ0rzNSLWvpe7Rm+/b290qGDRWH6d0dYdDKK0oAjkkFKoodq+EuWPsBAcvPPivmM0xNEa5g1wsJ9ZgZ4fjwbflKbR5xRjuDZITRR0s0fH+kyLYkIgy4SN7e6q/iYRl8bjjXaKg3mL28Pp9D5JlvGB6C4jcNQ0v6EbCZdfMYdfY3e2dyESuxpMLk61yrfYdh+IfpphOFkYS5YU+fsZSehCsnDzELXccIUApEvRePLQ/j8wtR41jJ8aOshg2/EsDQI4x6iHjsdrtOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T9pc4zImVfAAxA1Cwh6g38DdAdbP/i1eiULjccwnuc=;
 b=dObykcCKQy9KT7vDKk7E2WPyLEKljlYDBTLqo6lRAZLUGgU6DR1cb+tQcosG4Zmak/PBdeSKX7a56vBqZDZnr1Q3o2gjgQBVBACbmkO41UHm3q6c7ZL1Y/oPvkNyV1KIIGm4LeSR61PZaRGqpTis1jFSHa6F2L20UFHgLgqz/lq4fJGUA1B67tOalMwshGE+qd1sLXd74u4rHtVcbfBQ6eG3Eq7HuczCWqOghdMgCAmu6Q46d4HQgmNCJxlPf0oBrvyBL8Ukrqep8jvwD3hW2Md1rUMH3lRa5pgIYDn6OXrqFAUDESwKf6a9Mv4aSctLvdUEv4UoMso4bB/y3DFcEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T9pc4zImVfAAxA1Cwh6g38DdAdbP/i1eiULjccwnuc=;
 b=b/s7EHipWdj6F7CbaaMCPNdXSi0x0l9slHwX+maVivVidbQQokHYvoaeb1/ZEL3AzyNrXqujkJsNgV5lTCC/zc76iEIbcBEGy/eAPXSm/C721/CjC3gFLfNh4YNU73OtiqQWBnVdcEump9WIYgmHSEF6biuwP2dH1hjJRNsu3/E=
Received: from PH7PR17CA0018.namprd17.prod.outlook.com (2603:10b6:510:324::9)
 by SJ0PR10MB4718.namprd10.prod.outlook.com (2603:10b6:a03:2dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 14:05:40 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:510:324:cafe::3b) by PH7PR17CA0018.outlook.office365.com
 (2603:10b6:510:324::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 14:05:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Wed, 2 Sep 2026 14:05:38 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 09:05:07 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 09:05:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 09:05:07 -0500
Received: from [10.249.64.139] ([10.249.64.139])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682E57Qh3891284;
	Wed, 2 Sep 2026 09:05:07 -0500
Message-ID: <011794ec-fb47-45e9-bbcf-fd8450892765@ti.com>
Date: Wed, 2 Sep 2026 09:05:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] recipes-core/images: Build ti-core-initramfs alongside
 tisdk images
To: Moteen Shah <m-shah@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <u-kumar1@ti.com>, <s-vadapalli@ti.com>, <a-limaye@ti.com>,
        <gehariprasath@ti.com>, <denys@konsulko.com>
References: <20260902132838.2135551-1-m-shah@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260902132838.2135551-1-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|SJ0PR10MB4718:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eb5afc3-85e4-4bb8-e4cf-08df08fb4436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|56012099006|10067099003|3023799007|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	AVyylipOIB4TdHQ6p5OcJxhph5qsJhO6r4CmkOooMUMKxf7frpsbL2upn8ZT8h3YMvBWjh8E0gftfbUigYneUriVNHwNSFS5K39gOJDUNj3rOy4LiBMXG/NnvjtQLovwdb7jFHtVXYp7Mww5xCWSQM5DAaHshtrhZ4uv78MjdaMKo5+uhXB9KQk8FByetMCU0M2pglP2L1KHDlt7vzAedXB+V7OGW5+xB+bCX/DXbEYaaZGAFheMKahLlhG+qLGRyFvsPjuv73Jp5JAAVwCSd/6+Scd0PevVPLBUnEbQsKUW30IWyrXWYE3Ojt0kViVNqDfEnIG8qvfI3neYu3AgTXsYgaymTh3qxI74J2yMMo7qNnIbEct8fUfCZJso+s+YuDCFt/0QISSHa35bL2NHF1mv2BOZy5DQe3//ac1ZPbKMj0iHwoJ96wcbpLLlpI/E4jtRXo/hZRdq7t6/LRR3iv2ol/9DpFrPMofttcOOPP5rVGU/VlP5BJ6CwTiw/SBnz/6xhaFORjI8MlEEyJniVy3SmW2VE7rzikGfOri4CC1xepaVyFGHYETXIuHVz+TMs0Ot9C7GLE+03B1CXl5UQMDvO8VZYo1uQ5QTUUB6wI2xBDX4RGL6+IQt/NGlLb/gN+WzmEPcnmuLNkEBZmCxkQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	27z6Oz++d36tfhqdG/cDQm0H/fxzh2QQRezRB5eKxXpTFhQSrJ0V1+sIenwIxNue+45YUENw4/j1ulKqhQeC8EHutp5pNOnKE8P4kdKIhrNRYkaHqxjj22+q5kPU65inAryWvBR1hkVKwEwFTSORh9zZ4PRNYVVj6aqjwdaDFNJJJLJWQ9Gu/+LRCJQEBJVNssNTqhHwCUsJzLASJ7AnN3tkfbarhNjR2Z02NaFd47oRS2Ez60VOkxU/8lP0LTV1uSGfDsxinubjcNrluKa81GxJIxAH6WHKbWQeSu4TnU483kRxk/Pp5BYWNjaFV4qOqPWre3uc1DtTsoAhQM6fdw6STbHBMefeh70m7nSuVoY5TGvkJxV6HGb2VQO3f2wOdNd9MY7mDnfTJXQ8ebERqxxD0ocNiSgWBvQzdFu1XK+j4KjmFUpmHYeWDEQ1/q0J
X-Exchange-RoutingPolicyChecked: 
	BcNSTb80N9WkSkJyNAg5jd5rhFKgK5Vc/y9azBebi9o+196shT1rlDrtXFfLeA/roV460Rb2sAPXKjGj/+mg1tSD65ldPzn+LmsXKSbbJeAL/KUm5tWOyrjXNH/bvHoimot2dzL1gP7NQIlZQ4dS0yOqdMJ2QDmcXSuHZFbEhJ1TFaGE3ByxW0jmyN9sK94ogNdnxvyIZK2jBC4W0r+RF5Pwc9be9Le3jgPLt0aqyDm//Y+QDHLqxRq5hyz4VaCE74BBzTCrNXPefQgjVFAvf68vyxdteyvsO0Bpt4FM4B7eztQINo/9kdmZt3U5HRIa4KLSifzsDEeyUFXSEN/X2A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:05:38.2857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb5afc3-85e4-4bb8-e4cf-08df08fb4436
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4718
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyNSBTYWx0ZWRfX3zQMjy5O485O
 A8vWTmkuEYoRwOObgdyjZi3q4spuZet8JfHNt9cDOYlp4NmryqFOjRjsRaNP6HjPsmKdsMc+Pm+
 SPJTuOLAcp2m23czD3vTHryDfWikmFg=
X-Authority-Analysis: v=2.4 cv=Ka3idwYD c=1 sm=1 tr=0 ts=6a982d37 cx=c_pps
 a=bZodHm7PKOcb5V0TIM2Mhw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=KRmc74xxBnraNa5_maMA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: gzsutXhJXsd-gDkkndse4ZG9llqE2EQn
X-Proofpoint-GUID: gzsutXhJXsd-gDkkndse4ZG9llqE2EQn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyNSBTYWx0ZWRfX61Dd2ZMkqqSL
 scNPG0u10UgihsbCwsogjZPz4/SAi+VUIsMEq5AoziUkumiGUNxu16HjQyVzHz+vh8FYWDdX4bU
 zwwq00b3S+29EhxohKhrJy3lu5N4VOL4lk8qxHEAhS/q/y8AevNYM53IQBEUbKD1WhmS0cnCJS4
 T39MF+SxLuaExMDje+DngHEeiS0FQEydWEXy7N6SA9aarjt0Tt23pKhp6mVPsF6QLJdvx8bhlAG
 C1HSYDmD9SJUgUo0PsZsH5BdYNx7Hwsb1Sbt+0oKLakL6yXXgc5+T3izRljqCzOJ+Ui+BZU778t
 rbph2ZSZxs7ZdsKsO4Fbzg1Vi0JwVWWhzns20CGIwG2X0LyfSi4aekeIr5XtPOt0ioCyqMgdCBN
 xxtyQuTDHzJdwLVjBmSRmnRLZi9y14Y+WrTDNlMcCDcbjINRCMWZ8rs53sya7v2JwARoDPNzayg
 zChCLnsbonDTrU5m4Iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020125
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 02 Sep 2026 14:05:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17648



On 9/2/2026 8:28 AM, Moteen Shah wrote:
> Neither image sets TI_CORE_INITRAMFS_KERNEL_MODULES or
> TI_CORE_INITRAMFS_EXTRA_INSTALL for j722s, so the machine-wide
> TI_CORE_INITRAMFS_ENABLED gate in meta-ti-bsp stays off by default for
> this machine. Force ti-core-initramfs to build via an explicit
> do_build dependency in arago-image.inc, the common include every
> tisdk-*-image recipe require.

Why do we need to force an initramfs on every platform/image?  What is 
the point?  The point of the initramfs was that *some* boards need some 
kernel modules to boot so we only require it for those platforms.


> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
> This patch has a dependency on the following series:
> https://lists.yoctoproject.org/g/meta-ti/message/20235
> 
>   meta-arago-distro/recipes-core/images/arago-image.inc | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
> index 37b20850..398e299f 100644
> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> @@ -30,3 +30,7 @@ BAD_RECOMMENDATIONS += " \
>   BAD_RECOMMENDATIONS += "${@oe.utils.conditional("INIT_MANAGER", "sysvinit", "", "busybox-syslog", d)}"
>   
>   inherit core-image remove-net-rules
> +
> +# Force ti-core-initramfs to build alongside every image based on this common include.
> +
> +do_build[depends] += "ti-core-initramfs:do_image_complete"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

