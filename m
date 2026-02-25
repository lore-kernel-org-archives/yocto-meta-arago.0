Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4455FD45FC
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 23:54:16 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59880.1772063645881298334
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 15:54:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=kewXiky0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.1, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHgzzBB+eW/T12tUW8udcDVZ6+DO7arT6CMjI1a+0c19MrD3f7MDw/zmOQDCystgaJ1Z5bfm9wQsee0CNz1+9v8zWnuNPewzFC9Zd2rlT2iFhaz7lSFUicMCZIbXTZnDOWsEDHd+c9rDXp0yDO7oQTIhmLPZ/2jxXklmGlF1svke23LjUFdEfBzGdVn9ioPHeO87mmWP1qLibj7ffro++n5QLDpogn9QvghsWM0KhWxm086iZZJDCZKJUWJ/jBHuUgBuz4WrFSsnnHcDwhVVGs+NQbAy+FqGME20dQAS0i+34/4NiKVUZYUtDgKZbAXm+Ja3/f6hwme/OF/IdGejEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hw/c656lI888ZGZ3d3/Vd97b2hI4aPGtEcZQfDJmmJU=;
 b=Ht1YiBV/Qy6M0bjhBCc1GfYrSKPMJV1T4Rbt0aryFtCAxGecLOgDItaC/u0GqUXSxSpsqwXJoGJW9Ex3N5i7cON5FkDzAHMiuQ+AVASs0fkakxJP3VioSfLe2SqB32yMMmP7506gL8MAJvVgdEeLJGUjwNydxEYHGOFc5sAJckusfPaTpJZWlra4YXS9tDxWMnnucyoOFCQzq9AqhySdI5yVxd/FtC3yDVtyMOXZH276JDSqAchXPVOXFDy3qStsZRGBnUPeqE0iDCF3ruTScoyb4/xJ81WtpBfeZ9FMCj+muv5XWBk3lGl+MrsLJ37u9F5of13i3KaC9iMznE6mIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hw/c656lI888ZGZ3d3/Vd97b2hI4aPGtEcZQfDJmmJU=;
 b=kewXiky0xwWEbIqiy9h3cUxGQugZoc9wKUBpjSMfg5/KNW4kw17tRCiJJ0XWX6lS51F73BAyfbM/8lpBpGNdJWSiY9FxfstMBMvJ/wqVD+t+CSJyNvOOusf/fnZ0a2BHWG+hC/dDPGDOXaz4xojUQs+vHTuMKNfmDdsPTxO4GS0=
Received: from PH7P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::21)
 by IA3PR10MB8564.namprd10.prod.outlook.com (2603:10b6:208:583::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 25 Feb
 2026 23:54:02 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:510:338:cafe::12) by PH7P223CA0023.outlook.office365.com
 (2603:10b6:510:338::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 23:53:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 23:54:00 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 17:54:00 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 17:54:00 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 17:54:00 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PNs0m71332861;
	Wed, 25 Feb 2026 17:54:00 -0600
Message-ID: <93331f64-8db4-46d7-853a-5e7937838385@ti.com>
Date: Wed, 25 Feb 2026 17:54:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] arago.conf: Tweak a couple of
 settings following oe-core changes
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <20260225021057.2555571-1-reatmon@ti.com>
 <20260225202447.GW11121@denix.org>
 <18979728D0DED655.1454197@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <18979728D0DED655.1454197@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|IA3PR10MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: 46424750-560d-41e9-b803-08de74c9261e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|34020700016|376014;
X-Microsoft-Antispam-Message-Info: 
	zBgPEG9zys+S7syC8pQCqoo+tJLFC/+lDVbWqNCfm8fB+Ji8slED6Bt5qbalFsWceZVGS8Bfwh8v0UsSOKpzA+qPQuLKkHPCLB9RInLVvWEgBd3QDE6aQivnfxyw96J9T+M33+7DSM4FQEEuLhWpc/ZuW5cOmI3+2R4yCF1M+VP5qRL7Y6szZQxry3k9f5z5UZ5JQxosEpY6GMmU+ws9hH1IK42BtXWq0xV7NCUAvJKxvBbIAApj+c/RVMd9ATJ7+SnipNgA1+l+SLJsXUMCBgwiPiEAG4FrwBCfHcy5Um7nUf//t5OUQ/WB63+H0QQDjJYpDti1v1BztbYfaqezDoP9Hcznn6kfxW/uC+hVhKeucdpCz923ZWzoUCuH4MzIyWrbw33Aib4MjYKADHUzvuzqx6YGlQK297UeyFryOI1pfjxhe2WHQmEQladWQY7zLAHK/gqIVe5NL7Y1DI+2EXvf6bIO7Xfg+Aujn1yKoGROeOdLNxA1y1TSgfyw2bAB/fx6CRw/7c2vXUkXRtCr8JIWapPHh8Ibe/DxUTE5pcz3kcsOHGInphX9d9qB2jXDIx1RtzdhTxhWMpF0HBTC5F2gzPMWIMtXcZ8dwTu+x2EHsVqMjuszvKAl6XsAEf30MsMAooO3YkTgHZ+lt9m0bIw0UjwCYST1zS21MtECRS7jJ8dsVjGP39f0pUPz5T5V6lpwB0oA3vvY0nuuYOLsMybSHdGg+WnZOrORLLma0ILHsbm/O5RBhOdpowndRzeUKQEcWKN2pedtQ/pjEmTyKITY//XpgTkAAQ7hTxIeqZjZA0rQ87hHU1W4z6R5cP6RFRfwDHSZqpjgxQL0lgEo6A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(34020700016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jRLQKeqNWEqQtBzqqVdHb9A6X6UMUufceY6CHbqFHIhINiZc0vUN+9S1iBa9oLgDKZKICkWtwSYGQRCTvuVj38r6XJ+sGsd1w+GGIITbSWoBq19ZhWP+gSaQ0sQviifEfAjj8EGrRssBmZVV5YlPyCufAY8ULa2WuFTpDWPAMDbhifM/bRJCcoB2fB8zxTKmfgppAQN8HPhiZKlRHS93CbVRHMcmeJp2LfyV+vpl60mtsDe0CLzkJ0m08PJNTWf5NLFlJCXpdwM6hy8shYRSHt9GB3VyDH33i/6oV5fHyIliKEt0qJQzi59znRq8Cr24bQ3gnEaubQNdryuEq0+haFF0eb1UF8fNijIqC+M7Nqw6ylUg3KG8RCcqO3Q2QVzR/jkDVjyQJKhWZK+/3DeNiSKalqHMtTeQcBuO1vOeQTu6LFiH75ooxOMLFX2/EElg
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 23:54:00.9116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46424750-560d-41e9-b803-08de74c9261e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8564
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Feb 2026 23:54:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17154



