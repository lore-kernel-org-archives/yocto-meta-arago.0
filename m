Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C589E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 13:54:32 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12361.1771422859864174772
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 05:54:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ObmE4Jb1;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.10, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+Yj1wQsHEoa/DmpdIGPfxEYE7XmHU68DYEOeh7K6i4KCfwTFhfuRF3SH/1Mg61xPmGN4hywbQ8Hhez++qQiMPDErJEyWX5tYqxDzCxZ3T17d9oJ+R5zBndaMI2RhEvrNc5KtHMO0hcdw+cTql3SCwzEB0S8Ri5qQ6R+danpNg39vPi+HCLywpwCUhpyETRqAmuyMMMFcH6DF+N3XMDAawmJSd6Y57pXyC9chiVUs3SCfOh7Qnyq2Wk/zAkq44TiAfM18T3Y+7EgAcoX0wsfz+HH2Lt31KVlUI5V0thuZ6UUvjqS2d0QtWLUj/NLIO9kp0/orgTjCVH6b5ASPCy4LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbExF9NgGP66vabS20NmrOTn6q+oW7sG6IWxc/xDjow=;
 b=NVW9tvNNKfnsBmp6ftx1uYA6UHr7tH1IGdOxe8fdKvDHmLzOTyFBG+5JtoGrlTdUo8lbD1QIT3UzT659jEnQtYEr6Gd1R50ErhSf1id6JxaH6IRGZOkqJx2btmBGjs57FSkPJliGrw/AflXMtAoa2HN+ak38Ywt2ggIfJ3BdKDkemwzS0qeTWkQB8MvSfVSzyVUh8LxP+MTBIwRHMUh4pxY5vr+XwepjiCx7oJdvaJ1c/LTn/ZVx+1RIcJmOBMlpm29FdZKSOkKdKPzORTcSSzMV+66viJfyfI1rFwDnR29XxGJ6UMczLQMuPIu+Rg2OW+23REEL1lS2Tc7TwO8JOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbExF9NgGP66vabS20NmrOTn6q+oW7sG6IWxc/xDjow=;
 b=ObmE4Jb1lLhp0NB+X8/THuYRAszz1NjY7LhDrhMi/u7C2sZNJmbx5kdRKSORKBy4jNSbLIxZ1q47+qYXAzd7PvLCNQUNIGGhNAXLA8LyOPCXx8L4ck60RqaMNzNya1hjbDVlETCSy9XFhjWfUDGHOX3RvYsqe1pfKnNv4ZHWIxs=
Received: from DM6PR04CA0025.namprd04.prod.outlook.com (2603:10b6:5:334::30)
 by DS0PR10MB997649.namprd10.prod.outlook.com (2603:10b6:8:311::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 18 Feb
 2026 13:54:18 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:334:cafe::8d) by DM6PR04CA0025.outlook.office365.com
 (2603:10b6:5:334::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 13:54:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 13:54:16 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 07:54:15 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 07:54:15 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 07:54:15 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61IDsFID472504;
	Wed, 18 Feb 2026 07:54:15 -0600
Message-ID: <a489eece-de40-44fc-a896-21dc6b892b5c@ti.com>
Date: Wed, 18 Feb 2026 07:54:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master][RFC PATCH v2 3/3] recipes-core:
 tisdk-default-image Add pipewire audio stack support
To: <p-bhagat@ti.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>, <denis@denix.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <y-hegde@ti.com>, <khasim@ti.com>,
	<j-sahu@ti.com>
