Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A22FD45E5
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 19:59:05 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54051.1772049539697852365
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 11:58:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=v+rNna2U;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.70, mailfrom: b-brnich@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZecmLMEMFKBu0ufkxMcNGANYknTl5U+RHz0C1n9dEd32MKdtZLxBQIiMpSHzlry7N6NdeBWqks0+gsGmvYcd80zZuYnLm0MFx1MaPirBXnJakE/b/eB2C2otei9IOiGzEM9dQoYbtcpIWYr2KL4T8PKDu/C6QMA9lfOtzGokKhPnBn9kNgvU8rBmOflBHDuQjM8rg4QAwweWUnwtId+/Eb1j+76b5WrQekWTZcUv0SSuNF1xuh0jCzR6vnHGJYuu+5AwHw86L+Y57Pu/g9Q9ofrMTVLpo/qK4PYeaWCOzWg51eXaud2w06k8dkxgz16C9aN7vqbtxKYj0Mwj6s06Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6HFaV+9NNEtbLx7J0ZJ7puclU73o1F2xrsxwr4R+g8=;
 b=J8vgNJjcyZ+dyJsfmrpF6d24QDlYB44Pf7NFGf4hH9Qk2jm23O8ex16KgAXUwQ7QUuKTGp0VYxw6i7FNKvwpTmGv5H98kSC3o8wjPB98/ScoEnbwbAceeBhwfg6Kd2zq0dMZ4grAZ18PMlIXaB1uzDwLdA9OQOWIfgDj00vqpMBZgs23qXZ1+M3dHWbiV+p7/N/58vuTYt8UuGEXXIQyx3DkPH2cZaDgUAJjE4E0K8IXWbfGEaOri31k4wRI4b+NYqBSAqXmCCbyUtq7oQnbrhSoyG37xpXRcdvARgonfxa/6g/XI6AQnnvXtJBiBeCwKDf5cSO3l9myLjLE0lPetg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6HFaV+9NNEtbLx7J0ZJ7puclU73o1F2xrsxwr4R+g8=;
 b=v+rNna2UbHsFjdaNDTpr0JREWx37t8kGFIzgyBjUlWS4A+P89Kqw3C/1cPinicS7Tl9NRL7sWErbPF5bndPhpKeGXUs84KRtK1RJkctpQymdi9lxD9+3z6W9hoLFzHc6h83nfbeDxMtiw7NydB0lOAWDBbDHThJ0V0yldXqlkl8=
Received: from BYAPR06CA0029.namprd06.prod.outlook.com (2603:10b6:a03:d4::42)
 by DM3PPFBBE6F5DB9.namprd10.prod.outlook.com (2603:10b6:f:fc00::c45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Wed, 25 Feb
 2026 19:58:56 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::d) by BYAPR06CA0029.outlook.office365.com
 (2603:10b6:a03:d4::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 19:58:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 19:58:54 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 13:58:35 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 13:58:35 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 13:58:35 -0600
Received: from [128.247.81.69] (b-brnich.dhcp.ti.com [128.247.81.69])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PJwZS21041414;
	Wed, 25 Feb 2026 13:58:35 -0600
Message-ID: <3fb387c8-dedd-40a5-9595-6e5eab18cfc4@ti.com>
Date: Wed, 25 Feb 2026 13:58:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] ti-test: Add Required Multimedia
 Packages to ti-test
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Darren
 Etheridge" <detheridge@ti.com>
