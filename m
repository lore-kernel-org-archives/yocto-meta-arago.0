Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8D4109C047
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 07:42:20 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42366.1774510939285439702
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 00:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=mN+DZU4Q;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.25, mailfrom: c-shilwant@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ie0rM89SNV2ZN2bVV9vUFdiCdGz/9BjYxZWwad4TeNatOOnr4+TRpDNQxx5XDAe1VbjtyRrlRDYpfiW3VIMuMmxHLvW2gBymjqBTnSIxIVLUJ6PHF2oxBsPZcCTGCNB+3kPgAtmerbkwsf1QCNu8AUiKuCuuWT/4Q+yD0sxkD3skunGySr07Tw7HeYEPlenfmPKuKBUdpa3JiyZkYyAnrwRAOxEdFSyA0GfQajWzuvygsByBRrd65y6JxNK6NXZQz3vXycjO1/+IL/ErGDyVy4AkRkewcjKPl9NhKMcCS+qiZeRxZsfE5U+ShGcVoVUzyFEt1xr9Cu+9R1QObB+Q+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bialJURuXvqtLCqPHgrBMmXlTXlHITIrlb9RmmXaEAs=;
 b=sWjfs3UXq9MgqTa0tekLjqaX8XXxW5Ow6PdddyTbsEBVY+wJkR79dqxbo/NxpFD37YFRj3+JT17VFeEobKnIEzZiYSZQSnS8yHarYLy7tFTh5YORyF/RN9dK+mvnSRXLfJPOZeCR7qiiUSsgKnGU35F5fDQg+obQtPBasbyFiJ0eha8nKqGOTiK3J0vzPnIUY3Hotx+Hl42Ei7MJ5fCKqZyPDZ6ombo001t5fGHgm8O5bNp44TOfNnTh/fW8B5hUrsj9voVIVS0oxvhi6zU52iLQr31dzw8loGe/+CNz0eUHpOYECI1JoVec/m5S15g01B697JtjhjW18Hdoyhi1jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bialJURuXvqtLCqPHgrBMmXlTXlHITIrlb9RmmXaEAs=;
 b=mN+DZU4Q9GIwiV1EgjdtMlLqVs1AQjCyfP39/U5R1uYSJyWjcR+mNZjq4u2nrBH+E3DDB27AnUpzg4JJSQ4qnMthYJH+bfmtZF/Xpa6R0mO7blSHTMVHU3DVIFw6zcqSGJnJTUTQnZD86mtQDT2p/24dNPeSIJ68KB1Yhze2VNQ=
Received: from SA0PR11CA0186.namprd11.prod.outlook.com (2603:10b6:806:1bc::11)
 by MW4PR10MB6394.namprd10.prod.outlook.com (2603:10b6:303:1eb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:42:14 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:806:1bc:cafe::b4) by SA0PR11CA0186.outlook.office365.com
 (2603:10b6:806:1bc::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Thu,
 26 Mar 2026 07:42:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 07:42:14 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 02:42:13 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 02:42:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 02:42:13 -0500
Received: from [10.24.73.51] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.73.51])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q7gBBn1274626;
	Thu, 26 Mar 2026 02:42:11 -0500
Message-ID: <b5ae415f-ba2b-477a-99b6-fc818faf46ea@ti.com>
Date: Thu, 26 Mar 2026 13:12:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 2/3] onnx: fix 32-bit ARM build
 failure due to LONG_BIT mismatch
