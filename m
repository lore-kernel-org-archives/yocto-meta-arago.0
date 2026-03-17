Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E918FEDA1A
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 19:40:03 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85244.1773776401915688577
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 12:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=xQ5WyqnO;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.64, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJ+faFrcq7MbCy2U4fK5ZvzfHl3XhnCafMaFzG0d3zviXthTDssOq8SViyhISZtLkV5DTGDrcolGakPieRCGkdKIpqfOBSr/PtLRlGoO3CTLLn2+qAzg+qXS1asm3tlzSIACOxgE6lER1LQHxlzt7AOwGo6jHeYNeNZymONkpQZ32H5FQfbA+ySHNjzUoE5bQdSgQTmrp13tpsNFWtoMKa+lSsgBUSITyOSfm8U/xcCJvs2bPL5hO/IZzEbxLGxwpd9arRvm92dhRFCLFSCgn0jIKPobWpjIHO4ICEEZzyuddokzgyAy7VoRBSF7a3RJMGFf8zlMcPk7OvyGWDi8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+M/19VEFqxfhzEgbzHRYkCe8JU9UmuezrZ+Rk7cY3i8=;
 b=bqHa3KbgNuvTc/G8oYnEmkWRcNHylo7Ac3aOfY9cRbj1vVRW+qoB9zWEUWxLJfmn3ekugjPaobmo5728x0FfsytbgR5uv9P2pUuKp0FWrwi+D9JR/YebYxfJ5QH6vG/iC/WAcjAT9renPqCVxiXlHrnJBhXhOU7z3BA3pMrcIf7DmG9KsF/PIdq4aO9OnL2K3yIdVl+dkkaFbv/NWxSkIDfUTd9yyISdad4MndUEeyX3GdBLEWnehOeUv4Gjhh1nllQ1JO92RMMARWYuFJm9HVl/bCI5brABDBR8b4HnmMzJUj7ca1DKk8XL+7xJA4ys8GJMZG7Ohiyxd/xIZ7ucPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+M/19VEFqxfhzEgbzHRYkCe8JU9UmuezrZ+Rk7cY3i8=;
 b=xQ5WyqnOraaAVX1m7Ax5byPmOzp8bSmruH5o2/Qd7m5Jfn1xMXxUkTU9QKZCcvIM8R6fP5h9lm/mjUT6TjpHZedbyEpjLB7AhQYZo4Tlvu3I6ejHVoCZ8O63hI+etvM2ggkugTh9gEFTu8OpQ69ezEZImdbr8WW9yWWz8pf5I5A=
Received: from PH8PR21CA0010.namprd21.prod.outlook.com (2603:10b6:510:2ce::10)
 by CY5PR10MB6011.namprd10.prod.outlook.com (2603:10b6:930:28::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Tue, 17 Mar
 2026 19:40:00 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::29) by PH8PR21CA0010.outlook.office365.com
 (2603:10b6:510:2ce::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.8 via Frontend Transport; Tue,
 17 Mar 2026 19:39:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 19:39:59 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 14:39:52 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 14:39:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 14:39:52 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HJdpo03253145;
	Tue, 17 Mar 2026 14:39:51 -0500
Message-ID: <b1d762ee-53b6-47d9-acb2-d62e86f0f737@ti.com>
Date: Tue, 17 Mar 2026 14:39:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] arm-benchmarks: Disable security
 hardening for accurate performance measurement
