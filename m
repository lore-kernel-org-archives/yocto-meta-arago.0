Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7356CCD0426
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 23:36:54 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78669.1767656212556641287
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 15:36:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=g4WWUxin;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.17, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKwbxPOseh+Jq4t/WXIuPbUX0aLRG8vcHXUgclSnRpGLIUjEM68eMNFdYoleuPBJnmY/IsZRZYeOGmXl33v2DTvTToHzA66deB+SWBRTTeZFU9LXdDH8uvHx8z2cVc/Q5EFIiTn8nZ826cd2IX1a+lDmb3d0sx9/cLCLVn/VPJMIy/kKO5FZ08dG8XSMGo6UrpcNA7tf05i59N1P8g9BApL6imxukR1GPjLhDtQOfZlIRFVl7EoGTxR2L9vJtnQtAoQ3hXEZAwoRCKD7aYycbWmEjfL0p5fFax/Z/4guKghdzX3G3tG/4BXKXsUSkAmOg7+vbbTeiZY5IgCnYnQ8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dKyVChikZ31OdXOwP8vy1gmk4GZ3d4ptfnIKrHWSaI=;
 b=J6Ri8qehDyjFZVigr11uzsvbta7o+XEpDVtKYVD4GViQ75R3VWBDRoeOYKuQ5wj9LU2AzwoXAtf22f6mHRO/mDIkA8gIjVQ/eUjzd2HPy70Ckoc52vB5LQicNfFpdGlD1nih1tyDvoVxPag7tHTbKL+q1s7Mjt6wCSnc++uGhhdbR4iDA5Tgf7tZE5BtQyZAee8LSIAGumh6lyM7dhgBWLbSSucyzyaqpe+2KZejbsFIuy8hUJ9ihdoHijI4sQy4A9mz8rhxWLTHocaeGmBTcGgN5YYYPjTvjAdEwIPDhaIkCgrqIVFxHKvworq+4PLgHALkmCVturJt+56XV8EfRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dKyVChikZ31OdXOwP8vy1gmk4GZ3d4ptfnIKrHWSaI=;
 b=g4WWUxindy5wFc6i26zMHh63bQArbRWUqKulWCdLTTJYkOjLwUUMKPWAJkdFKemd/HYb6epF96rtVwm9GH+MF/S/8lInJqXZpCvVFhoFh10D2ntrKlJxpOUJ0Zrip7saE5DR6m5R6X0ttTfZvgv1CxxdYy8yVNpsAEBd76ArlZo=
Received: from DS7P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::9) by
 CH2PR10MB4389.namprd10.prod.outlook.com (2603:10b6:610:a9::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Mon, 5 Jan 2026 23:36:49 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:8:1ca:cafe::24) by DS7P220CA0012.outlook.office365.com
 (2603:10b6:8:1ca::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 23:37:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 23:36:48 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 17:36:48 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 17:36:48 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 17:36:48 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605NalHT2064293;
	Mon, 5 Jan 2026 17:36:48 -0600
Message-ID: <2068f564-6855-4087-905e-c7da0c151ddb@ti.com>
Date: Mon, 5 Jan 2026 17:36:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 2/2] telnetd: Move telnet daemon
 scripts to meta-arago-test
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260105221926.2503358-1-afd@ti.com>
 <20260105221926.2503358-2-afd@ti.com>
 <58492a2d-1cfb-4289-ba1a-f86939d54b36@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <58492a2d-1cfb-4289-ba1a-f86939d54b36@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|CH2PR10MB4389:EE_