To: Pratham Deshmukh <p-deshmukh@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
References: <20260326072653.1025506-1-p-deshmukh@ti.com>
 <20260326072653.1025506-3-p-deshmukh@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20260326072653.1025506-3-p-deshmukh@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|MW4PR10MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bf9e771-dd45-40c2-ce22-08de8b0b3282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	rK1bE9xDBDtwkbDPgkC+608VRdLVZ0KW3Ov7ich8hZEgXsTuBl7dxtJpHa0PGfFSUSkJwK070aGA11U5U3UO5a5PtJn0LG1R9t9Ixjygsi7Sa/K9CCim7Iv9oDdDztxq2PUqCHc/HbJxCkn+ad8e1Ep+Ra28VpJLak26uvSbJS6qeZ7c/8kIDTUhw+3eQnQAAXwOZvgGNq11bjT0C6HaNfZ5fdV0ZH4DbENYlJ+QYs7Lqbs+qoRfSUb3O7FSYGh9QIy1VIu9fuNG1hc27QCrZAxBr88YDLZ9CBF5TScKVNa3qGWjkdrtzGKIdhbvvfmHlatq0qkytAbcPqc4b+BV7I82XpEvVnUiPD6LLslddMFkpvkoiroRNDPqTXBoE+kkYgamTKBGlW5JR0lZBuWu694gquDER0/cqPOyaS8e8tWA5Z6wBIbvXZhnxnPbw7BpecZPBKGRmKZ3pBARjlG0a8XzpiORjAgodQqScTmNccteZF1z/UFhcjH9X+iZVwYDwre4Imius0WfIQbWe9kya8IyAjxfiKrg9nlCOQqy+xgpmsBc4DmGX2/rp+Y6Dz0HtaKqcXDoL9kmxAO8KQ2wSe6Y5VM50jL6JibVB4X+HdF7JrHNovi/PdU40WvkRobOM6xGvpC1hhP+ot01jICZfPNiQI6F094AjSJtUzNXyLIPQPdOy92BdfNWiH4RAV0waOPSc2bapXApjMlFHQgNDvfHBpCSF1FA5l/B5mkOV+NRRA+q2Z/XkWeB5vuDQdg9xMf6MGaKxVl22wnq7vEByA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2RMVSEcRXT/KxLpZRrwWvf1Eq8mtvpFMCZC/HldhZcVnRyNLmaKbImgWGCtUPEtP9XRR52k2+8hSzBTZbsDEUTbSb5s4exBbWVdG9E1pvFs+nqYAWqdIdNk5hkPPVsRLx6ENC4I7XYTS324aAjjX+hSsVolpwgL3aYr4hnspuuBYKyMKNRT5j6kEFNfqIGmOW55xayMOQHGUgqTFjzdivxchu0Bfi0YrPSS3jRXpZmELOEFjJ+Hl7kbLaIORKm3JjcOSBu7nonudJZbAYYzAbGPZShQR8uayy8izI27Fc8ZRpPUmYpB3CJiX2AT+5Ne0xidJFLmh3NCb/1HXl/hqnn1rZNZhfXO25SY9NI/brANAN5px4xexPygqbgnzaUjuQUci3ZX/n2owUVCrO3BJRJ+1xlOBiXwEDlYDTA1zOZiI9IonMbje6tFusYUzWm/d
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:42:14.0828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf9e771-dd45-40c2-ce22-08de8b0b3282
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6394
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Mar 2026 07:42:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17443


On 26/03/26 12:56, Pratham Deshmukh wrote:
> Switch from python3native to python3targetconfig and update CMake
> include paths to point to the target sysroot.


I don't see the below happening in the patch diff,

"update CMake include paths to point to the target sysroot"


Chirag



>
> The build was incorrectly pulling Python headers from the native
> (x86_64) sysroot, leading to a "LONG_BIT definition appears wrong"
> error when cross-compiling for 32-bit ARMv7. Using python3targetconfig
> ensures the compiler uses the target's architecture-specific
> configuration, making the recipe compatible with both the
> architectures.
>
> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> ---
> Change Logs:
>   - No Changes
>
>   meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb b/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
> index fc565dec..7d27119d 100644
> --- a/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
> +++ b/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
> @@ -61,7 +61,7 @@ EXTRA_OECMAKE:append = " \
>   	--log-level=VERBOSE \
>   "
>   
> -inherit python3native cmake
> +inherit python3targetconfig cmake
>   
>   python do_build_version_file() {
>       import os

