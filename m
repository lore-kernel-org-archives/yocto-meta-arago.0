Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917E8105F7B1
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 15:03:04 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17915.1773414182509912830
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 08:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=vAOGDmch;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.23, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWvD/XtKrz131lIjhQgROaUZyoV4iH6m5Hr4hK4ptMtff8ZyziTU7ERm9MyTsIz+VnNEi/BIDAIIQhVGfKXXzZ2cC/uZy4zI8Oj87+hwTvzZ/vQFOdPdpyZovd8CuUqhy3/GPRjgILbdmoImW5c40pDiMhavl3CMPD3gAEK/v3UjXWVCDZdumZAtoItfVbd0I+mYK2hr0hkNQ4+zdd9VRSZQtZnF99xo9NtpFwSkmBaV1/W738payIa5vi3w+4UyjOXyAzo1ufQ12UaaWkTi3bKdDwM6dl+L2zK3lZYerOIYCrdjHCYBPiSZCEhJFKBNb8hPjXVAwDAaftLrQ+k5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/q2sIRVCKmAb32Hx4fQKqesY+9miAYAmZI34GGn1UE=;
 b=HZQGOQvg/sjAFLRIgvOJkA2l5BOE2UYjCiX/Wa/cCvyKbBqRnvcf2qRp+xINCrYIErvnBa7eSS0CYO7mevODjZZnhzA0x1nqB+CwGC/Qd+q+28XDwO06iYpRN5DvZgaYrB87kCXyihUsQgAkFWmCytCxgReSBIWNpfHy/zuQOeBF/sOViV/Ld+pkBi1RkcEtR7aDJIzRpFdl8dGggVf+5cfiySGOE9SD1x0YknWsqvNWi8+OlpQb9ndQgaF1BDql4Zjfq+c0mIwLZENUb43je50VQRBiz+xTFqeBdcoiujnXHuQLm4cKda06Dk3yuQB+yGxnsxKmGeSW838X8X/o3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/q2sIRVCKmAb32Hx4fQKqesY+9miAYAmZI34GGn1UE=;
 b=vAOGDmchzE54ZMQ5AeGbAI7s7Xi+xhd2vCgz9ixKVf33TwsAo0rPBTL+8OA+wvSMrWelZ578RRZisIdnIfRu38Egt2qZV5m6q3gf/J3VByNXnG00NizKukWz87zjuDxMU1i9bWW1xTB55BIMqo4l/lHDayk2SYOmGKgs/cbaREE=
Received: from CH5PR02CA0020.namprd02.prod.outlook.com (2603:10b6:610:1ed::25)
 by DS0PR10MB7902.namprd10.prod.outlook.com (2603:10b6:8:1aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 15:02:54 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:1ed:cafe::4a) by CH5PR02CA0020.outlook.office365.com
 (2603:10b6:610:1ed::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17 via Frontend Transport; Fri,
 13 Mar 2026 15:02:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 15:02:53 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 10:02:53 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 10:02:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 10:02:52 -0500
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DF2qwP219193;
	Fri, 13 Mar 2026 10:02:52 -0500
Message-ID: <8e7a8b22-47ca-431b-852f-7bee365f7141@ti.com>
Date: Fri, 13 Mar 2026 10:02:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v3] linuxptp: Add support for HSR in
 Linux ptp
To: MD Danish Anwar <danishanwar@ti.com>, <meta-arago@lists.yoctoproject.org>,
	<denys@konsulko.com>
