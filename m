Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670D8EB3641
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 22:55:52 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5261.1772492147076773410
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 14:55:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=CkSJFxS8;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.65, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpAdxSlaBwou57xCYtw8MVeRaLuI9k9m0qzor1auQzkcd+tRI8dDSiGSrg+xlBtsIc0042niQpPr8UPSpKE+BRcaUfsBY+RcuN3HqO5hbUKKp7dswmNf+EyyPaDRd73LXrBerKOEtZp/gZTPfMNW0BCppnl6c91lzWlF/hdnvUBkFqhW7HpVbPtKpGY3TBUTf5M+OTLTcCSS+L3l20on97drHlqreq3VNYuvT6UQTs7RrRvqOkVGNd3IFJpGFkctDbkRoRvlrnJy0bCDW6xrMIyHFyArJ+LUMoovU/IQeRohf5E0C8I9ehVaDzhTnbcOSiT1g/jhrDZgpqvQqhR3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q99v2sTrvD0w+azvJ5GvAaLiJdtmynuw9CSp83fiaps=;
 b=HtLKe86OFAASiMWCRiHSLs5Hx5LNuyJE/7OJ1d9VsHjaLY0d5CSa2qnCSLep055COl57VGttH2KRiK7SnHXGAx9mbDrtCSh4nz8rbQKN4TRSzitQn8mi/pGZ5wnRRpMXokP088WXlN/a9yaRpcn3G7y8wXoRziolwBlwNEN/vGSeZMcTxk1afmKJow4gEjzQUtmfdRI7SJWVjXJ3OCcUo+B6eceUYMI4NryC76shntu7Uoo+aw9gHP63q2OJ/l6az3qSAEAqJAXFF5SK4meBd1DnJptJmxJ/Lq211W/RE4+pRSfgFjZ2qd6CbYcqR2gQyib8lrgqCtA5M2OpprFjtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q99v2sTrvD0w+azvJ5GvAaLiJdtmynuw9CSp83fiaps=;
 b=CkSJFxS8Eewm31MHL1VKQP0odiZibyT4NuYJO2/vrxAISR8X7jJdKZEKR6fjqO0T4+yVTPaJL4GdfPZ+5HAHD4Fdoj5aj0+7edaiq+keR3PROGIwNNyB5PKi0HxJWlIRj4fQo7dNlakjFpdr7qkjnrf+oB34cwiOyyK9p5q2SnM=
Received: from PH8PR20CA0022.namprd20.prod.outlook.com (2603:10b6:510:23c::22)
 by IA4PR10MB8350.namprd10.prod.outlook.com (2603:10b6:208:55d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 22:55:44 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::f1) by PH8PR20CA0022.outlook.office365.com
 (2603:10b6:510:23c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Mon,
 2 Mar 2026 22:55:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 22:55:43 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 16:55:42 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 16:55:42 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 16:55:42 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622Mtg9P1058334;
	Mon, 2 Mar 2026 16:55:42 -0600
Message-ID: <c7bb76ec-980b-4086-a399-c7e76774e713@ti.com>
Date: Mon, 2 Mar 2026 16:55:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 3/4] meta-arago-test: Add curl-cffi
 and yt-dlp to ti-test-extras
To: <t-lannynd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
References: <20260302205436.1117890-1-t-lannynd@ti.com>
 <20260302205436.1117890-3-t-lannynd@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260302205436.1117890-3-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|IA4PR10MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af9722f-c226-4e7e-4af8-08de78aed584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|34020700016|376014;
