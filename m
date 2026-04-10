Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AB5F459F5
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 15:21:07 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.159083.1775834460031564579
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 08:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=YXS/HrFI;
 spf=pass (domain: ti.com, ip: 40.93.194.14, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jG1tTdR6BU9llVSFLCRTjlQ2z5pqB1UzSm6qXNdHOZJapDf8+fqUHYqMv2YMGTzKHpiv67rYWNf1PxOkvqEZgjJGqWARIG7xFJXl81k2FMiV5D7HBz6c85T5H0qnrmtePuxoE5yjEVPQKODUVXqnzVA9nrAhEygcAPLT/SRuiih9hIo48xzbf4OB6HkIbimECZ3rjP9hkB5wSfERgpQDjPIG8GiAD2R1pMqajLZeBHzvWL1inVW72Wik9sesdeNsrSqWhTnjTAGU2ghuqTkgaa9XmnnpItJZT2cPnFIGcbbSm6QMbdSqjvM8X4iTDKNY5V5+RhwbeNpIQ68TZFEzaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SP///meziT4jAkSmrhpjNC9FOI/woUH6rszqNHdxKHM=;
 b=gBUhRs8S/xqj3wC79fK2d/y4uJ8CjgynQE6oQXSbrsMVIsNwDsPq84baCvx2bOn2RHrG+NoD9h0LIQtqWmJL3Wu3p3BV3nzkz0c/2NZfZcD2kmZZmWLxPn7jU2UidgvKQrv55dm1XP87uvvvn+DeoTiaftqAy9PgZcrAfzTRtgVw0svbbKPga7dOhJqtA5VrHBCK3cu+zQnvtb0vOOE7YljcovxQgWfk563+0J0SNh4Ermz5fNrYtjJ2Ic2fXnvPIerfUbK6+JF59moXH4bSgpcHRqQUoAxdPy7rrh1T8p3+DzRglBO0OUI0K1aW8MSmyaj7NL4UPYjaIIKzdOOysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SP///meziT4jAkSmrhpjNC9FOI/woUH6rszqNHdxKHM=;
 b=YXS/HrFIDbhzvqMiDjxIYhWxwUAMob0+b+HAAyg/XV8LS34Kw0uGUrJmUV18Ec8z+l1pOS1yN9jGA2uXWQjIF1MREz5W20dgcVzVXFIOiokrlvIBvy+rWlvLvsEGayLuWVE2FUo4M93BsQ4rXK3AjkQA+zgjlchfzsDxgukpN+c=
Received: from BYAPR05CA0073.namprd05.prod.outlook.com (2603:10b6:a03:e0::14)
 by CO1PR10MB4404.namprd10.prod.outlook.com (2603:10b6:303:90::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 15:20:57 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:a03:e0:cafe::6b) by BYAPR05CA0073.outlook.office365.com
 (2603:10b6:a03:e0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Fri,
 10 Apr 2026 15:20:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 10 Apr 2026 15:20:55 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 10:20:31 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 10:20:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Apr 2026 10:20:30 -0500
Received: from [128.247.81.216] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63AFKU241599177;
	Fri, 10 Apr 2026 10:20:30 -0500
Message-ID: <a651e6b1-ee4c-401c-a614-88a7310b2f0d@ti.com>
Date: Fri, 10 Apr 2026 10:20:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: oe-core
 v126->128 migrate bbappends
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <denys@konsulko.com>, <b-brnich@ti.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260409213918.1020996-1-a-christidis@ti.com>
 <20260409222737.GC11121@denix.org>
 <d2404ffd-61b0-4562-a383-9579cc8d01ab@ti.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <d2404ffd-61b0-4562-a383-9579cc8d01ab@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|CO1PR10MB4404:EE_
X-MS-Office365-Filtering-Correlation-Id: 23746747-5ab2-47e7-9e0b-08de9714c2a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	bm9TApeTZwJUT9xr0IIXuXuSVs/m46e80p/SeXGFiA5H7AkYxRJyBdLanzwP7V9/Vsvo9Ckj9kSxPLJ5pG49RdqDxPD152qPythcA4WJ84i+d35s4oL0TX/W5jc8slC5psCHIu0T/i0IPg6n2mTRL3VoRNvVUfy3mM6fVCdOjw35iwanr/claHp5jfd10J+EF5l0NrpYPuVjvwDgdvRIAx1jOtuJNZcFw7vQgyB+Vp9+c4Z3FWtgxuJCR/ImlRsfSAPrsjZiRWM07v9IVek/FdU39/wGrA1aOP26Uy9YBOUhMr9Z+leTxMm2QJORpsNsoe+V6oTC/IYdwAKRMwV05YDSlertM6RM6z8hdNpZZbgE1YscMWi5u9HFAnSnYACZL4S1S/dGVjlyssMcVP88YC1gbMFvHRVVzsgwi36AP4BRDvC+vbw+wjYJneLcoCcjQMikmVpNMqxtqVxyoRlbaIzhxCLZvdE6ica5hsl3ekc60by9zxFO1z91a5ydLnQ9qI4Wbyb/MA8MDpaMeBSJYNIdlNl/GypNC3dOwhTBlGV1NXKWM8TBPgqM5KLEKuOrN002C+51TEoz/R238BcgGYoJh+xtkjjs09MlvoPBMU4MxECosvNpzq5YWbiu3LnnwS0kF0rMF9C3sM+rZYfNJV7jv+IWHwwxapJbqHMnorjCM8fGxJEZ6Qnc5kGJgJ0yOqbb5lfm9dnHkUi7mJCBj786Hliz40bpXAnEttgD7+XQ1ACeXlhMW6u0jYDu71/7Rs8GnuYT6a3KtWQ2jz0xFQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0B17RuECJ0g5zidfH7YvPABkP43CPhNXCpumbvcC05MjXSWate6qvl6utH2awqdfKtXCW7NfX7/N3OIq22juskiEgzHixobjGI3E0mFJfmidE+duFm3DNrGNIeTKVcHi59NlWahs30Gu1YpWlt6Y+1677rSbxTW3BpmrureHCCmP603ZpZvLzcAeqax73To/9TqMe0KyIP4naoKT9S95ttjqcesUVRFxgI73hd3lIT2Zos/Y0DjXBhICN3xdepaYmpjBHOZ+4JJrNq4FEa47zIl0HgPqcdnH+3NB/5xrzRXkHptgk/gelNR47dKLnFwoo+yWLFxyLaLdsztOxBwNBYB7C5ufdHmTbsqh6O9kDkxt9G3Q7Y/XgxTp4lbzRCcjBLFTJx83/TJ7EoBMEBIBFoQcl5lAX4ffv67zXFK0iHwhrVsfNy3eo8haje3hrWEL
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 15:20:55.2546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23746747-5ab2-47e7-9e0b-08de9714c2a3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4404
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 10 Apr 2026 15:21:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17464

Ok make sense, cause I checked the mailing list and no patch was sent so=20
I sent mine.

On 4/10/26 7:42 AM, Ryan Eatmon wrote:
>
>
> On 4/9/2026 5:27 PM, Denys Dmytriyenko wrote:
>> On Thu, Apr 09, 2026 at 04:39:18PM -0500, Antonios Christidis via=20
>> lists.yoctoproject.org wrote:
>>> From: Antonios Christidis <a-christidis@ti.com>
>>>
>>> Fix bbappend files to apply onto the new recipe from oe-core now
>>> versioned at 128 instead of 126.
>>
>> https://git.yoctoproject.org/meta-arago/commit/?h=3Dmaster-wip&id=3Dc923=
bf7b5b67b7261583f330dbe9ba22a2076b6f=20
>>
>
> Yep.=C2=A0 I was testing the builds to make sure that the version change=
=20
> didn't require any patch changes.=C2=A0 So I didn't want to send the patc=
h=20
> until the builds were done.
>
> Just sent my patch.
>
>
>>
>>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>>> ---
>>> .../gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend | 4 ----
>>> =C2=A0 ....26-arago.inc =3D> gstreamer1.0-plugins-good_1.28-arago.inc} =
| 0
>>> .../gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend | 4 ++++
>>> .../gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend | 4 ----
>>> =C2=A0 ....26-arago.inc =3D> gstreamer1.0-plugins-good_1.28-arago.inc} =
| 0
>>> .../gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend | 4 ++++
>>> =C2=A0 6 files changed, 8 insertions(+), 8 deletions(-)
>>> =C2=A0 delete mode 100644=20
>>> meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer=
/gstreamer1.0-plugins-good_1.26.%.bbappend
>>> =C2=A0 rename=20
>>> meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer=
/{gstreamer1.0-plugins-good_1.26-arago.inc=20
>>> =3D> gstreamer1.0-plugins-good_1.28-arago.inc} (100%)
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer=
/gstreamer1.0-plugins-good_1.28.%.bbappend
>>> =C2=A0 delete mode 100644=20
>>> meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d_1.26.%.bbappend
>>> =C2=A0 rename=20
>>> meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-go=
od_1.26-arago.inc=20
>>> =3D> gstreamer1.0-plugins-good_1.28-arago.inc} (100%)
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d_1.28.%.bbappend
>>>
>>> diff --git=20
>>> a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.26.%.bbappend=20
>>> b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.26.%.bbappend=20
>>>
>>> deleted file mode 100644
>>> index 0ceb558c..00000000
>>> ---=20
>>> a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.26.%.bbappend
>>> +++ /dev/null
>>> @@ -1,4 +0,0 @@
>>> -GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO =3D ""
>>> -GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO:arago =3D=20
>>> "gstreamer1.0-plugins-good_1.26-arago.inc"
>>> -
>>> -require ${GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO}
>>> diff --git=20
>>> a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.26-arago.inc=20
>>> b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.28-arago.inc=20
>>>
>>> similarity index 100%
>>> rename from=20
>>> meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer=
/gstreamer1.0-plugins-good_1.26-arago.inc
>>> rename to=20
>>> meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer=
/gstreamer1.0-plugins-good_1.28-arago.inc
>>> diff --git=20
>>> a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.28.%.bbappend=20
>>> b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.28.%.bbappend=20
>>>
>>> new file mode 100644
>>> index 00000000..e8392833
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.28.%.bbappend
>>> @@ -0,0 +1,4 @@
>>> +GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO =3D ""
>>> +GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO:arago =3D=20
>>> "gstreamer1.0-plugins-good_1.28-arago.inc"
>>> +
>>> +require ${GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO}
>>> diff --git=20
>>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.26.%.bbappend=20
>>> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.26.%.bbappend=20
>>>
>>> deleted file mode 100644
>>> index 0ceb558c..00000000
>>> ---=20
>>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.26.%.bbappend
>>> +++ /dev/null
>>> @@ -1,4 +0,0 @@
>>> -GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO =3D ""
>>> -GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO:arago =3D=20
>>> "gstreamer1.0-plugins-good_1.26-arago.inc"
>>> -
>>> -require ${GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO}
>>> diff --git=20
>>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.26-arago.inc=20
>>> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.28-arago.inc=20
>>>
>>> similarity index 100%
>>> rename from=20
>>> meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d_1.26-arago.inc
>>> rename to=20
>>> meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d_1.28-arago.inc
>>> diff --git=20
>>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.28.%.bbappend=20
>>> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.28.%.bbappend=20
>>>
>>> new file mode 100644
>>> index 00000000..e8392833
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.28.%.bbappend
>>> @@ -0,0 +1,4 @@
>>> +GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO =3D ""
>>> +GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO:arago =3D=20
>>> "gstreamer1.0-plugins-good_1.28-arago.inc"
>>> +
>>> +require ${GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO}
>>> --=20
>>> 2.34.1
>

