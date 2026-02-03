Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376C5E87852
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 17:52:27 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23107.1770141142404821195
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 09:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=VYxkeEWl;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.28, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EziIQKku/Aw9ZweEwqXcWkXDFl0evxOFQE3vu4oenDlgcOmlE1vyf7fVdLfJUwKVoTAxdT8GiuIF6TJ/UucSl/C9NIRWmjPiIaXocf4wVv0dblUmM9yBr4BizAKMO38W6dH0mNJ6LZzu3Snk2he6FDT9uv5dhcOkQDp02GC8TeiUCczboBWFICp6/SvZxd70WU6o+EOp7BQZHsqc1BjtuQsHI9IzKZPNrRPKr0SRLdB52AmN+VNJ/Xva4dA/bcU3hcLleXLNOtCk9FA0Wse6lhLBhS/7WKP+gGLHylMdub95ij0NhjXjHWPQMcGb/hTLLz1fHgetjvuL6qiNPHX68w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhBerpFvU7q3/ClAudDqEqvZWLkpiDi5hQ+eDfWP18g=;
 b=A/uNrzvcTfMXDsBZwFmurr1pmRmgwfOt/kUqAsX+YsiT/3UDDbaL5V8jJ77QKGKKF/R2SdT0Wy3AN6i7utE6MqhFomvp3Np8xTJp42+UnzY4+CQP5Gk433mzkHwxZB+NPIvZzuye+m+qZSzP9U71fuEZAltInSihbXBmKBGmG2Mg0IxnJrwfeSilIAG+ARSOgcaYG292svns7SpRa5EuaxmSmtWa+tDDHYccieRfbhzt97SYsp4HSM3LJW8UpVlCMhL+UaacWHhx0xX68IiXbOrLl7vDkgXNXd6TayHqXZmO0zNfgTDJicLa0nLkfccXN4DFewX5n6a8Bxf6qr+O2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhBerpFvU7q3/ClAudDqEqvZWLkpiDi5hQ+eDfWP18g=;
 b=VYxkeEWljeEq3Ya5HC+KRyrUkKnEMJfeBCxtpH1kSWj4EeXBrBWXx+AbQtD8213utEtbSUrWJGsd8nEdiQ0hLU7FExRpzJexXa+0h6Wuw62ItqEcQFHA5rtMPLBwYeWoG68Kq4+UkNNEs4nnPOVaplQeI27X5hd8bkFKZXncyDk=
Received: from CH0PR03CA0073.namprd03.prod.outlook.com (2603:10b6:610:cc::18)
 by SN7PR10MB6644.namprd10.prod.outlook.com (2603:10b6:806:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 17:52:19 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::fc) by CH0PR03CA0073.outlook.office365.com
 (2603:10b6:610:cc::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 17:52:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 17:52:17 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 11:51:57 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 11:51:57 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 11:51:57 -0600
Received: from [10.249.64.47] ([10.249.64.47])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 613HpvQ33916898;
	Tue, 3 Feb 2026 11:51:57 -0600
Message-ID: <754f3be0-30ec-4d9d-b57b-b3f264243271@ti.com>
Date: Tue, 3 Feb 2026 11:51:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] FIXME: systemd: Remove new OSC prompt
 feature
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20251219172103.363206-1-reatmon@ti.com>
 <20260203165304.GW11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260203165304.GW11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|SN7PR10MB6644:EE_
