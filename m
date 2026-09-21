Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DBEC982DE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:29:12 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44065.1789975745385809960
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Sep 2026 00:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=qnIlu0hA;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=KFWIlfVx;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68L7AXo13131394
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Sep 2026 02:29:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ar9JkgI4A4p3tRgqUYz/hiNTx/zfZZ6C3mKKhOcEc
	yQ=; b=qnIlu0hAEeO2ug7Z1JIbmD4D97WhndjWT9i+8KBrlZitClPze7x+kdNv3
	wQSkMSHKWJjBMUtPa9PHNkWE6EMqUBC6vnBd61fD/qs+tj9ly0ooe7OHT1YoL2au
	a7z87TgloQkaH5UfpQlsUBfmli45tdOycj3Sf0knHTUq3wivDbI3oDTS25AXKsPo
	nMmT17vBZHjA/9wlg/hZZt4bUXd0itdshn9tgRUs4clgJta9ei3aGZS5kml0De6B
	juVKH3rSeVQXSbDdPPgEsN9uIaSEwYHtO+cOiw4hSg80nUtwJdvUA+8mQwFJN3Ed
	Za8d+cnk+9AV6IixTLg1EYo1+AUEA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011036.outbound.protection.outlook.com [52.101.62.36])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gtbdnd092-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Sep 2026 02:29:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agKxfZIev2cXNUEePz35nA1xVDYcrE7DZo5qAsr+svItVFiOkccQL7BLSdUtaNGg7PWnK2nVetkyY0S7bkxlqei6i8wHbhkgUc+NakpiuphGT1CIS5NvURqFp3juB2tumVxHvP1a1Elf0j0J8+GRih7ypvP89xqe+1HqHhoG823u/XtM+bZ19ud56oHlLzcBmua+D55K1wSWIuUz36gaN2nYi0ishCbt0EQJ3f51z5uwyENQlRZiyC7+ZwkALK+jfSAKsNnD03inBEW7bKbyKezBzAxFOkB6E6R1qvjAIyHm5culV3nJUsH/AIfNpQ4XQ8IqofeHBVnKh7ELCycIoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ar9JkgI4A4p3tRgqUYz/hiNTx/zfZZ6C3mKKhOcEcyQ=;
 b=o+nJ5dEIkrJijXv5jKdZk6kA0Ew0LfHsrUONwmTHGYI7YTQ1dG98+RKRs3KEELFRCl8eZTlI/RCySG1h9aFtskhHt6T083PJuEaBZgHSCZnrXl37MGPusozyxG7a/zEk8o6vqtmHJIhDKgtp5G4G/sVY6wlglsfklGcn4sI9+XIlRaPUhUgsCk9s/d3/tDBWIe67sg5lf/kpXjsbLPbn8eyyrscEq/AbKJ3pxK25nvPftmcgDuz9NQAf0QsMBsXSk7SCm/X/gxgD2wKymbTazKORox1JuJCrGn+6AF+shYrozy8Q9timJ4QNov+pCiAtnntZQHBqE+bA+BO4d2+70w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ar9JkgI4A4p3tRgqUYz/hiNTx/zfZZ6C3mKKhOcEcyQ=;
 b=KFWIlfVxgXkAQHJCUBfYIDmB1ZoTPreU0u96bmGAT79OQXXUfyxCV7gl1aHAKSKhmDifrz97KPQF72HewLK5bgLpExmWmCczw5NxSeT44e7e1qjc047N/PL45NpPqR3YlxUBjUG2viECC2M+DsaymN81HbbZk4zKFrHwGWp5yK8=
