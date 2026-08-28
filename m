Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A41C61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 03:27:00 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74.1787887615541243461
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 20:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=iJa2gaWL;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=o1aFgaEH;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67S20A37283485;
	Thu, 27 Aug 2026 22:26:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=yUxov66LROGjE+7jDXeyGC+SBnTfKy7zvdE+zKgyq
	Fk=; b=iJa2gaWLB55+0J9CgE1KDHO98XX5XeHhJpeLSKar0mpqdQjvE4p22Wfu7
	+TXkOpEMaFiFA0jsk7HUYDfa41SiPJZNS3HHa/+TKxUom+0CnYcIqfcXC0LLMC0u
	sKG86QFAQAFFMrHfnpCMBwO+8Ab3/ux7C8Fv9t/3caVu/H7Ao1PVM9pf4iOzUyRu
	CAykwetVnvfy5490lyTn7+bP/qO1Ql0n3fWxzLh+CYHvtWKVHtw/QgVHFCKSuUpf
	Kgul9b+gkfQnf9g755WLvYhVFLJOdtk/iroXg/p1KkdMt2vJD77ngAYKjl5LE04v
	33kWVwRc8Hq8/WsmVrsRM49CcaU5w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gahg3ehwr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 22:26:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COn1V4sW3e5tqyPMJ3mg4HXy2MvO6ZR+IcnSYuWLE6FCq16ityOK/7twSKcbAYVjKAH8XNtzt8exqL1QYwam8R7/kQAxMzHdemtmRhuUALeDR6+0FcE2UCd2H3tdnTinxx04ZgvFpGFl4+3yT7z3KVBEdWY23gD7kl9ZvOKRvzDGJHKLQ6LycqcOrDuEkLYpbJE7L3sN9mSzVkmli1lV2KNHQ934yua8meq49SLDI18qylBpcRuGhncXDCwW2GuSlGRmGPTa5qIxOIpAqIWDqyfFKOj04HGaI3WUGOjjvQAjH1yQfGnWD6eBVAG//7lpDbTny4NY9rukIKE9Nv/t2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUxov66LROGjE+7jDXeyGC+SBnTfKy7zvdE+zKgyqFk=;
 b=h1uJSEE9Ft1f5J0qsotv5c/egbm/VJDTqrCZ1iK4B76JCKf59QDd54nzpIX1pp2khDtWUW05ZIKBzjofULHuYx6DVcj8t4yK4W6I3xB9ul1f9EG41WnRiPERFJB2+ZXILW9R6ESaoj231WffGJqOU2vq7PA2BwSEgKsdtVw8IEhiXjErNVrxP9OBo5qGcm78AZpgq4IuoyYKPlVU9g6GLY9n6dXmikJj513j3ypIMSo7MyaLopSQfNimEdrurYNFoAiB4NQm+zHOEvGiAxR8pX9UkFBVx39/OTHEjbaxjmPEEPWlsXs6Rdb2NonwOLpg72hytW1VwtAX1c/afzRiDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUxov66LROGjE+7jDXeyGC+SBnTfKy7zvdE+zKgyqFk=;
 b=o1aFgaEHSMlcEA0b9UY5zfyRMCrQ5iI1T55QB+Fnm9gQfmni/5bcsnRrtxXRmcxoVP0ULu+DjHg1bz8KrLEZ3HLThECpEvVsK0Jrh8q9vCm/sDnbb7ffCzp4jggH4OrDtR6RQDS/9sYw4iouCkJl8fceMemSWpg491D/3bVhbgE=