X-Microsoft-Antispam-Message-Info: 
	UuWf8IysSpjElu6Y0toT5sU3MWfo1KB9f5EsnH1AZRSgE6AlRwSPbpYzOByen2w0yBUdQrchOO1Fqc/+25mtzZOh/r1MfGX9wSuLh3Y/Fyizm2U4k0K3c7gEC5ZZaEXjApWa/Ap5bOfzRiiYEIO39Lis3CJN0V/kkudYBNrLlQ95WoRLzKiXc1gSWQWmZ7V/m4gcsqmNcYFQpH6DI6IDDmesheqmHXC6biWu+wXIdT90b8KUQw4pWOeEz5GBn+Yk6h+4Hqo46xsdzjnru5UNOhcqsk9vhSfmuooYFnkkmRhxRxpuxigjWUWfpRMF0C3OpC+a+RXp2OOPJLxWjSoxqr+DnZ6i+3C2qvR3ZFclS6LWcU664I80cvxpXZ4r2InU2FzZyMmHIBArGCl/DX5Z+XVjjLLQQ9Xsbz0qbO49XPTwdwac9WzyJQPsZTw2SV63jhUkgrLxl8geFfigH770PSqEArCNTgHVVsPPR9lglJI+LhzmDMe4be5YWzFPyjH2CyI4ATL3FyNBCQSRa9AEaD5kTc6zXErPtFlL5KBviKkFkfPnPUTDUaX4I0zJcFHvq9hAQX4fqs/LGD+kHncnXi+zI1521DJIXSHNlI/IKrrk+ZusQjAqLO+2d+4ed1x88TwA+gJuIQiWdfTh9yxM44MaFPBtu03rqTczSXp2NfAhhGScgZcPtpyJaVQ2JLXaRqcVIH+dvyiEzjoMOBX75oHB50ygrucXNhQ3t+nxNS3F0Yz/Kycp1kpRXK0oR5/2qe6fIIC6nlwm72veUP5BvBJxYIXy6d2GCCNQPyeotoIqBOno224GvGj9G4dmjO0/htF9fkzo+ulxBytH3NhYsQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(34020700016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kvvTZ9TaSInVt9gjMdUkBv7lm/GdCnLXjmQg+CXPcs3c5N4kyc4fNPK6u8Jb9Q/Bc7lig9cKmhIETS/k6wpKboMZ4oRZJF+SDyrRMgUrVIakc8EIHwbamYKbFBFm2LsPd5mh4XNQEpjEX1RX2itzXnHJGN9p33sZtpp2hk4mRTDM0HonsPqdfUgNMV3uUZZRDEg2O68xD2yPoznjqiE3Qwmr0PZCyXubnEZadoiRrt096oi5NZ6UgBYZAeoEsjLtYhQwJe/1aGJSYgO6exqabT+twNGiN7vcfBrQfegew+IiY50WG0rqUTllpjgk/Und+t4uJJQbiOFItv0Xf817JW7x+aj2WETSR55o9hqPcq3hoj97e74PTIdyOhGFzU4LHa8KZJWby1C2bZUoqePXY+n5X2e1W/2+apl+/sKl6NY4fkwK2BlL1GX43bkgomf3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 22:55:43.4207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af9722f-c226-4e7e-4af8-08de78aed584
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8350
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Mar 2026 22:55:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17182

On 3/2/26 2:54 PM, Thorsten Lannynd via lists.yoctoproject.org wrote:
> Add curl-cffi and yt-dlp to the TI_TEST_EXTRAS packagegroup for additional
> testing capabilities.
> 
> - curl-cffi: Python library for curl-impersonate functionality
> - yt-dlp: Enhanced youtube-dl fork with additional features
> 

Didn't youtube-dl run into some legal issues.. Could you expand on what these
"additionaltesting capabilities" will be?

Andrew

> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
>   meta-arago-test/recipes-core/packagegroups/ti-test.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index f2ae1aef..d1d049c2 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -77,10 +77,12 @@ TI_TEST_EXTRAS_OPENCL = " \
>   "
>   
>   TI_TEST_EXTRAS = " \
> +    curl-cffi \
>       python3-pillow \
>       pytesseract \
>       python3-numpy \
>       wayland-utils \
> +    yt-dlp \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${TI_TEST_EXTRAS_OPENGL}', '', d)} \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'opencl', '${TI_TEST_EXTRAS_OPENCL}', '', d)} \
>   "


