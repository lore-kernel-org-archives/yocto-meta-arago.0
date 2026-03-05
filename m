Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B8EF47CB0
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 18:31:27 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51491.1772735477116292832
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 10:31:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=eMqUeq+g;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.61, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egyqQG506zXQzAkiDeWtJiA8lIoBhV2Xv+Ck9rM/yNl2sD09Mh425nZnrdCVf3gbgImajHSEYM5XP2xeOlwvpqcDiC0i2JpY5IyFDFyNXJcK6CRwuqSDsHYU3jr9XhXNTBeSavr5UB65Xdvttt0xaGtC69n71RGLBAeCDTogBRDfpHljH4m7lT1MX6fP8+JbsIkkL2+6v/BysVQ/PiCsylOnIh5pbv/zwRlK2VVVaOEn1uUaqOpNrpX+te14zjh3hq9E39waRHgjRmCFQD7OTiqZxxxMJ1Y4O+ZcTx1WaQHLmhV2PvaRxzrPMP8iGSxsyB/RZ+LXGg19pmSTZxis+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HaewlTIGNnj/kFEX1xkPmPV1SH7NsZ7FgOaX0kRIKY=;
 b=qrmQIwnsz191EjtNz84rCh/INIHFl6WS+y+WM/zsC6FZKSxlxzRzbkttaGiJ5KosNb/kja5DRJN/xNaH5Yo/j7e1EjoxYgeC7GLGe8fm5ISukOHfLOxP8FrWJxwRQlGcQTyiun7SilyBTW30xYTtVYeW0BwGQ7cUSzv07/ndyyih0Z5QzKdEbzH3SD49MC+MSNEvvVT2YS0ie45iU/JMjOrjwzvro5u3zYRjqHzGFPLK3pzcXEbrvPpBy4qceyZnW9zssdkxCYbIh4gk+/zxuc2jLk7y4HOMbRwadNbQ42JvlgXYtv5+araChpP2a8ZZ0IdPuEVBDGPl2wGLfhxXNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HaewlTIGNnj/kFEX1xkPmPV1SH7NsZ7FgOaX0kRIKY=;
 b=eMqUeq+gfXOHrAg4Qh1H5JkKzaJ+kVdGcwMVCCmEGSi5qJL9snKRo/HVCPc6vEV5ALsqY6uYdUl8OrbOXZivysfoGnXqetkXl+TTOD04EekLIbI7ASIZE2uj0yo5ip+myWPMz+dX/lyUkdQ/6jOYzBq7pxN/AjlI3KMXMfqA0G0=