Received: from BN1PR14CA0018.namprd14.prod.outlook.com (2603:10b6:408:e3::23)
 by IA1PR10MB6051.namprd10.prod.outlook.com (2603:10b6:208:388::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Fri, 28 Aug
 2026 03:26:49 +0000
Received: from BN3PEPF00022BD1.namprd03.prod.outlook.com
 (2603:10b6:408:e3:cafe::4e) by BN1PR14CA0018.outlook.office365.com
 (2603:10b6:408:e3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Fri,
 28 Aug 2026 03:26:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF00022BD1.mail.protection.outlook.com (10.167.248.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 03:26:48 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 22:26:13 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 22:26:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 22:26:13 -0500
Received: from [10.249.138.105] ([10.249.138.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67S3QAJE3046003;
	Thu, 27 Aug 2026 22:26:11 -0500
Message-ID: <2f9a5909-7817-4ce0-8b8c-a394038638b0@ti.com>
Date: Fri, 28 Aug 2026 08:56:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] linux-libc-headers: add
 DMA_HEAP_IOCTL_EXPORT uapi patch
To: Andrew Davis <afd@ti.com>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <u-kumar1@ti.com>
References: <20260827150719.821469-1-gehariprasath@ti.com>
 <6aa57f3e-0274-4c7b-acda-d3937d542c27@ti.com>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <6aa57f3e-0274-4c7b-acda-d3937d542c27@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD1:EE_|IA1PR10MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d70808b-b4e7-48fa-3622-08df04b4319b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|10067099003|6133799003|4143699003|5023799004|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	Zp6ZIEJM7Gdkoztt5Fx5WxcYtPfdSnxmDVNgO+RtOK77eS3uEDgUDy2bSYIHKUgLfy3nd0Vs5MDnJGA/UsqioZrx5W8qqe7Tyx7Ol1dTTPS8Uzt3QXQGBaxbuB1eTr5Tspn352LjMZWuj66r1TsZ2nJcHazgtoJ3TXLFglSrgM+QHx40lhGAfF2pAWT6tQsMzM7nROMbT05mUOFlB6C7tmv5vbhwEhac4VaRLQVfp6J9gReRpX8zDhtRws26RoG2VgeAKEDoALfIz6JZ9Ey90h55CKswiYZtQFQXfMpyU/Gn5YbmYGVTtokP812Xn8wU4HNqk3jaWpcD9Ny5QbSIaXnEotnvPbmtPLevct6AubfmDqcRh6/Z1yyv4fWgtZ7+EuzanC0VQI77FACsnpgNnfP+w99ElkiiHfD+PlI5GCzAahpyWxtlbDGMdl1Oin983Q6NoxKQtMVoUSgqVI3wq5eyKH/SlkLlpb2OQxZYHP5icWf7rK0TY/jCefTuCXVXL3U7iorks3l4f8AhY89iNdn8Q7wHK86UZ8QcwDRPhPkvj9pjJIhZxDQ8CZMckC1C8nR+gQdTGQ18DLGWRuB8ThbmPFpsWpixqrQ8/wPaOZRyaNSTtX9pQpF7MIXwMKk3ruBePesGYeWLdb0v7suu3TpehV6y1A+tv2qmBRjgIaONI482isbVh1+9hqI+26OPJD9YVMF7XOQM4EMJaL8O7w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(10067099003)(6133799003)(4143699003)(5023799004)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	q/cqeu13/LebH8P5fjlnarb2Ji9TDeRSA6sHIEoQ0gAVGULzkmifRqhdI9NYdWdQgT/pnr7+GAD8pFSQ84k4g7vtDoSnxbSCyeTQfBOS//DwODmoXJhSG5b//NKuJ2sLB4KNjQnIiTkbYZFquM84pnAedH6pkKbiA7Y4PNMjg0lqlxWD+BqkuAfXoexCn+3G5d8kxKFoZnyEfkdMViQbaoAPBItRatDv/tKObek3UaP7AGpbUwshA6e+93V4QXG69OKsGQdNz2Y7lJEFeyy83HfYUxLAnOrALtygmuTQdvhK3UmvPzAqguqD43XAa6hr73x1eBOn++p7hPh90ccyXL9Jj4S9Cr+GQW8cWT9bnxvlm8zkR2vpHUa4jCjXAkjKN0COzXMz7doUAYZ+1Owz87y/VUStvu2joD8oIpt2yESONkuL89v7VRplsv3tsYTz
X-Exchange-RoutingPolicyChecked: 
	Zhm4yS/mHUQ+P+h7602MgGkFbrtff9pTvtliTFWpotLQRH8W4S9A5veHXMYZBIm8VQyduX1gxAL9vHTTUzNwQblreQuecPJTg3ozQzQaEkV72QqHzW4gOb8RidM5PhMn2juPB9KYQK495O9eh3M5Gomi3c9RRkEkMa0qhoHxyXF8oVLKFVifgCLWvQfn8PskB2PEcHal3bkivmvtAnycx3MNnQpyQXthjD8J0AihJ9nUDY6prJ0u+cKakiPjdZP+yc/yBiqPJp35fHW7Bn/Ubr43BDDeG/c5h2mC12gzw2YG7cqGfYS0v9pN157FKtHTQHIdRHeiVMP/sxGN8Fgyig==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 03:26:48.1645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d70808b-b4e7-48fa-3622-08df04b4319b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6051
X-Proofpoint-GUID: TmsFTZPfhZ70NHc5L4N6nZ4Aa9rgHwJH
X-Authority-Analysis: v=2.4 cv=M4597Sws c=1 sm=1 tr=0 ts=6a90fffd cx=c_pps
 a=PQms4psfS+nBHIg3Mxsk7g==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=WfHZuIUsAAAA:20 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=VwQbUJbxAAAA:8 a=siZXzoIST7-YZmhQS6IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: TmsFTZPfhZ70NHc5L4N6nZ4Aa9rgHwJH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDAyNiBTYWx0ZWRfXzNtT5cj9Psyx
 TT+mc9JUdy29OJmQeHdivEzzhmmQErcaxcGnL39yMd1XNdUwybwlhX54ZnZsGDHOA7alSR0bj5T
 4mn5q67YSkRcgvqiD67jtyl0RUIRV++d+wpWCWKJ02DcedLZPwP+7pM1MwhjSCZXx26OnoweDkO
 ZW7GaARRD4LWl7njDohBNkLNVbYJ2VmsL3ZZuK77lfi56mdyRrYAzjhxCFUMyEf6t9mby8nQ+Ht
 hLAVEGjP4/41OaIcU7r39ghWfGiAcMKALx1yvt4P9o51TIvDf022Oo7x9tL8D2Hll/lsMDIPObn
 cujYVGWkMjjtZLKl/JQlC8Mj2qvRt8/olzaIdTx1XlF2ncgiehXn7PlLYKo1+EkJ3/fmQ67SOZr
 VPi4yD2ZsAOzGImOBsnmNW0rQ1/ewCnb4rRsPzt8idfBAublnTlbfgX4uL+a+N//8W3ygrAtGk2
 mKBAyPhBA3KdxdD6+8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDAyNiBTYWx0ZWRfX4kqY15DUB3mM
 YVsiEsAU+zgptYtFGsHwydxa3gTtSUjUInrx2C/ktT0MjWp0hVmWwyOHELOV7FSoawTWlhhuOYx
 l02qWzHlKDNMLjIBjBrJvO+a+umZt/s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280026
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0380145.ppops.net id 67S20A37283485
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Aug 2026 03:27:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17612

Hello Andrew,

On 8/27/2026 10:21 PM, Andrew Davis wrote:
> On 8/27/26 10:07 AM, Hari Prasath via lists.yoctoproject.org wrote:
>> Copy the TI vendor kernel dma-heap.h header, which has the
>> DMA_HEAP_IOCTL_EXPORT ioctl that the default linux-libc-headers
>> doesn't have.
>>
>> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
>> ---
>=20
> https://github.com/openembedded/openembedded-core/blob/master/meta/=20
> recipes-kernel/linux-libc-headers/linux-libc-headers.inc#L7
>=20

I read this note and tried even writing a separate recipe for TI vendor=20
kernel headers, but bitbake simply wouldn't allow me to copy to=20
/usr/include/linux where the linux-libc-headers is copying to. I can try=20
to install in a different location like /usr/include/ti/linux or=20
something similar. But in this case, the userspace application need to=20
make adjustments in their code to include it from the new location=20
(which is possible). I am trying it out with a build, will keep you=20
posted and send a new patch.

Regards,
Hari

>> =C2=A0 .../0001-dma-heap-add-export-ioctl.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 58 +++++++++++++++++++
>> =C2=A0 .../linux-libc-headers_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++
>> =C2=A0 2 files changed, 68 insertions(+)
>> =C2=A0 create mode 100644 meta-arago-distro/recipes-kernel/linux-libc-=
=20
>> headers/linux-libc-headers/0001-dma-heap-add-export-ioctl.patch
>> =C2=A0 create mode 100644 meta-arago-distro/recipes-kernel/linux-libc-=
=20
>> headers/linux-libc-headers_%.bbappend
>>
>> diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/=20
>> linux-libc-headers/0001-dma-heap-add-export-ioctl.patch b/meta-arago-=20
>> distro/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-dma-=20
>> heap-add-export-ioctl.patch
>> new file mode 100644
>> index 00000000..e96c9ff0
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-=20
>> headers/0001-dma-heap-add-export-ioctl.patch
>> @@ -0,0 +1,58 @@
>> +From: Andrew Davis <afd@ti.com>
>> +Subject: [PATCH] dma-buf: heaps: expose DMA_HEAP_IOCTL_EXPORT uapi
>> +
>> +Mirrors ti-linux-kernel commit 8715cc31cfe8a191ade660ff787fedbadcb187=
d4
>> +("TI: HACK: dma-buf: heaps: Add Heap export from offset IOCTL"), limi=
ted
>> +to the include/uapi/linux/dma-heap.h hunk. The kernel already ships t=
his
>> +ioctl; linux-libc-headers fetches its own independent pristine tarbal=
l
>> +and knows nothing about it, so userspace can't see the symbol without
>> +this patch.
>> +
>> +Upstream-Status: Inappropriate [TI kernel hack, not upstream]
>> +Signed-off-by: Andrew Davis <afd@ti.com>
>> +Signed-off-by: Udit Kumar <u-kumar1@ti.com>
>> +
>> +diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-=20
>> heap.h
>> +index a4cf716a49fa6..db749800b6c16 100644
>> +--- a/include/uapi/linux/dma-heap.h
>> ++++ b/include/uapi/linux/dma-heap.h
>> +@@ -39,6 +39,25 @@ struct dma_heap_allocation_data {
>> +=C2=A0=C2=A0=C2=A0=C2=A0 __u64 heap_flags;
>> + };
>> +
>> ++/**
>> ++ * struct dma_heap_export_data - metadata passed from userspace for=20
>> export
>> ++ * @offset:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset from he=
ap base
>> ++ * @len:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size of the alloc=
ation
>> ++ * @fd:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 will be populated with a fd which provides the
>> ++ *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 handle to the allocated dma-buf
>> ++ * @fd_flags:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file descrip=
tor flags used when allocating
>> ++ * @heap_flags:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags pass=
ed to heap
>> ++ *
>> ++ * Provided by userspace as an argument to the ioctl
>> ++ */
>> ++struct dma_heap_export_data {
>> ++=C2=A0=C2=A0=C2=A0 __u64 offset;
>> ++=C2=A0=C2=A0=C2=A0 __u64 len;
>> ++=C2=A0=C2=A0=C2=A0 __u32 fd;
>> ++=C2=A0=C2=A0=C2=A0 __u32 fd_flags;
>> ++=C2=A0=C2=A0=C2=A0 __u64 heap_flags;
>> ++};
>> ++
>> + #define DMA_HEAP_IOC_MAGIC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 'H'
>> +
>> + /**
>> +@@ -50,4 +69,13 @@ struct dma_heap_allocation_data {
>> + #define DMA_HEAP_IOCTL_ALLOC=C2=A0=C2=A0=C2=A0 _IOWR(DMA_HEAP_IOC_MA=
GIC, 0x0,\
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dm=
a_heap_allocation_data)
>> +
>> ++/**
>> ++ * DOC: DMA_HEAP_IOCTL_EXPORT - allocate memory at offset
>> ++ *
>> ++ * Takes a dma_heap_export_data struct and returns it with the fd fi=
eld
>> ++ * populated with the dmabuf handle of the export.
>> ++ */
>> ++#define DMA_HEAP_IOCTL_EXPORT=C2=A0=C2=A0=C2=A0 _IOWR(DMA_HEAP_IOC_M=
AGIC, 0x1,\
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_heap=
_export_data)
>> ++
>> + #endif /* _UAPI_LINUX_DMABUF_POOL_H */
>> diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/=20
>> linux-libc-headers_%.bbappend b/meta-arago-distro/recipes-kernel/=20
>> linux-libc-headers/linux-libc-headers_%.bbappend
>> new file mode 100644
>> index 00000000..7f0345ab
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-=20
>> headers_%.bbappend
>> @@ -0,0 +1,10 @@
>> +# linux-libc-headers fetches its own pristine kernel.org tarball,=20
>> independent
>> +# of ti-linux-kernel, so it doesn't see TI's out-of-tree dma-heap=20
>> ioctl even
>> +# though the running kernel already has it. This carries a minimal,=20
>> purely
>> +# additive patch (no existing symbols touched) so that ioctl is=20
>> visible to
>> +# userspace via /usr/include/linux/dma-heap.h without re-sourcing the=
=20
>> whole
>> +# recipe from our kernel tree.
>> +
>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}:"
>> +
>> +SRC_URI +=3D "file://0001-dma-heap-add-export-ioctl.patch"
>=20


