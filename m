Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE8EF33823
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 19:58:53 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85688.1773777531000541885
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 12:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=V8k2HZKz;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.35, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQDP5MOEJtexRtLSr0JHyFBgYx1uPCmBAAG2KOlI/ybRRFrkEPgI0CMiMr9efEWL4f+l8/EFgQS9dcZGluT3YBWtHERhA/3f3VfKAQSWUdimbL5c3F7RFNkpCs08fudnekbQjnIDfWgG+2flAagYFbwcuBU7OSdodigvvQXbyTKdtWzEHkZNqMz0c9MBbMb3jWQ5u8s7RIx4i+uGY5oEDcabHZGMsqBIPENrNXZjqsqmaET1BhopJZxbPqvoYoZiCIdBPtdWkmET0rQhk//7qbkeztJhT0bqBm59o3mJuvraRLuUOst9hE5PVqU552R/cCxjTRcX7UDCgTaS/CVfUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKDVXst9A/EdmBNCRsh2MttZCaMDA49TGY4eCFrlHLk=;
 b=BnWtE2WWLOadQxKnRJiw7UwEPXzX3VPUKnH0q0el3kCINDE3ZTlMLrAgfgZYI+K0lPrxRNle61WZCBUehja+8UVdRD6IaW0I1AJ6FFNCT0/Sy+c4otKB+nYJsVz74E/LQYiju/2zw/mfptdOqbe2RDb9iMvSRJlqxSfP4eCtTVhZP1S7fevjYBByHamlRhfe3LCH2wZiUyyofON+zxqfTGOzL3pWnWEszqPhWjyLxEw34LkpWgiUYZJ0gUiUNbuh0ZyvG9YwNArwDc5thsjqf0n0dwmVqsoGSGv0O7nnI1RCWtn1LXFG+ytmEn3Hk+8sl0yyMgkA2VaQ4HJe++Kfgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKDVXst9A/EdmBNCRsh2MttZCaMDA49TGY4eCFrlHLk=;
 b=V8k2HZKzCa6ZAu6W+t/QvFWcwQ7LnGHiQBS0ngOGeaHr4BZJttQugToS8J39vK6ZRwq5yuR62LeyCFLUHUmS7/ekgzUVwwDvD6W1Xgcw3MMzOOhFJngWEeBjeKMl3Vfk7fh9ml99DbESmMZRspGMBrRMpkU0kBoZ96PzDGfdzOE=
Received: from BN9PR03CA0865.namprd03.prod.outlook.com (2603:10b6:408:13d::30)
 by SJ2PR10MB6990.namprd10.prod.outlook.com (2603:10b6:a03:4d2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 19:58:48 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:13d:cafe::d1) by BN9PR03CA0865.outlook.office365.com
 (2603:10b6:408:13d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 19:58:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 19:58:46 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 14:58:46 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 14:58:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 14:58:46 -0500
Received: from [10.249.32.142] ([10.249.32.142])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HJwkRC3756574;
	Tue, 17 Mar 2026 14:58:46 -0500
Message-ID: <598ab4c5-8e1c-47a2-a3ff-52046b015a92@ti.com>
Date: Tue, 17 Mar 2026 14:58:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/2] libsdl2: Add tests package
To: Antonios Christidis <a-christidis@ti.com>, Denys Dmytriyenko
	<denis@denix.org>
