Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97086FD8FCC
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 15:34:41 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72654.1772120072206658649
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 07:34:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Pni9fZxm;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.47, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbNOcfwYyV0OsS+wnSDR+nh8qWm02LFq1ohgb0QAJLegJw9B+BIOc6r/DQ0+XepmBTq17PYRdaQ5hUYzGRUzcUOCA4sEbdnt0ecLLD/3PlW6194YDXIH8LcZyT2OIGXdnfniDnRPk1sXw8wi/qlnRO441Q9badXa3mLl+4kS6AH7hDtzVw2HX9XE2IXrwuVoHdmTcTuVFPcDlSwk0h+wGK9SDHoeZQbRdwXgaQn8mtCLqdEwjRWqrKpRFS/NzxKCqGj2wboUI881Zwv2hMJv4vQsLx/P56VvF9MqWRErMddEpnhXi4EMuweGK+9CJVZXwMMMuUQTVqbj3NbFj1T+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4smJcIgDyyMIwPUoycEU6ujCw2yV15IKDR2zvqm0+M=;
 b=wCAvkcBZ47n9/QDQ3PsVIlBOEoZQPsLqVl4Z2GuclqWvd1lN+Sj/l5qjvmBWYfkQayv6834PjF3bOnm511gKjz5cn20SMclqhYHlaDU7Bh1GNxfOdsnK783kBzbs24WbfDxG6hyUINyXhophrpw3yBEypeWMUbMfqKY6YjgYoRJrG9SMaA5DiymPC4YHJ+q2NM0BpTYQEfapxDkSIkFhPrkWjLSJM2rNZtNRqn+nELojivcku5dVOWdfTM9cNoZ9ZGeJQWsT3yseKL6Buc5PSYoodE467jtC95rVQmsR7XanckWNltf/NVgjYoMnW42jy3zbzROODIbWM4MzbAwUUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4smJcIgDyyMIwPUoycEU6ujCw2yV15IKDR2zvqm0+M=;
 b=Pni9fZxmEO4GFTmF3yKQ77HM86GQXRVysaYnaWvxo7uuMM3hszVZn3nqwmB3VPsZChD0ooRFa23g8E1FWPxNcGWSwKYMfavi3sOBWb4eKlEBRF1NbI56KW1L//NqY4ey5D4LWqVcpgI/Oneb9MhGuA8nc2l1uAK8oXsGyux4fCU=
Received: from BYAPR08CA0031.namprd08.prod.outlook.com (2603:10b6:a03:100::44)
 by CY8PR10MB6466.namprd10.prod.outlook.com (2603:10b6:930:62::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Thu, 26 Feb
 2026 15:34:29 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:100:cafe::12) by BYAPR08CA0031.outlook.office365.com
 (2603:10b6:a03:100::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 15:34:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 15:34:26 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 09:34:20 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 09:34:20 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 09:34:20 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61QFYKMi2105577;
	Thu, 26 Feb 2026 09:34:20 -0600
Message-ID: <506e6042-5c12-4517-adf6-981a833f8b2a@ti.com>
Date: Thu, 26 Feb 2026 09:34:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] ti-test: Add Required Multimedia
 Packages to ti-test
To: <b-brnich@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Darren
 Etheridge" <detheridge@ti.com>
