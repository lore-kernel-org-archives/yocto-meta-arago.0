Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B10C61DC6
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 08:07:34 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1618.1787904444671016544
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 01:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=QYDbwHns;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=knUuCDbi;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67S72GDc871053;
	Fri, 28 Aug 2026 03:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=aapuAw/N+xnPWMb5PmXrGHiioLX05LqRO9S9wqPnp
	CI=; b=QYDbwHns0rp+DHjkw/BsJD0OoJ/NRZoqJYxTZzaC5MqnZ60srPCCUWYTi
	wmE4e4oJ/wstxxdaSsJTzdgfekZTNPEzmbBGaxdPt5SPhuWFtpWJMoUKtXvOMo4h
	XoQzPJP4C6QvFhRmxLzKeW8Io7DeESxlpNfhGlZ590eleozQQDWlMqFMn5KTCTG5
	TESQZmkD3Ea7o1tlUP1spbu6YJKVPyUnH0/W3fieO3KP/SG1sJULV1bp5ilP6Rjq
	FPnepcSYLzdvf2h2kvp8rC2MzTeZhW4KfoPWTBszWAtCTWK6zEiNR+mx2bOP9PNR
	pLxG2iDDnKx7sLhOjClvEyOxTCylQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012021.outbound.protection.outlook.com [40.107.209.21])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gb5kdgaq5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 03:07:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ej0ICo4lHeNQ8low/mSMdiTWcgTraf1X0pHKlAUJ2mPsZGRtxOc1gnkbSAa6jzHN0t2pAU7+DLzRDa07t/226ovARNvsmtjstw6FGXBO5Bn9/2hnLzYISSigCA5QO/WkdHlLUgRCPZwbxf7+ERA9IS/L1ODZGQwEZ/kCRqH4ZCuGTRyYF3YFmCfcSbCA8P367Nw3LUJBQL3o2k3ee+GS0qfakfWsxPfdmLDrIPPpwn74YZ59WVdDmTnjt4ZC+YRFe7CiCDxtYk0up3PzQCbwUEIk0KQODRWOiXIFt0CTaBUjSk/lnc683Qu0dDsFNYOOsNTXVHPYL8U9ZVGxu23DwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aapuAw/N+xnPWMb5PmXrGHiioLX05LqRO9S9wqPnpCI=;
 b=CWcc9mQnp0ywWWpBHQPnbvzZAgkIrG+tHIANQWFE652tyAWg2HKZ3tHT13YxdlNhIXYSsUOal8DUfQvUER03tKpW4aaJoXb3bI/AZtYoz5R2vhZLwSG7VgOnHQ6MyZbRtCk4gcjfKXZ3+aoqxd7wzj8+drYJ+LdrlN9/DrJghF9Ji8Yup5pT2YsTFg5HIDeQhqliV+9p6ViH3K5NKBDuGiajznjPKJ83nwlMjLv0N/koS+FcHf5t0wc7Ul8RQ0SgWiIY+d/dyapBN1JuLtVtMh8YMzC/akOPStjoPSysuEQJ5PH2paaUxt1bZ18BYNPcNn1Ny0vsnjjalWyQ8O++eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aapuAw/N+xnPWMb5PmXrGHiioLX05LqRO9S9wqPnpCI=;
 b=knUuCDbiIWnBncvfwag/LUpVa4TfKUrNEqH2vF3YNJjIzRwix/Z2dwHJ5tCfQY7IfntgL4VZiT0/oDa/I08fhozLzVJqj6qBN+7+UacOIDBDwLylPKlzCLj6TFiF2yPBPi+To7L2SGDuBLKGf/ug5dxPniT2fbK8P8dQdUJlgdw=
