Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A01C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:46:54 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4122.1788428807177692652
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 03 Sep 2026 02:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=QWVzyL66;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=VaSz5r6X;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 683918j43302108;
	Thu, 3 Sep 2026 04:46:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=gCgS6FyONTLckKtbt9dmeil0YXwuFt9014Oqmme/J
	8E=; b=QWVzyL66PJY3qeRJ1H+SZucfwRAj1ZdQSReMUsdGUL/+AuW9Mcr3v6Qte
	khzUBmWWFF6w8z0TNVmqZlZVfjE2Nm27Kf/bUc2jCD0zVNK42Pm2CvkOk1pBR7ff
	zsZNqXlNNPjYMhUIrqfavcajlxC7gcL9xxefscP0jomC/FFOrx5VAZJb/HlLT6cJ
	nUMiOQaOADHEk44fdwAD9IW+pHb1reqsNeDRJKO0u8aDZE0s5wyOmeA75Pa7AWkX
	C6alcBC6KXJzKLeVXdTNzuUDC4mcE4P32sz7WokD4r0pGGnNY/wb7VjEVnfhhfgD
	NhW2K+TceMEcBWNGXqXPp0cgTHEBA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gf0jv202w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 04:46:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhJ5DQltw2W+qIfw623KxkjEJdkohhcwugTZOE+IH9mrBmWahvDRbrVEqW6a5JP2grKncz+Ixd9I2lqOcb0cSF7V56F+aSNlOOKXVq5rBimAZ9dT+5ESmM0PEyVc/KdZ42JU4GOvcKa7Nug6IvNFmZ3LtmSZ79fWG7TP6prEntWjLtxjxkx8FIYIXvWEC+PBcYbZyYEKdRchkG5E89GGDmSf2p4gpnqeDTi+BsSxeDt1oIfsxBNJZf2W2ARubEcymvMjDDRfQWUGrGh8Jvjn5/mWZ6eqrW97aj8q/BV2a74QljpzcVinFZHnT6/xqLlihtaWZvphYsrFGokEBZVgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCgS6FyONTLckKtbt9dmeil0YXwuFt9014Oqmme/J8E=;
 b=MQWiVSxakSSpPxf0N1bDY/4Lh8ZQ4xV/Xczcn7NZ3RahRtHxxzVtZJEj6dKUdFZ83LMSZIXGogVvN3sE/t8p3LTm4iQk9aJG7PjpQ5SDsrbkQDEe2ufbcOMbg2HZgla1dZuGUHR+cXhShsmyGMdBMAyzIOzvA6oznFcde033cCnO2SsJDV7Z0psJ43O9mH8aSULHMhGUvy2ILgSSCdzZX/tmCOtZHNL8gNUI8mvH3tlSSieDj7Q9JEjFSGX5PcPOprCo3SZurl9c6THnxqCM+FInxZayD16swcdohrXSRpIbMVZA6X/vTKhJ+is2ystV0p2sREplaILiSiDgyktlLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCgS6FyONTLckKtbt9dmeil0YXwuFt9014Oqmme/J8E=;
 b=VaSz5r6Xtq7FuYKgQ3in7NDU6ME2MLFJ6sa40PYNRWcXeI9KST4odE3TFr5C8UVJ/u/S+vHF1arBxRlI6A0sjjQRqP0kA14TMRPo56Yp8YXnExsMULSyjjsTslWMBB09mkS2RJo7LIkKbin+snZLGHg7IR+uBAKqqJNSfEmSayQ=