References: <20260225190339.3295692-1-b-brnich@ti.com>
 <20260225195731.GS11121@denix.org>
 <3fb387c8-dedd-40a5-9595-6e5eab18cfc4@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <3fb387c8-dedd-40a5-9595-6e5eab18cfc4@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|CY8PR10MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: b73a5ddb-0c29-40ff-14c7-08de754c8665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|36860700013|34020700016|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	RMM5zN95dkRGjKZUCCZHr1xza36bWJU9oDWAAt26mqedGrX0CAJYap6ZEUsVsaONrPX9tH4lJfKSNfP5IJhz3AGfutoDdIT2UTtb89xxEzP0eFFTkrogQ88YibDgfPUT+8TdUnfXpC8viub/cmtjxKw9ydCA6RHCHunBKy8saL4pKsAdCfNJMTwXRDz8LmOiYaYlVeTX/E2co8+8mv7ivUTOXmplGFctmoab7spGx8C9Hd73Q0iyqM3QeXb3jMa9HBwbvGVBtk0f4FPuiFVBy42IW6ylWXfI8AuLOr5mzFRZyNh7Oiw+MLkMBWG/6P30herFz42gOm/oiDj3WSj7dtMqvzSuhq2VoRDwaD9Xfh2CGOTYeiNeyq0eDi+ua79NHSVQS6vPCv8ap0D2dhZHxHtPLgQ7I0G09V2YzImL/Xn9Z+t/W7oXgTVk/LEWRIR9Wli1CNSmjMGwwPEMlCcdGz2gVsH9CaGY9OhB92lF0WeLpxtTLCjAx/ti13b39dPJgFVHvwQI4s9gRq3eN3GCVn7N9AnBsxE/CWZL0L7LAC/2xPyNQirm/XCfboAEE9dNGGAg/2sSy/t8GtnMJGwatRLzkOkBDhdR/4AqjJrBcv52oW+JdOzlcapv/NONf+7BWxayNtq1bzA5yRvEYc8R9sYE9Q33ovvvahhi9HqvtW6sob+Hq0tRhlkMsqveeIORn3MkJvwe0tWgKep+fT0y+wUE6EhpDWALwn5RqXAYlVY6oMXxmRGyuZb+NMcjHi7IQkDLyREZtlWhx9OhkwlMSw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(36860700013)(34020700016)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	DO1E0FH1td8FSceGqqnZrPvx/eUkUjXInLTmFsL8ic9qplD+UDYrg9UTxXuFH8skZv7Nz7Y5MYNVhDxYu+gGNAybtC7D4lEqQNbNHPLu7ht1UrhK6W5JTH1D5mbo+FrUQ5rWd+CQOcNt3jt5Yhsjliy7bi93xHhUauRJJshXyiq+su2qtswwrMzIaknPM9TycFtKexhPmGrRtEbaC6tE3G9wKNTl6aP6VwP/TP69ah1e+6nJb52BYS4DAzcWyVm6NZ/XGbbZ1Ae7/YjtheG+vTKYmxr6E0dOfLXVPf0fPo8+MbKqMQSsCnpqNq9QCmiFE18RxDMs3jhsuAJil9OijOqHjgA8NytkzuOa3Fw2i3QPcnSG/bWlVWJqTYCIl1LlnRXmXWmnd1Z9Sf0IFLSTGpE94qpM0RztDLPxHgbO8M5IC3Cl9QSgbGoRFrLWbXAk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 15:34:26.4591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b73a5ddb-0c29-40ff-14c7-08de754c8665
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6466
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Feb 2026 15:34:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17158

On 2/25/26 1:58 PM, Brandon Brnich via lists.yoctoproject.org wrote:
>=20
>=20
> On 2/25/26 13:57, Denys Dmytriyenko wrote:
>> On Wed, Feb 25, 2026 at 01:03:39PM -0600, Brandon Brnich via lists.yocto=
project.org wrote:
>>> FFMPEG and MPV are required during automated testing. Explicitly add
>>> these to ti-test.
>>>
>>> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
>>> ---
>>> =C2=A0 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 4 +++-
>>> =C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/me=
ta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> index f2ae1aef..c694545d 100644
>>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> @@ -16,6 +16,7 @@ TI_TEST_BASE =3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dosfstools \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ethtool \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 evtest \
>>> +=C2=A0=C2=A0=C2=A0 ffmpeg \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fio \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst-devtools \
>>> @@ -36,6 +37,7 @@ TI_TEST_BASE =3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lsof \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media-ctl \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memtester \
>>> +=C2=A0=C2=A0=C2=A0 mpv \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mstpd \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mtd-utils \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mtd-utils-ubifs \
>>> @@ -145,7 +147,7 @@ TI_TEST_TI_TOOLS:append:am65xx=C2=A0=C2=A0 =3D " \
>>> =C2=A0 "
>>> =C2=A0 # Disable due to breakage
>>> -#=C2=A0=C2=A0=C2=A0 viddec-test-app
>>> +#=C2=A0=C2=A0=C2=A0 viddec-test-app
>>
>> Was there a meaningful change here?
>=20
> not really sure why it added the lines above because i didn't touch those=
 files on my end..
>=20

Only change looks to be removing the trailing space, your editor must
have (correctly) removed it while saving the file.

Andrew

>>
>>
>>> =C2=A0 TI_TEST_TI_TOOLS:append:j721e =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pru-icss \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ufs-utils \
>>> --=20
>>> 2.43.0
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17148): https://lists.yoctoproject.org/g/meta-arago/m=
essage/17148
> Mute This Topic: https://lists.yoctoproject.org/mt/117999946/3619733
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [afd@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20