Received: from BN9PR03CA0930.namprd03.prod.outlook.com (2603:10b6:408:107::35)
 by DS0PR10MB8222.namprd10.prod.outlook.com (2603:10b6:8:1ce::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Fri, 28 Aug
 2026 08:07:21 +0000
Received: from BN5PEPF0004698A.namprd02.prod.outlook.com
 (2603:10b6:408:107:cafe::1e) by BN9PR03CA0930.outlook.office365.com
 (2603:10b6:408:107::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 08:07:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN5PEPF0004698A.mail.protection.outlook.com (10.167.245.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 08:07:20 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 03:06:40 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 03:06:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 03:06:40 -0500
Received: from [10.249.138.105] ([10.249.138.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67S86bSf2421190;
	Fri, 28 Aug 2026 03:06:38 -0500
Message-ID: <e49ebb08-4e37-45aa-a13c-80c15f38c4a0@ti.com>
Date: Fri, 28 Aug 2026 13:36:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH 1/2] ti-vendor-kernel-headers: add
 recipe for TI-only dma-heap.h ioctl
To: <reatmon@ti.com>, <afd@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <u-kumar1@ti.com>
References: <20260828055034.1106316-1-gehariprasath@ti.com>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <20260828055034.1106316-1-gehariprasath@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698A:EE_|DS0PR10MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: a93814a5-4e8a-4a72-67ba-08df04db6231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	+b+LTbL8zgVWzSBOR5smfIs0l5Sgh0ulhYiBhIK0P2EqcHK119/sjs+RGaAVMlk5NLYV09RR629Y0xD2JQrvwdZH7vCj6+FCmh4Tz1ocQqIIJqk29TgBwJvoFQP8hQgCE3M+L+xGQgdtw8bYqYQeyobfiH9npykUzc9P1D65mzauMTXpk/EA2gtwliRcY8b6VAGFy5iuV9Q8Q0Vmy6MvHyACP71IhG77o0kUDQKVPMtOsBhX2h2+fiVl6y10ekCqQHtyxX5qT7tLhvReQdPuSfDPtVMwXxQPqFhXuSvRfQjNTLIjWTkTo2VoS5AQBZMXICF1a05Z6CuhRTYfVFuGfmPnKhaQwGWz+nRd8fMmmKkwrnCiwe6pl2usHFhKWTWU+2CFXVs3V90BJ55tIs7uxAtrfV6K7WacG6Ce0ZkNDWXURLvgCx/fJjRMTezLQCCUUID0WShQ9HqMK5aAi1HE4izVukEtMlQIEtv4DA8HdHTmuWJgYFbk6xModHWcJatIDRbgnGSQPZcDVGzy1H/Nx51diurUNWxUC48ChD9wl8FjxvlYuAw1Id/9lDid7M9FiPf/giqAPKcBZGxeVwuXuc5CTv/5x1LMrxevc/Nk7evyIurLSto+0VI8+vfJL6e6m+T7rHUhhd5PqB4LNvl0Xo5nuQfpR9mBEA8H9qCXKaEbk+rkE7Soch821ULo8KJG8dApYDhZxny66J65R7C7Dg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YxyozEHdK7Roqb7EjAu02k/2KfA2uFrHwqJd6i6uIROwZ3+FwD6fVUw+pqfEZPPjXu+0abNDAeEwsGiVFT3Abmz98Z9F7VYIc5tdEZXfDcjIbWpOuCV2wvAmNQLqkzvZZpOHILtZQ9wkrQI5AiOsDI5tnraR0q4KWcFxg15bpWituqG/qb+EX+L/0mZBUZWm1/7/pz3dEHGW6WB9TLJ4uqYZuhWe8zmEGWAihjoZlp32Xyrl6W2o2QZUvfEYLrrUkJ2eE520E+cv4ir/riBh9RiXzZJdHNHEaIuIGxU/71WfuWMDi3av+0M/6vn98aY5cU9JG1Jsc+qWW/rDmhsxGZUG4xs6maZCP9kxrvMGPMc3AuQ/zouRZt1mRHrVe+b/F5Lp5yrByTWCCZT4HstUX0ylx2MKtScI5Bw57gXiDHtE61cmeF1GSBcCDs3hehAH
X-Exchange-RoutingPolicyChecked: 
	2sDyK8C77rvtjPdd21Ggt9U1OTy/+kNttvCHBOS9HqA1RgM5Jen4n3BWF4UG65oeo5LW4rtaTAZRWKdzUiAIZJRr1ulBXZbfONG5CtGKdTJ0mWCo8p9vvjFo+/9z0F/EFowyrifRedv2oEexE9C6jZPE2bqSmg5aj4Hx7euO+6v7KasK7EbhNSGY07QLYiJTSuUfk3AyOXkOejrL1ZMGWgUIO2cUMny8gF2UiKLU3rMTBrF003UL3uaDwUpwu5oVVLCHmpdIS7Zn/WRr4Q0tGbeoPdtt3K7TIF364CsehAPCsST/zEOmQhnesmZDUtVj1mPkU/iUjR5NkwA+GcD6gg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 08:07:20.0470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a93814a5-4e8a-4a72-67ba-08df04db6231
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN5PEPF0004698A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8222
X-Proofpoint-ORIG-GUID: E1jF7-B2y_4fEaEoUowRvh0rB_nm6DXK
X-Proofpoint-GUID: E1jF7-B2y_4fEaEoUowRvh0rB_nm6DXK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA2OCBTYWx0ZWRfX7HYIO02jADYK
 B5E/+nZ/6IOZuDj0tUwIuHUvOhvijZUAMoJInNlHKZDjrz0ymRoucx/a6B8+GnDCvUzluISxnCo
 8lXmre74JzZSZqnUrY7AYfPkRkF6+AU=
X-Authority-Analysis: v=2.4 cv=UPPt2ify c=1 sm=1 tr=0 ts=6a9141ba cx=c_pps
 a=oJa8ZcSO0M6ZbQlUw3N+2w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=T5wT6sVmLgvxjAWShZMA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA2OCBTYWx0ZWRfX8gX51vpGPn5E
 NiJ0YInwecu4XWi24vL31A32fB5r3eASZ8rCz6gO26HP/Ok2oc5Cu9korZOGfp8Bf99GcyDTZnK
 C7I4DQ9jWBLnr8SdiA3QeYN+GYlfVpKyHl1z4NwNKBnbcBASyKSyvbCqzM+xodh+i8HCnQiF/rB
 IrjXbSVUmAofg936p50OyaAQnlBhSJokn6X+70zab/wXKkNuthZ42Aut9tl22NSp254rVHfXEPc
 2UUZvFq9Uf5cTO0jsoTJwzhnWnjoI31MUb2oCEJqWifQnX3N4MLZLFUjwy+43gqpZOhuVo0KB1r
 hv16IJrvqy0Hp9mxJksd76F1zB4oi+pzYUCVM0brvdmeWN+KXSDkOTUEXG5zKH3eikHKl+fh+vg
 qkiGyMoXQqGToTgralMh1NvuhUduGxkh+WSqaIUHwTYicCxoDDxmc3ghdwC9E8L+XdvUKe5PBIz
 HNLgYLp2GbXl67e99cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280068
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Aug 2026 08:07:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17617

On 8/28/2026 11:20 AM, Hari Prasath Gujulan Elango wrote:
> The TI vendor kernel's dma-heap.h carries DMA_HEAP_IOCTL_EXPORT in
> downstream.The standard header provided by linux-libc-headers' wouldn't
> have the custom changes.Copy it straight from the kernel's staged
> source tree (STAGING_KERNEL_DIR)into a separate /usr/include/ti/linux
> path instead, for userspace code that needs it.
> 

Discard this patch series, forgot to send this patch to the 
meta-ti@lists.yoctoproject.org.

Regards,
Hari

> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
> ---
>   .../ti-vendor-kernel-headers_1.0.bb             | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
> 
> diff --git a/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
> new file mode 100644
> index 000000000..bf7dcc3a5
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "TI vendor kernel uapi headers not present in mainline linux-libc-headers"
> +DESCRIPTION = "Copies select uapi headers straight from the TI vendor kernel source \
> +tree into a TI-specific include path (/usr/include/ti/linux), for userspace code \
> +that needs them but can't rely on linux-libc-headers carrying TI-only additions."
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +do_configure[depends] += "virtual/kernel:do_shared_workdir"
> +do_install[depends] += "virtual/kernel:do_shared_workdir"
> +
> +do_install() {
> +    install -d ${D}${includedir}/ti/linux
> +    install -m 0644 ${STAGING_KERNEL_DIR}/include/uapi/linux/dma-heap.h ${D}${includedir}/ti/linux/dma-heap.h
> +}
> +


