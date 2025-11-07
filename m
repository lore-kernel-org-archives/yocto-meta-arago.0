Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D98CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 17:30:54 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4822.1762536644807493004
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 09:30:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=sXGMrO2R;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.22, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2b2jgKxkPUT5uV9WhO3n8xATXv1iXhNB0K4xIk6MQwx66vHGyXB+bjFsbmStaCFO4gcR9Z+n72OJFxrfs9ppEXUIzMr4maMdQU5nDbErVursFIe0MdKtBZppT+e705soayZ+sH3ZnraybHd8W9EZROGC4uqCdkh3YmVT3qrz15uqqLm3ygDHMm22rLwpYAP+CxklPpJbml2hoMO7oNPdyly9Wt1FizUoOYXI26FA8a5gda9fgjIvm8EqOh2jbT9Zus8Z08IlP5Lyn2r+7bT/wDUYijaHQH7sqUxvxX4wJIELUT0wtfjvVM5mzO+hLbhq3vV9bJSU9fC9TT47ysC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWbiFtPHMMWJAfvO3z8cyt/LLfCY0WWZOe0s/XIznaU=;
 b=A94yJnFgQ/PnsXWeKWSPitXsAvqzdvKulTym4NSt9oewir77ZPETlqomTmPyhb8+wgfhhiWlbkMmIvkSBDV6qj2bkdFe5DavKjrmxWOa08jfyFUGa7CZQixihQggsYFm20PbEv5sF4zXkoguembDGuwH2C+8iZLJSzvuOOCMvBuNu9iSyPU/hWR9mLDfGoj7twakmLUeoNIO4G/RV+EN0/eAujM8JhS6/I8m01ta8BeTkzQhYma7IlOsQCb2liEHXOvKYuekU7QdHbgzwl+xJ4K5rs/aoruImCFBnpqa16ky0zIcxy+66geEZaPH+A9NRNuUnMqXN5kU0CROtT6FSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWbiFtPHMMWJAfvO3z8cyt/LLfCY0WWZOe0s/XIznaU=;
 b=sXGMrO2R9lrOJdN0f64gEUvagEKsvUH+8zSbvDvwMn1z1y993QxVP1ULXjStAI3K8nl/5qUA+RaUzWFJmn7nCt511OkInDkmaJTz4f6a3LWr8u1/o4ip9t3XaQQGSV+sg5CzKhufS6hh5SE0YAoU3WTFQNJ8Hn7KxVQF9WWJMcQ=
