Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C22C982D8
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 16:10:31 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14627.1789747830339669687
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 09:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=GMFonxmE;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=LSaH4ejV;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68IEJj6L215472
	for <meta-arago@lists.yoctoproject.org>; Fri, 18 Sep 2026 11:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=KI9970v08vfb8/gVBJqBhYUzb/gRptoanxF7bStON
	yg=; b=GMFonxmEftsUmTBw8sOwiB7XS1hyiMWz1Tdh8q3ce3O+KqKK3nTbeXDXw
	j5KKNoSosHGurfjduoLB6VePE9FJPZpGfg80FPh+1+nXu4VALuS0uLg8HZhxEjRg
	ijLYNsgtSR98ScYcnJAZHp5J7U1zlgzJUO6i9AZskEjEQ7wh35dvrP23rF8L/Xui
	lx4njuZsMViPTAsstvtg+ilpHWYPgPWiXP/yHVkp2Ss/kwp8FXne4HEdqeWDLYGv
	rq7K67ADaVYcqlUfWCvJ6L/WsWjvVpZnhIoAew4XfUlFJxPm2//04EutxFmBHO1c
	f16+DT5I2ejPY9/7E/uRa3IyuXLzA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012037.outbound.protection.outlook.com [40.107.200.37])
	by m0380145.ppops.net (PPS) with ESMTPS id 4grx6dc0ed-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Fri, 18 Sep 2026 11:10:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKrPPakPbxPWvRAKufpZussAHFaWT7cRoMV5kh6s0OkK2WLgI6SAzZijYM+MDfCSgg4Is6jhAAeuT5rSH2LrI2P2BiEyMQu+yGe3CULjQXqH9GxNsPUAjAIjonMTAn0SmVUc86jn/8cKggLDROhgejgDY7IkMULY9qkDLIO/PT9r1LOhZoXPlGoYeB1L9ydbI6LYzGdHy67rsJK/VL7WMT2yOy9t7BwQ271OK4wJf+neme3muXb/0XBewTyPYygQX7Ogew6l0X+4akHqDbnJC+g1GQtAHFpCRAH4QAQzew3o5AUsogcTdWq3Kj6O+h/aI9Bke/0PC28T5frFp5pouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KI9970v08vfb8/gVBJqBhYUzb/gRptoanxF7bStONyg=;
 b=HRapfh05aMYU69gurLdU1Jpj3+oh3XuDbS/IRcqBuIKzM5jz/o7p2vngIX+wYFNUJ979GJWScCxg66sMiHD1bHekrDHyTtQ2EAVt7u/ECBfz8kNKzFoVWf8qQ7S3htkX3jF2TnrGVt36kqAF0ib1bZi50dBFwUKwbrYsr1/k8X3T/blsKP6D2qdMh1cfJsQXfVr37uDdeAffF8XJ/2fhnAlnp4Er0UjfcYHTd8VwFD15iqW5ILcsXug4K/kMbkn3T3rokqXro+0dB7S+ClXzmgqyUhQAoqv6FifjB99PENoMktyfFbQ7kx6iGn84sb0LNrSFEnKbAuZEfu3i76s7bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KI9970v08vfb8/gVBJqBhYUzb/gRptoanxF7bStONyg=;
 b=LSaH4ejVDpFyS6CC2QhirgoXQqKb48i31WIEByK978CJghibxyna27bw2g3PaT3aQNJvTnFl7W87A8EE+Ba3a8GRN7Cd5qFjMLUac/WnVFWZPtfHXaH5nI8j3P/wdEjcE3s2J8CxKqqyiltq/HoySeF4DO+4BFv5ywohT3YrX28=
