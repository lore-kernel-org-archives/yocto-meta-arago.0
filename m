Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA63E9A03B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 05:50:39 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6285.1771393836559141508
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 21:50:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=reyGLbic;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.12, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5AIsFsB4/+kLE1i2q4rdqF3LO2WOT/kADge+0AgCzirDHl7wUKM/uEZrOdYv19q7cuS1E+SEun7YABwz/aIVRwdMLTb8fXkIveCx7Uv/+loazy5I9caoKj5j3wj8kvC/eiptU/ucrJL3+uVdXzaJaHPnL59JlvYSk8Kkij1WYNS3C/XdJxLpKTvKtOcZ3hRJkVUmIMEN7QndVsxygf2GxOpS2rgHv3Ws4WRun92CuMEaf2tkkXkDcML1xwWiWWf14e67CexVdORc8YIrjz+Cby2Ovg1mNUEVT4EPvvRaH4kZIZmNk3nAT44Bw6N5u5qIP7UnWF98j/Xf83Qgxt50A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXcPzyrJT5DR3G5WH7vb10fXVfxnYtKevTpmch9ia3M=;
 b=yuOX2GM+YsQBrOfs2bZNFJIM1vIr8KN7BrDiKZV1IoNHdcZnAK5dFq8uqsxkdED6GsYrzGo57MSA1p5DpZXBw2H4EZNl5fJ6zqIRE4kCCbgLMIzRyiZsn6MmDakc1914gkuZtcKQz4zV+I2VauPnOqqwOGSzt8JZIVLaw/wYVQIg0SL5W6IYoGK6gyFgwGyMGyvKbi+w+fA2lONUJstoFQZuwhg5bKD/aDGr1tVvbGtBFTFpbEYwL3K5p9xsFfhkg3JYP4Dc6reRl8oBDl23uhOnggF8y9CvffwjsgwFfpBqc60QvGlq7yjzgKbDfDbyIQ1QI7v2UW0uAy4Tef+U7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXcPzyrJT5DR3G5WH7vb10fXVfxnYtKevTpmch9ia3M=;
 b=reyGLbicVX5B8DVSQGlPF9kbWkNcFnNkA6uaJJTlKpLVskVEHO40Qk5EW3beutSSR6Rjwlqe8l1wjDquomzS1nBEWZtlqTBQhFyBdsrLVuR/zmOi/ux+FNSwdTkCvAMIN/DK2SHNOidLTYKgVEoTZyLiJ0wog9dODWCxHMGLaxY=
