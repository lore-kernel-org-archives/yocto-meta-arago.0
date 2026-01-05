Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F2DCD041F
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 22:30:14 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77371.1767652208125074658
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 14:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=mmzBsrfh;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.19, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGq7JtfOt95UOWB/BE2rEnntV8lpkX8vdJ+tTI0p+eKZssG4l5L01pHteXzp4vR65yw8OMEuSM3CQGHFgZqBQgm4oB/xuAXwQHpVpsaZNk/9qV9Zz6QuhTcNbhDPgF9BfAzmKE3oifxkkbJA2a6ADKDGIIQK5orPNAJmIITy9lX5H4/5qLUDjb3PqUymp1I1UWH7ULx5tn8NnGSUEh8kRw2nsYzKWzoBrilURdD8PuG8ZpgApvz9zg1tunh0eNZPt9hwOr4w8ueGQcGdnZGdEJninIOFEcShsI7TQS4uXiDAfTXJONNcPTeMj/y/VtloGsF9kizxY+ovLVc2Ec9DRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7J8HSRzjWPm+aTICDI2hLLWkKuEGbM0PDyauQDs+CM=;
 b=ZfiPE7V5tDgIEiTNl2voWlh3kEcbC7E5iILoXOVFCELW+JK8H40Qk6wLyCo7abUeFfnCSklqlNRDDj27AuNKKCojgjo1ZGcpW+rp7wqdWvGE5LxMvgSY0jsYtE4UxpJZfLMoAaCf7Emg5kjsK6vjUiOllseq5PRu3nIzv6jPn6bIj8HRULhtIIUxGCB6x8cWNIq0CWguMRfMEdR6k04QwDr6Ggl2/VskJ6+IrGTLsYxz4sD/ORxDiSL6yRb7huKyZf8l09nzfPil7rMN0liLJ9bM1cB/YPZ+bryUkYSCEAy1J8FYDwyEr7I9iUaLRViT8rBn9Gf7RFKgSgavQfYLpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7J8HSRzjWPm+aTICDI2hLLWkKuEGbM0PDyauQDs+CM=;
 b=mmzBsrfh9QGy/LYj6T1eWAtinev04Cl01KvAGUpnZx3bVw2sv4GjJK0a6q42lvoSMdopWBYuspVvGQ/AYpJ6T+JYji4p03G0UEHB0eih7oEPK7PtXZcZyKBR5I+ZNCfabaKKHkBC6gYrw2ckUPZaRTMCgNXUxV7uf8fpPenkMds=
Received: from BN0PR02CA0014.namprd02.prod.outlook.com (2603:10b6:408:e4::19)
 by LV0PR10MB997663.namprd10.prod.outlook.com (2603:10b6:408:33f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 22:30:06 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:e4:cafe::f0) by BN0PR02CA0014.outlook.office365.com
 (2603:10b6:408:e4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 22:30:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 22:30:05 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:30:04 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:30:04 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 16:30:04 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605MU45J1994836;
	Mon, 5 Jan 2026 16:30:04 -0600
Message-ID: <07d1ec47-6cfb-435a-b2d8-da6d0c30197b@ti.com>
Date: Mon, 5 Jan 2026 16:30:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 2/2] telnetd: Move telnet daemon
 scripts to meta-arago-test
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260105221926.2503358-1-afd@ti.com>
 <20260105221926.2503358-2-afd@ti.com>
 <1887F5F5DDE0276C.1986633@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1887F5F5DDE0276C.1986633@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|LV0PR10MB997663:EE_