Received: from SJ0PR05CA0181.namprd05.prod.outlook.com (2603:10b6:a03:330::6)
 by DM6PR10MB4138.namprd10.prod.outlook.com (2603:10b6:5:218::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 18:31:12 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:330:cafe::12) by SJ0PR05CA0181.outlook.office365.com
 (2603:10b6:a03:330::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Thu,
 5 Mar 2026 18:31:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 18:31:12 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 12:31:09 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 12:31:09 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 12:31:09 -0600
Received: from [172.24.233.101] (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625IV6go2840206;
	Thu, 5 Mar 2026 12:31:07 -0600
Content-Type: multipart/alternative;
	boundary="------------4N7eeej25XvCP005O7E9TZCw"
Message-ID: <62c09add-4c40-46c1-b7bb-4fcefea6edbc@ti.com>
Date: Fri, 6 Mar 2026 00:01:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 1/4] arm-compute-library: upgrade
 24.12 -> 52.07
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
References: <20260305173419.1735480-1-p-deshmukh@ti.com>
 <20260305173419.1735480-2-p-deshmukh@ti.com>
 <5b1800bf-669f-4a66-9d2a-c07be1fa0036@ti.com>
Content-Language: en-US
From: Pratham Deshmukh <p-deshmukh@ti.com>
In-Reply-To: <5b1800bf-669f-4a66-9d2a-c07be1fa0036@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|DM6PR10MB4138:EE_
X-MS-Office365-Filtering-Correlation-Id: 225495c6-41c4-4cc2-602c-08de7ae560c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|34020700016|376014|36860700016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	DpnmNp4x6T4bzehMmHBah113kuxO5/EpdlWlCPUhsjCQDPBTk9ZjgDQinb/7fB5aBSGMjgGDiIRFPcTOpXDgUGIaPwk4XuNmYKS3Fl8xgqCxzDtKN9Tdnc6a61s+gafysbn57rqvFLI8V5ayt2pn+05LWU18Lm6jgsLQQ82/jdWeVJJoaUhoe88ltdPLZQ7iO78t77T0XogY4cU0ryRAKlH0pShZTmQPGhQTzQzKFiTqXTd39bjp69ysVedTsUaVK4P4OEWCm9y4TMR91oej0s7jASoSi92rAUTPSeC1MCq7pr/3CLpReF2bS+5xWl5IlkuI60uNJH9JqSxNZ2JQk7LYEX6hMfmEJSO2Mw61hn8ecFvCmRI7w0wdoHewvi3klUUMgdYiNXTpgmzKVXu2mySouV3Oij5gVY7vFaBTnd4Jk53uDoXa0LFafxe4GpHIvsr+IzfaPlk309kb00XtNrxLn8W4ssYzBU7e08tPavs3BGca6twGTy+zgwJiU7W2ZFrcBA4OlZ06yFrlXdLwz/85qw0sVoxyZlTD/B6uTrmzmFHz5U+gcgFFCatvwjVjcF1Uid3spCqXxoXURb7M2l0f1DYJKaW9JvlUJA+ouxXNw6j4XEMctWvDc0XqBcZNBTRwRt4QrDY4zztnJUBIOssdrA48Yb44Cwoas3o6WrIqQCNqUbw9G/XDUXD7IQnmd/Bw3GO42K7W0KLQxPTPlhozlVCMFIByfJxwwjkBlCvapKtHAEO4ln+sxVvJA5Anv/K/uDlOXf7+hvBlRBCtow==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(376014)(36860700016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vhQOFAQZn41nBdLDLtKcRDewJcKKZNEN9zh1EZE5eGzXOp7EA8pqo8wG5l17Sj5mcTNSEV0KFewGIP9y9hv5mOHYo0zgGGc1n8+qml1MIPA1O89QRQqs3/zp7NoAT5rmrvdpnRXUTwMAWss0av6fBmGpixPW3fVTxCHPmOiZSu+2mOER7IF0e2bh2mXRHQMBsphYUqQU8DqJUbcdD3qZpBaaMOsCH2H4F80ZoQv338BcbRjdP81HbkInbrcHiULdWtkBCX4VfgXdTzZsiuC6byH+8BL0v9geD5eJhSjj+0XLww7uTtDrrscKm5g4kj/yd0FsJQX/D/E73I+U4PGSfcaAbz97pjYTpcbkD6nfMFXNtSGSs+l2Q+twyyTrkTiDF3/io4ezgCvHDZugg+7L32XIJipTvmoUOjqzaV0F/JhG+5PS2uUmmuE1Ekh+XM94
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 18:31:12.1214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 225495c6-41c4-4cc2-602c-08de7ae560c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4138
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 18:31:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17255

--------------4N7eeej25XvCP005O7E9TZCw
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 05/03/26 11:50 pm, Andrew Davis wrote:
> On 3/5/26 11:34 AM, Pratham Deshmukh wrote:
>> We are migrating ARM Compute Library from v24.12 to the
>> latest version v52.07
>>
>> Removed Patches:
>>   • 0001-fix-Fix-indention-in-cmake-generator-script.patch
>>     - Upstream Link: 
>> https://github.com/ARM-software/ComputeLibrary/commit/e0c42ef651709fd284da3bedd2c98d420bd6fd1a
>>   • 0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
>>     - No need for this patch for v52.07 ACL.
>>
>> Rebased Patches:
>>   • Following patches are updated with new commits
>>     - 0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
>>     - 0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
>>     - 0004-Add-source-files-at-library-definition-time.patch
>>     - 0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
>>     - 0007-Allow-ARMv7-builds-using-CMake.patch
>>     - 0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch
>>
>> License-Update: Updated LIC_FILES_CHKSUM for MIT.txt, just checksum 
>> update due to minor
>> formatting/year changes in the license file for version v52.07.
>>
>> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>> ---
>> Change Logs:
>>
>> v1 -> v2:
>>   - Fixed arm-compute-library recipe name
>>   - Fixed tabs/spacing issues
>>
>>   ...NABLE_NEON-in-code-for-checking-NEO.patch} |  72 ++---
>>   ...-indention-in-cmake-generator-script.patch | 130 ---------
>>   ...ENABLE_SVE-in-code-for-checking-SVE.patch} | 117 ++++-----
>>   ...ce-files-at-library-definition-time.patch} | 246 ++++++++++--------
>>   .../0004-Allow-ARMv7-builds-using-CMake.patch | 174 +++++++++++++
>>   ...ptions-for-SVE-SVE2-and-BF16-support.patch | 112 --------
>>   ...mbol-error-when-building-TensorInfo.patch} |  24 +-
>>   ...SVE2-support-to-be-disabled-in-CMake.patch |  91 -------
>>   .../0006-Remove-TARGET-dependency.patch       |  58 +++++
>>   .../0007-Allow-ARMv7-builds-using-CMake.patch |  86 ------
>>   ...rate-generic-library-name-instead-of.patch |  33 +++
>>   .../0008-Add-FP16-source-path.patch           |  28 ++
>>   ...24.12.bb => arm-compute-library_52.7.0.bb} |  56 ++--
>>   13 files changed, 551 insertions(+), 676 deletions(-)
>>   rename 
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/{0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch 
>> => 0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch} 
>> (58%)
>>   delete mode 100644 
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0001-fix-Fix-indention-in-cmake-generator-script.patch
>>   rename 
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/{0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch 
>> => 0002-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE.patch} (67%)
>>   rename 
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/{0004-Add-source-files-at-library-definition-time.patch 
>> => 0003-Add-source-files-at-library-definition-time.patch} (24%)
>>   create mode 100644 
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0004-Allow-ARMv7-builds-using-CMake.patch
>>   delete mode 100644 
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
>>   rename 
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/{0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch 
>> => 0005-Fix-undefined-symbol-error-when-building-TensorInfo.patch} (68%)
>>   delete mode 100644 
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
>>   create mode 100644 
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0006-Remove-TARGET-dependency.patch
>>   delete mode 100644 
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0007-Allow-ARMv7-builds-using-CMake.patch
>>   create mode 100644 
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0007-cmake-Generate-generic-library-name-instead-of.patch
>>   create mode 100644 
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0008-Add-FP16-source-path.patch
>>   rename 
>> meta-arago-extras/recipes-devtools/arm-compute-library/{arm-compute-library_24.12.bb 
>> => arm-compute-library_52.7.0.bb} (58%)
>>
>> diff --git 
>> a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch 
>> b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch 
>>
>> similarity index 58%
>> rename from 
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
>> rename to 
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
>> index 1c33ac3c..b7dfa7b2 100644
>> --- 
>> a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
>> +++ 
>> b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
>> @@ -1,7 +1,8 @@
>> -From 4350c56d14b7b68acd060d8331f3ade1fb74e167 Mon Sep 17 00:00:00 2001
>> -From: Andrew Davis <afd@ti.com>
>> -Date: Thu, 5 Dec 2024 09:21:23 -0600
>> -Subject: [PATCH] Use ARM_COMPUTE_ENABLE_NEON in code for checking 
>> NEON support
>> +From 6902148626781de2b4a2aec2c00fb6a13328209c Mon Sep 17 00:00:00 2001
>> +From: Pratham Deshmukh <p-deshmukh@ti.com>
>> +Date: Wed, 4 Mar 2026 15:24:41 +0530
>> +Subject: [PATCH 1/8] Use ARM_COMPUTE_ENABLE_NEON in code for 
>> checking NEON
>> + support
>>     ENABLE_NEON is a flag used by the build systems. The flag is not 
>> used
>>   in code, instead ARM_COMPUTE_ENABLE_NEON is used everywhere.
>> @@ -11,19 +12,17 @@ use in code.
>>     Upstream-Status: Pending
>>   -Signed-off-by: Andrew Davis <afd@ti.com>
>> -Change-Id: I65f5e7411c99280e2dd8c187140909cefd1c6892
>> +Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>
> You take the signoff line and authorship for yourself, even in
> patches that you made little change to other than what was needed
> for rebasing them.
>
> Maybe some tools you are using are doing that automatically, but
> some might take issue with claiming their work as your own. I don't
> really care too much in this case, but under one condition: you
> should work these upstream so we don't have to carry them here in
> Arago for next LTS.
>
> Andrew
>

