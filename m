Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A9DD46C16
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 02:39:33 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6732.1769654369187829818
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 18:39:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=HOxpJXFb;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.61, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyEAzOiMMErxlKmwXhPkMvYsBLr1mC3EKd801fGb0obQdlVjKFWX5dR+mp0SLAypq+RLnmXJttpSqF71v6J6kbf6NeEAPiudOJqRRXLXxpD+15AFOt75Ufu7/Pztylg5xoBlLKePFADSwRMf+O4i35g1ytpFpLj2Jw2s3I/KfRDScHdxw/1SK46K9Hc0k4B88lAV9+D6y5ZszYE3No1LtVvL4EPZAF7+5Ce8hAMO/zxfbKX4m66V1nYMJt7se6WP9Y1Sbnvbsn+++ijhSDyNuJJcOlHxfKA7Ija8KGLChk4m4Gkkmriej39rQj/rg5Vnl2EiAXGRhoPkFkcCSpvTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BK8Z+RAW4TberNniqhnWPRZtg2Mrw/KENLa+04zb5vM=;
 b=Aje92AVunEqxEwULzHqBcz3h68JRDYBt5Rr8ui2ATaPqo8vYTQhdXhOkjKRIXYv94VTACM9VusvDbwjHSwKYSx2/iESQOrnZm+TXfiqz6GCLvKZ2WOVYCXQUV4FW1CgdP8OlHM1Ypocif+AHNkFm2M0wqUz3eCa6wl/aMugARmUqoqgBFVvLmj5tgVKVBuCzhDfrSYvolcVPV4WzF1NBDciZLYNCqZ/spTnIquMSeB1FivX5f+YHsn1s+jMbFibw/7EhcLE01rtfa5uNw8n8a9/K6ejv+NWe5WLT40bZMX05RKsFum5CfKR6qkhOSRe9ko2G41aSOjUHslbZyFJ7uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BK8Z+RAW4TberNniqhnWPRZtg2Mrw/KENLa+04zb5vM=;
 b=HOxpJXFbthlOAxTBoSdXSke1RLK7B5rUmxC8r8HfiZLbVZZi6WKZUYU9F+vGpwtUPKO4/aNp2Gnz2XQJ/F2pAB7rST9Dhkzky2W3dg7ASP3q2W2wnYERfY/lyHWoXYDWZIVMu3kVBW/oQu7yR+JwSw5Pa2lzFZUwRENjiDbplA0=