References: <20260225190339.3295692-1-b-brnich@ti.com>
 <20260225195731.GS11121@denix.org>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <20260225195731.GS11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|DM3PPFBBE6F5DB9:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3f00bd-4a66-4e7f-61a4-08de74a84dfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34070700014|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	7+DXXqqAu+Q0O5B9a8UG0d+nH4zu17vgHUR9kuqBAafNIK/z7MdUBahru3BEO6F6VrKvne5NmYVHsLpX2Fy0vNF21DkdmRGeg73wl07T2SbRAiH6Pz+5/fu/nSFUTXCx8ZcVTNaVoXuvqgmzW2Dwkbg5+krVQH7DpCKxEFD5j369sEpB8sGe89fABa23Pje6zW9eEdvKNXd5nvQH8TMLuwbAjA1Qs4v8IH1HX6hAnjksr54OGgT/8fY0QkFxtKXlg1eT6qQ5HV8Camu+y1ZMXNiGvQ8xdNvzVLWMzVqFZVdFv08jvga7BgFxMPUsTSBhVsCSQunj96FZMKdjytPugIBDAlWB8dEd9n+AclFg6/ezSv+yOS6jQtXR3xCpwcEGpqELv4n6DGm5iUyx769a4ZR8cOIFZLa1aIO2wjy3cKHvC+/SidP1Y/yXbXAMh9+GM7ZsYH7AUXz5FGoagvnnAm5krd1JI4Rexsuh6oNGLvgjJiKqf9MuOjuCJ3A3RZFCmn7i11UFGBHpsbBxkOSR7Z4InlR9t+N3crhD4hl64n5rT2Wj2OkxCpOiSGNA544W6ct4pxKtqAve7KosT/U3lPc7knCDiEjYO84PssDyc025cEM2q/2nUbEshCXRk/1d+0RxRxHscA9wmmaua0TGlvgjUDhN0wMPIZkgxaCtI1MtwgWdsThLd9x16lE9cKRnfsTqczUhk+R03Ts+6j7zaG6a5TRBMiJDhOe/dNB70aYL7DCl2NLjbVTLhnBZwX3XJnzXNeAhJgxaBxlw1hDX/fQGpa/xxjc5W9i00ZDHF2aMS8kz9JyE16fOycZcjFBHCHmpmwc2xMucaPBal0Xo0Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34070700014)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	07onYmiFn5Vnfwfa620XS6yY1UD9qQhgmTyCjMZwR5Lfj1mRcup3hITcR+2z/qVki6k+LtBDEKyD9mAwkMGr4Kt686TaGamR3DPaY6I1qgn99w+zk7Qb0hAqLrtMHQH1dbzjb+aIXcsiDcydaUexBsZeeuu5MiDqOkT5jCcc/TRezUtrUdrBFbhK32Kn0QRkq+GPqC4CtRJZXc7qrBkBLGJryGeQ/YC49t1m19pLHgNdFQWgav+If2k52a2FFhjPT1CmTV3LqD2zRfqHfVNOLkvmPdxAvVCTvrLvO26wHFeL5l4+AH8rZNhXWhNqBFLX3XppyxqNAtBRLuPJpvpLaoGb5BpXR6S/riMbTDXg10ZG21Xz6U8f1Q0zqZQlmFXB5WwTTRfn9YjkiW2Lkn9/qhBGwbBwKb7cI+TxPdSvn+pddKxBttX++vpcvJlw+P5F
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 19:58:54.3562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3f00bd-4a66-4e7f-61a4-08de74a84dfb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFBBE6F5DB9
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Feb 2026 19:59:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17148



On 2/25/26 13:57, Denys Dmytriyenko wrote:
> On Wed, Feb 25, 2026 at 01:03:39PM -0600, Brandon Brnich via lists.yoctoproject.org wrote:
>> FFMPEG and MPV are required during automated testing. Explicitly add
>> these to ti-test.
>>
>> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
>> ---
>>   meta-arago-test/recipes-core/packagegroups/ti-test.bb | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> index f2ae1aef..c694545d 100644
>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> @@ -16,6 +16,7 @@ TI_TEST_BASE = "\
>>       dosfstools \
>>       ethtool \
>>       evtest \
>> +    ffmpeg \
>>       fio \
>>       git \
>>       gst-devtools \
>> @@ -36,6 +37,7 @@ TI_TEST_BASE = "\
>>       lsof \
>>       media-ctl \
>>       memtester \
>> +    mpv \
>>       mstpd \
>>       mtd-utils \
>>       mtd-utils-ubifs \
>> @@ -145,7 +147,7 @@ TI_TEST_TI_TOOLS:append:am65xx   = " \
>>   "
>>   
>>   # Disable due to breakage
>> -#    viddec-test-app
>> +#    viddec-test-app
> 
> Was there a meaningful change here?

not really sure why it added the lines above because i didn't touch 
those files on my end..

> 
> 
>>   TI_TEST_TI_TOOLS:append:j721e = " \
>>       pru-icss \
>>       ufs-utils \
>> -- 
>> 2.43.0


