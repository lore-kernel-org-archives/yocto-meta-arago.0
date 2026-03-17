Return-Path: <a-garg7@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66482F3381D
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 08:59:19 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71666.1773737953299529405
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 01:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=QM1LoQIp;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.48, mailfrom: a-garg7@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dl+Eqosy9zKlNpKbIUOXSEU6IiCnP62YBiOcWGfN9Hzi2TAdi0jwsNeK31/YvJlGfdQNv5znddJQRWXCivuA1WdhzCUVC7k5IN6m7GfetepCdfdBJW0qlcIalIGtZHAWFvD0u95Ct72y/i6jiFbSALuY0DRTuDnFLJJdDtAGgzRobSl8RhuS5SxUU7/H1HEKSzutDujFioqW3WN2ay0vy/M1UmGqxh+w9wDgRsQYBUnkN1/Y7cR8MMPJunRr5U9ZekuEHGhuvX9Z+g1nOVUTpqRWQ21YBrnn7zxdzEkgQZeE+/aKPDNE8poe17RZLi8fIJIEA4qiwMC7mHXAcFhhtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ePb4otXgfcYfr3ud7CvNgvoV+Y3MjB7DCVw0PgN+OI=;
 b=Oeo8XuY65AWLAzRpy1JYz/9CiQyaPdkJtFjRwQ1fUhC20Xyta6rOfcOhvx8ZZ7fCzIqQqz59YmZQMO1lsxyGKieBPb4PcG1eHuDS5lp+MOjDgEZeBiOPt8BD4zhZ5WoLz+4CKS0eXw5k5Shei7Xq5mTNqoDubc283d3gx7eNAfk1kG7K3EIiKJdHgRVravEQpTi0JOx7rGSMkOgMKrwcTgxoc56x2WCJL+g1d/+u2f/JDNqQ5Vex/xkTR+PzpjuaXOsUGYDiXMsEm5MYpPkVN7b98nOVMirBEbcUgN4422g8Hby8nhs91xbCDroPmxusiPeweMrXat3tKFiyAmYDZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ePb4otXgfcYfr3ud7CvNgvoV+Y3MjB7DCVw0PgN+OI=;
 b=QM1LoQIpWp3Y2ZAa+LtpShGmAvGTJ3e6/ho4gzWHK7r3Kez5cekzKaNHVKdzKJXjWgQDvpOkDAcPGOjCgXTcekOYyMZTGk+LHGPoWt+dHeW3oanocoYNZKw/emabAD+95YBcrI+MlLsuBE92nIuSZA58JXtYgQ3WRf8jCEZxefI=
Received: from SJ2PR07CA0008.namprd07.prod.outlook.com (2603:10b6:a03:505::8)
 by BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Tue, 17 Mar
 2026 08:59:10 +0000
