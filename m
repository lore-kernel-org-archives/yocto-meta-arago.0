Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E932BCD042C
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 01:25:34 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80718.1767662731227584712
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 17:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=o+puMcyv;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.60, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3Zlw2HqlfGaK3W0HbAlID8dmDM++Lfc9t0ZOCnPAAEwDt5d9CZ1zZpZ6t3URwr+qdNeinPtnxgc5MN4r3/IC3/6nSFVgkG7pOInP47Aaqn007LFrqz/s8riVbJEf0P1H4z15gzzTUH1bsKPZmCLZfVd39aHx1OFmVivlG8gMYRjCaNlHYt7UcaI8WcILWLa6b41BBwm0AXHKYCA5SCe6jrmA7bnbtCcNPlUNEKFuqU2vF9ltVH9qRA7gVrNtDvQu7bgukj6fQXeSdK55S+CkrNF6FAnn8NiPKcZPfe0pyvV+89ZqD66WJGIH87cnFEWeWYcXXy6A3Vt+1h3f+ft5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9MptS84FX4MSypj57JmB5MIGNxA/mSQ2TUYZn7b9iI=;
 b=DhZ0d2T+zD1VJflrCCHhFAcQA3fuBEke5Hyt8N1gIJTnz0/ON/VaRy/tLWax0GJFb8dUVHuF0Su/CtLmj0ZDCqENn61nKPhWXi9QZRMID1Q/08EgPSE3jPxyvtrPDYC1HMCkUFg8ak+3bin4BHF4jPH9QGz9KeFb8rwzENmQM6fnDOBECxSFHludn5d5/lTOjFaHkXm/K90yBvLjGeDofcg/0cYy9d0f6KZ6QTD5+slXshoWDtt4jwdTD5F3rvka5TKBSmNC1Lu8cE/EbPXdo2lIu62H5cHuY+T8x4GqM/Bht0TBCWkMmP0RqOYCl3Bkl9P0heJejAbw09ji+udWkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9MptS84FX4MSypj57JmB5MIGNxA/mSQ2TUYZn7b9iI=;
 b=o+puMcyvcHJXHTlOUfXKTgQPI/QEWk06AKy5dF3CoF80xEybdmY+9JiCIo+KpvpJjc5Op4hVfnirC8xlw1akk0LIYboBh/u8//9l4ll7hf3/XTrIgNKCQfXsG4+K1JGu764x5WE/Jcrx6DLnPfbTsvGncHW8V1b+Q+rEB7MZu90=
