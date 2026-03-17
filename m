Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE98FEDA18
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 19:29:23 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84976.1773775760537959244
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 12:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=mISaYr+7;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.65, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giY2qkJNhQmt27kkcRpif3UAB5IcFsxY00dUlmQZBZeSmqW9dWVEhwsFhiCqU4lZo1pr1nEpemLHR12cuunXA5p4rBPMWLdYT0hYgkv3oZPXx+X7XPXUQ7rsrhKly0QO2oiHvTV88zkEnkkXI5ivhV4LErlHzcVgSOY4hxlU3SNdfbe7mO1tggGR5PVvr9+zEVopidve5Ey3nHX3+gjhF+E6YsYSjWj4uN2UxvdkQ3uDjBkkx+asl9tuUiA70dxtBst28B3aO+3eyexufOJjWyBglj8gfDtXITbWUDyXyEoutBbjx65E2K6k2Ir+yyIIPAXSHxl/SS4ENrujfCNAjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziZHeUJpykctwTjkp1EORONe9v1Hzl4k5ZjNYy/LHGg=;
 b=oZlGwl6Ap2jVQwSGtN2O10vTkVo4CjntDOr544D4/BxhkvL7WXk1ltVgjhA9eX4GxHJU59CxFhcXHSCsNGep+kLICeMy15C+nuYOE9NT50vXlGnNR9OspQ5ujmOK9yCE7YOK/uhiZ0lsrUYmvJFjLS1lOL504SdnKJAuiArb3pF2pCyvxOCSE4eDTmW+5oaINQLO5mLTvnpVtwQW8Tp6PUEVxgtkaKWCVu+WoNQcXIQPqc+rxSdX+8qYc3uFaLwCuB2FUOE1kVELCaXbIhEXE1YecYbc2NhNHZadvbJfRUIsybGfW5YRf+jfnP5V3Z1VzsCZRi1HLQ2cHw/jaSclCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziZHeUJpykctwTjkp1EORONe9v1Hzl4k5ZjNYy/LHGg=;
 b=mISaYr+7t9Wc98gunvG71BxRqNl9qaLd+Z3uvzlqETEfepOQLr/cY5QrSp6Oo64EYpGfZvSoUwsJc2C1dcyTYqVhbm8x1wT0R7XP0EDT+hQGRKVVr6Ay+JUOfHo/aDMdOcJnoGR3AQuaDvB6YJtuWeIZCDDl2Mv0R7T//4OR4W8=