Hi Andrew,
Thank you for pointing this out. I sincerely apologize for the oversight;
I am still learning the nuances of patch authorship and attribution, and
it certainly wasn't my intention to claim your work as my own. I was simply
focused on getting the rebase working and wasn't aware of the protocol for
maintaining the original "From" line.

I will update the series to ensure you are credited as the author for 
these patches,
and I'll include my sign-off below yours.

I’ll take the lead on pushing these upstream so they don't have to be 
carried in
Arago indefinitely.

Pratham
--------------4N7eeej25XvCP005O7E9TZCw
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 05/03/26 11:50 pm, Andrew Davis
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5b1800bf-669f-4a66-9d2a-c07be1fa0036@ti.com">On 3/5/26
      11:34 AM, Pratham Deshmukh wrote:
      <br>
      <blockquote type="cite">We are migrating ARM Compute Library from
        v24.12 to the
        <br>
        latest version v52.07
        <br>
        <br>
        Removed Patches:
        <br>
          • 0001-fix-Fix-indention-in-cmake-generator-script.patch
        <br>
            - Upstream Link:
<a class="moz-txt-link-freetext" href="https://github.com/ARM-software/ComputeLibrary/commit/e0c42ef651709fd284da3bedd2c98d420bd6fd1a">https://github.com/ARM-software/ComputeLibrary/commit/e0c42ef651709fd284da3bedd2c98d420bd6fd1a</a><br>
          • 0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
        <br>
            - No need for this patch for v52.07 ACL.
        <br>
        <br>
        Rebased Patches:
        <br>
          • Following patches are updated with new commits
        <br>
            -
        0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
        <br>
            -
        0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
        <br>
            - 0004-Add-source-files-at-library-definition-time.patch
        <br>
            -
        0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
        <br>
            - 0007-Allow-ARMv7-builds-using-CMake.patch
        <br>
            -
        0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch
        <br>
        <br>
        License-Update: Updated LIC_FILES_CHKSUM for MIT.txt, just
        checksum update due to minor
        <br>
        formatting/year changes in the license file for version v52.07.
        <br>
        <br>
        Signed-off-by: Pratham Deshmukh <a class="moz-txt-link-rfc2396E" href="mailto:p-deshmukh@ti.com">&lt;p-deshmukh@ti.com&gt;</a>
        <br>
        ---
        <br>
        Change Logs:
        <br>
        <br>
        v1 -&gt; v2:
        <br>
          - Fixed arm-compute-library recipe name
        <br>
          - Fixed tabs/spacing issues
        <br>
        <br>
          ...NABLE_NEON-in-code-for-checking-NEO.patch} |  72 ++---
        <br>
          ...-indention-in-cmake-generator-script.patch | 130 ---------
        <br>
          ...ENABLE_SVE-in-code-for-checking-SVE.patch} | 117 ++++-----
        <br>
          ...ce-files-at-library-definition-time.patch} | 246
        ++++++++++--------
        <br>
          .../0004-Allow-ARMv7-builds-using-CMake.patch | 174
        +++++++++++++
        <br>
          ...ptions-for-SVE-SVE2-and-BF16-support.patch | 112 --------
        <br>
          ...mbol-error-when-building-TensorInfo.patch} |  24 +-
        <br>
          ...SVE2-support-to-be-disabled-in-CMake.patch |  91 -------
        <br>
          .../0006-Remove-TARGET-dependency.patch       |  58 +++++
        <br>
          .../0007-Allow-ARMv7-builds-using-CMake.patch |  86 ------
        <br>
          ...rate-generic-library-name-instead-of.patch |  33 +++
        <br>
          .../0008-Add-FP16-source-path.patch           |  28 ++
        <br>
          ...24.12.bb =&gt; arm-compute-library_52.7.0.bb} |  56 ++--
        <br>
          13 files changed, 551 insertions(+), 676 deletions(-)
        <br>
          rename
meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/{0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
        =&gt;
        0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch}
        (58%)
        <br>
          delete mode 100644
meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0001-fix-Fix-indention-in-cmake-generator-script.patch<br>
          rename
meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/{0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
        =&gt;
        0002-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE.patch}
        (67%)
        <br>
          rename
meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/{0004-Add-source-files-at-library-definition-time.patch
        =&gt; 0003-Add-source-files-at-library-definition-time.patch}
        (24%)
        <br>
          create mode 100644
meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0004-Allow-ARMv7-builds-using-CMake.patch<br>
          delete mode 100644
meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch<br>
          rename
meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/{0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch
        =&gt;
        0005-Fix-undefined-symbol-error-when-building-TensorInfo.patch}
        (68%)
        <br>
          delete mode 100644
meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch<br>
          create mode 100644
meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0006-Remove-TARGET-dependency.patch<br>
          delete mode 100644
meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0007-Allow-ARMv7-builds-using-CMake.patch<br>
          create mode 100644
meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0007-cmake-Generate-generic-library-name-instead-of.patch<br>
          create mode 100644
meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0008-Add-FP16-source-path.patch<br>
          rename
meta-arago-extras/recipes-devtools/arm-compute-library/{arm-compute-library_24.12.bb
        =&gt; arm-compute-library_52.7.0.bb} (58%)
        <br>
        <br>
        diff --git
