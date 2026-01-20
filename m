Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49F7CA5FAA
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 16:32:47 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10529.1768926760627729247
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 08:32:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=QZbQUmuL;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.14, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOt3mE8s4A5HvzKCM8M+YpdRh15btk8Hso/NWlgw7sB6Nw83Jsmg/QuwMZdlWOuqu1LKMt36LXf+tZTQYdOtKz3zlBRcYYui2jsIwP/fZ+hhd6y4TN3OyLaJwrDixtL05YRzzS/x2P4bPUzAp3NU10qtrUMYYHmbdeusnxk1FAQODsvPxN28U/C2VE5RvO9aLUtXV5j0Y27pZNQUCf1njiDBI31eAY45sLZN+1dzpYYS/nfAKhwi/j4BqUYdLwhN8xPQ1PpFiUTpu+l20zcJKSjqH8julnAz6DcV6lQiLssOZKUpt8iuRCvrT+TIEimvkIZ5Pvu1SE9I5mDdM9gf7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7QNkRBLkA9tl7wJ+TGRiX2C7w+/nK7WyhfVlLwXT+s=;
 b=EPHpdLeUrXZjqbhjenK5EgJjwMzBvlSDVhZw0KRfvzijFQhHZVTC2MKLoSfpwHXLJ9hkkf1nNaD7mOc2ANcaHW31QP1zXssJ0nZLPZCeWAjBTKN2xh6EJLRsp0CQCTMicjOfi8k2ETKt/Ky00AU7TZZXWjeGFmYDil+EmCCzmOFrXCl0xsxsC600WR/flIKK61mDexxGAEj1eqEiK+YBUNb+pznD0sEe+F+IcEfnzBeWln8t94dGgaqR/pW4ymOrBDm+HJOd35dirt7wMO4YOnnxOtPkm3Um543wDfJDdj6lNw6XhyxBPiR8cxtIzL8ty2NcxEyNBU1svUXK4g2a0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7QNkRBLkA9tl7wJ+TGRiX2C7w+/nK7WyhfVlLwXT+s=;
 b=QZbQUmuLOqrBU5XqK0jqWkp5S1h+5AfJJ9ijmK+lIe2kNb4Jdd1k9uSqUj79tUtreQ+9VdOhGvLRqci8xxA0x1W5Wht34sDQkc1Z4nTmRQ006F1xGORjtAgC7qb4+ncJExYKEuN/HaP8ZvO1RfFaKIRk0hoQcUH545Klzgn+Yoo=
