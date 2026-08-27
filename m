Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C79CC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 17:00:02 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76.1787849999933371291
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 10:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=EclqHhUQ;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=BtUZczBZ;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: u-kumar1@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFnd9s3143025;
	Thu, 27 Aug 2026 11:59:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=yDLzvTD0njRZUUmECI02Io+Ol7Ff6Ebv329YbqNqY
	9I=; b=EclqHhUQkpTJ5FAzjL5ZkMbCOrdoXZI2UJ2SaSw6mOtA2LKgCLEBUgp1l
	8gVSiF+vHnUPs4cmSTMDjHWDOb2Bzm4DfNwe8hrf0a9xA/LurVX3YWvHZCl6nh0x
	kuxJLGV+9VJDhkHu/ZRdRwoGILY6L0F8ZAVgYOn5BBfkUJYOolBkP6QzTQ+gS3tx
	VPan7Y0gFXkjlf0Ca4SeGxbh0IKVQDNAnlhj2ALv62LUFqm7x7HrlmVFsrmUXfTZ
	dKYJt56l40rqawuPK2QcQsU+ZB+ju6NQQKttvFQ8o5jS2E0+RxRav7hCetfbo7G0
	RHQCyaXKJSUJsT9hSJeYndw3XTZ6A==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010032.outbound.protection.outlook.com [52.101.193.32])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gakag2d6u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 11:59:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xmke2OgZ65IS+7N32K0LVMfp3Ru6PACz98zEdYp/JlB04jzUUWdl1P07Z+97IPNHsmFm+s58N2JSvvkUYVniU92GEAdxl5/+DWAqmpDZ1gvgZvNs7xsO/oQSWqEx1Il8ZWCGSIxIxJJ3nokAUBsODqLmVqUwwjpK7QBdNt8z8In+OSfQl3E3MK4Hs0YRMXgcGqwy7Q+RyZeznEyQX8Cij6NAbQ1d7gwJb6bXOaQYRU6vNb6W88D/Dn+RW9RnCo/VaaDD1RHHVSLUQYjuNCCYd82NZNMKIw9gj5QBljEm9t5t7zjxVKg8b9KP4eo+5x2/poOdypGKQJW7dj+s3S565w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDLzvTD0njRZUUmECI02Io+Ol7Ff6Ebv329YbqNqY9I=;
 b=Np42n+sRa6CVfncp5Kalu+ajuvj5OFWGbTwWXqNnxyb2PvOXV0qyx3j2so1iA7BwDJdpaEG/ew8zO/7PXAyX4UYRjxwr2b1LlqNfkbFk8onQztyvsnKHpmnuLCYo2/xwLvt3bFwvZDieIIoOIrBSwHOS6KsFDPFXIWILHsa/nlptBlpS0OGVUnXi5Q2srjrufXqhxKjtdvWFxNBy4H3xzaRB3FVK0bdncTVsib2QUcCd3xX0l4We8UThJwy4GrpJb2oiIBWWDNWwZrSKeh6u7rOwzsnxX/LXk7D4QgRNSLmSoihBoxsTP0HPXlBlu5KNsVcrR3WvQHBygxv3dFY5DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDLzvTD0njRZUUmECI02Io+Ol7Ff6Ebv329YbqNqY9I=;
 b=BtUZczBZxiL04uZciSisKvC520yTTsf+BX+5iAidiqTdhjD9BORdDzhDoQFhfQy2R2VitJtuq9eCOpej25BuxtxlxsVwT+/NonFhLC0c1k8ACDzmtx5Una7SyFY+BDiUcpPRPJsM0G+8pTyt8TInkxuwJfTJ9vrGV5L6ApmdvXY=