Received: from BN9PR03CA0096.namprd03.prod.outlook.com (2603:10b6:408:fd::11)
 by IA4PR10MB8400.namprd10.prod.outlook.com (2603:10b6:208:567::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 17:30:41 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:408:fd:cafe::ef) by BN9PR03CA0096.outlook.office365.com
 (2603:10b6:408:fd::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.10 via Frontend Transport; Fri,
 7 Nov 2025 17:30:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Fri, 7 Nov 2025 17:30:39 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 11:30:36 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 11:30:36 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 11:30:36 -0600
Received: from [10.249.33.213] ([10.249.33.213])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7HUa193361351;
	Fri, 7 Nov 2025 11:30:36 -0600
Message-ID: <742219a4-d09a-4bfb-9bd4-1fad263466f5@ti.com>
Date: Fri, 7 Nov 2025 11:30:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] cpuloadgen: Remove this utility
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20251107172409.1248314-1-afd@ti.com>
 <20251107172513.42431-1-prc@list.ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251107172513.42431-1-prc@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|IA4PR10MB8400:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a4226b-ee5e-4cf9-d0a9-08de1e235ebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QVVnRmpIV1FucU9zL2VwbGFVTTUzTWE0QjhjWkJyUzlpWnhwRGtBekhwUFlM?=
 =?utf-8?B?UHVCcmlMUUs4L2NDR0ZvSnNnb3AxRkk2b0JwK1RYZDVDMWx6TjhMa0pmVFJX?=
 =?utf-8?B?Q3RNVHRHYUdNZUpaVGdNN1l3dXAxVTlRbnVMSit5OWJFQ2RKMmlVbHdrOEk0?=
 =?utf-8?B?Qy9BenNNL24zRUJ4NGRJZzhuZlR2T1ZFRFRBM2dEYTE2WGtiMDdNU0NaY1Az?=
 =?utf-8?B?aW94NDJreG1Kd0RQTzh2aXAzakgrdVQyZFRRdC9iWXJQY2JySWVNYjhRbkhN?=
 =?utf-8?B?SUQwUk5kY1c5NTllcC9GMmduaWwxZ1ROeUF2SDVoNnh0MDZMczNvalVoUTY3?=
 =?utf-8?B?ODNjUlY4clVpOFZnTlcxbmpxRTNjdDh0MldobU5jeWNleTRkUUhCM0NHQVpC?=
 =?utf-8?B?K0VBTFYrZ1VTenI2U2xrZm1jcE5wOTFtcXJkUUtjK0tWQStTb2VTU3VTVkFt?=
 =?utf-8?B?MlMzNmpnVnRkY2h5b3ZJRExqRFp0QTlMTm5DSzkvZ1M4eGIwY21TZERTOXVt?=
 =?utf-8?B?ZU9Rd0FuOGtDbytZYXlOWm5xSmpRWVYwRGU5NE5uRDhXS2V4ZittREFibGdP?=
 =?utf-8?B?di9RTndhMnZPdGxIZ2xqTUU4c2lMM3F2YjV0QnlyN2pocGk2eTBhTTJ4WVgy?=
 =?utf-8?B?TXhSYkRQeWhKRmMwQ3BuT0VlZmdtdjBUT2s0cW5sTng5U1pINVV0aTE3Qk9W?=
 =?utf-8?B?U29INjNFbVNKNUxLTHorcTlrTFd2cW9ZSEl1dG5LSzRUSmJXdGJsREF2YUJl?=
 =?utf-8?B?ejhuU1hjUDUwYVR2U2RXaDlxV2o0aTFKVDRUK2lyZnVEUkgvOWxrMWFYb0N5?=
 =?utf-8?B?ZTMxckRqeHEyRjNZNGU4SmR2SSs5em9QVU5hMjNSZzR6SExzU2NmRDBJMkZv?=
 =?utf-8?B?eTBpYmljYXZCK3dGL2duK1ZQKzR4OWFCWXUvOWhxazR4SzJpeUM3NUhJU3dH?=
 =?utf-8?B?c2EwdGp0U3A2bEZ5TjJtYjFEYkxTTzFrRHAvaXhDVXBteGNIaGF5bHhZZm5W?=
 =?utf-8?B?WWg4dnY1RkhLZ21FUHpkOWJ6ejgzSUo5VjBlcy80NGlUS2dVd1g1cldhc0Q4?=
 =?utf-8?B?UC9aQjlJMjBjUG1nZElFVnU5Y1RCMkFLMFZMV1htSWRGd3BZcS8xd1pWQkZw?=
 =?utf-8?B?ZTFlUzViYTRzNUljYlR6eFJ2ZTcvRHJCREwwQ1A0eXh1ejYwU0tWeDhOSlhX?=
 =?utf-8?B?cVRZYkxkNktxdW1TKzVoR0xMUU93NWNRZXA3SnFqNTFaYjFoWU55WUR4THNW?=
 =?utf-8?B?M2ZyOFZaTFE0Y1BUYVpETU9MbC9xL3ZyRWIwN0dpVWdHdzlZME51NjVmampN?=
 =?utf-8?B?Sk1UdEZnRnpyYzlLSW0rSVViTFFJeXNxb1dZK1BqSTdwazc3RjFUd01xRkRK?=
 =?utf-8?B?Y1BFYzZFUEVrcGJMdW5BOThpYmRWRFByWWtLL282R01sU1JGTmVTWlUyOXJL?=
 =?utf-8?B?bnpIdllWR3lmZzhCTDE3SzFFNFQ3N2dlOWVzbUZWYllzV0FmejhZVk9aSFVv?=
 =?utf-8?B?WUtrK2VEcE1RZytpV1YvZDRWUVN1TnJ2TTZ4alNqdGFtVFlQZ0tjeTNvLyt1?=
 =?utf-8?B?MlovM3psM2tYdFV4UlpFMHJPYVdKdzU2cWdPOGhBeTE3VmtHZXZUcTRpbHcy?=
 =?utf-8?B?akpSRmE2U3JHbm4ydytJMVVBUVUxK3dDSXBZcEtXL0I1eG1iL3RCcHA5aFRP?=
 =?utf-8?B?YUlMMmI1RXdEa1B2NXovUjYvRGxGTmMrVVRqdW10ODNNaWxYQXVtdkR3UUZa?=
 =?utf-8?B?L0R3d0xFYlljbEp6dUFTYzUzRGtmcDlUSTBMTHJNUlZVR3lVMVYxcGFyc0gx?=
 =?utf-8?B?NE4zUmplUUMxTUlHbmJFYTJ6ZUJ0R1hkcFltYWU0aWswZm0vOVk2enhtWDNU?=
 =?utf-8?B?YnFxY1RIZDJYRVI5d0ZlK0FYL05wb2Y3UVBiNGRlUGJiKzNWVVhGSXUwdU5x?=
 =?utf-8?B?N2lJdlBNZ3dSdFFiQUVCNFRLc095YTErdGdrMjZickI0WkJIMFcxOWU0aitj?=
 =?utf-8?B?RkZvZnk4QllObER1TGp3VnBMclVFS0YrNnhXOWxSRVpBSGFXa1VXSm1rVWV6?=
 =?utf-8?Q?QW52hr?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:30:39.4151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a4226b-ee5e-4cf9-d0a9-08de1e235ebd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8400
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Nov 2025 17:30:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16730


Ignore this.  I need to tweak the check to allow for removal of the 
entire file.


On 11/7/2025 11:25 AM, PRC Automation wrote:
> meta-arago / na / 20251107172409.1248314-1-afd
> 
> PRC Results: FAIL
> 
> =========================================================
>    check-yocto-patches: FAIL
> =========================================================
> Patches
> ----------------------------------------
> FAIL - [meta-arago][master][PATCH] cpuloadgen: Remove this utility
>      ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-UPDATE-1)
>          patch
> 
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

