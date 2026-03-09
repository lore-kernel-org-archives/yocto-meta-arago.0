Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02935F3C24C
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:02:46 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13654.1773061363279620816
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 06:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=e9VLDfKK;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.58, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LpcsyU+QasTh+rQTHBs1q5qgxwfVdyo8ri3BBhD5mDESdbhY7BIctcS29j0t3+f/eq9rM4OQCdPQr8Nj4c9H21Wyvy/lhvz6Svi+TX2iu52FQ6OHS9/CyOAK3qUOr5BzG9wpH9ipL1+24Fi0hHs6z1XB+xjKlXVitXaIsUZh+ZeYSvBHEBO1Qm7ps8Qt1DOLq/l/apt3JJvR+4+TN9sOXwsQkm7R1fPVM17oJ3ujUn4adn26Aw3qZ+i97eCD7Lww/cAGwvv+k3vEiMc+KbwzstRwHe+zRl5VkHj8QzHNc1jAPHghS3N5FKs4ry0eu3Ne2AxrYHJXINL1Yy13IAH5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZaOXppaWxzpjW0rEMPsj3DyDuvVL8FqZPL0SfNySHU=;
 b=re2wQxLJmeh2qmC4tv1Ypm8++WQmW3MMmyEM0IAcU9q/i7M+xGnrGs8JEjjuRvw6oKMrsWcL5m2bU/wx00qV9/fkoi+jG8Z1ntZVY2nUGa+ct9RBBfHznWS3eEomTSSJlGr/PNzgceRBGV4alQ2EcZlfZAmoEqyUg7JPCARbXjpIlwrufOut7olTtXyzQivIqoruDkwS5yTUKqEFvUFhumLnMJvb86KMO82nAuKOotOANVcPX24xPMg2vcRIILmZ8e/XDmlAiDnQE+UnH/bJ224Eky6qe1j7nyeFK8M38dj2m235A16CyG9R39jXbl+pmD60j5pnvv263CjW43v+TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZaOXppaWxzpjW0rEMPsj3DyDuvVL8FqZPL0SfNySHU=;
 b=e9VLDfKK2e/blQNiPkuSoWuuRBa/BtVa9NlklgldCpVX3P2gfFgpYf+FNxbLHlWQMo+mKMw+/ePAn0DwVfGXxBKvlAW1cJNNnbqxMkhDRA5DQAokp75s9UuJtiWUEXK283qKJSFKWUHjnBUXcWs3kbrJf2lP9vVAzLd5UEbe6LQ=
Received: from CH2PR12CA0028.namprd12.prod.outlook.com (2603:10b6:610:57::38)
 by SJ2PR10MB7857.namprd10.prod.outlook.com (2603:10b6:a03:56f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 13:02:34 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::65) by CH2PR12CA0028.outlook.office365.com
 (2603:10b6:610:57::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 13:02:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 13:02:32 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 08:02:03 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 08:02:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 08:02:03 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629D239n627028;
	Mon, 9 Mar 2026 08:02:03 -0500
Message-ID: <73a153ec-d0db-4db7-b3d8-450a29e6deaa@ti.com>
Date: Mon, 9 Mar 2026 08:02:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/1] nnstreamer: Skip buildpaths QA
 check
To: Pratham Deshmukh <p-deshmukh@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>
References: <20260309053346.3827889-1-p-deshmukh@ti.com>
 <20260309053346.3827889-2-p-deshmukh@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260309053346.3827889-2-p-deshmukh@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|SJ2PR10MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f21b08-24e6-4c52-a0fd-08de7ddc20cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016;
X-Microsoft-Antispam-Message-Info: 
	84ns56f1NbEPU4q1sZmqGkYBkw18b7UoN9TSaMS1GFkFlGTkv3S3SxEFGly3c9L5pXqxSIUW/91JL9waQ3V5LTt9Pj/U04enwBZGIcUp8yoPC/91QT/IZIx/FHr7uJd75bp24e4omhcWwDjNlafbUn2gqU84Y4/77ZwQFo1FVxaxiGW3WJExUqZLWlcEPt1I37MlpUJ3FUbeEKQisvYwRuRkz2PXFdQBuNq1a3OfsdZDJbRHXrV/nvrPosff2nKNMk1Tufqblpe67eZeOtcgJrFc/pCIaYgVT6n43BWeex6Fs1FfK4Tx5MnCWUtm9KZGT0NRaAbUF+ITKzQgSKRudpVdqnr/Z5TWpabTcDIT/Ht7urrhlJwaR4G9iLws5J4Icwx21LzlanRwV1M5ot/8kcyydY81gSDtp1cZUbpUONuEe8+3N9mvJw77lkJZvaVe5c7wXGlWEbf2BipRmSiDy1cicI0Yxlo/otSkoh9Jf/J8KOBmZybMKyy0E4to0mJqGF3gEQQKlkRP4aOFWzvoeS9tSMUhC7mll7grOaCnvLNy1X5XajIsbdkAy/6ZhD1aJpzbhuXbKthtwX44s7T/OvnPM85tWXF42jYmVaIQrFBIa68R1aEEZHzvhgELfdb6bqBvTiXW3hUbHrL0ziPGloJYThrrnPTO0pNsrf96toLGB9GBB+JEYY/6v0LoNhn0NxGR7FB9/Td5aPcb0wBH4bF/XvAP8Jzx42/etLqhsSFO/2A0G8EOd78SqvUbir1KHS9uCcjL4d9Inuk5NGgCCg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jbAhcKBDPC50zl8Tp/IzqBa+r5fwr1UraORcUSHd9Q9PwoTdT8UsA2bSwF8n5zube9TrAsBejCgQSGea+6LK8e+r8TasQ5iLVEdrqoz6zTS80feJ83LD/EFo0dLu0LMyaTOLnhlRrPkg9WCf9wipTIMaf+BrE96yztz2AFM838bqTPOjCY7QJ3iDZ4ksY0mDcjjE36dUYQM8RikV6VCOBUHWfCE0ZnlG81txgptZUEOulT7x6mEEW8/kNcY7BwY/AI1JPHdhir1Ubq52bvnX1Z1up1iu0AGiovftkEb4QWW9D4t6Mo6uHkEx5VZb9IQzN8yr4WenVkxuiqkQPVyIwi1yETFFoPY6L4w4NthZCIt4rGRv3lwEf04MtIjZxAhLKpRjkXtYYJ5iksg83f4NgJeSa8tzKOJP51A1VmDQ23b3Gr7h2Z/cYZQ9yY+Eqj9a
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 13:02:32.8925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f21b08-24e6-4c52-a0fd-08de7ddc20cf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7857
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 13:02:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17292

On 3/9/26 12:33 AM, Pratham Deshmukh wrote:
> The nnstreamer-src package contains debug source files that reference
> TMPDIR paths, causing QA buildpaths errors during do_package_qa.

Any read on "why" this is happening? How do the build paths end up in
the source files packaged in the -src package?

Andrew

> Skip the buildpaths check for the source package to resolve the
> build failure.
> 
> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> ---
>   .../recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb           | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> index c62589ac..74d72d9e 100644
> --- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> @@ -64,6 +64,8 @@ FILES:${PN}-tests += "\
>   "
>   INSANE_SKIP:${PN}-tests += "buildpaths"
>   
> +INSANE_SKIP:${PN}-src += "buildpaths"
> +
>   FILES:${PN}-dev = "\
>   	${includedir}/nnstreamer/* \
>   	${libdir}/pkgconfig/*.pc \