Received: from BN8PR04CA0054.namprd04.prod.outlook.com (2603:10b6:408:d4::28)
 by LV0PR10MB997970.namprd10.prod.outlook.com (2603:10b6:408:398::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.5; Thu, 27 Aug
 2026 16:59:54 +0000
Received: from BN7PEPF0000009E.namprd04.prod.outlook.com
 (2603:10b6:408:d4:cafe::6c) by BN8PR04CA0054.outlook.office365.com
 (2603:10b6:408:d4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Thu, 27
 Aug 2026 16:59:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN7PEPF0000009E.mail.protection.outlook.com (10.167.248.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 27 Aug 2026 16:59:53 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 11:59:29 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 11:59:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 11:59:30 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67RGxQkl2228527;
	Thu, 27 Aug 2026 11:59:26 -0500
Message-ID: <7f88c5f3-c997-4247-90bf-f7a17bb9252f@ti.com>
Date: Thu, 27 Aug 2026 22:29:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] linux-libc-headers: add
 DMA_HEAP_IOCTL_EXPORT uapi patch
To: Andrew Davis <afd@ti.com>, <gehariprasath@ti.com>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <u-kumar1@ti.com>
References: <20260827150719.821469-1-gehariprasath@ti.com>
 <6aa57f3e-0274-4c7b-acda-d3937d542c27@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <6aa57f3e-0274-4c7b-acda-d3937d542c27@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009E:EE_|LV0PR10MB997970:EE_
X-MS-Office365-Filtering-Correlation-Id: 55cdb8e4-ea54-4c31-778e-08df045c9d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|56012099006|6133799003|3023799007|10067099003|18002099003|22082099003|4143699003|5023799004|13003099007;
X-Microsoft-Antispam-Message-Info: 
	63/duJ3Hekvt0UYqAnXNdiSoldp8KbE9qDIKD+dltrOuEGZJzCv8Dll9evtbF0yWV7Qt1mWlbEqDpVhWbUNZ7sj/8MNLA7/KDealinGrWViNcSqoZ86G4xj0RntUd5W78EY+NPquNYrUhixhXNOBNxtfDXgXWsvGX/gzuidZiE6jjCnA9K7RJPJlg4mVorn+uodtmUBE/HDpeOnHVRjkmLM0gFQAObDw6+7lU2805E/jfcQx/Urs5KPp46oR5zZodc1SP3j0hh2PwKLfsVdzeTQV4zGvzqojwea3Sz7FJpjDCdnVoxSXeQq5ZYHE/erA3638cOwHDBedBnurK7y5UCAMr/5d4P/Wo7Ew9SS8rWIEJ5m1C2HCBAa8cikfFUj7v2PJNcvrpdC/FgfQe5VYTPijUQwQQqQ7NhE1yNs6Qeppan3NVHFpYxWrCIur5JsDVgzxjSLf5m0/GQku8f0iZALpqLA/1d81FtUYRlxzqvuQbIbBtcaUkeyctgEZJEbYkxdT7SVbofw+oaWgXVjML8YEDu2Qk3af+ngDX5E1wIpRtjniBolDDHFcR+L8vEJJ3ItUoBTMDJVRhgXp53Pl9fe5sstc5seqCoVffOL9VFgH0lWBCAFeFJb/Ax1gIWBEpoSZQiDNJ2WcWikD/6jzh9MolOjjIearKiD1kyEddMod15uhqvrPfILlGqWJcz0+84NsVkv4HWV1d5P7So8prA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(56012099006)(6133799003)(3023799007)(10067099003)(18002099003)(22082099003)(4143699003)(5023799004)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0MVov4QvuM3OWr6LTR18zmyo5Ehxf8IhQ0nj3JczRDzkiqjHHOCu65cOumtFWxi5/Oq6amVtr4CTslkdNoFu2Hduy2L1zWL75qCWrrFI4GfX16NfU0xsDID9GdDhvGBLqTcpXzxzSutcXhLsyYaEZET9pfmNZ6I++j+ixD7qfWHTkV+2EKD0isUboIww+XkPYxvNsCyINyZvY4IioDRSazQ7lCPAZ62jGh10kr1K+HD4rG+8QZb+FPSgggxuwyJqLGLZ5q4LQLf0uazxW3/XwXU2GSH9j1HToOyUwWA8NGCU0CZCQ/8qCD36DRCd/7lyxvXWNvCoex8dL6pUdPtPKIIwXbdv81ZdKYUReDVggRs4y8Gzdvh+sdQWiJ+w+868VW40+GPYpQEYJa5++B0QXhgqi36daxJ2QS2JzaeXqtkf/aII6U5cS27k9hRat9/f
X-Exchange-RoutingPolicyChecked: 
	Hm4rN3O1PCnDJ6GfNf4dWyfjFKbtUwNOVWRX7NDG24H+z8iCJEKfBt4J41dEfo2u3N077ps/ncYxla+nriZvJcHEapBUFovZ3DCUYJTTqPKlGmtqSWjOoioP4fxUodyCjdN1rBVRpkRL0JWMTppeMi9yLPcoMqbv/R5VrsUQIHnQKohNyI/QZc+JOg7wt8XtjpaevEJyrgrfIioOFap6/qU1QbfW/u+90LAOYuJeQ29nh9gGvRJWgZl5HQay/+cY8B1V2X8BbxRF2HQtTyyfhs6d5DIAK+xG9S19NDoOG3GoNVmBaKVQuDgGHuso8JPI0hD8lGn4KXrP8cg+EBLqqg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 16:59:53.4484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55cdb8e4-ea54-4c31-778e-08df045c9d7e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN7PEPF0000009E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997970
X-Proofpoint-ORIG-GUID: oi98RL79P0_QXBa94obQmnJTJ6-h9oX6
X-Proofpoint-GUID: oi98RL79P0_QXBa94obQmnJTJ6-h9oX6
X-Authority-Analysis: v=2.4 cv=VrMTxe2n c=1 sm=1 tr=0 ts=6a906d0e cx=c_pps
 a=eJMC1fB0Wmzbl6MXJ2sZyA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=WfHZuIUsAAAA:20 a=ZWcXVxRsAAAA:20
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=siZXzoIST7-YZmhQS6IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MyBTYWx0ZWRfX2DEwKAHecwaV
 6MEkS6AokUYIbWftpCEbaBWUWYymDHUzU/VM3wFoYltAOxgTo041fmh7kfzsN/Q+L1+mxSg9WbN
 oxl+YukhcatTAVqgcmkrVS/f09HaD3v/xN22ZGtUY/GkwR/MJQYbWtoq05s9ddUHOWjid0iA8nJ
 CN7jrk6YJdZdkmLKsjw3k+Kahcq2CuXA/R58/NEAyQlfDoC3WwDiBI4ooHWQr5dRNCGp2dHAoXq
 vo1FHYU9vPNlxL4ar3AlfYYkK9w9fPG6AOP1msiQUFTEQ3oTSUq+0SYSC0AXNQkhYib52JTQx5W
 1hs/2hi92Ro08unWQZ1wU4PSpmNFPcd6xPVwfY7Pnv1D7mzNtcr3O21hDj7Z/qy0Aldf78q5Hc8
 kHaxjPmoJqj0CLEowEOQQX6DvXXF0lCbBQCJqPgxC3dxbIK2xrzLJcOTMGiVS+NuS8JGJwqcQlh
 p3Zk/s7ofHfhvE4WP8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MyBTYWx0ZWRfX7QRsVgbB2nN3
 utCCNe8Q17LB8WMUh8tzP+YyPO9hL7uQXEPbQKi+PjVxKFDCLfPAUzsQNywD1sFT7x2jGgGCR/r
 Yht211hWelnK8TqZF1QWuYjaVsarqfw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270143
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 67RFnd9s3143025
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Aug 2026 17:00:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17610



On 8/27/2026 10:21 PM, Andrew Davis wrote:
> On 8/27/26 10:07 AM, Hari Prasath via lists.yoctoproject.org wrote:
>> Copy the TI vendor kernel dma-heap.h header, which has the
>> DMA_HEAP_IOCTL_EXPORT ioctl that the default linux-libc-headers
>> doesn't have.
>>
>> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
>> ---
>=20
> https://github.com/openembedded/openembedded-core/blob/master/meta/
> recipes-kernel/linux-libc-headers/linux-libc-headers.inc#L7

That is usual problem with when uapi is getting updated
https://github.com/TexasInstruments/ti-linux-kernel/blob/ti-linux-6.18.y/=
include/uapi/linux/dma-heap.h#L78


Now SW stack using this ioctl will fail to compile in case of
1- using include from rootfs or
2- compiling on target itself

recommendation is understood,

thanks for suggesting alternative way out

>=20
>> =C2=A0 .../0001-dma-heap-add-export-ioctl.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 58 +++++++++++++++++++
>> =C2=A0 .../linux-libc-headers_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++
>> =C2=A0 2 files changed, 68 insertions(+)
>> =C2=A0 create mode 100644 meta-arago-distro/recipes-kernel/linux-libc-
>> headers/linux-libc-headers/0001-dma-heap-add-export-ioctl.patch
>> =C2=A0 create mode 100644 meta-arago-distro/recipes-kernel/linux-libc-
>> headers/linux-libc-headers_%.bbappend
>>
>> diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/
>> linux-libc-headers/0001-dma-heap-add-export-ioctl.patch b/meta-arago-
>> distro/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-dma-
>> heap-add-export-ioctl.patch
>> new file mode 100644
>> index 00000000..e96c9ff0
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-
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
>> +diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-
>> heap.h
>> +index a4cf716a49fa6..db749800b6c16 100644
>> +--- a/include/uapi/linux/dma-heap.h
>> ++++ b/include/uapi/linux/dma-heap.h
>> +@@ -39,6 +39,25 @@ struct dma_heap_allocation_data {
>> +=C2=A0=C2=A0=C2=A0=C2=A0 __u64 heap_flags;
>> + };
>> +
>> ++/**
>> ++ * struct dma_heap_export_data - metadata passed from userspace for
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
>> diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/
>> linux-libc-headers_%.bbappend b/meta-arago-distro/recipes-kernel/
>> linux-libc-headers/linux-libc-headers_%.bbappend
>> new file mode 100644
>> index 00000000..7f0345ab
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-
>> headers_%.bbappend
>> @@ -0,0 +1,10 @@
>> +# linux-libc-headers fetches its own pristine kernel.org tarball,
>> independent
>> +# of ti-linux-kernel, so it doesn't see TI's out-of-tree dma-heap
>> ioctl even
>> +# though the running kernel already has it. This carries a minimal,
>> purely
>> +# additive patch (no existing symbols touched) so that ioctl is
>> visible to
>> +# userspace via /usr/include/linux/dma-heap.h without re-sourcing the
>> whole
>> +# recipe from our kernel tree.
>> +
>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}:"
>> +
>> +SRC_URI +=3D "file://0001-dma-heap-add-export-ioctl.patch"
>=20