On 2/25/2026 2:26 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 2/25/2026 2:24 PM, Denys Dmytriyenko wrote:
>> On Tue, Feb 24, 2026 at 08:10:57PM -0600, Ryan Eatmon via=20
>> lists.yoctoproject.org wrote:
>>> oe-core has made some changes to default values for all distros [1] [2]=
.
>>> Target a few specific packages at the Arago level to back out those
>>> defaults and allow packages to build.=C2=A0 The changes fall into two t=
ypes:
>>>
>>> - Disable static libraries
>>> [1]=20
>>> https://git.openembedded.org/openembedded-core/commit/?id=3D03fc931bfe9=
ea3fa9f33553e6020cbc067b24291
>>>
>>> - Enable tighter compile time security
>>> [2]=20
>>> https://git.openembedded.org/openembedded-core/commit/?id=3D4c2d64c10a5=
b0437ab1ea04df22386f0f95124d1
>>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> =C2=A0 meta-arago-distro/conf/distro/arago.conf | 10 ++++++++++
>>> =C2=A0 1 file changed, 10 insertions(+)
>>>
>>> diff --git a/meta-arago-distro/conf/distro/arago.conf=20
>>> b/meta-arago-distro/conf/distro/arago.conf
>>> index 17c6fed8..691f9068 100644
>>> --- a/meta-arago-distro/conf/distro/arago.conf
>>> +++ b/meta-arago-distro/conf/distro/arago.conf
>>> @@ -153,3 +153,13 @@ LICENSE_FLAGS_ACCEPTED =3D "commercial_ffmpeg=20
>>> commercial_gstreamer1.0-libav"
>>> =C2=A0 # We are working to reproduce this error and submit bug reports =
for=20
>>> this
>>> =C2=A0 # issue.
>>> =C2=A0 DEFAULTTUNE:armv7a =3D "armv7athf"
>>
>> BTW, slightly unrelated, but ^^^ this was a temporary workaround and=20
>> it ended
>> up staying here for quite some time. Is it sill needed?
>=20
> Good question...=C2=A0 I forgot about that.=C2=A0 Let me look into it.

The only change was removing that line and I get four failing builds:

Summary: 4 tasks failed:
=20
/scratch/builds/arago-master-wip/build/sources/meta-openembedded/meta-oe/re=
cipes-kernel/kernel-selftest/kernel-selftest.bb:do_configure
     log:=20
/scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am57xx_=
evm-oe-linux-gnueabi/kernel-selftest/1.0/temp/log.do_configure.1747988
=20
/scratch/builds/arago-master-wip/build/sources/meta-arago/meta-arago-test/r=
ecipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb:do_compile
     log:=20
/scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am57xx_=
evm-oe-linux-gnueabi/hwspinlocktest/0.1/temp/log.do_compile.1970615
=20
/scratch/builds/arago-master-wip/build/sources/meta-ti/meta-ti-extras/recip=
es-bsp/dsptop/debugss-module-drv_git.bb:do_compile
     log:=20
/scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am57xx_=
evm-oe-linux-gnueabi/debugss-module-drv/1.4.0+git/temp/log.do_compile.21369=
98
=20
/scratch/builds/arago-master-wip/build/sources/meta-ti/meta-ti-extras/recip=
es-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb:do_compile
     log:=20
/scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am57xx_=
evm-oe-linux-gnueabi/gdbserverproxy-module-drv/1.1.0+git/temp/log.do_compil=
e.2138236

Building am57xx-evm.  I'll keep looking tomorrow to see if these build=20
errors are solvable.



>>
>>> +# Some packages ship static libraries which are disabled by default.
>>> +# Add support back in for these packages.
>>> +DISABLE_STATIC:pn-ti-ipc =3D ""
>>> +DISABLE_STATIC:pn-ti-rpmsg-char =3D ""
>>> +
>>> +# oe-core enabled tighter security checks at the distro level by=20
>>> default,
>>> +# but a couple of packages in meta-ti cannot compile with those.
>>> +SECURITY_STRINGFORMAT:pn-dsptop =3D ""
>>> +lcl_maybe_fortify:pn-gdbc6x =3D ""
>>> --=20
>>> 2.43.0
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