X-MS-Office365-Filtering-Correlation-Id: 8296797d-211a-4a36-ef50-08de634cf892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U01jb3B2MitSTy9ncFNMbEtKaURQaGpCVkN3OThLUlRwSEhReHl4ajVUMTgw?=
 =?utf-8?B?eFBURkpYOThPQWEyZ1pEVDNuNzZDVUFGMll1TGJaOWFIMjQvcHl3eUd1bkZT?=
 =?utf-8?B?ZktFZDlPdktEblc0S0JsejlsWWdIbEh3Wk9QckJuaWZRWGhKRHEwTFZxRUd2?=
 =?utf-8?B?MGN1blZhSStxRVVQMFRVb2RPbGtoQWlBbUxvR3kzd3dZZVh3cVhEdVlRMlE0?=
 =?utf-8?B?c1JDZmVSN2RsY3B2R0Vyb0ZFNm8xNStVelFRVDRLNng5V01KeVJWVmFVbTRh?=
 =?utf-8?B?em9Dc3V1UVFITUNhNmRhV0ZQNXBHRnR4Wk5DY1k1cGtTMzRkVVFqZWpNdGx5?=
 =?utf-8?B?czdPNVFPSXlhN2diRkNTZ1ZKQmJSazVQRmRhY3FHaWZ1SCt1TkRWQnlNaUJG?=
 =?utf-8?B?RmJ0RnNhMVc4NmxhU2phd3JtK1pvc0hXMS9XWUZCcjFVT01YNnJXMCsvMEJa?=
 =?utf-8?B?Ry9MbHJKanBad0kyS2xwYWhOeWVnQXNOd25wWURXS09PbFliU1p1U2hvSlhI?=
 =?utf-8?B?bS9JVElrYnBUSzlaOFJKeUhWbjBBSGY5cVZvdHVDZ1R1M3FJSEhwbm5MKzVM?=
 =?utf-8?B?RWxYZmdjZDNGMEZoYVVZd21MeEZKL21tVG5EQVpEQUJDWHI5bUpBaVJIT1RY?=
 =?utf-8?B?QjFEMlV1c3JTOEVEWG5XVmtSUGltOHdoSmlKVHYvc0w1bXhYMWh4MXp0bWhF?=
 =?utf-8?B?V29pUTRia1ZPMXZEdmlQWnNLUENHcnFjY1ZpemVPcklVMFZIekFJakFvS0p4?=
 =?utf-8?B?RmVYd1VnMFJwNXRUSDhSRUpQNzZTRXdEZUpiN2dsM0RITVU3OGRTSjFJRmdn?=
 =?utf-8?B?UXdRT25vWkNKRFZkUjVpZEtSbWFzRzR2NHRhWi9ETlBodmJPZDh2K1dpajhM?=
 =?utf-8?B?bVI0TTlzSWp2MG56M1k4Umt2bWJpYXpxUStPRCs4ZExQVCtKS0dLSUwxUUpM?=
 =?utf-8?B?UllkVGZEejVBeVJGZ1BrZ0k3Nmc3QVh4UXRLRnRWZG5jd2FxeXdtQzFrQVhv?=
 =?utf-8?B?eDRJdDZDYmxWOFI5bkg1ZE9sT3pLUWNudHdtNUpITlBFTjJiWTNUaVI5N1J3?=
 =?utf-8?B?KzFBbWEvSGZKTzFwcE9oS3VEYmlhT2JlaWlrL3BRWXZRejgvK3hIdzErQnBI?=
 =?utf-8?B?OGYvQzE0SHlYbzl1TjE0MXEyZXNzaG90Q2NMZVBpQ0dORUR5SW5wM3NKRjAv?=
 =?utf-8?B?VTFway90TERqcWRIYkJPbEpGM1kzU3ZVYzQ1L2ZHRjNNSEd4RENNNEUwZlZJ?=
 =?utf-8?B?RGVoZDZLODBZVmdGQnFDOFRQbHlRSVhpR29OWWhaVXdtdTA3SjNoRG5TSzE0?=
 =?utf-8?B?ZWZvTnphZmpLT1pLQnhLUnBqdXR1N3FOR1EyK0lVK2JIVlYwT08rKzM0Vi9R?=
 =?utf-8?B?M3NvUytYNlJSK05GU21wNnFQUDNTTW5ZMlJ5RlptbnhHMUpwQzhDTkdlRjll?=
 =?utf-8?B?RERPZ2liUnF2V1BHdzQxUktmNldIQ2pJOG1UQmladFFNRmFKaVVUNnBLSE1W?=
 =?utf-8?B?MkFaUFkxamc0Z1F2ZmZSbUNETk9rZHIySit5MllUb2NuclJzcEFRcE1MMXg1?=
 =?utf-8?B?RXQrSFozbnRpckE5RUNZaUxZRS9ubzFTTEFadjNDMEQxaTBYWVRqV0Zlb29p?=
 =?utf-8?B?WW5sdUx0b2VBem9sYmVkZU10b2RiTnQ4TDVLZjhXU04waGtxQU0wTFV0Vm5Y?=
 =?utf-8?B?QTQ0YzZ4S3RXd3dhSHZIbzhxYU5XU0xGOHVucXluYUp5Tm1rNlV2NzcvWmVi?=
 =?utf-8?B?WFdBVjlQekRLNWhJenppaWxFL2NPRkFrNTFpVG5aVytuSTZUKzByRlZ4UWpo?=
 =?utf-8?B?SU5KYWlGWjUwVFU4ZDl3ZlBMdVBwUWRtcml4NGsyQ3dSZ3k3VW1Db0cwa3d1?=
 =?utf-8?B?azFUaVFmbzhxYlJQakQ4TWRzZDhNSEtQQ0FlQUlDckJSbkwrZThaL2IwUnNQ?=
 =?utf-8?B?TTkydmVDNTRKeTVzYkNUWTlzWm9jV2dRQzhDU21Ua0ppL2pEYVRraGxJRG54?=
 =?utf-8?B?MXNrdU1DYnUrMWlMT3I4aU9TNGcwV3g2UCtKV3MzMzNwWDUvMXhyRGhEU3Vr?=
 =?utf-8?B?SmFsZ1QwS3k1aWFYeG1EL1ZpZWhkZG9ZZ3dzRnRiN2NtZXMzVzdGbkU5UFQv?=
 =?utf-8?B?OHJjcXIzMjRsYXpWcXVlQmRMYmJ6VUF4ckRIeGZFNVNXcWRKWC93RERPZTRO?=
 =?utf-8?B?c0Nxd1RmM04wcE5mVENYeExJR0o2Y3ZMZTNjMFRUV2gxVXg0RUJ6bTQ1MTlu?=
 =?utf-8?B?WFEvaGt0dmdxNTg4MW1EN21COWF3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	A6o7uzCvdApG6Sl2Fb99HgBT8sDNMxlscreuuLpSASf1kPj/j0r0Ktlc78bqfusiZ+cFxa2DMxPDtfFHA0PikOpqj285E8ERJCZfdIreglwDWTSTx7lOCiuhu0S0X5KzDW0H8v1LiuINtkXRv3t7diRdv/aAWGD0vSLfR4CK+z5GY4blOZuVujbgj2tfiYOZ6X7pIUqSNIOagnJ/e1riu9liR4KUD/64yaCdZouSHFwPMwYVgQCdTbcsOVQotHaSwcCRUwgtdIOHV+FX6YrflMukqfxuXag6S944tZPGZqXjGaLekFMtfTw+xV9lw4y7Egj9EeXslvsWq35mbvU5a3MigOKJiKmQjo+jw18aitpTNu0y1YC1wR77QINVf/y/kUOekbxc4FRuEYc3VuF3biMKL42NintKwYVeHFGgFNhcFyIULPsULnNsEMQY/y8e
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:52:17.1300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8296797d-211a-4a36-ef50-08de634cf892
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6644
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Feb 2026 17:52:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17068