Received: from DM6PR05CA0054.namprd05.prod.outlook.com (2603:10b6:5:335::23)
 by MW4PR10MB6440.namprd10.prod.outlook.com (2603:10b6:303:218::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Fri, 18 Sep
 2026 16:10:20 +0000
Received: from DS2PEPF000061C4.namprd02.prod.outlook.com
 (2603:10b6:5:335:cafe::8a) by DM6PR05CA0054.outlook.office365.com
 (2603:10b6:5:335::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.7 via Frontend Transport; Fri, 18
 Sep 2026 16:10:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF000061C4.mail.protection.outlook.com (10.167.23.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 16:10:19 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 11:10:03 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 11:10:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 18 Sep 2026 11:10:03 -0500
Received: from [10.249.33.128] ([10.249.33.128])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68IGA3tR2005509;
	Fri, 18 Sep 2026 11:10:03 -0500
Message-ID: <ad52a32b-c804-4ff4-9b9d-191320876310@ti.com>
Date: Fri, 18 Sep 2026 11:10:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master/wrynose][PATCH v2 2/4] recipes-multimedia:
 Add PipeWire bbappend, service and config files
To: <j-sahu@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20260916160547.1287287-1-p-bhagat@ti.com>
 <20260916160547.1287287-3-p-bhagat@ti.com>
 <681846.1789647419422393550@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <681846.1789647419422393550@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C4:EE_|MW4PR10MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: dea6a17b-7d51-4377-73a4-08df159f563e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|6133799003|10067099003|3023799007|10063799003|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	lVIIRISQ3tFZgOWGQpPs87FGVrHPSgcSty2vXkuFIMgKzfFX6yd1W1g3TzabzkKXu0eR9KB03bd5AzhLUpENOiS+vsK4RSLaS3rZH6gRBxTYeArON58B/M+XE+CHTY2bC6TsYNQ7bh5E8mN0iis7P+nMOcetfBG1lBYWVR4aKJ5eTs3cjG8KljaGc7Xoqm5kACMqJ9XqlqQaJtLJsJy00q8jMMxccvcUsa20fgQ4NONBqjvij80WVRIl+yjZ9iXiQe+PThke8lTAn7SXa6Bqhkn0lVvtkgoz2uFLHfj4R3fKEtZWVCC0le7Yis0H9hP3euEtux2AFbnqDjyQd0G0dOwgR2OK7RIcc2Mh+Ami/sHmbvP0BI/nTFHgh9/EAjKQehL4xKc9JPDmQKThBZGTwndmG5WgWqaQd/1XYVbeoRqXbKm3EjKE6miPIQt3isqFD1Fj4LHexi9dGJy/oklhu3Fg+zFId3cwG4JpflmYWZo3/xPEhDsZqzyKpvhJWyC6riLUtIm9sP1LM7SuEvxSGtvXa2EIFX8/5vdfTwLMQcFAfMMqoP2MPY/665swrgwxGqP4EOHrn+DoeZ87VoVU5sXtbr3gYVTwm52V2JdSN+OHCxcMrI5h7jL9oWusuA0A81yFnyujeEMo89t60DMreD1XVcQYfprQQYAqcuW+/tRJ3KCwE+VZ5Qs01ukMwqY9pkrhcH0pauscU2Oe6mFjrQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(6133799003)(10067099003)(3023799007)(10063799003)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GawosPJhw2lO4+Z+zGZwJTkzSvB6sith7g3neqSirDCKn27OLaWJG3L5e4SJJ5CbDGuzJkCYPVBXEKd3jlAyuI0lgXLrA/zQVo4zOlkXNOC9/YEFiTwypmEcNHI1jYiSp10bEqUG4tZRhPrLt1o66geA27bifxZyOuBXQG//ZcprwVOBQXqDgxpXhiGMdh2ul5rO1kanG0q8ApLgPFbzuH+mlXKi2nhXpeL0NJS1fPrwqVZzYPPgGNeh06O1eFeL5cOh7CVHdz+QkIJPchmdrHDBuVZTAzGMlh717KB2R7lZ09ZJ3Rd1aTe3naagGOxt/e/Wxyl2HRgFCqub6BYSfmA0MeHtGCeGPbRgtSKMjFvtw1wKP/HjwlG68xqyqe2PNbzZrhP751lMEZ9wgSo1NWK8ut3l0H7Kzc4KUCrgE7CEEnc78EUudF3D+7j9M3DX
X-Exchange-RoutingPolicyChecked: 
	IoMtfxdM0GMAYEXWkM6DnYof3OBr5/ZQ1K3R+cucOXTDZcWg8uJvYwqEqDgvBmL+q/yJKiOio1ccCOem9cE+ErpxKfFzrd+BLoYE9WAxVpJopMETdmYiBYOA7NWhyLhaP1krxB8P+1W2kI+X6S/YowhkxZyovXoR/DkjTq7g9gIW/TCdaqBGu9b3iZlG1hH/NAQCtn3ODqMj5imfIuNb3tjEcaxCPETfLJwy5TcFjJ0Lpdl67QHvaG3oQ/xxwf2LkpMSFbggLSAsN3LtZmtjvxkjG7Z2xzccpWMdRXEkjzAlUouXtnB7uZDKZuiv8A/wOxgji91saYnnl4zYBa2QRg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 16:10:19.9816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dea6a17b-7d51-4377-73a4-08df159f563e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6440
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIzMSBTYWx0ZWRfX7nn4iRMFsF64
 7WtNmsBgkPXTye7A4oxj/Ty4oGQZGbUfsi0lAupThQPfciqLnHmaBYSl9hx4hZe/VpLSjt6/Xbk
 FVGVlfn8zc97y1OJmp6bnl1YRkdJm+w=
X-Authority-Analysis: v=2.4 cv=Cswq4X4D c=1 sm=1 tr=0 ts=6aad6275 cx=c_pps
 a=TuEuCTxUJaX1tclN0RLokw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=-lflLcAE-tIARBaXaT4A:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIzMSBTYWx0ZWRfXxkngWYniHo2k
 uJ6caW5ZUAOgFQZBGnoHFtaqLRsxO2aw17PZ6JFK9EOIBFdjX1k4MBjUJ39Ny44NBeSx4JkGdrI
 XzoWrcf+EmoeS0MuWPi62e5qRmLQ8qRYw94AMbY67f20gxKiGrLeKTbiVFBKUGc7YLNLdr8bRIN
 8WF0GrDm9PzYMJwlaATm4WGOS27wDeIEyyC0isNPC6DpMlS/e+tHQZpQc39fJ2u50c1JP6uELFE
 hPM5QFIJmk7jnaRP1nieVAMXQ+b0U1jTwfmgT5dgf3V7Mzy0TEVJqIPzG8wV68I9vq3jK5i4J25
 7pkQ/pdJtclQFMAz9oVUyXEBlzFLcq/KpnAU+aKlSykg2Sy1fIbwfT8Jc+cXm5qIVcic6AivOCU
 9XAaIqAZU2HExWg2CWJm4gnNFCjyI2+qslvncbDpH34iDznDoaM4ttBMZcUPYjvM7R11kGWpSx/
 KEeHpqCZVVMaHhio44w==
X-Proofpoint-ORIG-GUID: g1tWJoGDgmX68euvYn5uSRpVxn-CC4NQ
X-Proofpoint-GUID: g1tWJoGDgmX68euvYn5uSRpVxn-CC4NQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180231
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Sep 2026 16:10:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17685



On 9/17/2026 7:16 AM, Jeevan via lists.yoctoproject.org wrote:
> On Wed, Sep 16, 2026 at 09:37 PM, Paresh Bhagat wrote:
> 
>>
>> Extend the PipeWire recipe to add platform-specific ALSA configuration
>> and service file. Service file added to start PipeWire as a system
>> service with proper socket dependency.
>>
>> Add sink and source configuration for 8-channel audio playback and
>> capture on the AM62D2EVM as the default configuration is 2-channel.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>>   .../pipewire/pipewire-arago.inc               | 28 +++++++++++++++++++
>>   .../am62dxx-evm/90-pipewire-sink.conf         | 17 +++++++++++
>>   .../am62dxx-evm/91-pipewire-source.conf       | 17 +++++++++++
>>   .../pipewire/pipewire/pipewire.service        | 26 +++++++++++++++++
>>   .../pipewire/pipewire_%.bbappend              |  4 +++
>>   5 files changed, 92 insertions(+)
>>   create mode 100644
>> meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>>   create mode 100644
>> meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
>>   create mode 100644
>> meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
>>   create mode 100644
>> meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
>>   create mode 100644
>> meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
>>
>> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>> b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>> new file mode 100644
>> index 00000000..6545c364
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>> @@ -0,0 +1,28 @@
>> +PR:append = ".arago1"
>> +
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
>> +SRC_URI:append = " file://pipewire.service"
>> +
>> +# AM62D-specific config files
>> +SRC_URI:append:am62dxx-evm = " \
>> +    file://90-pipewire-sink.conf \
>> +    file://91-pipewire-source.conf \
>> +"
> 
> Is it okay to have AM62D-specific PipeWire and WirePlumber configuration files, scripts, and services
> in meta-arago or set somewhere else? Ryan/Denys any thoughts?
> My recommendation would be to have a more generic/runtime-detectable configs that is device agnostic.

That's why I keep asking why we have something specific for am62d in 
here.  If there are other ways of doing it to make it more generic then 
I am all for it.

Generally speaking, if this is required then it is ok.  The other way of 
doing this would be to have the distro add in pipewire support and then 
move this specific change over to meta-ti-extras as a bbappend so that 
the platform specific tweaks are in the BSP repo.  That way if someone 
wanted to use poky with pipewire then we would add in the needed tweaks.

Denys?  Thoughts?


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