References: <20260210155201.3029549-1-p-bhagat@ti.com>
 <20260210155201.3029549-4-p-bhagat@ti.com>
 <5c16ef77-10cb-4a84-8558-519ba58e9406@ti.com>
 <7be0bbb3-3e5d-4f92-9133-56cfc243d10a@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <7be0bbb3-3e5d-4f92-9133-56cfc243d10a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|DS0PR10MB997649:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c9558b-2eef-4809-b75d-08de6ef534ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zcr7BpV16og0PjOy+ON+aTGfR15x8M8SlOqU6VOy4k8gT4qS797oGN34yAts?=
 =?us-ascii?Q?7cR6MgKjSBzCl8kpAbMS0kFHoQIcuF1vPLsgncbbtSnleQ10Cyk8C7fJ08hO?=
 =?us-ascii?Q?nfwEPx9di2vDIqtXAdnJtm0CUXy1SNPzEey3v+uqqnxi9vhN0Dppp6RiLvj+?=
 =?us-ascii?Q?Bp8Rz+Z65Avd99YgxxCqgZEjh6JyIZxvP0hgJZpd05isgnbnPjF0MJlpz3IX?=
 =?us-ascii?Q?M8PJpDQ0moGmVwkGDK0Hjty9UcyXRlQZH3odYtk4uiDsz5ZbNymn1y5ZIAoj?=
 =?us-ascii?Q?i1XKjNyY2DoB/bT+Gy6jsiGKqqN7vLhaSIT4UsRAUGgumqV5zO8wNv8VL38l?=
 =?us-ascii?Q?UhdGG5PLSkksU1o0wPUJkFP64Nb6AIFIFwpEC1ye9/T+Hda7QPq/ghFjNaRJ?=
 =?us-ascii?Q?+4nlGYC5S2uheMs6TiNjeDIBorQHna5+3sR/jlhe8+YxGCHvrtNCJN69bwIB?=
 =?us-ascii?Q?iA7JBtXfo3tNzer7xsdJwgnzats1qJkmZvM4JA2JS2UDyaxKjcCQiHHhpSTb?=
 =?us-ascii?Q?35yMElE9+KLtZN8r7gKo9KcNJNOfzBdIs+5XUv1UTt4ah3OQlXUc0Fp2cx2a?=
 =?us-ascii?Q?RROv/dFKOZ+u5qlJk17SOGRHMc85cp32HK58cNFiOcWQcMpfqrUbb7RK3tSO?=
 =?us-ascii?Q?jl23E9l6abbgdjEn5pIeiBbPgs2NULVqufjSzS56g9cnje8zLdGhPoREYqt0?=
 =?us-ascii?Q?Hb9wvpLpCpeVylgZ8aTmnqjxwgkQ4OAlgNwFn3Gjwhisa+aN5SChaXnJQyFx?=
 =?us-ascii?Q?Az2Y53abd6GUNf0yFOhDhdMjVyIgq5VoFUMayQqIzbIeTYW9nHfelrPRM7/j?=
 =?us-ascii?Q?+Busfupy0CLwQ10YX3zZRxH9VTFwnG3WzEQFx+QeHYJC6gbIEBZ8TGnOVhvq?=
 =?us-ascii?Q?rJFMTB+v+4P17lU5kt4WroEE3nqWtkcobvZI1icFMYfUN6gFf1ldxXp+PTKp?=
 =?us-ascii?Q?PcC6tqiRWkhQDRaHP84HYYYRuR95vunt1sQeTmw+leRVWzBrY/fM+kNkuz6l?=
 =?us-ascii?Q?1JptZC1NRB2bfC45N0FRbyZZk5BNu6lJhdNUyUqTtRsW1K2is1lT0aqDULTC?=
 =?us-ascii?Q?k7xRI2Ll4bw/Lq6kxBwGC6OLa2ScZjBnSISzk2h2pvv4NKJbxTult7SZl1+X?=
 =?us-ascii?Q?QUupmIssLgzAM2mLcsvjB1g4XlESsmVexbVgWuF+BSIxCCixi7MWjukCjbpO?=
 =?us-ascii?Q?RHCHUEdLZ9/ER82uZY/WoTy7YQXnMK5KcBZrikmMVGmmbOtGOBjuxnnOu9Bj?=
 =?us-ascii?Q?6qQoXXpAZt3iOdwr7PVPhBLM/wP0nHMIpLTKtzMiagKFZhSvd53lvpTNFc89?=
 =?us-ascii?Q?vg8b8uHzhJgDivLgK6ZTlVJDXAkR9DSKN2/P6O30kFLoZiI80TmkRNy2BsTY?=
 =?us-ascii?Q?Lfjczdui4KCaSxSWC2ptIr8vxXTaf/iJFBj28YIunBzbMBnNcpwoMlSiwluo?=
 =?us-ascii?Q?tcBT5E5YLXGvqaAhi6dY+ygTbGB/JlzDbY49lwX8uttbServDRkgsBQXrzXH?=
 =?us-ascii?Q?h2Nzv5JFOtDVJKhl7Zm8S4tbufdfaeTQJluf//Fy0moDGIcexhUlF4CTI643?=
 =?us-ascii?Q?B9E0uuWjwTeCHfmyrBzmIyI4QmWud5q367AvYu2Gw483C0v28UWhHT+18dhX?=
 =?us-ascii?Q?Dw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(4022899009)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2I+ndbvRpFFHTbfwJmGX52FxZL00CbHCx3LB0Jw07bGTLaytEZMhC5tH1ZiAYEh6oleKSp8w8SHIdn7CEsAzQBVhUimQH7jgfmAjQhZ2MU2/9H8Z9XYNKxoQJwMYy8cOW1+rzlJIj+2f86d43pxhbEnJ4CzuPIGylQ/uezd043EAKA8dWj8GKvYFWtpWJ7RHUvGHu6AEhXeWIAMv9W7DEalachJJycRiH/Q5J0XUUSMSpI7LhOsPmWnotZtmeJ5mbQt578TC/mMfjw/KuFl/EAdsXXeVgzXkxXKVlKn6/Ys+pkJFn3xg9nlSwIt3dx/UKO5CrL4zs1RIVHRcpIG5PY5mA6XWSpCd/o34s+tJFhrzl90mhe0hF7Eo5+F0rs3zON4jW+cvSw2RxwL6cdSr/Nk9vHXLMZ2Ori0ew5F1jPLIo5ka62AyRdd/NlMPLzUV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 13:54:16.7400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c9558b-2eef-4809-b75d-08de6ef534ff
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997649
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Feb 2026 13:54:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17121