Yeah.  I've been watching it in the review meetings to see if/when it 
ever gets accepted.


On 2/3/2026 10:53 AM, Denys Dmytriyenko wrote:
> BTW, there was a patch that now sits in master-next to control this with a
> PACKAGECONFIG:
> 
> https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=0d7575d32a7b14762d80b1c09db4065ff247a903
> 
> 
> On Fri, Dec 19, 2025 at 11:21:03AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Our testing flow is blocked because of the OSC prompt code that was
>> added to systemd 258.1.  This feature seeks to put a lot more extra
>> information on the prompt using escape sequences, but it is conflicting
>> with our board setup in some way.  All of the escaped sequences are
>> being printed at the prompt which makes our testing detection code
>> fail.
>>
>> We need to get this fixed in the long run, but we also need to be able
>> to pass CICD in the meantime.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-arago-distro/recipes-core/systemd/systemd-arago.inc | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd-arago.inc b/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
>> index 6e5baef7..3c31b92d 100644
>> --- a/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
>> +++ b/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
>> @@ -27,4 +27,9 @@ do_install:append() {
>>   
>>       install -d ${D}${sysconfdir}/systemd/
>>       install -m 0644 ${UNPACKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
>> +
>> +    # Remove new prompt code that is polluting the testing output
>> +    rm ${D}/${nonarch_libdir}/tmpfiles.d/20-systemd-osc-context.conf
>> +    rm ${D}/${nonarch_libdir}/systemd/profile.d/80-systemd-osc-context.sh
>> +    rm ${D}/${sysconfdir}/profile.d/80-systemd-osc-context.sh
>>   }
>> -- 
>> 2.43.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

