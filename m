Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D95C61DFD
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 21:07:37 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6692.1788210453063409089
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 14:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=nZUhbPZ2;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=dh4bXSqy;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIS7I21444698;
	Mon, 31 Aug 2026 16:07:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=59AXQoOjGv+L63NgxgFoDiuzzKcfEpNlHqvAEvgow
	WA=; b=nZUhbPZ2MWSEQvQVtL1CCAUFmE1X3D/8eYRCZJh4+HR+RZf6tHORQSR01
	TGcgG+TdCjni6JAzrXDH9mDcAvEa8fxS3Z53Uj9v1wE966S1g35JG3DMQfwxFyAm
	R4PFUsrCxT05660mBWs3fEaUhAMlAOV8xbyTgngXi5HHQ+k37yqHlImyKfzPRY1f
	PMEO2/uxf8RqZLQTLZVlQtzslNEZFTWQYcpFet4eLNsURQU0M/3CZKr0j3GBIl49
	zKqW2jAy6OP1J1kvjI/75mjvD4KXwWxRfrVZ+B/FuZwVY/L+BFPZg0SjJZBRYixn
	bhcgNnkIhArQ+Uite/Y1Ax8QuBJxQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010060.outbound.protection.outlook.com [52.101.193.60])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gcejq0uv8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 16:07:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6YbeDBkayNTMj9tZV71r0AFcpBHMgXxC4lSjG5dNL/2AOh/pIMSHn8Qog+7gK0h6UJfVAbow0CA3fXgzuhN1AtltNmtBdyNzuHjEoZKUibovy2wsRQfdeKdMzyXt4MinyM4G0XU5IWsd3c5hwVMDWp2zo8b0dS0DqxGrZygDA4RkFcfzKhjBSTAXZtSNpCVxKjcap3TrflhQOrBUdygwPG8+G39MxC70b4kANVm1qPmN4+7WIsAPTgXrA0eJeQ1zLl8N2UjnajMVKARUh6oTw2gL0+WBF8co4DNQuzdc8OZfSv93zLP5gXM7cmdjrJlYvbEnt37KZ2//3L31syn+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59AXQoOjGv+L63NgxgFoDiuzzKcfEpNlHqvAEvgowWA=;
 b=EA7uX7MAXiBIZi2qsEbYsxbIBZXlBD4BIryV18devYIuvdh6R/JQ0Lx4mxgu1HIcc1AfQLESZEZnM2w3PAi63WFKe/UHJQ2kBimw75/XQTWXuZLgxAXPqOO/dBjH5Gsu0RGb6QeSNqvbtqqy6qyvKF8NvMjajEN11XIwJdagZHhu8YLSOhO7oBGgslg1y9YkKM9i4sBMyYY3KXv8uHiEvlesJXTJ9JDBjwRkVNbhdtwvgs6LDMJBjW7sdbMger0+CSnvLBxfi7XjKZow0m4cprmezVciLpynA/2ngfpzRozUfbQ/47GC7PcSaCKS6n0M5eYjjqZnAtbcnI5VfnCY6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59AXQoOjGv+L63NgxgFoDiuzzKcfEpNlHqvAEvgowWA=;
 b=dh4bXSqyvOBsaXUrEI+07Ociz+I/R6clPNu7KCfZxrql93kSE3V417gKU2qOoWI5ZEtjq11E3JtrZkq3ps1cVPO5PIArGoUx8zOZVhigK7TnJtwf23D2eWBQler4ZqR2kWDYCqEJi+bWAIc5OhznK6lhthv0kPbZrcULHvb6p7o=