To: <j-sahu@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <20260317183932.327935-1-j-sahu@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260317183932.327935-1-j-sahu@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|CY5PR10MB6011:EE_
X-MS-Office365-Filtering-Correlation-Id: dac2b79c-34e4-4b00-5f17-08de845cf98b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	DwLGgCT+72/3h8S9Lft50ETqRW2NKJTk0Sw+AChp09jkHu/6mfz5hh5K+n3alw4wZUjpG1uXqgZwQSBj0T1PntHDnQ06MOLHdWJsgoGI4HDbzh4sn+Y0827gcZQRo0NcAERe2GLroXmQpAEQumFdw5ldobYfVS/gbWcSRiyDXmu25JGKNlOI4iyww6TZOwADXVSmbal+rbmcJTmQB9Z6opWl/1XYjyDVRBT3CNa9m66UVeIsrEzyueQbwDBY1j93Tv/O3MnCV8TGqCofyZxVorM8ULB9KjM5+2i8cetM7CQKH6LknHbgjtOjceAVq+Pu9xBg7VHwZ02dA+V/FZDdJzcSE7lHDq9BPoR4Qv+4tGxcB3AQ/brNeZ1xi1m4NrW0bEC4g/YWKZVMvtkmBLsJyccddVCJKMcPC3uZqtN0WplXMseiV4slDu12dGLzwThauhIPMYR56ursVxkaIBrIU7IOWcipeipwCVODPJ78qOQEJl/C/kpfkOqgLYsWDexnQATDz3HKGpEWVGWnSTaVeklW5gU/8z75gG092qV6BYD9lkNpZQB+S44Rf3dyJ6wAds4yvoG8DTcRp/NQAR1rhH/04feeU3kEOlQntxZLzuC1NHI1sYnuaTfToaP1+Jc5Ou8KU4kmHK5nCHji/SvNs7F0+HHa9bg4QUAg+po1ZEXRMK/vbcUEhwmSm5vG2SdyXlTx98yYw7H32DXtnFs4ZEJcwTrmMMkz6Jm5OlQHpSTtUYHXQKYztQmdQxxZ4vCNRl4C13GspuCpOhJifa593g==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	OutfFucqxEZrY5nm7PWOpBzb3JLX+aDOE9OVQxr40w9yFeQ7lUx67DBGeW2F4dTJ17ILdUvTM9l4n6O6h1CHtBdVGehvRZgG5Dw0RNW7N66Qnn0kwoE35JDkLMJ+6tCR6xWXNMZb3apjYRe3VY/wwWCirlS8YEtCv+TckIdDitemmmSL89hopUq7XSAy7wEpTCrvYkN678wK7Isz9fOMJYp7bAk/aBSBjOakUEXYXBUz94LL1aAamdXdU/LZMJGYybAcW0n1bxNcB6zFjtECoqs3qJn2iedJE0uSVJ2py6Ti1RmbbLmZBKb9OUzGiB3Lj2jvofb3g6LdCU2I1N2AMsT0zTR9BdTX80FuAVr8hYDABAVp9nnmEtYLNO6cN2xNc3sMowDQw9cx/IJRm2p5mDXqI7MtT8hmO2bIsCB2xf1qLFFceOSgQI7q7zdAQ2J1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 19:39:59.0809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dac2b79c-34e4-4b00-5f17-08de845cf98b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6011
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 19:40:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17373

On 3/17/26 1:39 PM, Jeevan via lists.yoctoproject.org wrote:
> In oe-core scarthgap, security_flags.inc[0] was NOT loaded by default
> in defaultsetup.conf, allowing benchmarks to run with minimal overhead.
> 
> In oe-core master, security_flags.inc is NOW loaded by default[1], enabling
> all security hardening flags during arm-benchmarks compilation, causing
> significant performance degradation.
> 
> Add distro-level override to disable security flags for arm-benchmarks,
> restoring benchmark accuracy for industry-standard fair comparison while
> maintaining full security hardening for all production binaries

The versions of these benchmarks in `arm-benchmarks` are still forks. If
you want a "fair" industry-standard comparison, we should drop `arm-benchmarks`
and use the versions others are using already provided by meta-oe.

Andrew

> 
> [0]: https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/include/security_flags.inc
> [1]: https://git.openembedded.org/openembedded-core/commit/meta/conf/distro/defaultsetup.conf?id=4c2d64c10a5b0437ab1ea04df22386f0f95124d1
> 
> Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf                 | 1 +
>   meta-arago-distro/conf/distro/include/arago-security.inc | 3 +++
>   2 files changed, 4 insertions(+)
>   create mode 100644 meta-arago-distro/conf/distro/include/arago-security.inc
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 43d4db53..6987d0dd 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -137,6 +137,7 @@ ARAGO_IMAGE_SUFFIX:append = "${@oe.utils.conditional("ARAGO_RT_ENABLE", "1", "-r
>   
>   # Load default preferences
>   require conf/distro/include/arago-prefs.inc
> +require conf/distro/include/arago-security.inc
>   
>   # Allow branding on top of Arago Distro and Core TI-SDK
>   # If ARAGO_BRAND is not set in local.conf, default to core
> diff --git a/meta-arago-distro/conf/distro/include/arago-security.inc b/meta-arago-distro/conf/distro/include/arago-security.inc
> new file mode 100644
> index 00000000..65107430
> --- /dev/null
> +++ b/meta-arago-distro/conf/distro/include/arago-security.inc
> @@ -0,0 +1,3 @@
> +# Override security hardening for performance benchmarks
> +SECURITY_CFLAGS:pn-arm-benchmarks = ""
> +SECURITY_STACK_PROTECTOR:pn-arm-benchmarks = ""