Received: from BL1PR13CA0010.namprd13.prod.outlook.com (2603:10b6:208:256::15)
 by DS0PR10MB7453.namprd10.prod.outlook.com (2603:10b6:8:159::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 05:50:34 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:256:cafe::9) by BL1PR13CA0010.outlook.office365.com
 (2603:10b6:208:256::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 05:50:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 05:50:32 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 23:50:32 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 23:50:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 23:50:32 -0600
Received: from [172.24.233.249] (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61I5oTkL4075590;
	Tue, 17 Feb 2026 23:50:29 -0600
Message-ID: <7be0bbb3-3e5d-4f92-9133-56cfc243d10a@ti.com>
Date: Wed, 18 Feb 2026 11:20:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][RFC PATCH v2 3/3] recipes-core: tisdk-default-image Add
 pipewire audio stack support
To: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>,
	<denis@denix.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <y-hegde@ti.com>, <khasim@ti.com>,
	<j-sahu@ti.com>
References: <20260210155201.3029549-1-p-bhagat@ti.com>
 <20260210155201.3029549-4-p-bhagat@ti.com>
 <5c16ef77-10cb-4a84-8558-519ba58e9406@ti.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <5c16ef77-10cb-4a84-8558-519ba58e9406@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|DS0PR10MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 96514d48-bff6-4d86-ab14-08de6eb1a163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/OOWEXhwIGOpcmBZ6Fb1fZukrkKoHiBOhBkmYSBQTvwtF44pAJN4gFyVyPQT?=
 =?us-ascii?Q?j6BtyzwSVmMrZleG9CAYKUsvu+N99UHNjLbjs6/WvdMykEAi/mwGIs6YL/W8?=
 =?us-ascii?Q?0ILNdPW3jMw7yalCxeyQ84jlYnhcOUz07Wi1576wndgqfavPIWFu3Hd2DRTo?=
 =?us-ascii?Q?YehpXF8bBsLlHZpky2EJi4KOaetHpbfiNhzmspEMV8ZbcPfGPSELHqhC6JFb?=
 =?us-ascii?Q?yJk/2SpvUCEmZdEyADnucWEeIi3ylwi7jZBkRXtKRsPSt7Sun+OnMeVgSJAT?=
 =?us-ascii?Q?TJDvpF0rEK/R90OZcyYqkcM3O5CYxTJbHOJzivwUcCL0AtoPbU2LbEzZIZ13?=
 =?us-ascii?Q?cRCfqCnRvIR2JsigeYQC9PJtcDmYjGJdOTVSanhNVGhTnfWTlc8WeWEqWVRf?=
 =?us-ascii?Q?erp5Avhh5PmC7loodOKu9As+k9YjKHWKjpQ8DP3CGum89kBNyqi0jkzu5j0V?=
 =?us-ascii?Q?+u2YzclvDE0TvAsLZGBJjUso2jlSA5Vqic5+7gezYuup2QjqCqA+bkEgjyyA?=
 =?us-ascii?Q?aBLUBbsoJp/n9mCGwKeCkgq6j+5NfQkcYzAaODn4yXwzi60VxfSXtqpzvbqp?=
 =?us-ascii?Q?Uv1aC0sqVdZukWJ1mU+IRQ+AYPAolBI5hHVNSog6xl2DvVDOqbm+F/avBxoM?=
 =?us-ascii?Q?htXlzI90pH1Pod8/m4mlxoqflLusWOIsZp1AcHAjkNIcPpE08rcEDUXcaj1U?=
 =?us-ascii?Q?rReLcwaC88fPcJKi+jX6NJf/kEkg5oBP8e/vmdS45iRk9DdZV+O9DXe+vMw1?=
 =?us-ascii?Q?qaMJmQ4tc2GTGPIrtpzpbzyDl/QKBqZqSb4gVG8v4mxgajrdhD9QubNs1PdY?=
 =?us-ascii?Q?WB0A0uw/KSFL0tWrE4v8lfO9xQB/qfqPI4qJyRCMnlhV4pc/b0swe0Hwwmds?=
 =?us-ascii?Q?Zbx0sGHHKUzK6tqvCpsl+Eqyi3py4tMtSZrJyiZtfTAZqdSv4LDyTFzv+1jy?=
 =?us-ascii?Q?Xvqvt8Lu69p3lrN4+h6QAn/2Ti99m/yl2B053LtjfrqSAKbGStFQRtbTk0QJ?=
 =?us-ascii?Q?oY/r0iGCHXbyLuEJA7VWv4dnZJEla/ibljxYdM4MOeoXER0JCfRQE7l0ZV3U?=
 =?us-ascii?Q?NevYpgbvb+TC6ZMKqo1P5MCfVvthjdYnK82KNVmH584cFYbG1Wefg3pviLN/?=
 =?us-ascii?Q?nMcrKBN9zTIuX13EfPM1zvZ0hGFPx/niAW7OeCRPurhhla82utacn+hGdFVb?=
 =?us-ascii?Q?UhjqUX45j2LoQwKD3oMTv6RQTGTTSfT+isp7S8blsuj2JXHWxV52mAShKH8v?=
 =?us-ascii?Q?C1US/JOMeYka69yPPEfHa6YFRP5jIlh25yyepBKi9HEluLGxGxc32ofLC1yv?=
 =?us-ascii?Q?99U11We91mPjC4GUTTSLWtutWjwKdxpG2RaslBSsdW2kBUHSAXNzZPiJdTAe?=
 =?us-ascii?Q?uCUHvuPHtKPT2g71qPmWOVS98VAmCFEUteDp0+LH+DGKR1PSc0R6DVO7d7R1?=
 =?us-ascii?Q?w/GV3gVknZkEqgUowQnUdFuKKAQu8plFGlcWXhZgZugIL2gredelq6m1XkWJ?=
 =?us-ascii?Q?Khwe62wfRc8rTvgtJtUUkr/lvu0i6scNT4GsBDExGiewudrPV816DyhEMW+Y?=
 =?us-ascii?Q?vkx4jpPuVoh9Edug0zm7mwgOUAAa2ob1VERqAYj31AAs4ZdFc3Ijl2+fDulO?=
 =?us-ascii?Q?UPe2OgdpXYE7wmRZHaSct5fxUgF8sye/fmYpTUy/7lcY8K95Uo40RXdY3hnv?=
 =?us-ascii?Q?SVsAMA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bhJckTQo2jbwfa5SjysZ+f7nlPzITf7znUgk6uPd+ccjE05RGyb5AvqkDaxz3MWGupoGrcG3NW0V+5NTvQIZu9pBNVQoEVY8d7b/FmVO6uxArXlXP4lISMpE1VXOgBaUNHb2QOBIw9saisi/nVSHv7cnDPoH38jmHXJUnAgZ1pNWW5E+0T1D43V8t6li8MJ0xUO0v5YIPJSdNX3rV/GTAoRKc/owpMfJm0zYW1nw4M++15IVYUw4078349u1Qz7CpMKBKFFXKuMPSeRuOYaA6itnDzX1z9MVAuuvjLbYtviDX3emhGw+wch4eWsO+4Iako3Y1dm6loI/BwYvMExptruW/m/gdIBqDuNKw4pOeLHt0b1OQedZO7+Oj+X6qxUxJNTaKfV7Tq6z9NJbPBjmA86FbAqaeJIhJXFz+eZa13TIlcRm+fRcCoyO3qUrd/Kk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 05:50:32.7845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96514d48-bff6-4d86-ab14-08de6eb1a163
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7453
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Feb 2026 05:50:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17114

Hi Ryan,


On 10/02/26 21:34, Ryan Eatmon wrote:
>
>
> On 2/10/2026 9:52 AM, Paresh Bhagat wrote:
>> Add pipewire and wireplumber audio stack support for all am62* devices.
>> - Include pipewire core components and tools
>> - Add ALSA and PulseAudio compatibility layers
>> - Include wireplumber session manager
>> - Add GStreamer pipewire plugin
>> - Configure pipewire with proper modules and plugins
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>> =C2=A0 .../images/tisdk-default-image.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 23 +++++++++++++++++++
>> =C2=A0 1 file changed, 23 insertions(+)
>>
>> diff --git=20
>> a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb=20
>> b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> index 27c5671c..c442e2ba 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> @@ -43,3 +43,26 @@ IMAGE_INSTALL +=3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('TUNE_FEATURES', 'ar=
mv7a', 'valgrind', '',=20
>> d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docker \
>> =C2=A0 "
>> +
>> +PIPEWIRE =3D " \
>> +=C2=A0=C2=A0=C2=A0 gstreamer1.0-pipewire \
>> +=C2=A0=C2=A0=C2=A0 libpipewire \
>> +=C2=A0=C2=A0=C2=A0 pipewire \
>> +=C2=A0=C2=A0=C2=A0 pipewire-alsa \
>> +=C2=A0=C2=A0=C2=A0 pipewire-alsa-card-profile \
>> +=C2=A0=C2=A0=C2=A0 pipewire-modules-meta \
>> +=C2=A0=C2=A0=C2=A0 pipewire-pulse \
>> +=C2=A0=C2=A0=C2=A0 pipewire-spa-plugins-meta \
>> +=C2=A0=C2=A0=C2=A0 pipewire-spa-tools \
>> +=C2=A0=C2=A0=C2=A0 pipewire-tools \
>> +=C2=A0=C2=A0=C2=A0 speexdsp \
>> +=C2=A0=C2=A0=C2=A0 wireplumber \
>> +"
>> +
>> +IMAGE_INSTALL:append:am62dxx-evm =3D " ${PIPEWIRE}"
>> +IMAGE_INSTALL:append:am62xx-evm =3D " ${PIPEWIRE}"
>> +IMAGE_INSTALL:append:am62pxx-evm =3D " ${PIPEWIRE}"
>> +IMAGE_INSTALL:append:am62xx-lp-evm =3D " ${PIPEWIRE}"
>> +IMAGE_INSTALL:append:am62axx-evm =3D " ${PIPEWIRE}"
>> +IMAGE_INSTALL:append:am62xxsip-evm =3D " ${PIPEWIRE}"
>> +IMAGE_INSTALL:append:am62lxx-evm =3D " ${PIPEWIRE}"
>
> Why are we doing this just for the am62 devices?=C2=A0 Why aren't we doin=
g=20
> this for all of Arago?


Yep the plan is to gradually expand this to other platforms.=20
Implementing this for all arago platforms will require OOB changes, also=20
users may or may not be used to pipewire and more familiar with=20
pulseaudio or some other audio server. So our approach is to first=20
provide it as an appnote specifically for AM62 devices, then gradually=20
expand it based on feedback.
>
>