Received: from BN9PR03CA0292.namprd03.prod.outlook.com (2603:10b6:408:f5::27)
 by IA3PR10MB8515.namprd10.prod.outlook.com (2603:10b6:208:572::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 20 Jan
 2026 16:32:38 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:f5:cafe::ae) by BN9PR03CA0292.outlook.office365.com
 (2603:10b6:408:f5::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 16:32:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 16:32:36 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 10:32:32 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 10:32:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 10:32:32 -0600
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60KGWWbw1370764;
	Tue, 20 Jan 2026 10:32:32 -0600
Message-ID: <185dc696-fc84-46c7-ac24-aea83fc6bddd@ti.com>
Date: Tue, 20 Jan 2026 10:32:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 0/2] Clean up patches for open62541
To: Denys Dmytriyenko <denis@denix.org>
CC: <denys@konsulko.com>, <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260120152519.12538-1-a-christidis@ti.com>
 <20260120154224.GV11121@denix.org>
 <188C7B8D7F1F433F.3496637@lists.yoctoproject.org>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <188C7B8D7F1F433F.3496637@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|IA3PR10MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: cf8bf459-1168-4611-deac-08de58418564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?llWEPi2191O5Ezjy5vRJEIFUGwXxdsoAVYKoytTME9UIj3ttwwqQNu/EWN7j?=
 =?us-ascii?Q?u+Ax38/Yibv9tbNqAlkftTbRN1CJt1lrszakEObjRh0Sa1RaTnsvsWvMY5bT?=
 =?us-ascii?Q?c74o4Z4uwGYB6qiRdzaPJzgqcY6UDgVosomoQvx7ljei87s/XPADnQINew/P?=
 =?us-ascii?Q?DPVRzrO4lAQJaLRYdvLtR+B52Ky9pXcRjInNlGJYUnWiGI0hr5gj+AWhGgyF?=
 =?us-ascii?Q?QYIM1Tia2fjtHb3foVpl3f+NhO9bqZS+/OKVXwfLmAgqIOfSxtxITqUlpJVv?=
 =?us-ascii?Q?Nop/LW7p6thwK4u1c9GENqtvBbhUnkv+wxGl0zpjQpLoeUJWMJj0mDx4SjmJ?=
 =?us-ascii?Q?5eqq3ZFhi3ff9MjHIOEGKNPDvAq14D/o+fxcRZcI2JD1KN7EGNBQLNhfY6My?=
 =?us-ascii?Q?7eglpRU82XIN+NULyRAjM3BLJvuz2oOggHk4fHFEzVUSu9Wye0E43pp27yhR?=
 =?us-ascii?Q?WcEm43B5bRrBFCtbaISjjoPgBHcUuZJlUYX9I7ZEVQR9QfRgOnykyjvQwx/J?=
 =?us-ascii?Q?C3Ll+6WIrSWBBQ2r+wHibzuZr7nYsefdlcjXE5zbU77v7kWjmPUPDpmRaRN+?=
 =?us-ascii?Q?fd+qKQiyhJMA6+7GxigUggNYPWfbJxChXD5i7YuadSmCmB5kZ0PPkJWfBI5u?=
 =?us-ascii?Q?KzdKPUGID39ijFn4dEKQovbznL1jDq/bAMt/oSae9CptB0R/rFlkj1HtXB7Z?=
 =?us-ascii?Q?TvIOqetWLHdssAN2BqoZ2H+aVSRGYRX/0CZR8jDMMcNJdlDLNxj+EfRecaIf?=
 =?us-ascii?Q?tupQm7VI/RmVfokdS5s+qzAMZ6CHGZMywVt5pV5kfflLKdHixe/zjIzX+8QE?=
 =?us-ascii?Q?needfua81QNMaTNDFTnH9yd9BAjbzBRXtkSyTGUXkB2HrXFEjH8aqZkW0OuV?=
 =?us-ascii?Q?J3iZv1T0CJLSnD8tor8jvdm+S/YMPdu53+nwmSc4bK1hjbpXKcEyR9v6Ywhf?=
 =?us-ascii?Q?g3hHHZcg6maglCxA0CwwP34x3/ztgDbSCJqdfzec0eYZ1BsyyHXH3g0GkbeI?=
 =?us-ascii?Q?J78a33T5+izY8NtTLxZUcMeGkrbTNxDlcKvqLouzZ+Krhe547cauwNpOwH5H?=
 =?us-ascii?Q?YZjNdy48XdGA80gQLsed1+cPEJhKIjdywAbmMlAZDGVIVVyicy4U0TRhxzys?=
 =?us-ascii?Q?kR9Hvyq41UskUomAEQCFnZ6zbb8WjSLi3RkLnR4B0R0ZsumELKPy8Gv5mHzA?=
 =?us-ascii?Q?2L5uiAfkfm1PdM0h8uhqCi62yvbRSQc/tYqCaahYYOPWLs4wzE7Sd6u5a5z8?=
 =?us-ascii?Q?kIM+yv6fBZIsRaJY1UuQXA7aC5PB6I4YKIOMTUPHTauRSmRhqHrqNjvjy8pq?=
 =?us-ascii?Q?l5I1pfHP13zIBfXDN5HrGpuqp85ySB22qwYfokTr6IOXo6JZWvgZ1x11h/wB?=
 =?us-ascii?Q?OKDvqbLGVTZb7BZGBrEO+I4ZpV/OWgjfdUXqEkYn3ucqGrRFOM231SjtaJZH?=
 =?us-ascii?Q?O6+2x4o/jjujaI+0MjVIrvBGLKlnIcKttWsO5iC3IA2rgTR38r4XbnY41dAf?=
 =?us-ascii?Q?XcJCpC6yvAP8fBdsq0vgsOhfBw3XCH2gJZ6AMpvuL6L1EMKRedH/4YD+wIXh?=
 =?us-ascii?Q?GtroZNxKhbEgdUOULMekKFMGVLQmL1/4mUoRAMzs24KnQl+5D7yuXRXFTwR4?=
 =?us-ascii?Q?2w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:32:36.6038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8bf459-1168-4611-deac-08de58418564
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8515
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jan 2026 16:32:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16991


On 1/20/26 9:56 AM, Antonios Christidis via lists.yoctoproject.org wrote:
> Yeah just noticed that. This series might be redundant then.
>
> Ryan's patch=20
> 0001-server_pubsub_publisher_rt_level-Add-missing-pthread.patch is=20
> status pending upstream, with no link and I cannot find his PR on the=20
> github repo.
>
It might be worth while to use my patch, since I have already created a=20
PR on open62541 github.

>
> On 1/20/26 9:42 AM, Denys Dmytriyenko wrote:
>> On Tue, Jan 20, 2026 at 09:25:17AM -0600, Antonios Christidis via=20
>> lists.yoctoproject.org wrote:
>>> From: Antonios Christidis <a-christidis@ti.com>
>>>
>>> Dear all,
>>>
>>> LTS migration related efforts to fix the recipe.
>> I think Ryan already made the same changes last week:
>> https://git.yoctoproject.org/meta-arago/commit/?h=3Dmaster-next&id=3Dbf4=
7628886392400787668c9b203334ce00e2e4d=20
>>
>>
>>
>>> Kind Regards,
>>> Antonios Christidis
>>>
>>> Antonios Christidis (2):
>>> =C2=A0=C2=A0 open62541: Remove deprecated examples patch
>>> =C2=A0=C2=A0 open62541: Add patch for implicit declaration error
>>>
>>> =C2=A0 .../open62541/open62541-arago.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>> =C2=A0 .../0001-examples-Remove-sys-io.h.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 68=20
>>> -------------------
>>> =C2=A0 ...plicit-declaration-of-pthread_create.patch | 30 ++++++++
>>> =C2=A0 3 files changed, 31 insertions(+), 69 deletions(-)
>>> =C2=A0 delete mode 100644=20
>>> meta-arago-extras/recipes-connectivity/open62541/open62541/0001-example=
s-Remove-sys-io.h.patch
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-connectivity/open62541/open62541/0001-fix-pub=
sub-Implicit-declaration-of-pthread_create.patch
>>>
>>> --=20
>>> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16990):=20
> https://lists.yoctoproject.org/g/meta-arago/message/16990
> Mute This Topic: https://lists.yoctoproject.org/mt/117364498/9164840
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub=20
> [a-christidis@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