X-MS-Office365-Filtering-Correlation-Id: 81bab61a-2f62-4e0f-4d04-08de4ca9fa08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?p3ktwFO7uGaeWPAUGpOljxoDmMtboOx4ty4dMpaf5rgxrcJnxOkAbht6gyU0?=
 =?us-ascii?Q?kZmjEGXMZ4x4Y49ct5QRsO6/qE5ZEls63Ihy+tbNQg4zZ3Mtsskmv36QsOLB?=
 =?us-ascii?Q?0pIAQqfQSL6oKiWHvB2jdPrrTqhKmK4D1wGEaLkznlZsOpBK6UmvEy1iM5mM?=
 =?us-ascii?Q?lDT2P54h6yTGFlomC1ETdWRPfTayXSHjHslU1V+u23kfAZaXFx6UuepiB6TE?=
 =?us-ascii?Q?XtiwT1Yx434x8hKO/GQjlE0fWOZ4aiKZPKl75J2Ay9sfIpRPKkKU2pJMPCQz?=
 =?us-ascii?Q?+AP+O+9KKox5xF6rjt6mkHVj4iOkzKRQvIg6MVPP7CeFoGh1Zeb9KjD8b/e5?=
 =?us-ascii?Q?4iBNqTzh7fqQjnOqS9M1RZ0B6HMMJqEyuznu2fbMUTpkC1mLpR0KeAom9D6f?=
 =?us-ascii?Q?KJuwEtieb//jjU1gQ1pLyzYO8qp1bnEwwQF1SA/BySHFjWSZDylwocwKAFY6?=
 =?us-ascii?Q?IxqxKK/I0niX1xDiWtP8Ud1FQJa3zv7R9ANftLT5+7dr3+NDVqkISqhiImOe?=
 =?us-ascii?Q?0LBhTM3JczmBqCDB5MfVCga8vGbafMSk6mCOLeNMSAuZX/F7MSedF5TbFeDb?=
 =?us-ascii?Q?eHYbr3In8ZvrICvhPym6HMfedDOVG3n4OpTkL1gpN7ViiVp7GJi/85qTe3QT?=
 =?us-ascii?Q?ANK8ssKyIeLB/w+UlQGEDXS2jw15zy66yJKbM2Ebm/+K7yHWEQ0Yh/gL/ppY?=
 =?us-ascii?Q?1F3BYS/+7Sz0CFVzR308olobG86YV9CtwftUrRY+20EaY18K2TkVzZAEA4xM?=
 =?us-ascii?Q?wVM5Egtfg/4uHch7BNQ0slFFa8EAPMsJw757ZZeRT4q17z37kzDh7XWQDEVG?=
 =?us-ascii?Q?6tE3/QxI28Wb2R2xqX8xXwbdjZJrj1miducgilGR0+PyQ6gDUo89QlTKA9Qd?=
 =?us-ascii?Q?pCrRyi4wgs8vn0xH5pNJvMaFN69SbpDOUas0g7SVQ+J9Lu+i5K592AJdSeKu?=
 =?us-ascii?Q?YManXax6fMPj5oOV/eaYyx9GsGD8oH77RPPzeqO1ELEZbEo6EPf1Lq11YM2/?=
 =?us-ascii?Q?YSZ3ofJ/U3tCUJEeyJra3d4Tdm8PY8G6v0uHZTjKV4mtTzBTRHW8XvojMQhE?=
 =?us-ascii?Q?BsON62a5cG2KIE84Ys/SHdOexC4EUwHYCDo2sUPDgq8JY4keWoBESETI8Qcb?=
 =?us-ascii?Q?WFhVjiNywEhd1YRZnyaA47hSYiV4eEMmi/KeBjtoRimK+8eY5G3LEAs1azxW?=
 =?us-ascii?Q?pVD8QeYTj9CZbxUrS5bBpTprbcVQpmxyiov+yxjSsog8JX8n6b1WTFBItnaW?=
 =?us-ascii?Q?uZQJImSMTNHj2ZTP15llRWlsNvdouDg0vS5S+xs3cXFMdB3plV2w/bJbYp/7?=
 =?us-ascii?Q?6DhO90D6ua1S58b9yu2hRi1WcHkOfLLEFLb7aUmkJBE8vgANulvI5X78d0IX?=
 =?us-ascii?Q?n1YI0mI3OMeR1tsQ5dlhu3UDJ4NNx/VfyYpXe3WlMqkb4w0Hi0A283XW15by?=
 =?us-ascii?Q?ITKvPNmNmGsL0A8YkhZVqUBnf7X8S/tVW9Uis+aayPbmpkEbBG+XScHcEPS0?=
 =?us-ascii?Q?MMqekcizqM3mEq7/N/gROEYGsasnFneO4fRALqqDNf3HuRLWJshgNzoArG2a?=
 =?us-ascii?Q?V7WhMERPeUzyPmvdcSU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 22:30:05.9987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81bab61a-2f62-4e0f-4d04-08de4ca9fa08
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997663
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Jan 2026 22:30:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16927