Received: from BY3PR05CA0016.namprd05.prod.outlook.com (2603:10b6:a03:254::21)
 by BN0PR10MB4904.namprd10.prod.outlook.com (2603:10b6:408:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 09:46:41 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::71) by BY3PR05CA0016.outlook.office365.com
 (2603:10b6:a03:254::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.4 via Frontend Transport; Thu, 3
 Sep 2026 09:46:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 09:46:38 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 04:45:53 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 04:45:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 04:45:53 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6839jo5R1305594;
	Thu, 3 Sep 2026 04:45:51 -0500
Message-ID: <1fddc226-571f-4514-be36-a7485bec9ed3@ti.com>
Date: Thu, 3 Sep 2026 15:15:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [PATCH] recipes-core/images: Build ti-core-initramfs
 alongside tisdk images
To: Yogesh Hegde <y-hegde@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <u-kumar1@ti.com>,
        <s-vadapalli@ti.com>, <a-limaye@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
References: <20260902132838.2135551-1-m-shah@ti.com>
 <20260903085955.xndzk7kynrhaza3k@uda1250336>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20260903085955.xndzk7kynrhaza3k@uda1250336>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|BN0PR10MB4904:EE_
X-MS-Office365-Filtering-Correlation-Id: 02eabab6-a93c-47b5-ad07-08df09a04053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|13003099007|56012099006|4143699003|10067099003|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	xiYG45VIH5rj9H8ObukA92HOE/ZnXEDcdP9dnN6CW51SqkerK+AeujAtn7L8Yehlr890AvXgFZX9SFwcSH4pIs5N9HDIFSIsYFk9Axa31e9MxnGGHHHAv3su5rGTL9R5xKvIxzWHWXh/9HzpiCLPd5aYesS8HwHPXyzfV/6jNGTJvVPxoNBBw0P4ga7yRwNz2KXFOPvSn/3Cd+Ja/ELzYCDmCDi/pJ4uz8DrVEb9n2KSgw8DdvCKNLGFvoLFRuTtfUaDeXFb9pBAbHNuUu30DCeVwkdyoUM7qDDTvBJS6yvuBgWfbDjtDliw0AYFDljWUkbV1ceCg/shxeMGbfVWY4jCfDGumKTiPLY/r99oNSQsiKhCCNY3Fn+jIHibYtw3Yf3497dbdpqYtOHii3gHcSkopU+j4Kl4p6UiZTJkJJk54PcMKeZu0AcK/4tb8bIf+CB7z0YfQCV6pwcwx2ekj6KeXDv1dMDIwYT3OgtRTg6l0QrveWg7vtgs93V9XIFSRMNR4S5+Ac6e5Gjmv9D7Jm7VOd9r/B6etucQwuyG0XVvFAfr+6nZjRmRNE9kldTbfDPGJ1s6kTsBSGFzW6ov1f8WW6SHxrjWAsot2NoJ2JKKxwCyb1hxPfkvoCuovNqC3XLbbhP/sdq8e9xUxF7lAA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(56012099006)(4143699003)(10067099003)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jt5I5NhdrLUfW0kSXGDXTayqTU6q8ywMV5MgxUYNj6h1Fkx6e/QHg8HG16PWJWAXBkqBm+6pCekDoPgF5n31NnGuNfJps/O2+R04s+1rznRLQJJ13Fnr13LVtLNlA4k+EQT4yISM/4boOGwQjXQXPOOHE/xzBdlR+izKNzvWzAlLcA1aMCv781++OprZzj1mdG+US3XkkwUxMm6LdYNCN45Id5dw1MX5ZrLRfneTDL/5esw7+3+RvCoqHeoOoR+lLnfGxTEPnLrJNxSbDRk+QePjriR8Da7yqeAa375TsSraLHsT1Lx/d0LxYUdUU6gd25ld94aTY9mgD7P3oaOfLiBwlBN6PuKKuR7RjZ2xNKbNkedMPzWTgT5/eIoDcPEwdZN55gS/HOFYFYAj5u9bFLYOuFwKVc8fzdZcSmqt0Ok/iJMT9bzUJfGsU7kMgBPU
X-Exchange-RoutingPolicyChecked: 
	5cx4jEXvjcvUa5gT2qjY0IqM/v6lS9wjVKdz1GLhnGIVUsgfym5uDCnrSEBOXshQfmQLDHrtPoYS+sjMFA4RJyPSdnxyw3spxGCjvxLteQX41BuiVX9lRnFf7oiQ8oHcH8R2pKBRrn87rHUGF7fQNUbL1FEAPo3qsMs+daAqXDXcVUXaazUGCoB0M5lqxOminzW8HXHBbEMt9CdOzF3U/MLrCX7BA5+Io7MEBq0POnPpqq6t2vnKzHCmG7/hALoncu5P9U0oKuftRdwTW4GKXWTb1wZIu0KbE0Ld6nL3ZG6PJ1Ps/7vRNagJLK0IaPT1rRfvtmKwoxlUmd8kg9/OYA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 09:46:38.7332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02eabab6-a93c-47b5-ad07-08df09a04053
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4904
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4NCBTYWx0ZWRfX4QRmM991UH26
 PcG/P/AaFRiO6uaJ206G0+iBDGD7oXfxJm1l/t+yFZZltAt/n/iBeUYvyG9wH07nzTYaYe3alPk
 g6nCDRuJiNITsXfhGogz8BMJQikOFS0=
X-Authority-Analysis: v=2.4 cv=J6eaKgnS c=1 sm=1 tr=0 ts=6a994205 cx=c_pps
 a=RV/m/49WaDJDQ/P4gGxFUg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=2FLF2O-O6af7eRJ2ORoA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: VP3II1vri4tNu3hdNrfovGrM_ee7to2o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4NCBTYWx0ZWRfX/bImgL5rz2q/
 DXZtHlVSsHYBQ+A/2simhwe1lSluT3TklZQig5fEOC+0cfPaSjaKfaujLjEU+uYXzTgKczS4rGN
 L4CpOMaEa00ihzPiMUQCJVFzQs2K8bGkK59+imtrLn9Wy7r9KpM9B3vZ5Rgzl++D8VYJiuUkSQt
 cKMpxP9zmtAt7J0vjVj/TxSKl6KL4dXYJyLxYtbiqOEEhp1RccGnqxmpprrU2/6o1wPA8Az8h7E
 3cO67pk1rpiSP8Tr6FlqKT0GyfD8gj0Lh+J/jCGGrn/ru3VzHXrA7A8pPHW9ACn8eFi2HrhYyg6
 IZcZwT2AsgHx99BGsjcuiEEBoHQnTZktYMvLUmHFB36RsAjA1vT9mTlHXmSDvrIVxXzpxyscpWj
 iQfRG1Glearc0M3zMYZO6HmP5JQRA1+eKdEnqqkEnryOOljhbg3waNPigeAiqN770yUfvclLkrZ
 h5oMgoVDcSy+41/f2oA==
X-Proofpoint-ORIG-GUID: VP3II1vri4tNu3hdNrfovGrM_ee7to2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030084
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 03 Sep 2026 09:46:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17651

Hey Yogesh,

On 03/09/26 14:29, Yogesh Hegde wrote:
> Hi Moteen, Thanks for the patch
>
> On 18:58-20260902, Moteen Shah via lists.yoctoproject.org wrote:
>> Neither image sets TI_CORE_INITRAMFS_KERNEL_MODULES or
>> TI_CORE_INITRAMFS_EXTRA_INSTALL for j722s, so the machine-wide
>> TI_CORE_INITRAMFS_ENABLED gate in meta-ti-bsp stays off by default for
>> this machine. Force ti-core-initramfs to build via an explicit
>> do_build dependency in arago-image.inc, the common include every
>> tisdk-*-image recipe require.
>>
>> Signed-off-by: Moteen Shah <m-shah@ti.com>
> I am not sure why this patch is needed. Why does j722s need an
> empty initramfs to be built? Why does j722s need a empt initramfs?
> - If it geniunely needs to be built, this fix should belong to j722s machine config by
>    setting the appropriate variables, so it is limited to j722s only.
> - If it not to be built, then the gate is working correctly and there is
>    nothing to fix.
>
> -- Yogesh

Its not an empty initramfs actually, if you see the dependent series in 
meta-ti which I have linked it adds the required modules.

Regards,
Moteen

>
>> ---
>> This patch has a dependency on the following series:
>> https://lists.yoctoproject.org/g/meta-ti/message/20235
>>
>>   meta-arago-distro/recipes-core/images/arago-image.inc | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
>> index 37b20850..398e299f 100644
>> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
>> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
>> @@ -30,3 +30,7 @@ BAD_RECOMMENDATIONS += " \
>>   BAD_RECOMMENDATIONS += "${@oe.utils.conditional("INIT_MANAGER", "sysvinit", "", "busybox-syslog", d)}"
>>   
>>   inherit core-image remove-net-rules
>> +
>> +# Force ti-core-initramfs to build alongside every image based on this common include.
>> +
>> +do_build[depends] += "ti-core-initramfs:do_image_complete"

