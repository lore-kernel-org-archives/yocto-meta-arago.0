Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D756106F2E5
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 07:51:00 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43039.1774511451003338301
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 00:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=YyU6axBW;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.49, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUZW4tQ8GNqjHbCdgaAmdphwGCJ5ynm7GJb4PN7daK5gM7Q7f8fk0WDq+VxXFPcuR/3KJewnvyqKbCXoSCZ4BLBgJc6aFVIICb00po28OLk40ucNs7bg4wx3/QMx5L2nCzegvw+CHWzyXxTcUfOLbpa4L3wi4JII947Mnu+knDnxYAM3ugOS+NFMIxBGdF+bwg0H2CWq56AsT/9VvVi6Yh3RF9oO0NyKSPhAkFUZJDH9lu8ixOEBQlSYtk4ch6zM9EG4pmX2iwLpShX0Fu5TgQFn5mSOmGaItTxCF2OxsfTV4NWxmG8qM5CiOVmPicoCtVJ+NRS+XX73NDw8zW8kNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxHsEELzCwYWrnVRNkiIZ+6UJ/at2tq2+kDYiPjBlXI=;
 b=D30MQmkyf/5MALn4BrTpt36EAbOOmmHQSoUxIx5sa8BND0M1K4e8DyCLWYBFjbM6q0tQNxsyhnBxXKqhguZczt52BUv30GF8W6LqpjJs8UT/x0sbuUTWv7V70u3IRXow8ctC8hLJi26qBTgpN9M0nQ1AERaK9PAdj4C1oBQFI6e3iFIWuC01mfiDJZaqaaJnPNJ2AKSo3bGc+yuKNaUjbECIzdrJfdFagmMX02u7BEErUIhhZ5p22YL91KTckBcWOWOdNLHQF4sGK0vu50KULqQkJkkvYXO+aJ0Ax5Ct9FZ+ObnwHe8cjVJNbQBLgEr0fyYJsMzNd3qyxJWoBHp1uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxHsEELzCwYWrnVRNkiIZ+6UJ/at2tq2+kDYiPjBlXI=;
 b=YyU6axBWFWNL7HO2lJNXtgbjyikcPaHia3lqHBlzOvhjCELlRHBoU3wsVEtf16wZ11bNAMtBGjyWyAvZbVqr2lis5sldslt82OE/uAA218ScbjgJQHdWXD6C1nVhKPHmgzPWg1aDILt9PLayj2Zvte2VF4lDR/jz/pKRPqBZpPo=