Received: from CH0PR03CA0184.namprd03.prod.outlook.com (2603:10b6:610:e4::9)
 by DS7PR10MB7155.namprd10.prod.outlook.com (2603:10b6:8:e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 31 Aug
 2026 21:07:24 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::33) by CH0PR03CA0184.outlook.office365.com
 (2603:10b6:610:e4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 21:07:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 21:07:24 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 16:06:58 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 16:06:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 16:06:58 -0500
Received: from [10.249.32.236] ([10.249.32.236])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67VL6weW485768;
	Mon, 31 Aug 2026 16:06:58 -0500
Message-ID: <9ec6e99f-8374-4eda-8c42-43cf925b41cf@ti.com>
Date: Mon, 31 Aug 2026 16:06:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: Drop
 unneeded patches
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20260831205242.3284673-1-reatmon@ti.com>
 <20260831210522.GO19759@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260831210522.GO19759@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|DS7PR10MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: b1be2163-3429-4fac-4b92-08df07a3daee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|6133799003|4143699003|10067099003|22082099003|18002099003|3023799007|13003099007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	wHgqPOZNHSENTVk4lVDg+ME/nvXmPauexGVRjfvAbbQUTpIMkqIOMTmOkHSp5AiqF1QDVvf0H454oOQMhV8tliCvBn9/JLT2aFatP2XRVj/Y080ggLuGUpv55wguQ2HJwlH55vwRW9xw7jUi8TJZAfqpS6JUjw4hj/BrFZPRgyM3WDX1g3XCJmHwC59qE65dJtFgzky86DVMczh07WZYRzj7bC6n7i/8SjDLSTXL/76Q90i0OXSP2qxXhIgXye4OqaeDSGoy06Ax2gfNIJwkX/vloYKTIPxz5btnMK4ROm1dnwDxxRLZBv+k0PhozW4qjPt5NtMY2ecaFdXWTr4fJuIDntk6a+l3S7p+5XtsYwucKNSe0PnRW3B8v5Lpxi8U8GdDNTtIhHWeiDTIR0WHFFgy5dJr5fucg8A3iyusvFwOvb46vfZ+/jo9ndeqJ9ilIMXGSXuGXug/JiAxwMieM0CuDhX4mIX2kQee0zTELVRT1Gho6rPm//ebS+98LPPMhm2IcnnjyIygEQwg5qAw13fNrhc+s/+tDZ+PCCq6WgH1B5a/N9iPvsE9d85T0994/W1Yz/t0ALC2Nb2paoy5ssdvSq+H4f7Asbp6KDX6If68hjLkENdOU56qNqEF+IzFlwzkRT0vEHuAl0WE6EJo1Thw347yYyglt0EP+cFWNa2ZtAjETuYMntlgFp2YXGzAKLJUkpBFwb+PyXx27Fh5jQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(6133799003)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007)(13003099007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iuqFPH9MAmpSf2zQFf1rK2BV0HZOjdV7TD9nB8DVFYMyoniYYMxsoT473FRhHTpYZB6b4vs1XwI66e0iE7XoWdkzW3b5FLTK4gB2O5AgvEElZHM7kEQ1wadvIW+MuZi5b6+BBJLdWuQvvTK8heOoSKiNUrdzs/Ax3Qf9THZraTRwgSoVXhUQkv7gqxh8dVrteSL/qZmVdsv4P6egjb0w+Z5KX3s5IHDUvpObGpFU1OHooqjKrEsHvYmziL9FgRfk/0oeyNkU0JjKeN+w4oqviyEAQB9ccdfshmO5wpNvbXpj2x0l8eal/xjr9KWpBOqdO+eAvWnIWcr95MMk8SiGYIv7qXWqthrjsBwjwmHOdwIn6HqAHArBhvoqxsSAwU3PqGSXyxKSLSxu9z0w0mLbaJ+cBrMz5Zxag4J0k9lgmV7enPYc7Y+PgHIipOqCIBCY
X-Exchange-RoutingPolicyChecked: 
	xiTT5E1nUqO7hj4QO7ZrJZYao3hqL/1UV34wpUr4cpCtl5HoKTP/8ZthChKrGjjzaL3gUxue87ukudN0uybA1yD0jlIJ0eLjd1AZyCMmdCIShj7zGcnYjoT2CuAWNnirAD/s43PJm5HmgYMKQ2mXlRG3CZI6/SPkdCrEtJ2VHVC4oRnhLgHu4o5DErRkbmn3gFcwGD6Ypv5AC/rXezGDR1ek0gAWoxfDq0Rno9FIXJ2yGsVimQNM5B2cY5Y9vv+bZ4TwASdbb+ofK/5uHPWX+g4mstWxVfg9BFrdHloBC3R0X6unOo3vcWS9wSyW0b9xiWnwCr/W7YuCHjn5OG06aQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 21:07:24.3035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1be2163-3429-4fac-4b92-08df07a3daee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7155
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE4MiBTYWx0ZWRfXxmvw1Is3z/ic
 0XLHf7pIjANYdUyDln5gafY6FLGlIC2ddYEQT9kMyd40wcUapdkeL+/kMnfIb0P0Vm8fObTv7kJ
 VAfi0/SwHBQ9arsM8i1tLXlgZK4Bcfc=
X-Authority-Analysis: v=2.4 cv=b6eCJNGx c=1 sm=1 tr=0 ts=6a95ed10 cx=c_pps
 a=8uZh/oWqEamKeU/uFK3X6A==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=Q4-j1AaZAAAA:8
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=Am4ss40yAAAA:8 a=NCohnyVLaxokEaqe8QIA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=lf-hbUz_c89dky27wAWH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE4MiBTYWx0ZWRfX9FXzSnzn68q2
 WaOmjQQWKUF2F74cCgy0lcry4v5P3tJnzXx0uEISHf6pvnb68l57YA1U/WsMFMGhxVMRSczBPDK
 SxdKKAaZpQ/yewJoPlojQwWLECESOgGkA0J8OcrQiW2kcO3KAHmDiGPw+u3q6zQn1TEo2laOv0v
 lGhI6kzdj9VB1flSdR2MShvv1J7mgWkNJd2UzT2OPm7DDLtXzhVDM6ed/daFGmn9UaL+wbiP/rP
 9cjG2mxN3j2bCN5gMNJtm9aWksPIlq+BbV00+pdepESKJHpjg9SgM68k1bTo4f/QUV7weVeDVNX
 QfAE3sTuoCF98XhwyTOpEw48XYKHMY5oH2IE4Bge5UwxAPKsKMsVm/4C3WzR5v8Kn9FieFL4Hjo
 zpHH09/Nnm3KphCVsW9H7jl1b/B0vuaeT/a0FTcDPbktmRqZS62ZX25ExPGjj9F0HyjhR4QWMM3
 AOhowwML9E4ipsuTwYA==
X-Proofpoint-ORIG-GUID: j7sUPij7f2rxnEynyNHorUXUY4Z06FM2
X-Proofpoint-GUID: j7sUPij7f2rxnEynyNHorUXUY4Z06FM2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310182
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 31 Aug 2026 21:07:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17633



On 8/31/2026 4:05 PM, Denys Dmytriyenko wrote:
> On Mon, Aug 31, 2026 at 03:52:42PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> A recent version bump in oe-core [1] has moved to a version where these
>> two patches are no longer needed.  Drop them.
> 
> I was looking into this as well and I don't believe the patches are no longer
> needed. They are definitely no longer apply, but I don't see they got accepted
> nor even submitted upstream. I see the code has changed around these 2 patches
> enough for them to no longer apply. I think someone needs to re-do them again
> for the new version...

I had someone look at the patches and they agree that the logic change 
in upstream made our patches no longer needed.  It should be more 
automatic now.

> 
>> [1] https://git.openembedded.org/openembedded-core/commit/?id=171b0ae0160d38e423c9447b883a4fd709808be8
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   ...ence-to-contiguous-format-if-support.patch | 52 -------------------
>>   ...pt-non-contiguous-if-contiguous-form.patch | 35 -------------
>>   .../gstreamer1.0-plugins-good_1.28-arago.inc  |  2 -
>>   3 files changed, 89 deletions(-)
>>   delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch
>>   delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch
>>
>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch
>> deleted file mode 100644
>> index ff617655..00000000
>> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch
>> +++ /dev/null
>> @@ -1,52 +0,0 @@
>> -From 0238a430b19e5302dc924321225a3e24778bd2b0 Mon Sep 17 00:00:00 2001
>> -From: Devarsh Thakkar <devarsht@xilinx.com>
>> -Date: Fri, 9 Mar 2018 10:30:47 -0800
>> -Subject: [PATCH] v4l2: Give preference to contiguous format if supported
>> -
>> -Currently gstreamer uses single format GST_VIDEO_FORMAT_NV12 for both
>> -NV12 (which uses single contiguous buffer for luma and chroma)
>> -and NV12M (uses two non-contiguous buffers for luma and chroma )
>> -and if device supports both NV12M and NV12 then it gives preference
>> -to NV12M over NV12.
>> -
>> -The logic to give preference to NV12 before NV12M whenever GST_VIDEO_FORMAT_NV12
>> -is set.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> -Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
>> ----
>> - sys/v4l2/gstv4l2object.c | 12 ++++++------
>> - 1 file changed, 6 insertions(+), 6 deletions(-)
>> -
>> -diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
>> -index e9026da..ad9f630 100644
>> ---- a/sys/v4l2/gstv4l2object.c
>> -+++ b/sys/v4l2/gstv4l2object.c
>> -@@ -2013,17 +2013,17 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
>> -   }
>> -
>> --  /* Prefer the non-contiguous if supported */
>> --  v4l2object->prefered_non_contiguous = TRUE;
>> -+  /* Prefer the contiguous if supported */
>> -+  v4l2object->prefered_non_contiguous = FALSE;
>> -
>> --  if (fourcc_nc)
>> --    fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc_nc);
>> -+  if (fourcc)
>> -+    fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc);
>> -   else if (fourcc == 0)
>> -     goto unhandled_format;
>> -
>> -   if (fmt == NULL) {
>> --    fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc);
>> --    v4l2object->prefered_non_contiguous = FALSE;
>> -+    fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc_nc);
>> -+    v4l2object->prefered_non_contiguous = TRUE;
>> -   }
>> -
>> -   if (fmt == NULL)
>> -     goto unsupported_format;
>> ---
>> -2.39.0
>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch
>> deleted file mode 100644
>> index 4878ea49..00000000
>> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch
>> +++ /dev/null
>> @@ -1,35 +0,0 @@
>> -From 8d29018dd31be2045f6724db0942ae1a7da0a789 Mon Sep 17 00:00:00 2001
>> -From: Brandon Brnich <b-brnich@ti.com>
>> -Date: Tue, 10 Mar 2026 19:47:35 -0500
>> -Subject: [PATCH] v4l2object: Attempt non-contiguous if contiguous format isn't
>> - present
>> -
>> -Gstreamer previously had logic that would set fourcc even if the format
>> -being negotiated didn't have a contiguous option - YUYV for example. A fix
>> -was sent to properly set either forcc/forcc_nc properly. For formats that
>> -don't have contiguous formats, that would mean attempting non-contiguous
>> -options wouldn't happen. Attempt non-contiguous formats before erroring
>> -out if applicable.
>> -
>> -Upstream-Status: Inappropriate [TI-custom]
>> -
>> -Signed-off-by: Brandon Brnich <b-brnich@ti.com>
>> ----
>> - sys/v4l2/gstv4l2object.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
>> -index dbfe4992be..b4a7c32f31 100644
>> ---- a/sys/v4l2/gstv4l2object.c
>> -+++ b/sys/v4l2/gstv4l2object.c
>> -@@ -2167,7 +2167,7 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
>> -
>> -   if (fourcc)
>> -     fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc);
>> --  else if (fourcc == 0)
>> -+  else if (fourcc_nc == 0)
>> -     goto unhandled_format;
>> -
>> -   if (fmt == NULL) {
>> ---
>> -2.43.0
>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
>> index a2204efb..d9e0df88 100644
>> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
>> @@ -4,10 +4,8 @@ SRC_URI:append = " \
>>       file://0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch \
>>       file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
>>       file://0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
>> -    file://0004-v4l2-Give-preference-to-contiguous-format-if-support.patch \
>>       file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch \
>>       file://0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch \
>> -    file://0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch \
>>   "
>>   
>>   PR:append = ".arago0"
>> -- 
>> 2.43.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