CC: <c-shilwant@ti.com>, Denys Dmytriyenko <denis@denix.org>
References: <20260311120943.3524472-1-danishanwar@ti.com>
 <b3b60c92-b328-4b8e-9868-ec3cc6885c24@ti.com>
 <67127b11-c24a-4d6d-a9fe-6a8e598dea39@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <67127b11-c24a-4d6d-a9fe-6a8e598dea39@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|DS0PR10MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: c677c48f-ef7a-41ce-3c5c-08de81119a69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	xe/A/wMHLGuQprrT1tK1nAYsiknMkI18vFvExwQU3KHPb/OhLbBgXzn1H0pgXGssIMjX1ObdtCa9ZZaAtsXjyApJe0pR6MzcrDyivRga2X6SuuQoz+dkinlrHehEle9E/DVHRKT8jl1/Lmny/e+yINlSj6aPik5Z7xPYI373sdA7KYUcSj/mlJhQUZ2Om9skq6z5GB9n2+CITbCWbEoc5jUKhGG/4K1oPyAXdxlvRAJbbg3HuupOpBq/XPc2122a2fnOnmN4Vh18T5vS7uBy3gqQ1BvQTxj+Yusz+YamNt4zzw/cAcktEQvdqtmye+ppXtcEPcHC/ZQy7/9uvufHcx725T66g5oyVaZdQv6WC8+xH+7aDHZNy9IpKotPXfiidea9XaMqWfAlHq39EQ99vWdme8zNW7yGGifxPuf+iiWgu8CJqXrEx6G2WRArNSlwhRneSWVuJnbTSeJJtjiWtMSYg7JmzUwcXCC/Hib+mAPDFaB9QEa7HqRNop8eHxalY2zZgNUrbl41h3xM8IsL2rAFGqmTuiBGYfPZoiyslN07wyMepFdndIezjpyoysOp3+BY6cBz6XfHiDGjs2iLkpWIG1yES33HQf52xkuUpm3ft7hyPGQv4q5lRInLIPTc5ee7tATpO7M+cePR8p4HZUyoVKHVBR2+wP5HrWVHSNRCRIU39JgrGXFqYmAp/jL9MLRdzZamKhpMRrIjdeGg09DyELigRoNTLTSQiqBh6vZiQ2gh4GVFz+tDaaEP+RiLVhe9Upt8JgF/0edHOhgDjQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Dpom7V19N1sC9cQdemOTqYjreOWv2Xg7L0xspRxKg4SMrdJ8mrkPfr8HUFj9JhsIxsKRa3i68iYocKKySz/eo+LXy/7y9dSdLj8ZIPXAlnQrWzs/Czc36irMXIlpEY6qvrixOPmkF2svPzRuwptIWhd5Wk41Z/ePWrpGwdKQRLXuMEQWjvBcCkyjwU3Fpp3RffqpPjjDiWME9K5vSLCKrfnwX//9NxU1YFFyGeHlcRFdJZxUWs1sy4n8bvtHSvhoV0oM0/scTYjMD+fUxoUNbbhoPZXGE/IS9iO/fwKzkBeMbezYde3fatf7YRdXKhod1sMpPI7pINlKZwqBxt0/eqgzrZHM2888rc89FoVMMN1MSTd8yIgZWXyHfW7Yoonm42YWipNeRlQoEbXkX2CiZjib6uYluKIabazRp4OZ4uWksMcckSzV2bryEF1ecQ6/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:02:53.7321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c677c48f-ef7a-41ce-3c5c-08de81119a69
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7902
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Mar 2026 15:03:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17334



On 3/13/2026 6:36 AM, MD Danish Anwar wrote:
> Hi Ryan,
> 
> On 13/03/26 12:27 am, Ryan Eatmon wrote:
>>
>> I'm getting build errors with this patch.
>>
>> ERROR: linuxptp-4.4-r0.arago0 do_patch: Applying patch '/scratch/
>> jenkins_builds/arago-master-wip/build/sources/meta-arago/meta-arago-
>> distro/recipes-connectivity/linuxptp/linuxptp/0002-port-Add-the-concept-
>> of-doubly-attached-clock.patch' on target directory '/scratch/
>> jenkins_builds/arago-master-wip/build/build/arago-tmp-default/work/
>> armv7at2hf-neon-oe-linux-gnueabi/linuxptp/4.4/sources/linuxptp-4.4'
>> CmdError('quilt --quiltrc /scratch/jenkins_builds/arago-master-wip/
>> build/build/arago-tmp-default/work/armv7at2hf-neon-oe-linux-gnueabi/
>> linuxptp/4.4/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout:
>> Applying patch 0002-port-Add-the-concept-of-doubly-attached-clock.patch
>> patching file clock.c
>> Hunk #1 FAILED at 151.
>> Hunk #2 succeeded at 1350 (offset -44 lines).
>> Hunk #3 succeeded at 1428 (offset -50 lines).
>> Hunk #4 succeeded at 2320 (offset -62 lines).
>> 1 out of 4 hunks FAILED -- rejects in file clock.c
>> patching file clock.h
>> patching file config.c
>> Hunk #2 succeeded at 355 (offset -1 lines).
>> patching file ptp4l.8
>> Hunk #1 succeeded at 902 (offset -10 lines).
>> patching file ptp4l.c
>> Patch 0002-port-Add-the-concept-of-doubly-attached-clock.patch does not
>> apply (enforce with -f)
>>
> 
> These patches are based on master branch of linuxptp. Is there any way I
> can find out which branch these patches are being applied to?
> 
>> stderr: ')
>> ERROR: Logfile of failure stored in: /scratch/jenkins_builds/arago-
>> master-wip/build/build/arago-tmp-default/work/armv7at2hf-neon-oe-linux-
>> gnueabi/linuxptp/4.4/temp/log.do_patch.1134123
>> NOTE: recipe linuxptp-4.4-r0.arago0: task do_patch: Failed
>>
> 
>  From the logs it seems like it is applying to `(tag: v4.4) Version 4.4`.
> I will try rebasing the patches here and send a v4

The linuxptp recipe is pulling the tarball, not working against git.  So 
yes, it is against the last release 4.4.


>>
>> So this is a no go.
>>
>>
>>
> 
> 
> --
> Thanks and Regards,
> Danish
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