On 2/17/26 11:50 PM, Paresh Bhagat via lists.yoctoproject.org wrote:
> Hi Ryan,
>=20
>=20
> On 10/02/26 21:34, Ryan Eatmon wrote:
>>
>>
>> On 2/10/2026 9:52 AM, Paresh Bhagat wrote:
>>> Add pipewire and wireplumber audio stack support for all am62* devices.
>>> - Include pipewire core components and tools
>>> - Add ALSA and PulseAudio compatibility layers
>>> - Include wireplumber session manager
>>> - Add GStreamer pipewire plugin
>>> - Configure pipewire with proper modules and plugins
>>>
>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>> ---
>>> =C2=A0 .../images/tisdk-default-image.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 23 +++++++++++++++++++
>>> =C2=A0 1 file changed, 23 insertions(+)
>>>
>>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.=
bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>> index 27c5671c..c442e2ba 100644
>>> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>> @@ -43,3 +43,26 @@ IMAGE_INSTALL +=3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('TUNE_FEATURES', 'a=
rmv7a', 'valgrind', '', d)} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docker \
>>> =C2=A0 "
>>> +
>>> +PIPEWIRE =3D " \
>>> +=C2=A0=C2=A0=C2=A0 gstreamer1.0-pipewire \
>>> +=C2=A0=C2=A0=C2=A0 libpipewire \
>>> +=C2=A0=C2=A0=C2=A0 pipewire \
>>> +=C2=A0=C2=A0=C2=A0 pipewire-alsa \
>>> +=C2=A0=C2=A0=C2=A0 pipewire-alsa-card-profile \
>>> +=C2=A0=C2=A0=C2=A0 pipewire-modules-meta \
>>> +=C2=A0=C2=A0=C2=A0 pipewire-pulse \
>>> +=C2=A0=C2=A0=C2=A0 pipewire-spa-plugins-meta \
>>> +=C2=A0=C2=A0=C2=A0 pipewire-spa-tools \
>>> +=C2=A0=C2=A0=C2=A0 pipewire-tools \
>>> +=C2=A0=C2=A0=C2=A0 speexdsp \
>>> +=C2=A0=C2=A0=C2=A0 wireplumber \
>>> +"
>>> +
>>> +IMAGE_INSTALL:append:am62dxx-evm =3D " ${PIPEWIRE}"
>>> +IMAGE_INSTALL:append:am62xx-evm =3D " ${PIPEWIRE}"
>>> +IMAGE_INSTALL:append:am62pxx-evm =3D " ${PIPEWIRE}"
>>> +IMAGE_INSTALL:append:am62xx-lp-evm =3D " ${PIPEWIRE}"
>>> +IMAGE_INSTALL:append:am62axx-evm =3D " ${PIPEWIRE}"
>>> +IMAGE_INSTALL:append:am62xxsip-evm =3D " ${PIPEWIRE}"
>>> +IMAGE_INSTALL:append:am62lxx-evm =3D " ${PIPEWIRE}"
>>
>> Why are we doing this just for the am62 devices?=C2=A0 Why aren't we doi=
ng this for all of Arago?
>=20
>=20
> Yep the plan is to gradually expand this to other platforms. Implementing=
 this for all arago platforms will require OOB changes, also users may or m=
ay not be used to pipewire and more familiar with pulseaudio or some other =
audio server. So our approach is to first provide it as an appnote specific=
ally for AM62 devices, then gradually expand it based on feedback.

What OOB changes, can you expand on this comment? As far as I know
adding pipewire should be a transparent upgrade to pulseaudio.

Andrew

>>
>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17114): https://lists.yoctoproject.org/g/meta-arago/m=
essage/17114
> Mute This Topic: https://lists.yoctoproject.org/mt/117740051/3619733
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [afd@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20