Received: from BN9P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::16)
 by CYXPR10MB7973.namprd10.prod.outlook.com (2603:10b6:930:dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 02:39:24 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::65) by BN9P220CA0011.outlook.office365.com
 (2603:10b6:408:13e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Thu,
 29 Jan 2026 02:39:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 02:39:22 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 20:39:20 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 20:39:19 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 28 Jan 2026 20:39:19 -0600
Received: from [10.249.32.25] ([10.249.32.25])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60T2dJH12999730
	for <meta-arago@lists.yoctoproject.org>; Wed, 28 Jan 2026 20:39:19 -0600
Message-ID: <6de7de03-280a-4be5-99b0-31292b6508fb@ti.com>
Date: Wed, 28 Jan 2026 20:39:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <meta-arago@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
Subject: test
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|CYXPR10MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: bdb73924-9440-4368-50e9-08de5edf9c2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z2xiYnQxcW9DdGo1SXF1aDR4c05OTHN5dy81SkJ6YWZyY3E4bVI3YWFVQ3Ev?=
 =?utf-8?B?cEVqR0ZjeWhZVUJJQ3h0d3BpNG1uaWZKZGZldVlwRGV1UUNpeW8rN3R1MnRm?=
 =?utf-8?B?dWdoaDU0a1B4Wjl0c3NpRXJScGtiT2pkS21GQW5CT21CZmRWZWljVTZKa0pv?=
 =?utf-8?B?d1NTcG5QRlR1TU5qZExrK0dFMEpkT3I1U1Bta0g3ZW9WMUZia0xGWXMzS2gr?=
 =?utf-8?B?R1N4Vy9IZXdiM3F5bjdlYklIUHZEYzNOQ0t0S0pSSWxHNnRXRzlvdmZxKzFq?=
 =?utf-8?B?QnlMUW9IT0J2RUNIQWREcFZ0QitFWGtoRmh5RU1PeERwaUpQZTJqQ1JKTUhw?=
 =?utf-8?B?Tm9XT281Q0ZrRnpCUXpKUXBEbCt0T2lNK1p2eDVNUWI2eWM2VHNaWDIySWl2?=
 =?utf-8?B?emhmT0p4d3Bld2JTeVBhU0c2SmRPc2c3Wkk4L1lWL09WaTlVZ2pScTc1Wk5t?=
 =?utf-8?B?MnAwVGsyZTZwWkFIdG9xS1lqdDcvS254NUwyeFlEbkZqRlFMWllFWEtNbTl3?=
 =?utf-8?B?cUhUZWJOcENFL0gvQkYyZjhJVFJwTlQ3ZXRITkNWRVNMSHhESlg1YWhGWHN6?=
 =?utf-8?B?QUt4TWY1eUFpeUJnVnE1RjRRNjJjSHBTQWhHUnpiRnRnNzJMeGZzWTROUGZD?=
 =?utf-8?B?NDFVL3RQdEk2bGttcmtFQTdqbW16bGxKc1dKU2sxZ0pNQm1SM2dSVFZKOUVW?=
 =?utf-8?B?Z3hUSVR2WU44ZW5CVkttMVJPclZqSzN1TytsOFYzdkNJNkZKZ2Zydkx4NTVL?=
 =?utf-8?B?R2Z6VzhHWnovcXBYNERXa1BSSGhOaHR5dzUvRjRRK1VuSTJmVFFpMmoxUHJR?=
 =?utf-8?B?T1lBNDVvWnFZRm0zMTVzQWwrN0JuR2kwNEw1Wnd5ekpmVFRodWliQUNHU2Fn?=
 =?utf-8?B?NmRCcnBXUkdSUVBqVUpEN1BqcXYzR2p5ckhiK0l6eUplSkVMQmNhMjhpRng5?=
 =?utf-8?B?dkN6UFJhS0lQelZBc3gwQW4ySURkSFRpdHlGUkpDME03ZGhpUUtJV1RCTm5j?=
 =?utf-8?B?cVJXeGYweVEvbjBJV3JiYlVGekh3MVpFSzBweThWNGVodVp4Rldwb1VIVzFy?=
 =?utf-8?B?eG5aczVWbmNUZzdadDJqalhKVVpDZ0VtblY2SFB3bTZHb2tYM0o0emtKaGFk?=
 =?utf-8?B?VytYT0RTdndjMlJGaWloUVVFYmRCQlFhVXZhL2VwVDBFZnJaekpNQURUN0Zj?=
 =?utf-8?B?MVR1NU1uOXVEWGI1Y21IOEVhNVkwYTVveVAxMFhNVXkza2VSeGQrb1dwUmVD?=
 =?utf-8?B?VERNLzI4T2dpRVhEaHZYWGJTOXJzbzdhMjRNU1hOL0FSeWF2c05lOWcvU0Rs?=
 =?utf-8?B?d25lR21DLzRYci9XSjdmaU9IeFBsT0lDVEVTOVJHVUllN0JhUnp0K3JhUk56?=
 =?utf-8?B?V0RVWGtuNjZqUVlxcFhYTW1UOW9walYvbTI4MThoK0JWQUVuK01WcjBLcVNw?=
 =?utf-8?B?VlRzb3Q5bFQ5b1RxUTU2S2hINFNXcTNyQWhrWENQOENpTU93UVNUSmdlWDVS?=
 =?utf-8?B?UDJZdlNLdFdGajFERTViekVFVnZmT2gzWDFlQU5OZ3NlQXk3UHRMYVgzTkR1?=
 =?utf-8?B?ZTZCaGdqQy90ZmlmL2tWRUsyUjdHaVY4TjFkTk1yTlNYTU9vbEFsQ2FTbGlv?=
 =?utf-8?B?MkhLV2l6S3VEbHIvWFZKcnVzbWFmTGJEby9MTXQvbjdMKzBJeW9ZM3VEZWVn?=
 =?utf-8?B?WHB5V0QwOWg4dWRSU1NqL2hHRW8vSGVUSVdENEppSFBBNFpINU44Z2Qyc2R0?=
 =?utf-8?B?eXdDUjAvcnlSSWgyUGtsT1hveW4zUkRFVWdZM0NPalRXQjhyejJTOG83eE9C?=
 =?utf-8?B?VldRSW40QXdsTmVhU2sxck1HRUo2Zm9Iai9oVE9nak9oSndvTnZkQ0Z5MnFZ?=
 =?utf-8?B?S2JlNTJyNUFTOHBON3F4RUVTTThjWCtEVmFtNzBBa1FvaDBYYzhkaTBnM1Rs?=
 =?utf-8?B?WEFUREVUU1lkb0YrWHd5STZvRjNDa3puTWJGZzhYZ0dxbEhKNWR3aTF1dU1Y?=
 =?utf-8?B?ZDdySHc3WjN3RDlza21jeTVLNWszT01SamhZMG4xUThIUjZkVWR2VEM0b1I2?=
 =?utf-8?B?NURETkdkeXRuSGF1VnZJMW81WFZDbGpVV3plN3BSeGtaRDNXY3dteHlldlI0?=
 =?utf-8?B?OS92d0V2bnlUNlIvRTdmelNCMytKZXRyeFQzMTVTYTBsZjJlT0NINlI1U1dY?=
 =?utf-8?B?aG9Qd05kTVFYZDhzQ0JsNUFKTTBLT0ZZL2JuNys0bjhFdEhGRkFkWjdaRWdG?=
 =?utf-8?B?WnFCU2J1RDdQV3F3QkFod1VwM2x3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 02:39:22.2863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb73924-9440-4368-50e9-08de5edf9c2d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7973
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 29 Jan 2026 02:39:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17043


Testing connectivity with yocto lists...

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