Received: from BN9P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::35)
 by DS4PPF92DC283F3.namprd10.prod.outlook.com (2603:10b6:f:fc00::d32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Mon, 21 Sep
 2026 07:28:18 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:10a:cafe::8c) by BN9P221CA0018.outlook.office365.com
 (2603:10b6:408:10a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Mon,
 21 Sep 2026 07:28:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 07:28:16 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 02:27:41 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 02:27:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 21 Sep 2026 02:27:41 -0500
Received: from [10.24.52.241] (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68L7Rd7Z1586903;
	Mon, 21 Sep 2026 02:27:40 -0500
Message-ID: <fad78699-7557-4d1c-acce-083c9fed03be@ti.com>
Date: Mon, 21 Sep 2026 12:57:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master/wrynose][PATCH v2 2/4] recipes-multimedia:
 Add PipeWire bbappend, service and config files
To: <reatmon@ti.com>, <j-sahu@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20260916160547.1287287-1-p-bhagat@ti.com>
 <20260916160547.1287287-3-p-bhagat@ti.com>
 <681846.1789647419422393550@lists.yoctoproject.org>
 <ad52a32b-c804-4ff4-9b9d-191320876310@ti.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <ad52a32b-c804-4ff4-9b9d-191320876310@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|DS4PPF92DC283F3:EE_
X-MS-Office365-Filtering-Correlation-Id: d359d2bb-fb1d-4678-11c8-08df17b1e749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|6133799003|10067099003|56012099006|4143699003|22082099003|18002099003|10063799003;
X-Microsoft-Antispam-Message-Info: 
	qDFCVKotOQKJxt1aBuTHAXd8C3/AliT2UnPmaz3ooYnyyCTy/T2+4ZvVI3itN/qXzOTrOKsV+7pLCb9CGEvanj8LoZkT7icuqCO78/Zb90Cg6cpGpbvYYkI+NXMAwf8BtHatgy7uAibVM5wFcpgPvjPXoiiLSyLbQEkann2PsO4lMREYfzttkeC1jCMnwdN7uU/ScHgBouFTQlYrONO7OWhNKz/P1B9Lc6D5W9Eo/9010akOQHERbEojlJ/Pfh9RvFwpQ6gxY2JK1AR4pqoqowtFNPrm1h3K0XIWBuGaykyPgWqlOKsvtpL5g3zzek5kFkg5Fhn1nHXUAAK79wEiEzFSdftCM11mSMvV8enCmFnCAC3quAvorJKTMI7g/Kb4hSjjDGAmhggap9UEzhOMGATupef5raYj9iUl1YHFrp0+d0pVWztKhw6zsewa2Ku1XuFpnYxhiRpmbYyizuwbZXXL8PkgxP/5naFxcpS4XIyZtvdDo/x6ddibLNY3LwVFMcXAswdNBjPZu1j8rFw5rYVxXShpAi+Cvl6gBSRDNB3YNLD1cknWKrzgB0YMLpdYVGq9PgxEQ2/T77DWCGCCtFwzkI8F0BTign2tUkaaHn1IqvxNj7X0FCek0q6U6uIwa2RMYp7L6W48WrsmXt4Q+l9hZR+8Pcbu1YWEsGDgvVoiVOcm8lCbl6xwaP+gJl0+QDHZAB3PTjG4kmM2iIV7UA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(6133799003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(10063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5MlAmo1o8rpLkh7fLCALQ+gqJsQj9I47Q1EwKerkqJigM0XDt1Mhgm5vCHkrxZf7Nul7QkXYZ2Tq9083rOxxFClVExus8QLmo6nEV84YoSomE5JYfqesdy9m6oC8Fn9da9VK7E3OrpxV8Fjt+5srVfsVZA1zZcuYa3qIoR/y/0xunKtOM8gszu/vgqpksLZxnT7f+qO8KSTZpb45njG1PU025XQBRa7J5td9swXLEJnWerUWvI3ohV1cib7CbDrRIJhpreH9+cTwgF9FqOC71Bon66ZyP3Xao94m0/5Ko4CRZkJ2j87AIZxoQMS5X8DDwJa9eK4LahkwQX/U33uYo0l/Efxxo1mItZ2KV9Z4uBLE/v+KaiH45Q4C7fMAy4HKm7qoM0p7aAmrWc8Ysw0r58XLXNQVsNd537FD1vSmmzubOgDkyQZMLX7hXlPGqHDk
X-Exchange-RoutingPolicyChecked: 
	eo1OhNAZkXoIZI9vtTdxr+f3m2KN7yoT6aY15aaIW8wz+z0Bt3RXCayQuxe52JkjrrDZeo0G2YYnsv/GkYCmLG9gw3qRODiCreH+STq8yg86LgKYaVwCjkSgeS66wOqE/dTnuMccl0Jy0mZDusuziPsM/mEiFafryXbSTYt2F+HXW6RXLnbKrgHg/aOdf2+7zA2DSKVbPZLT0ytnnZ04nPy9hm5Y6CbtSGwzmfx7q/SQrxBw1PWJFC+CpKPd9BbVHxkxwlMI+9LrAcTkoJnV8KFPr5+9nlZRjSzKl//UYV3hYkhXOhi8Fl8nyXucNskf4Xf0H8YyKUcrjGoN4JOglA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 07:28:16.5709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d359d2bb-fb1d-4678-11c8-08df17b1e749
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF92DC283F3
X-Proofpoint-ORIG-GUID: kCtYLgsrmh_Rs91VlQYRusEH_VGQ8Njt
X-Proofpoint-GUID: kCtYLgsrmh_Rs91VlQYRusEH_VGQ8Njt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEwNSBTYWx0ZWRfX7O2CeF+AEs6l
 SxNvlr7Vk+0HZV+OPgfegHGy21K2vhURvaLGyHvEAXqbcZ4wt8rVYykEQw9pAP1B/4WnoLkcyDD
 LpfdngwtQDNcwxh7uJej0AC4I1Wm4LoBOhgxMD9wQhsLl513bGW0z0QoOAx7Tney8P3aZ0EG/oT
 zuBJyt2ywTGT9pUUe+KPEIhxRrBy5zv7+LQZpfzfhmY6vqKtD/blNM1IORELNNgahTWRzoLacf0
 6aAjU49/V2O1/tJYoTSIqDEUr2LfCcgl81B5jkwvweTkTJjfMn8BnnHuzkDifvTtoVgZnAem1i+
 7t9FR46eIUpE8A/ubO1Qsi+AIawAryXB1v/jXsWFnvOlzQ1kuZsnFcYfFl3+gBisGAKvSd37kRs
 svh0EHOiFk5zCoo2PxhEFvahycg61cIcdcoIuhbA9S8Kp30XNgCrmg2O5o5/EiYfbDTxiMWbMDy
 huFIZ+TGRFWFg3kE5jQ==
X-Authority-Analysis: v=2.4 cv=bpDZl0ai c=1 sm=1 tr=0 ts=6ab0dcc0 cx=c_pps
 a=QuE5qaevU/mtxJv9VH5uOg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=x8-8yM4xiXJm7mO-kQMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEwNSBTYWx0ZWRfXxmPXH8TGtEsv
 wRGQ6GvfurfkdvKtNvzAnN4KaesP8c+rZ4wgmUcgRfvzmhQ/rK422oMqzlh4n0mgM+ZG075mFNV
 5WGlrAOCPFJ3Rfw5hKKDjw9FfXRkptE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210105
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0380145.ppops.net id 68L7AXo13131394
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 21 Sep 2026 07:29:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17686

Hi Ryan and Jeevan,


On 18/09/26 21:40, Ryan Eatmon via lists.yoctoproject.org wrote:
>
>
> On 9/17/2026 7:16 AM, Jeevan via lists.yoctoproject.org wrote:
>> On Wed, Sep 16, 2026 at 09:37 PM, Paresh Bhagat wrote:
>>
>>>
>>> Extend the PipeWire recipe to add platform-specific ALSA configuratio=
n
>>> and service file. Service file added to start PipeWire as a system
>>> service with proper socket dependency.
>>>
>>> Add sink and source configuration for 8-channel audio playback and
>>> capture on the AM62D2EVM as the default configuration is 2-channel.
>>>
>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>> ---
>>> =C2=A0 .../pipewire/pipewire-arago.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 28=20
>>> +++++++++++++++++++
>>> =C2=A0 .../am62dxx-evm/90-pipewire-sink.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 17 +++++++++++
>>> =C2=A0 .../am62dxx-evm/91-pipewire-source.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 17 +++++++++++
>>> =C2=A0 .../pipewire/pipewire/pipewire.service=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 26 +++++++++++++++++
>>> =C2=A0 .../pipewire/pipewire_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++
>>> =C2=A0 5 files changed, 92 insertions(+)
>>> =C2=A0 create mode 100644
>>> meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>>> =C2=A0 create mode 100644
>>> meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90=
-pipewire-sink.conf=20
>>>
>>> =C2=A0 create mode 100644
>>> meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91=
-pipewire-source.conf=20
>>>
>>> =C2=A0 create mode 100644
>>> meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.servi=
ce
>>> =C2=A0 create mode 100644
>>> meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
>>>
>>> diff --git=20
>>> a/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>>> b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>>> new file mode 100644
>>> index 00000000..6545c364
>>> --- /dev/null
>>> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.in=
c
>>> @@ -0,0 +1,28 @@
>>> +PR:append =3D ".arago1"
>>> +
>>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/pipewire:"
>>> +SRC_URI:append =3D " file://pipewire.service"
>>> +
>>> +# AM62D-specific config files
>>> +SRC_URI:append:am62dxx-evm =3D " \
>>> +=C2=A0=C2=A0=C2=A0 file://90-pipewire-sink.conf \
>>> +=C2=A0=C2=A0=C2=A0 file://91-pipewire-source.conf \
>>> +"
>>
>> Is it okay to have AM62D-specific PipeWire and WirePlumber=20
>> configuration files, scripts, and services
>> in meta-arago or set somewhere else? Ryan/Denys any thoughts?
>> My recommendation would be to have a more generic/runtime-detectable=20
>> configs that is device agnostic.
>
> That's why I keep asking why we have something specific for am62d in=20
> here.=C2=A0 If there are other ways of doing it to make it more generic=
=20
> then I am all for it.
>
> Generally speaking, if this is required then it is ok.=C2=A0 The other =
way=20
> of doing this would be to have the distro add in pipewire support and=20
> then move this specific change over to meta-ti-extras as a bbappend so=20
> that the platform specific tweaks are in the BSP repo.=C2=A0 That way i=
f=20
> someone wanted to use poky with pipewire then we would add in the=20
> needed tweaks.
>
> Denys?=C2=A0 Thoughts?


Agreed. I could not find any variables, macros in pipewire doc which=20
could help generalize the pipewire configuration for all devices. Only=20
ways i see now see is to generate a config during build by either=20
specifying values in recipe or use a service/script and inherit whatever=20
alsa reports. But what if it needs modification (example AM62D).=20
Furthermore other devices do not need it as they work with default=20
configs (only support mono/stereo).



Since these are no doubt AM62d specific changes, I can move them to=20
meta-tisdk for now and keep only the pipewire package support in=20
meta-arago. Let me know if your thoughts.


>
>
>