X-MS-Office365-Filtering-Correlation-Id: 683a87f5-bb8a-42db-e4db-08de4cb34be2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?y0WN7fMj6DS0HzO0QUdZzzJP+C6RPfmrd+r2h76l2XSH198iyjl3WVXWlgob?=
 =?us-ascii?Q?n9YE352+9VCpB9s9mZx8zXMQGqtx5ut8R7YyFGNHxT/AVCx8Kxl/uqfLZXl2?=
 =?us-ascii?Q?Rz5H8h7+gNZhGjE2QMnYqRclrEQZOLLobmdmu3camPZEOverCounUSI+8DiH?=
 =?us-ascii?Q?L4pS7K+T36CVlFTDG/yYNTZp4L+WEcDMCR2xA9Fkx+Oi30hQr/wZuB35aYSP?=
 =?us-ascii?Q?zh7Edmg/DrWgdWJlapV79sK2Fr2AYiOLv4GVF6wVp43iDyM0l+nIFnKZni37?=
 =?us-ascii?Q?NPdn3IQZKdYKp60RagMe4kt8z/+7uGTFdTTAdrxjfjvw/NJCOWGFPfU6Mosr?=
 =?us-ascii?Q?Sn6pi2I3JsanmAAWsjrG/+32wUGkRl6mT7hO2hvylZ2dHY7WLnS4Idj43CYl?=
 =?us-ascii?Q?CNcoQsSy9mroZbiQQhnm7NzeMc7GbEiNxaJXLLcDlpb21t/dP8aKCzzMPZrg?=
 =?us-ascii?Q?5Zg2kN/bYm5UFi44EpJvmQlF+fMrh+IK2odgpHQPvpLZ7LUP0QToC+3tLeAK?=
 =?us-ascii?Q?58hOzu1YEqv4CybQ+fwfZ3VJOy4fhyYCoUuH+fT9n5ShQXv65TzTEPJYjeSY?=
 =?us-ascii?Q?PivXATODvf9jsvOkLicacWBS/4JJQ9HVs0goFqCXJj155JrCDOhWvnBKFY7F?=
 =?us-ascii?Q?bursw9bxcRhmLLfJFBvuye9eD3otjIs7ctyrmMfW+VR6yfZ5P9E+KtdIOk9W?=
 =?us-ascii?Q?5OJjY6T7stO2aObCPK5989IFGiFeVFZ7r3ng9MfonOyA/Js1/pyFv3EUUtnU?=
 =?us-ascii?Q?sMtyt+r3TmmocOof9NRdhI/FbsT4PTUXIGOZ+5YVVsKfu8ezbTUkFYTLhoSj?=
 =?us-ascii?Q?ZQ4GFt+u7+s+zasiGBMNCvTw1DdV4/OfolRW0Rayy87+Ygv92ZweGUMCXXur?=
 =?us-ascii?Q?wTKsTLyC1Xus0p5TnC25jjmWx6Icew0hLWMt7w4Bl9c488pke98gng1EqcJK?=
 =?us-ascii?Q?2lMlzor0k88x04gHwCxAq6BkDdNWh3wa4xeOEjsMGxKCRvnViYAYCd6tOfc0?=
 =?us-ascii?Q?p0vsMb/qwdFVWCfW30GP+NDlSKl/zL+mxUNxHtTZOYoHymyf8HdDa53+egnz?=
 =?us-ascii?Q?d+hEwg+WMcRy/v+nDDdNNKAbtjeJgpr+eQHIx3bA5GSMFa9FsDAPtuZAfqWs?=
 =?us-ascii?Q?BwxlBsk8ZQnRBq5WcaNZzF/N/VMpQV7em5I+bTjKScVgHlHQpSJmS4cEvMhF?=
 =?us-ascii?Q?0Vivuy1k9YPC/zjdMAx9MVgBzE46FvxqsSxI1y7b2+WAS2q++6cb1fqprygC?=
 =?us-ascii?Q?Uf9hgH+8EQOhdtJkcCtUMlWBRLTiARxXRzkLuBKO/wUMadvEcp8KDf4eUsxq?=
 =?us-ascii?Q?pVHrohbUmKrRr1a3FWtjQDcl617/uOrKZOnRF097PEaFmd1B40PHTuXb5YKL?=
 =?us-ascii?Q?25axbcRprC1nJ7IS58zTXP25/SlvnFk0k3avFkTZzKOg3sgcyPhlL6N9fUqr?=
 =?us-ascii?Q?1/r1F0v0FqPoeBCUt3iIZZDxqiSEqMMEzVry3w7GryWXbAZ+rBevLXT2sMrZ?=
 =?us-ascii?Q?o83YfDwrhI5RdhgNhT4G+Q8PBwdcN/pBv5w2fzCITPLrR5mt/T0V+vBmCMxt?=
 =?us-ascii?Q?GGUf7Mwgwq3bI00pNfE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 23:36:48.8189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 683a87f5-bb8a-42db-e4db-08de4cb34be2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4389
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Jan 2026 23:36:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16929

On 1/5/26 4:23 PM, Ryan Eatmon wrote:
>=20
> This one may not work.=C2=A0 This assumes that you have ti-test intstalle=
d (which not all images do).=C2=A0 And without ti-test in the image, then y=
ou cannot telnet to the board during test.
>=20

Why would you need to telnet onto a board to check on test if you are
not testing? If you are testing, then you would have ti-test.

Removing this from images that are not specifically meant for use by our
test automation is 100% intentional. Right now anyone can telnet into,
as root, without a password, all of our images. As much as we love to claim
no one should be using these images as a base for their production image,
absolutly every single customer is anyway. Which means we have a huge
security foot-gun here, and customers *will* end up shipping devices with
this massive security issue.

Andrew