Received: from PH7PR02CA0004.namprd02.prod.outlook.com (2603:10b6:510:33d::7)
 by SJ0PR10MB4654.namprd10.prod.outlook.com (2603:10b6:a03:2d2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 01:25:29 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:510:33d:cafe::26) by PH7PR02CA0004.outlook.office365.com
 (2603:10b6:510:33d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue, 6
 Jan 2026 01:25:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Tue, 6 Jan 2026 01:25:28 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 19:25:24 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 19:25:24 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 19:25:24 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6061POSv2072516;
	Mon, 5 Jan 2026 19:25:24 -0600
Message-ID: <4d22d3da-ecd4-4897-a0ca-d20ccfbf4686@ti.com>
Date: Mon, 5 Jan 2026 19:25:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 2/2] telnetd: Move telnet daemon
 scripts to meta-arago-test
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260105221926.2503358-1-afd@ti.com>
 <20260105221926.2503358-2-afd@ti.com>
 <58492a2d-1cfb-4289-ba1a-f86939d54b36@ti.com>
 <2068f564-6855-4087-905e-c7da0c151ddb@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <2068f564-6855-4087-905e-c7da0c151ddb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|SJ0PR10MB4654:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d9bbf5-bd07-40d2-5279-08de4cc27a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RPcoYlJZKyG63MTPfXddBaG7zozdqOwARjl1LjVMk852+3cQlaptGQW9OUg0?=
 =?us-ascii?Q?23Aq6KDndFy5zssFiXxb1UTwpX0OxyB8dcy6X6ge8aseMgABpqohvgqr3Wff?=
 =?us-ascii?Q?UVO+EhU+AUz5AYT+y/k4ySheAmm9exLFtEZPbFjcoH2QVoDuWHTwdCsYpxgN?=
 =?us-ascii?Q?E7U+k/aQJCuTxwM9umcRlHNWSCgGDPXWdIk0htM9ee7PzftHgBuJ1lRsV3BU?=
 =?us-ascii?Q?1wL5Zy4xZJO+EGhrD1ApqBPKRWruX64cm1vG2WMZbXaeKnDVBwSx0wbLtcaT?=
 =?us-ascii?Q?OoQdXGxHwQZ9SgAPqFKP0NqXr340acjNNSTtu/UgBkcZVLLnjgcAgD5E6DBS?=
 =?us-ascii?Q?WPtAV5Jmz1PIeatXErso/KnSRhbsSDObnHvMAeT7biUDqsVzcsFOrvsjSX/3?=
 =?us-ascii?Q?INOpSXuMmx8OJlz7wjWa+79aJFyTj5RqqYg27R4KBAGXECJ41sJpbjsw0rTY?=
 =?us-ascii?Q?D4PJawH+hCdL/GGP7oIA1OGU3U6X+80qTp65iodbNYyS97P4I1butxmWbz+l?=
 =?us-ascii?Q?w6j/IrHX/FI9SQBKNYLPJthLuD6tEFwVSSDmtjz1UXIH9gOjiOmzKhmILOCt?=
 =?us-ascii?Q?Iy5ivQKJhP/egYd6NKvGUNAuKOur4JJLhCzCch/qfJ+q3oY5vToScD24teEk?=
 =?us-ascii?Q?Iw1a5rZ+9PwujUeURy1P+PFQTKdvZpJneDzxwiWoXXV6nHjbA697W22k/sJb?=
 =?us-ascii?Q?/59S+3S7SPWCA3bmeY2kWJTqRzZyniHxdJ5TrpvsoXm07t2kLd90OR3eKHOr?=
 =?us-ascii?Q?QJ5o9Mq6FB5HJl05vBnD5gS3awCuDEnl0YA3NdP2bu3iCqZIVcnGG6KWhD6o?=
 =?us-ascii?Q?23rJYQ0RmTNbcwb0x3r+t1Dj9/0jn9OMBXvsajLR+7evNSNRf+3UGzOmmgbW?=
 =?us-ascii?Q?6yI8HgiNsIMqJ/jP94xJQf0vkrAmxYW75Vi2dPzx6B8MK4ZqaHohidqVIOiR?=
 =?us-ascii?Q?T22Gp7P07PbV1aIt69zu0QQqbdIWqvLhsIwtBUXQ1qmg4OAUCLAjAW6NVQxB?=
 =?us-ascii?Q?r8MVs2WF8jEATQNdeY2oWi5bU66d3x4V8l1aQygYtS+mrLtVh+pIy6g0Rq7V?=
 =?us-ascii?Q?M40bv0cOiFFG0SNASHz3KL3NnjnMyaFAAF1SvUX4m1TuYr8BbROYzY/Rf+of?=
 =?us-ascii?Q?djQFlnRG0qzUzZdriCpmZwJ4+kGyTd56sSe86bAhwIDYrWfwDCHEzEFh4Yle?=
 =?us-ascii?Q?G9XcO3xYXlhyIsgoA/OvSgX/Z7QhYxmY2da7NaOHmXA+l0cc1YkghgEhksn9?=
 =?us-ascii?Q?YZlqNY5fK/TLqFTbl6psojCwzEjgQ6WGqqMNyVWpTEKa0hgZa/zetZQPqnEW?=
 =?us-ascii?Q?3ruM8l9/5Ei1/2GezBqcrRMw89zZX0bdaWwQEf68MVzdg0n1zics5c6OAkIC?=
 =?us-ascii?Q?imEEn0JdM3rGF7uBxGdvo70TTZXG7CtWtYgC2CsyLQWkW6rKDYTafvVXl7Ng?=
 =?us-ascii?Q?/R4UrM9ApEOIJOnrAp4jIf0eBS2AE2yhKJ0HcEJJYNaN+Zl2n3BbyaxboC7y?=
 =?us-ascii?Q?X8b8YFstu3A08Dyp1uNxWizmuh3RYxNLb02VGOf66DLz0cGLipTgWw4aSU1h?=
 =?us-ascii?Q?JIXybymfhXrIrFVfiAc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 01:25:28.6955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d9bbf5-bd07-40d2-5279-08de4cc27a0c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4654
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jan 2026 01:25:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16930