Maybe we should make a ti-test-core?  or ti-test-required?  And put=20
things like this into that package and have it in ti-test as well.  Then=20
we could change the image dependencies to require the new=20
ti-test-required...  Would that work?


On 1/5/2026 4:23 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
> This one may not work.=C2=A0 This assumes that you have ti-test intstalle=
d=20
> (which not all images do).=C2=A0 And without ti-test in the image, then y=
ou=20
> cannot telnet to the board during test.
>=20
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
>> =C2=A0 rename {meta-arago-distro =3D>=20
>> meta-arago-test}/recipes-connectivity/initscript-telnetd/initscript-teln=
etd.bb (100%)
>> =C2=A0 rename {meta-arago-distro =3D>=20
>> meta-arago-test}/recipes-connectivity/initscript-telnetd/initscript-teln=
etd/telnetd (100%)
>> =C2=A0 rename {meta-arago-distro =3D>=20
>> meta-arago-test}/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb=
 (100%)
>> =C2=A0 rename {meta-arago-distro =3D>=20
>> meta-arago-test}/recipes-connectivity/systemd-telnetd/systemd-telnetd/te=
lnetd.service (100%)
>>
>> diff --git a/check_yocto_rules.json b/check_yocto_rules.json
>> index 7b3e20db..26275421 100644
>> --- a/check_yocto_rules.json
>> +++ b/check_yocto_rules.json
>> @@ -27,8 +27,6 @@
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "PV-1" :{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "skip_files" : [
>>              =20
>> "meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb",
>> -           =20
>> "meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-te=
lnetd.bb",
>> -           =20
>> "meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.=
bb",
>>              =20
>> "meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb",
>>              =20
>> "meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.b=
b",
>>              =20
>> "meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb",
>> @@ -38,6 +36,8 @@
>>              =20
>> "meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb",
>>              =20
>> "meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugin=
s-ducati_git.bb",
>>              =20
>> "meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugin=
s-vpe_git.bb"
>> +           =20
>> "meta-arago-test/recipes-connectivity/initscript-telnetd/initscript-teln=
etd.bb",
>> +           =20
>> "meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb=
",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 }
>> diff --git=20
>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.b=
b b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
>> index b80697e5..d36b4397 100644
>> ---=20
>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.b=
b
>> +++=20
>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.b=
b
>> @@ -16,8 +16,6 @@ ARAGO_BASE =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mtd-utils \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mtd-utils-ubifs \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 curl \
>> -=C2=A0=C2=A0=C2=A0 initscript-telnetd \
>> -=C2=A0=C2=A0=C2=A0 systemd-telnetd \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ethtool \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bash \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opkg-bash-completion \
>> diff --git=20
>> a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-t=
elnetd.bb b/meta-arago-test/recipes-connectivity/initscript-telnetd/initscr=
ipt-telnetd.bb
>> similarity index 100%
>> rename from=20
>> meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-tel=
netd.bb
>> rename to=20
>> meta-arago-test/recipes-connectivity/initscript-telnetd/initscript-telne=
td.bb
>> diff --git=20
>> a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-t=
elnetd/telnetd b/meta-arago-test/recipes-connectivity/initscript-telnetd/in=
itscript-telnetd/telnetd
>> similarity index 100%
>> rename from=20
>> meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-tel=
netd/telnetd
>> rename to=20
>> meta-arago-test/recipes-connectivity/initscript-telnetd/initscript-telne=
td/telnetd
>> diff --git=20
>> a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd=
.bb b/meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-telnetd.=
bb
>> similarity index 100%
>> rename from=20
>> meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.b=
b
>> rename to=20
>> meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
>> diff --git=20
>> a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd=
/telnetd.service b/meta-arago-test/recipes-connectivity/systemd-telnetd/sys=
temd-telnetd/telnetd.service
>> similarity index 100%
>> rename from=20
>> meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd/t=
elnetd.service
>> rename to=20
>> meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-telnetd/tel=
netd.service
>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb=20
>> b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
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

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