Received: from CO1PEPF00012E65.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::9) by SJ2PR07CA0008.outlook.office365.com
 (2603:10b6:a03:505::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 08:59:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E65.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 08:59:08 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 03:59:04 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 03:59:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 03:59:03 -0500
Received: from [10.24.69.112] (a0507033-hp.dhcp.ti.com [10.24.69.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62H8x1Fi2403052;
	Tue, 17 Mar 2026 03:59:02 -0500
Message-ID: <c3bb9f71-5f56-4e0c-818c-e0b9a5196d19@ti.com>
Date: Tue, 17 Mar 2026 14:29:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/2] ti-test: Remove the pcitest
 application
To: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <denys@konsulko.com>, <c-shilwant@ti.com>, <s-vadapalli@ti.com>,
	<danishanwar@ti.com>
References: <20260309130109.52886-1-a-garg7@ti.com>
 <20260309130109.52886-2-a-garg7@ti.com>
 <0c2b4b1c-7694-44e2-b98f-83770572e11d@ti.com>
Content-Language: en-US
From: Aksh Garg <a-garg7@ti.com>
In-Reply-To: <0c2b4b1c-7694-44e2-b98f-83770572e11d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E65:EE_|BLAPR10MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d192631-a01b-4894-ba8c-08de84037334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	YoDlJ4asAcBpyiimKYqM/q0fQ92STZdiBwf865Y2liO6bPHQlWggnWZuHeLY/9GlPCkXJhcQYeV+9vpYs4Wcma/zJOfKBzgVdWWj0sQCfCfC+fe/NHRxxojinK1zNEY0J5Rcn9CB2r4LQHFQnXk7haA1XlztMB2BnN1xCSY5EnaezQhEfRbxrbLwRwh+GpNkqUOTEnVp9iqPmwLyMtZy4L2DJN2gNbzxFxlJa1ENY9FkkeogdKcESQRAd5jJOpmc/bVlICiZn+dbUGZrtdwLmvz1gwxB1Lg4QUOPk9R68syZmcea4X8sxHqXiENUDSZDb1BCoXfv+h8e/6N6F2bHkQaFeh1bSVU3DagO9aHf5T7VUJ0XH/ZkSczMHxlvpJAzJgI5lvw1i0jA2N1tg7VPk0DXWpKe8udf82lz2KIkZ4hxcBYYmHJMcNZojP7DJD3hPn+nUy+J5cnx+t9UF58iER0C2DEGRxACI5VllPxoFax67/Uud8ObbukGr7mb8Vt3JPSsVZs/drvTcn0C9p65UpKVyq4UMBeiG7vwU1+KqXUtQhT+9qD7FPMtvZXsoEzLqQn4SF51d8s24ukEm8FoMlBD1zUWIjzeZoc+R8Ithakwdn/DyIaMEGEBT7DlU5UDf4wB6dWBlpgtCkbj5URgMmKzi4nTWEpJ4DyJMi9F6iGc9OTngvhQwciT/UnSGzr9Wlyd/qF3L60HqhIXTMym5/gp87JcZBKb48bsNFfGsrj7UxXgDuChWSMIVwrY7jrmiSKRt5TjQkSQbpRxNqaXTA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XNc+UYqtDVyeBcPrri28uc32hO2GFFMkxOTZMLQ7lnKlA/yUFCxfCfuq7kDHSw6LznWouBhOtz6Y8GQrl40OHuyGgOAl2VNBKFaoGWSNN1ddiRlcABCRbopQhuJ7HlUpGhYKChzeMJW17c6f8jiQrLE/51H/41fJD9oSsjxt2i78mwzbmkHazTqsvoSQYaWlStHHv020RozX1CDqyWEGN612qZMtjHTJdblcg46su6Ipsk1+WqZOPEn+XAyFaD8gKOabPIURH5di3WD0jmKZCRJsSmVI82dRJow5JHoZj51vPziDNeVm0dY1Wj7QIoqeM68Cr1+2nU8YAiFlYo/8ji3JS3D9Es3BSkfHr6ihyiVb/brWwao8c4NHdkxum98Gsz3YTIcveT+xbv4apaY8Wxg349ooCozVbtd0FOz2j0ICaPmNUtlWYhjjfG2bPmvN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 08:59:08.4474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d192631-a01b-4894-ba8c-08de84037334
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E65.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5009
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 08:59:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17356



On 09/03/26 19:16, Ryan Eatmon wrote:
> We can't just remove this globally.=C2=A0 We need to base this on the bsp=
=20
> that is being built.
>=20
> If you build the 6.12 kernel with master then you will not get a tool=20
> that works and will try and include a tool that will not work.
>=20
> We will need to support this until the 6.12 kernel rolls out of support=20
> in master.
>=20
> More comments inline
>=20
> On 3/9/2026 8:01 AM, Aksh Garg wrote:
>> The 'pcitest' application, used to test the PCIe endpoint functionality,
>> is obsolete on the 6.18 kernel. Hence, remove the pcitest application
>> from packagegroups.
>>
>> Signed-off-by: Aksh Garg <a-garg7@ti.com>
>> ---
>> =C2=A0 .../packagegroup-arago-bootstrap.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
>> =C2=A0 .../recipes-core/packagegroups/ti-test.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 -
>> =C2=A0 .../recipes-kernel/pcitest/pcitest_5.10.bb=C2=A0=C2=A0=C2=A0=C2=
=A0 | 18 ------------------
>> =C2=A0 3 files changed, 20 deletions(-)
>> =C2=A0 delete mode 100644 meta-arago-test/recipes-kernel/pcitest/=20
>> pcitest_5.10.bb
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/=20
>> packagegroup-arago-bootstrap.bb b/meta-arago-distro/recipes-core/=20
>> packagegroups/packagegroup-arago-bootstrap.bb
>> index e7a28eb80575..35c54ce7b176 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-=20
>> bootstrap.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-=20
>> bootstrap.bb
>> @@ -11,7 +11,6 @@ UTILS =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 evtest \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memtester \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nbench-byte \
>> -=C2=A0=C2=A0=C2=A0=C2=A0 pcitest \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 serialcheck \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 yavta \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdparm \
>=20
> UTILS:remove:bsp-ti-6_18 =3D "pcitest"
>=20
>=20
>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/=20
>> meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> index 65cf7f1ea614..25d8cce5d615 100644
>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> @@ -37,7 +37,6 @@ TI_TEST_BASE =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nbench-byte \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 openntpd \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@"optee-test" if d.getVar('OPTEEMACHINE=
') else ""} \
>> -=C2=A0=C2=A0=C2=A0 pcitest \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pciutils \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 powertop \
>=20
> TI_TEST_BASE:remove:bsp-ti-6_18 =3D "pcitest"
>=20
>=20
>> diff --git a/meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb b/=20
>> meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb
>> deleted file mode 100644
>=20
> You cannot remove the recipe since it is still needed for 6.12 support.
>=20

I missed the fact that master branch can support 6.12 kernel build.
Thank you for your feedback. I will post a v2 series with the required
changes.

>=20
>> index 9ab0dbedf4ba..000000000000
>> --- a/meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb
>> +++ /dev/null
>> @@ -1,18 +0,0 @@
>> -SUMMARY =3D "Linux Kernel PCI test"
>> -LICENSE =3D "GPL-2.0-only"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd=
7e46"
>> -
>> -BRANCH =3D "ti-linux-5.10.y"
>> -SRCREV =3D "73aa709ca10103b61fba3a07471dbb4dcb56db45"
>> -SRC_URI =3D "git://git.ti.com/git/ti-linux-kernel/ti-linux-=20
>> kernel.git;protocol=3Dhttps;branch=3D${BRANCH}"
>> -
>> -do_compile () {
>> -=C2=A0=C2=A0=C2=A0 cd ${S}/tools/pci
>> -=C2=A0=C2=A0=C2=A0 ${CC} ${CFLAGS} ${LDFLAGS} -o pcitest pcitest.c
>> -}
>> -
>> -do_install () {
>> -=C2=A0=C2=A0=C2=A0 install -d ${D}${bindir}
>> -=C2=A0=C2=A0=C2=A0 install -m 0755 ${S}/tools/pci/pcitest ${D}${bindir}
>> -=C2=A0=C2=A0=C2=A0 install -m 0755 ${S}/tools/pci/pcitest.sh ${D}${bind=
ir}
>> -}
>=20