On 1/5/2026 5:36 PM, Andrew Davis wrote:
> On 1/5/26 4:23 PM, Ryan Eatmon wrote:
>>
>> This one may not work.=C2=A0 This assumes that you have ti-test intstall=
ed=20
>> (which not all images do).=C2=A0 And without ti-test in the image, then =
you=20
>> cannot telnet to the board during test.
>>
>=20
> Why would you need to telnet onto a board to check on test if you are
> not testing? If you are testing, then you would have ti-test.

The base image is kept small to do network based tests.  They then=20
install the ti-test package from the NAS.  But that assumes that the=20
test framework could telnet to the board after boot in order to run=20
commands...  That's the scenario I'm thinking of.

The best solution is to update all of the tests to use ssh, but that=20
still means we are still hardcoding something in the file system to=20
allow connecting in a bad way.

What if we also combined the above with a variable that we set in the=20
local.conf during our builds, but is off by default.  And that varible=20
override would make us include the ti-test-required.  We could even just=20
add that setting to the local.conf...


> Removing this from images that are not specifically meant for use by our
> test automation is 100% intentional. Right now anyone can telnet into,
> as root, without a password, all of our images. As much as we love to cla=
im
> no one should be using these images as a base for their production image,
> absolutly every single customer is anyway. Which means we have a huge
> security foot-gun here, and customers *will* end up shipping devices with
> this massive security issue.
>=20
> Andrew
>=20
>>
>> On 1/5/2026 4:19 PM, Andrew Davis wrote:
>>> These are only used (and only ever should be used) in testing images.
>>> Move these out of the base distro images and only into images including
>>> the ti-test packagegroup. Move the recipes themselves also over to
>>> meta-arago-test.
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>> =C2=A0 check_yocto_rules.json=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
>>> =C2=A0 .../recipes-core/packagegroups/packagegroup-arago-base.bb=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 --
>>> =C2=A0 .../initscript-telnetd/initscript-telnetd.bb=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 0
>>> =C2=A0 .../initscript-telnetd/initscript-telnetd/telnetd=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
>>> =C2=A0 .../recipes-connectivity/systemd-telnetd/systemd-telnetd.bb=C2=
=A0=C2=A0 | 0
>>> =C2=A0 .../systemd-telnetd/systemd-telnetd/telnetd.service=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
>>> =C2=A0 meta-arago-test/recipes-core/packagegroups/ti-test.bb=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>>> =C2=A0 7 files changed, 4 insertions(+), 4 deletions(-)
>>> =C2=A0 rename {meta-arago-distro =3D>=20
>>> meta-arago-test}/recipes-connectivity/initscript-telnetd/initscript-tel=
netd.bb (100%)
>>> =C2=A0 rename {meta-arago-distro =3D>=20
>>> meta-arago-test}/recipes-connectivity/initscript-telnetd/initscript-tel=
netd/telnetd (100%)
>>> =C2=A0 rename {meta-arago-distro =3D>=20
>>> meta-arago-test}/recipes-connectivity/systemd-telnetd/systemd-telnetd.b=
b (100%)
>>> =C2=A0 rename {meta-arago-distro =3D>=20
>>> meta-arago-test}/recipes-connectivity/systemd-telnetd/systemd-telnetd/t=
elnetd.service (100%)
>>>
>>> diff --git a/check_yocto_rules.json b/check_yocto_rules.json
>>> index 7b3e20db..26275421 100644
>>> --- a/check_yocto_rules.json
>>> +++ b/check_yocto_rules.json
>>> @@ -27,8 +27,6 @@
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "PV-1" :{
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "skip_files" : [
>>>              =20
>>> "meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb",
>>> -           =20
>>> "meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-t=
elnetd.bb",
>>> -           =20
>>> "meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd=
.bb",
>>>              =20
>>> "meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb",
>>>              =20
>>> "meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.=
bb",
>>>              =20
>>> "meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb",
>>> @@ -38,6 +36,8 @@
>>>              =20
>>> "meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb",
>>>              =20
>>> "meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugi=
ns-ducati_git.bb",
>>>              =20
>>> "meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugi=
ns-vpe_git.bb"
>>> +           =20
>>> "meta-arago-test/recipes-connectivity/initscript-telnetd/initscript-tel=
netd.bb",
>>> +           =20
>>> "meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-telnetd.b=
b",
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 }
>>> diff --git=20
>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.=
bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.b=
b
>>> index b80697e5..d36b4397 100644
>>> ---=20
>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.=
bb
>>> +++=20
>>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.=
bb
>>> @@ -16,8 +16,6 @@ ARAGO_BASE =3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mtd-utils \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mtd-utils-ubifs \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 curl \
>>> -=C2=A0=C2=A0=C2=A0 initscript-telnetd \
>>> -=C2=A0=C2=A0=C2=A0 systemd-telnetd \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ethtool \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bash \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opkg-bash-completion \
>>> diff --git=20
>>> a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-=
telnetd.bb b/meta-arago-test/recipes-connectivity/initscript-telnetd/initsc=
ript-telnetd.bb
>>> similarity index 100%
>>> rename from=20
>>> meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-te=
lnetd.bb
>>> rename to=20
>>> meta-arago-test/recipes-connectivity/initscript-telnetd/initscript-teln=
etd.bb
>>> diff --git=20
>>> a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-=
telnetd/telnetd b/meta-arago-test/recipes-connectivity/initscript-telnetd/i=
nitscript-telnetd/telnetd
>>> similarity index 100%
>>> rename from=20
>>> meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-te=
lnetd/telnetd
>>> rename to=20
>>> meta-arago-test/recipes-connectivity/initscript-telnetd/initscript-teln=
etd/telnetd
>>> diff --git=20
>>> a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnet=
d.bb b/meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-telnetd=
.bb
>>> similarity index 100%
>>> rename from=20
>>> meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.=
bb
>>> rename to=20
>>> meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
>>> diff --git=20
>>> a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnet=
d/telnetd.service b/meta-arago-test/recipes-connectivity/systemd-telnetd/sy=
stemd-telnetd/telnetd.service
>>> similarity index 100%
>>> rename from=20
>>> meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd/=
telnetd.service
>>> rename to=20
>>> meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-telnetd/te=
lnetd.service
>>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb=20
>>> b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> index 22957218..ebac81c2 100644
>>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> @@ -22,6 +22,7 @@ TI_TEST_BASE =3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwspinlocktest \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdparm \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c-tools \
>>> +=C2=A0=C2=A0=C2=A0 initscript-telnetd \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iozone3 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iproute2-tc \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iproute2-devlink \
>>> @@ -57,6 +58,7 @@ TI_TEST_BASE =3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stress \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stress-ng \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strongswan \
>>> +=C2=A0=C2=A0=C2=A0 systemd-telnetd \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcpdump \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l-utils \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xdp-tools-arago \
>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