Received: from CH2PR16CA0022.namprd16.prod.outlook.com (2603:10b6:610:50::32)
 by DS0PR10MB6270.namprd10.prod.outlook.com (2603:10b6:8:d2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 19:29:18 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::ef) by CH2PR16CA0022.outlook.office365.com
 (2603:10b6:610:50::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 19:29:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 19:29:17 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 14:29:17 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 14:29:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 14:29:17 -0500
Received: from [128.247.81.216] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HJTGn83723559;
	Tue, 17 Mar 2026 14:29:17 -0500
Message-ID: <b1bd0c0f-15c9-4f35-88fe-12e12e88ee22@ti.com>
Date: Tue, 17 Mar 2026 14:29:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/2] libsdl2: Add tests package
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260317185724.34717-1-a-christidis@ti.com>
 <20260317185724.34717-2-a-christidis@ti.com>
 <20260317191426.GA11121@denix.org>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <20260317191426.GA11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|DS0PR10MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cb85190-51d0-4e9d-6467-08de845b7b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	L9LTsN4lvWDlAGRQn4Tf3sPianmWduMabszx9f1bwVoUm68r/EtDg4hIH7G0PCLkWNQ2b5/GM3MUGcPtN6f/10BFQxxFhqGu1ryAwpb80nEO+RGIbIWxKMYCJvoI6IKgoFmnl+pBGb1Hv//v3mkezec5pWsbTaJH1cxLul/uQtylJNDVawmvQnNFHPTFD8gZlbXZGDiAVAmo6mdjejkiU/IzKy7ZveIZs7luuPcpwXdmoUltGz2Zr5efy+1/zGfFDuBVO50cW6g5tUvH6l1ZjsTJfEc0gYkHQ1sLScqWBsB2PW+l0ywREx6JxurhZlrI8UI9XNZluxtRTB1AvD0s8uoGn1qFG+HWzWJpjGJJm1LBumfMUKJzmRwQZD4FvnfoWoqbpK2yw0GWxwBtb11TWMNMDZ4Vwuv42d7+MXo1yjiQ080w358LoZV6AFbiHYk8PuCUUa49yzDZLPZY7+wJpvt1Qunah7ucFY7IsGMtU/lWFChFz2gW/5ulJpem8kZg7XLijbneU08uNi2VlB24oi35QSnjB/kCyrRvmkCAwzq/EUNWPZkBoqKdHX0zc68eFmUIG7M1wblJwD80R/gu8g4RWJDFnYhd/fjipkZK6cBwqaXxI8nUokwFYcaMRo79el7yhAzgeOVBGruR80uOR/zTXEnurfuHj78iwLDZHp8rOwgUcpvxb3nscZa0AF7FJ6XAxQJsUlitYp84EHeG7uG2BAZ3jAEL+MoXszS1Z/Y=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2jYt4/Ni56vVJfTzZ9fu4PlHzHvIqfKdJzQBuNQjM//U1Xb4nk5Xoo4fQW903EjHgGCSyo+AzmjPvR2ZhxlIcPjm7F75uIeO/alhdnqHSTlj4eBDabNFNHaxHKG9ZfDWrdYLjkPR8k3qIwNNNT8fPbGgCIHRNUvBoTmjcZT8LA8Q+9xJfVO18ICxuL4bMP+v9RftBRSeagCcpYNeUZsfcFOQw62Til02V8pAe7P9w8XIuVabTIzaCtcHZc860wM0NZWbgdQPGLavVtOv+mwE73Ay7AIXMLpfZN9iVJTkMKHIHuY4zCAvzAsXCRnbDk/RMddmX9oViWCuoS0KWr2i+oqsfOLCI+46VHKewSvhHkbRx1kn/G0BEtUne7TEKHOaR2UkaPyU7ndj1Nn6uxmENuGZMInrhB2+z0FgVZGaVXTeXOr9b+zZ8awbF0JsA0cg
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 19:29:17.9307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb85190-51d0-4e9d-6467-08de845b7b64
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6270
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 19:29:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17371


On 3/17/26 2:14 PM, Denys Dmytriyenko wrote:
> On Tue, Mar 17, 2026 at 01:57:23PM -0500, Antonios Christidis via lists.yoctoproject.org wrote:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> The software provides tests, configure cmake to build and install them.
>> Package the tests in -tests package.
> This might be useful to get it upstreamed as a new PACKAGECONFIG to OE-Core...

Thank you for the idea, I'll keep that in mind.

>
>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> ---
>>   meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc     | 6 ++++++
>>   meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend | 4 ++++
>>   2 files changed, 10 insertions(+)
>>   create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>>   create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
>>
>> diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>> new file mode 100644
>> index 00000000..f33ff909
>> --- /dev/null
>> +++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>> @@ -0,0 +1,6 @@
>> +EXTRA_OECMAKE:append = " -DSDL_TESTS=ON \
>> +                         -DSDL_INSTALL_TESTS=ON \
>> +                       "
> There's no reason for :append here, while += could work just fine.
Do you want me to send a v2 for this ?
>> +PACKAGE_BEFORE_PN = "${PN}-tests"
>> +FILES:${PN}-tests += "${libexecdir} ${datadir}/installed-tests/SDL2"
>> +FILES:${PN}-tests:class-nativesdk += "${libexecdir} ${datadir}/installed-tests/SDL2"
> If the values for these 2 are identical, why do you need to set
> class-nativesdk variant explixitly?

Ryan observed an issue when class-nativesdk variant wasn't set 
explicitly on scarthgap branch.

Link: 
https://patchwork.yoctoproject.org/project/arago/patch/20250917220826.2078836-2-a-christidis@ti.com/#31054

>
>> diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend b/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
>> new file mode 100644
>> index 00000000..385aa801
>> --- /dev/null
>> +++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
>> @@ -0,0 +1,4 @@
>> +LIBSDL2_TI = ""
>> +LIBSDL2_TI:ti-soc = "libsdl2-ti.inc"
>> +
>> +require ${LIBSDL2_TI}
>> -- 
>> 2.34.1