Received: from PH8P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::35)
 by IA1PR10MB8211.namprd10.prod.outlook.com (2603:10b6:208:463::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 26 Mar
 2026 07:50:49 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:510:2d8:cafe::7e) by PH8P221CA0008.outlook.office365.com
 (2603:10b6:510:2d8::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Thu,
 26 Mar 2026 07:50:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 07:50:48 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 02:50:47 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 02:50:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 02:50:47 -0500
Received: from [172.24.233.101] (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q7ojoL1284964;
	Thu, 26 Mar 2026 02:50:45 -0500
Message-ID: <1d34d04c-3403-428a-bca6-c52ec26b8b2a@ti.com>
Date: Thu, 26 Mar 2026 13:20:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 2/3] onnx: fix 32-bit ARM build
 failure due to LONG_BIT mismatch
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
References: <20260326072653.1025506-1-p-deshmukh@ti.com>
 <20260326072653.1025506-3-p-deshmukh@ti.com>
 <b5ae415f-ba2b-477a-99b6-fc818faf46ea@ti.com>
Content-Language: en-US
From: Pratham Deshmukh <p-deshmukh@ti.com>
In-Reply-To: <b5ae415f-ba2b-477a-99b6-fc818faf46ea@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|IA1PR10MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: e60a3fc3-754d-41f3-cbed-08de8b0c652e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	SNnU4l9ZWkMCZ5I8p34R2SpKAsy4tOqoV0GNmf4jRMcqhAk8hC/TVyQOq9qVwzDTZdHeBS6AdJajmin6DT5vCIheltkbHtUBEF3zraqZw8QhrrRGO7eRMhsWRI8r0HtJtdsimNQtJIHt7yKR/6omdYfn9qfo1EMnf4oXrPfszcd4XW5lI746sbl4/P2cKwTApb4TvlYG4rDWIFIyU77aUTEjCfzIjpO2Nx3RyEOLL+dvhJsCGqPWsJDhX7w3pDDGtenMw4MmWBSpB/CBXtZ557fwGPKCRLqHa/7spEyU/XM39APiHKvOjsJRFrckARL80fHIt6BIASiqZk3bhhzsLtOXz6uPSvhzDYDC9oTsthGobswMZt4uk/0EhHtzx1vz9GFU9uuYwLY9urzRCvZVEgmEXfQBW0kHHMiDfIZIxxA14g2W+gAlmE2PA84lhYRbgFCyNFeGoSIgX4/G1Iw92nzZWsZ9K8OL/p+5Pn6uEqI62ns0YGBGxZiK+PIVXVYBWvXakhAELHTjBYwFWsjmyfUBIJFpJ5mo1zpkwqFbo51XEx4sbIpcxj2C/hxcbVuzHatVlkBc7+usSAkfNJjBC8qFPz5Rf5HD0EMvKPlGvIFreTiUv/nBl38U+XITa68A2QNjYTM/TDB1AKcAGgXS5cYyA5MlTqipkhaTU88XgNF6c2jKUJ3vmv+oraBJAnBTxSTYBV6BxCnkZhVaD3J52lp/FdMDiTYIDB1tNESadl0Ur0mu/DbJZlPZwuUatRL3FGS/i004bfXGxZslD8tHDA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	DfS7x2ObPfkSKpxBZvHsmYxGJbomQBkU/hZI8I0bsHyXgkqlDkK3WGcgHZRMC4RbiniRxmx2kEusVK0SMdExLOGy9l7l87ksEPFHV8ginXeZeq8wKNuJwq+8RiasT09P2Ux/5DK/EX0FRhwfhZyd/wAvT4Tlm07KUqBB27W0289ebp3Rqv6wESGx52VpfIeQlk9RrzpEKYxAfFepzqiZV7XHRUg8vKBxGS4QYCNDgIr4lwMx3WNC04ZCnQ7kGaNTnU74YVin+H6ebsrZIL8gUbYVf/gNI+JGhWg67ZgQxWHZLm6rq2WEu5Uj896Pa79ZoJXq+v1d3yGX68NNfbxjvfmZIBupekuuHZKpnR4G3LCCSaekzjGWbmcWlAjO3hMdOOtODlHcoN3QHLcUIsRc/6mAqJfEC/RcKS3+xsgXrVL+rYmGh8Ke4lvD9PD/jhOc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:50:48.5916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e60a3fc3-754d-41f3-cbed-08de8b0c652e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB8211
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Mar 2026 07:51:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17444


On 26/03/26 1:12 pm, Chirag Shilwant wrote:
>
> On 26/03/26 12:56, Pratham Deshmukh wrote:
>> Switch from python3native to python3targetconfig and update CMake
>> include paths to point to the target sysroot.
>
>
> I don't see the below happening in the patch diff,
>
> "update CMake include paths to point to the target sysroot"
>
>
> Chirag
>
This was to address the CMake definitions changes that I did while

testing. Those changes aren't required now but I missed to update

the commit message accordingly. I'll update this.

>
>
>>
>> The build was incorrectly pulling Python headers from the native
>> (x86_64) sysroot, leading to a "LONG_BIT definition appears wrong"
>> error when cross-compiling for 32-bit ARMv7. Using python3targetconfig
>> ensures the compiler uses the target's architecture-specific
>> configuration, making the recipe compatible with both the
>> architectures.
>>
>> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>> ---
>> Change Logs:
>> =C2=A0 - No Changes
>>
>> =C2=A0 meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb=20
>> b/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
>> index fc565dec..7d27119d 100644
>> --- a/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
>> +++ b/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
>> @@ -61,7 +61,7 @@ EXTRA_OECMAKE:append =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --log-level=3DVERBOSE \
>> =C2=A0 "
>> =C2=A0 -inherit python3native cmake
>> +inherit python3targetconfig cmake
>> =C2=A0 =C2=A0 python do_build_version_file() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 import os