CC: <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <20260317185724.34717-1-a-christidis@ti.com>
 <20260317185724.34717-2-a-christidis@ti.com>
 <20260317191426.GA11121@denix.org>
 <b1bd0c0f-15c9-4f35-88fe-12e12e88ee22@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <b1bd0c0f-15c9-4f35-88fe-12e12e88ee22@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|SJ2PR10MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a7b07e-c506-45fa-ae9e-08de845f99c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	g3jazyTtoe782cdrXhyFnczBbbCuCwnrsXSF50yEaVYE4ozS0frHjG63zAAVOJFAMByAOuOiAWpD08V7jhFxFy4JeKfZI3uXfqgMY+6gzudAszEc3mMdkTkKb/kyzzlzg0jL0X0pyC5Q5cEE6wAVngb8VHy+bz1XnE8fMgncyXsrNH5dEn+aG92jyqFtfEojJYWoUo1sKuuFUw+1IxukfbMz7QNzzJPme6RYuSK1uZoZn5LL41oC16inAbJOnBsNqrNs+gLTEoXbIlddnROFNkzJhIaZjcMQgFVrlzNXuzw0fapGWOdGCgtRW/f5xCIW4Dcb1+7+fNFwMJQm/8GQ5T2B8HrrNa1BetxzTT370EANQ2/CrIdYEvCsYOs67g9AMOK4ACZoROZiCu5DmgxO4FhvFGQ22ce+uV7A4feZEF5jqt4VVBS34JNUytZilRM6PPAZw0AYYit89ngbNMhU07mx0PagxNg1GTDJGMhXYlwbmWt1kSDxi/3yBG1ojth1pPIj6yD/P6kUwCA/K08iF9lWAbiQfj9M9W+iKwUKRM1Oq7AsQ2zhbaWnLUl4gvX3gEP3yefljq8z4Q/Sg6gQPgXmcEqy2ySoMcpJh9HqSmFXV2huqqXvkQpgGIWxHGKhpL8hwJY2j8yS6270nJIxZmvWlm991JodVr6AcOjmRTaQdy88fTiXL94hnI4CcjvSxTssIArrLeFZIkxwNinmA7T26vJLlF36Oi6WRN/TBVw=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	D8n7g/h4g6aUM3TtnVLj9Mah/aIrE3JrSlHcJQQ9mbCzXnCtX7TUNkdVcl/+y+axMRgQZyR7zWtpkXamiq46nDH1lfhgTItNyM14wejkbL2eaN2kvkKGhCu2vCfp9nWmZGL2OKtJQdEhwS4YRwp1myOXBHMX7AULhxbpG2NeP2LJvRs+5HEcZF1bRzjLPz1ufIQCR351bD1Q2cNYMIbsGAZV31Us8XajRT2+TjyG5dghuHKUXV1OLmKVX887HqmNIpOGQSfh86K0qxzGFLBU01iuoErzCW7w6WGqckP0lEOAsLWSKKS+N2lg0IqB1UOPKSrnTO0skQeA3U+gNiT1n37Kj9xC09ViU8wD7GVbe5d/OqLYi/U0avktnZJKiEq3CDPBSEFcIW1bm/Z7AuprOAPpJJ8gPRBZs3/uOAgpyuRsvlRxvnTA+N5+0+LXFVZi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 19:58:46.8535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a7b07e-c506-45fa-ae9e-08de845f99c2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6990
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 19:58:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17377



On 3/17/2026 2:29 PM, Antonios Christidis wrote:
>=20
> On 3/17/26 2:14 PM, Denys Dmytriyenko wrote:
>> On Tue, Mar 17, 2026 at 01:57:23PM -0500, Antonios Christidis via=20
>> lists.yoctoproject.org wrote:
>>> From: Antonios Christidis <a-christidis@ti.com>
>>>
>>> The software provides tests, configure cmake to build and install them.
>>> Package the tests in -tests package.
>> This might be useful to get it upstreamed as a new PACKAGECONFIG to=20
>> OE-Core...
>=20
> Thank you for the idea, I'll keep that in mind.
>=20
>>
>>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>>> ---
>>> =C2=A0 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc=C2=A0=C2=
=A0=C2=A0=C2=A0 | 6 ++++++
>>> =C2=A0 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend | 4 =
++++
>>> =C2=A0 2 files changed, 10 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>>> =C2=A0 create mode 100644=20
>>> meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
>>>
>>> diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc=20
>>> b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>>> new file mode 100644
>>> index 00000000..f33ff909
>>> --- /dev/null
>>> +++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>>> @@ -0,0 +1,6 @@
>>> +EXTRA_OECMAKE:append =3D " -DSDL_TESTS=3DON \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 -DSDL_INSTALL_TESTS=3DON \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> There's no reason for :append here, while +=3D could work just fine.
> Do you want me to send a v2 for this ?

Yes, please.


>>> +PACKAGE_BEFORE_PN =3D "${PN}-tests"
>>> +FILES:${PN}-tests +=3D "${libexecdir} ${datadir}/installed-tests/SDL2"
>>> +FILES:${PN}-tests:class-nativesdk +=3D "${libexecdir}=20
>>> ${datadir}/installed-tests/SDL2"
>> If the values for these 2 are identical, why do you need to set
>> class-nativesdk variant explixitly?
>=20
> Ryan observed an issue when class-nativesdk variant wasn't set=20
> explicitly on scarthgap branch.
>=20
> Link:=20
> https://patchwork.yoctoproject.org/project/arago/patch/20250917220826.207=
8836-2-a-christidis@ti.com/#31054
>=20
>>
>>> diff --git=20
>>> a/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend=20
>>> b/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
>>> new file mode 100644
>>> index 00000000..385aa801
>>> --- /dev/null
>>> +++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
>>> @@ -0,0 +1,4 @@
>>> +LIBSDL2_TI =3D ""
>>> +LIBSDL2_TI:ti-soc =3D "libsdl2-ti.inc"
>>> +
>>> +require ${LIBSDL2_TI}
>>> --=20
>>> 2.34.1

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