>=20
> On 1/5/2026 4:19 PM, Andrew Davis wrote:
>> These are only used (and only ever should be used) in testing images.
>> Move these out of the base distro images and only into images including
>> the ti-test packagegroup. Move the recipes themselves also over to
>> meta-arago-test.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> =C2=A0 check_yocto_rules.json=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
>> =C2=A0 .../recipes-core/packagegroups/packagegroup-arago-base.bb=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 --
>> =C2=A0 .../initscript-telnetd/initscript-telnetd.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 0
>> =C2=A0 .../initscript-telnetd/initscript-telnetd/telnetd=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
>> =C2=A0 .../recipes-connectivity/systemd-telnetd/systemd-telnetd.bb=C2=A0=
=C2=A0 | 0
>> =C2=A0 .../systemd-telnetd/systemd-telnetd/telnetd.service=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
>> =C2=A0 meta-arago-test/recipes-core/packagegroups/ti-test.bb=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>> =C2=A0 7 files changed, 4 insertions(+), 4 deletions(-)
>> =C2=A0 rename {meta-arago-distro =3D> meta-arago-test}/recipes-connectiv=
ity/initscript-telnetd/initscript-telnetd.bb (100%)
>> =C2=A0 rename {meta-arago-distro =3D> meta-arago-test}/recipes-connectiv=
ity/initscript-telnetd/initscript-telnetd/telnetd (100%)
>> =C2=A0 rename {meta-arago-distro =3D> meta-arago-test}/recipes-connectiv=
ity/systemd-telnetd/systemd-telnetd.bb (100%)
>> =C2=A0 rename {meta-arago-distro =3D> meta-arago-test}/recipes-connectiv=
ity/systemd-telnetd/systemd-telnetd/telnetd.service (100%)
>>
>> diff --git a/check_yocto_rules.json b/check_yocto_rules.json
>> index 7b3e20db..26275421 100644
>> --- a/check_yocto_rules.json
>> +++ b/check_yocto_rules.json
>> @@ -27,8 +27,6 @@
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "PV-1" :{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "skip_files" : [
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb",
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "met=
a-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.b=
b",
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "met=
a-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb=
",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-serv=
er.bb",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb",
>> @@ -38,6 +36,8 @@
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-ducati_git.bb",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-vpe_git.bb"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "met=
a-arago-test/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb"=
,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "met=
a-arago-test/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 }
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-base.bb
>> index b80697e5..d36b4397 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ba=
se.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ba=
se.bb
>> @@ -16,8 +16,6 @@ ARAGO_BASE =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mtd-utils \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mtd-utils-ubifs \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 curl \
>> -=C2=A0=C2=A0=C2=A0 initscript-telnetd \
>> -=C2=A0=C2=A0=C2=A0 systemd-telnetd \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ethtool \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bash \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opkg-bash-completion \
>> diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/i=
nitscript-telnetd.bb b/meta-arago-test/recipes-connectivity/initscript-teln=
etd/initscript-telnetd.bb
>> similarity index 100%
>> rename from meta-arago-distro/recipes-connectivity/initscript-telnetd/in=
itscript-telnetd.bb
>> rename to meta-arago-test/recipes-connectivity/initscript-telnetd/initsc=
ript-telnetd.bb
>> diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/i=
nitscript-telnetd/telnetd b/meta-arago-test/recipes-connectivity/initscript=
-telnetd/initscript-telnetd/telnetd
>> similarity index 100%
>> rename from meta-arago-distro/recipes-connectivity/initscript-telnetd/in=
itscript-telnetd/telnetd
>> rename to meta-arago-test/recipes-connectivity/initscript-telnetd/initsc=
ript-telnetd/telnetd
>> diff --git a/meta-arago-distro/recipes-connectivity/systemd-telnetd/syst=
emd-telnetd.bb b/meta-arago-test/recipes-connectivity/systemd-telnetd/syste=
md-telnetd.bb
>> similarity index 100%
>> rename from meta-arago-distro/recipes-connectivity/systemd-telnetd/syste=
md-telnetd.bb
>> rename to meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-t=
elnetd.bb
>> diff --git a/meta-arago-distro/recipes-connectivity/systemd-telnetd/syst=
emd-telnetd/telnetd.service b/meta-arago-test/recipes-connectivity/systemd-=
telnetd/systemd-telnetd/telnetd.service
>> similarity index 100%
>> rename from meta-arago-distro/recipes-connectivity/systemd-telnetd/syste=
md-telnetd/telnetd.service
>> rename to meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-t=
elnetd/telnetd.service
>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/met=
a-arago-test/recipes-core/packagegroups/ti-test.bb
>> index 22957218..ebac81c2 100644
>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> @@ -22,6 +22,7 @@ TI_TEST_BASE =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwspinlocktest \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdparm \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c-tools \
>> +=C2=A0=C2=A0=C2=A0 initscript-telnetd \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iozone3 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iproute2-tc \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iproute2-devlink \
>> @@ -57,6 +58,7 @@ TI_TEST_BASE =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stress \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stress-ng \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strongswan \
>> +=C2=A0=C2=A0=C2=A0 systemd-telnetd \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcpdump \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l-utils \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xdp-tools-arago \
>=20