a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
        <br>
        similarity index 58%
        <br>
        rename from
meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch<br>
        rename to
meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch<br>
        index 1c33ac3c..b7dfa7b2 100644
        <br>
        ---
a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch<br>
        +++
b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch<br>
        @@ -1,7 +1,8 @@
        <br>
        -From 4350c56d14b7b68acd060d8331f3ade1fb74e167 Mon Sep 17
        00:00:00 2001
        <br>
        -From: Andrew Davis <a class="moz-txt-link-rfc2396E" href="mailto:afd@ti.com">&lt;afd@ti.com&gt;</a>
        <br>
        -Date: Thu, 5 Dec 2024 09:21:23 -0600
        <br>
        -Subject: [PATCH] Use ARM_COMPUTE_ENABLE_NEON in code for
        checking NEON support
        <br>
        +From 6902148626781de2b4a2aec2c00fb6a13328209c Mon Sep 17
        00:00:00 2001
        <br>
        +From: Pratham Deshmukh <a class="moz-txt-link-rfc2396E" href="mailto:p-deshmukh@ti.com">&lt;p-deshmukh@ti.com&gt;</a>
        <br>
        +Date: Wed, 4 Mar 2026 15:24:41 +0530
        <br>
        +Subject: [PATCH 1/8] Use ARM_COMPUTE_ENABLE_NEON in code for
        checking NEON
        <br>
        + support
        <br>
            ENABLE_NEON is a flag used by the build systems. The flag is
        not used
        <br>
          in code, instead ARM_COMPUTE_ENABLE_NEON is used everywhere.
        <br>
        @@ -11,19 +12,17 @@ use in code.
        <br>
            Upstream-Status: Pending
        <br>
          -Signed-off-by: Andrew Davis <a class="moz-txt-link-rfc2396E" href="mailto:afd@ti.com">&lt;afd@ti.com&gt;</a>
        <br>
        -Change-Id: I65f5e7411c99280e2dd8c187140909cefd1c6892
        <br>
        +Signed-off-by: Pratham Deshmukh <a class="moz-txt-link-rfc2396E" href="mailto:p-deshmukh@ti.com">&lt;p-deshmukh@ti.com&gt;</a>
        <br>
      </blockquote>
      <br>
      You take the signoff line and authorship for yourself, even in
      <br>
      patches that you made little change to other than what was needed
      <br>
      for rebasing them.
      <br>
      <br>
      Maybe some tools you are using are doing that automatically, but
      <br>
      some might take issue with claiming their work as your own. I
      don't
      <br>
      really care too much in this case, but under one condition: you
      <br>
      should work these upstream so we don't have to carry them here in
      <br>
      Arago for next LTS.
      <br>
      <br>
      Andrew <br>
      <br>
    </blockquote>
    <br>
    <div class="Y3BBE" data-sfc-cp="" data-sfc-cb=""
      data-hveid="CAEIBBAA" data-complete="true" data-processed="true">Hi
      Andrew,</div>
    <div class="Y3BBE" data-sfc-cp="" data-sfc-cb=""
      data-hveid="CAEIBRAA" data-complete="true" data-processed="true"
      aria-owns="action-menu-parent-container">Thank you for pointing
      this out. I sincerely apologize for the oversight;</div>
    <div class="Y3BBE" data-sfc-cp="" data-sfc-cb=""
      data-hveid="CAEIBRAA" data-complete="true" data-processed="true"
      aria-owns="action-menu-parent-container">I am still learning the
      nuances of patch authorship and attribution, and </div>
    <div class="Y3BBE" data-sfc-cp="" data-sfc-cb=""
      data-hveid="CAEIBRAA" data-complete="true" data-processed="true"
      aria-owns="action-menu-parent-container">it certainly wasn't my
      intention to claim your work as my own. I was simply</div>
    <div class="Y3BBE" data-sfc-cp="" data-sfc-cb=""
      data-hveid="CAEIBRAA" data-complete="true" data-processed="true"
      aria-owns="action-menu-parent-container">focused on getting the
      rebase working and wasn't aware of the protocol for</div>
    <div class="Y3BBE" data-sfc-cp="" data-sfc-cb=""
      data-hveid="CAEIBRAA" data-complete="true" data-processed="true"
      aria-owns="action-menu-parent-container">maintaining the original
      "From" line.</div>
    <div class="Y3BBE" data-sfc-cp="" data-sfc-cb=""
      data-hveid="CAEIBRAA" data-complete="true" data-processed="true"
      aria-owns="action-menu-parent-container"><br>
    </div>
    <div class="Y3BBE" data-sfc-cp="" data-sfc-cb=""
      data-hveid="CAEIBRAA" data-complete="true" data-processed="true"
      aria-owns="action-menu-parent-container">I will update the series
      to ensure you are credited as the author for these patches, </div>
    <div class="Y3BBE" data-sfc-cp="" data-sfc-cb=""
      data-hveid="CAEIBRAA" data-complete="true" data-processed="true"
      aria-owns="action-menu-parent-container">and I'll include my
      sign-off below yours.</div>
    <div class="Y3BBE" data-sfc-cp="" data-sfc-cb=""
      data-hveid="CAEIBRAA" data-complete="true" data-processed="true"
      aria-owns="action-menu-parent-container"><br>
    </div>
    <div class="Y3BBE" data-sfc-cp="" data-sfc-cb=""
      data-hveid="CAEIBRAA" data-complete="true" data-processed="true"
      aria-owns="action-menu-parent-container">I’ll take the lead on
      pushing these upstream so they don't have to be carried in </div>
    <div class="Y3BBE" data-sfc-cp="" data-sfc-cb=""
      data-hveid="CAEIBRAA" data-complete="true" data-processed="true"
      aria-owns="action-menu-parent-container">Arago indefinitely.</div>
    <div class="Y3BBE" data-sfc-cp="" data-sfc-cb=""
      data-hveid="CAEIBRAA" data-complete="true" data-processed="true"
      aria-owns="action-menu-parent-container"><br>
    </div>
    <div class="Y3BBE" data-sfc-cp="" data-sfc-cb=""
      data-hveid="CAEIBRAA" data-complete="true" data-processed="true"
      aria-owns="action-menu-parent-container">Pratham</div>
  </body>
</html>

--------------4N7eeej25XvCP005O7E9TZCw--

