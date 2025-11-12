Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C819CD4F21
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 22:54:43 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10980.1762988072929955230
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 14:54:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=a4284/l1;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.70, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5hTlSnSYwDn9zAN9oXMqDvCkp61achgKzU8LLIN8JTSc2l8+1zQWMukXFIVs4HLmAhKji3pyMsNAhvf82s/Jrjn420lpClESA6Q/Y/R0BH85efGsa/kkK8oQqVdR379RvAs03g4qKdywqtpJkOIzgyLHJXKQNNDCK79XzRMbS8T7/8cQSczeOIzx+y0odTJSst97P6gno8K6hcIiG8Ly+hh19ZNjba7PLNLLpGWtQZ80bkS+sXXQjFBRI1oWASpYXI/pRdqtb1EKL7EHoTO9b5y8SIDWyaeB0Gw5K/8vJdB2bhEhNExlxP3LqnXO2Wqw9Kl7NV7BtPwJN+8tAzbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYA2qKxIUBFKbP//FqwSGis10r42JejjR5FUTeFcwi0=;
 b=AqNPe0JivT5DhzlfkowkQV6LTJH+m+voX9TSAermF8yki+okbuuWNNUQWIBxYMSUhk7bsp4cNHXBozkN/YQA/PalGRmQAm3vPtidhnWildjGGeAbjb81sNylFzSyp96YeozK9kH7WjEvwrbHng+6StsIgOxo+K19cXaf7rdxBEMd26fcU28l4gNvEm6ZWA14/g3BtliUc5U6D9Gr69NKzR3LjY3gAeQY0pWQlxga36R4sRudqp/6QhGyjitMndiGMblfIzQ4Phxt+IJE61RtBbC3wG7jZPC+jpAz9b+OAi/spWYJ8i4S8fAVYTTe1Bddr1s5CW2zEsV4dyo46qOCdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYA2qKxIUBFKbP//FqwSGis10r42JejjR5FUTeFcwi0=;
 b=a4284/l1WZLqTSioaaP1Zng/fjXel1cXbgoaIa4XXzpn5MyVbbGSRUoA7tz8pNe6MXviWVWPM6FDoCkCs/gT/GjScErh/bSO0drBQJCYMVj4E4DyPKxheeya5k01/td/lcta5GYtHLVzBt0ECbnrpQ5/vWsSlWNbPk7Jsmrz4RE=
Received: from BL1PR13CA0380.namprd13.prod.outlook.com (2603:10b6:208:2c0::25)
 by DS7PR10MB4895.namprd10.prod.outlook.com (2603:10b6:5:3a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 12 Nov
 2025 22:54:29 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::74) by BL1PR13CA0380.outlook.office365.com
 (2603:10b6:208:2c0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.6 via Frontend Transport; Wed,
 12 Nov 2025 22:54:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 22:54:28 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 16:54:22 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 16:54:22 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 16:54:22 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACMsMWW3422373;
	Wed, 12 Nov 2025 16:54:22 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 12 Nov 2025 16:54:22 -0600
Message-ID: <DE733YTGAPRW.2ME0OXJ0QGH83@ti.com>
From: Randolph Sapp <rs@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, <rs@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] udev-aragoconf: aggregate
 generic udev rules
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251108011752.3782760-1-rs@ti.com>
 <ffca3dab-129d-4ad3-8ec8-3276bee0a3cc@ti.com>
In-Reply-To: <ffca3dab-129d-4ad3-8ec8-3276bee0a3cc@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|DS7PR10MB4895:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e5267c-ed7b-427f-b64f-08de223e6f65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RkxuWjYrcHQ3TG9NZDZqMi9CaysrbGwrSGRhajFuQm41U3A1c1JYOXJMNG5Q?=
 =?utf-8?B?NCtxdFlYblZFaXk1alMrQ1llVjJWczQvMjhxQnBtQkxRMzZ2a1lTT05OM2c5?=
 =?utf-8?B?SlZkVnlLbnpna295ZDRwOS9BSUJEWWl6aGgxSVcyUjluM3BhYm1QOHVrUjIy?=
 =?utf-8?B?YzRRRFV4bjhLcXA3SEFCMUp2UmxSSmh4emc0QTNySS9KaWhINVhldEZ0dDFT?=
 =?utf-8?B?VkoxU0VSRXFrekljK2lqRUU0bzJxSUtIcDFzSEZDYlA5RXBpQkJJU3YzM25O?=
 =?utf-8?B?R25GdjJrL2hqTmdNOFJFQ3ZVNzZIRDR2VWRNQnZ6WEtuRlVKeUNwM1M1Z25P?=
 =?utf-8?B?QXRjZmZGZkdxWEhkckFvZzVNSVNxLzExbVA3anltQnlsT292RGh0QlY1MjlR?=
 =?utf-8?B?MmlueFJ3aXFwMVZTcG4zc0xWM2lNR2NjSWxpN1ZTNjlrSWwxcjVtb2dBSExP?=
 =?utf-8?B?ZGhGa3lLZ3llT2lHZkhDQWQ4ZWlpNFdJQk1ZRzVndDNrbVV4MmxYMCt0aHE1?=
 =?utf-8?B?blNtWTZ2aUkyZjgzcmRaWTJ2bytFYlN4MytHQ3E4azhhYk5ENXpJcStFcVQw?=
 =?utf-8?B?dDlhUUJ2eW0xazQySUFLUlhFVGRtL1hpaWNxdDVoclplQm1SSzRXTS9seE5O?=
 =?utf-8?B?VThwTXZtb0ZuL2JxRFFzcUJuZkFXZlN5NWFFblVSMHprc0JHRjF3WUlmdHVi?=
 =?utf-8?B?WXBDaFJmbTBkZTFDUkwxd21PZm5hYmo1K1Q0TFgzSVVvRERuZXpmeTIyUlJ0?=
 =?utf-8?B?eEx4YVU3QW9hN0xpSUdhQ0NnN3lFTVU3MS8vamlHQW4raU16VlhCVlBTU05K?=
 =?utf-8?B?MTU5VzRmSWNQMGY1RVBqMmYyQTdxOVAxM1NQU3hXMXljZnpmU0VaQTIyeHdS?=
 =?utf-8?B?SDhmSFZyMFlobFhTREJ0dG45WnVidDd3Q3dzNCtIT3N4dVJNOTBqNXlkNkZ5?=
 =?utf-8?B?NVFBT3M4Y0lqM1dMRDNNRzdOZm5acFVrb2oxVGl2aUdPK0NuT3B0d04vOTdO?=
 =?utf-8?B?TWZ1a2Q4L3FoMGhJaG1hYlVteGZ2WEs0a2pKczRVbXVTU1RUZFRTeEk3TzUz?=
 =?utf-8?B?NTVtYU1ycitkSzVqK1BPcXl5bnNnNUdZR254UnVUcjF5V1RuRWxIcFlWSDhp?=
 =?utf-8?B?NnpNbHpmM0lyZUw5aGczajNzbTkxam8xdW1RZHBkSnJOcmNYczVBU01KK1ZU?=
 =?utf-8?B?VW9vbjBYendKVU0vdmhwaWVueU45bVdLTWU1a0RuTmdNcFhUQXVVZ2l4emxI?=
 =?utf-8?B?YUIrSzBZMDVPQ3kzSS9ucDM0YlFsTEN2NW5OU2xTTSs3RVhCOTdicUNKaUZo?=
 =?utf-8?B?cUJhY3BDRVM4YkVBVGVuQnNJZXIyblRNQzA4UTc4S2NVRk4xQ2tld2Z1NkRW?=
 =?utf-8?B?bG5OMVdnNEJ0cFJ6c2Y1NXNxa3RCV1NiSVNHaHdianlpU0FEdFlFN292b2lP?=
 =?utf-8?B?OFgzMFA2VW9XTFJXMmlMZHo3MTBuMUZXRGNJN0pTcmR5dVRMZXZjTnZGcm53?=
 =?utf-8?B?ODhNVzlVVG1ZRWdSa21JK2tDL01mVnQ5Y2V1OFBuTGVaY1RVRGhMY3J2U0Zy?=
 =?utf-8?B?ZThiSVA2UVNkelMra2RqbkYya21XV21WZHNYMDhxK0M5K2Fmb2FWVFdleS9m?=
 =?utf-8?B?Vmo0SnBreGoxMkpEU3p5c0pjeFpGZjRvSFNGcHJsRUJOMldwcHdOdlNJQ3Nk?=
 =?utf-8?B?aTNPbURZaFphUWZOQVNIVmkxcTgxNy9MQjZSZGtIUG1EYUk0dmtjQ05lNHFs?=
 =?utf-8?B?MHMwSVVrMFRXZzFFSDN1VG9DT2ltMkdRbCtEcUtKV1hOT1lKbTExalFDV01B?=
 =?utf-8?B?NkJ2Tk9SOSsrL2o2OFVqTXhYMEVJaTNFUk5jMnZ5dUJRdmh2dXFQTmlxdXhs?=
 =?utf-8?B?T2lmZUtpS0o3OGRlU2JUOFB2ZlZoTkdyNmN4dEFlWTlCZ2RSRHE0QXlWQXJZ?=
 =?utf-8?B?NnNOWXdTNFQyNHJGMVVvZTBrU3pPeDRWa3ZFSDZ1ZWU3bUEraTZSM3djNnlz?=
 =?utf-8?B?bC9iWTVLcmE1Q085ckYybHJKV3dyak9HK2hsditPUGIzUzJlNUNGK2ZpMTJO?=
 =?utf-8?B?ckFTTUF4QnJPL2J4aFI1UTFuTkRkeFNPSm8wUGFhbTVCUlMxdWJZSUorZXdS?=
 =?utf-8?Q?BeMg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 22:54:28.4346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e5267c-ed7b-427f-b64f-08de223e6f65
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4895
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Nov 2025 22:54:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16748

On Wed Nov 12, 2025 at 4:05 PM CST, Ryan Eatmon wrote:
>
> Should there be a master series for this same change?
>
>
> On 11/7/2025 7:17 PM, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> These udev rules are specific to TI platforms and should not be
>> appending to the main systemd or eudev package. Split them into a
>> separate udev-aragoconf package to reduce duplication and cut down on
>> appended content.
>>=20
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   .../packagegroups/packagegroup-arago-base.bb  |  1 +
>>   .../recipes-core/systemd/systemd-arago.inc    | 27 ----------------
>>   .../systemd/systemd/usb1-rules.sh             |  3 --
>>   .../systemd/systemd/usb2-rules.sh             |  3 --
>>   .../recipes-core/udev/eudev-arago.inc         | 22 -------------
>>   .../udev/eudev/dra7xx/udev-cache.default      |  5 ---
>>   .../udev/eudev/keystone/udev-cache.default    |  5 ---
>>   .../recipes-core/udev/eudev/local.rules       | 26 ---------------
>>   .../recipes-core/udev/eudev_%.bbappend        |  4 ---
>>   .../udev-aragoconf}/37-can-am62.rules         |  0
>>   .../udev-aragoconf}/37-can-dra7.rules         |  0
>>   .../udev-aragoconf}/37-can-j7.rules           |  0
>>   .../udev-aragoconf}/37-can-ti33x.rules        |  0
>>   .../udev-aragoconf/50-arago.rules}            |  0
>>   .../{eudev =3D> udev-aragoconf}/usb1-rules.sh   |  0
>>   .../{eudev =3D> udev-aragoconf}/usb2-rules.sh   |  0
>>   .../recipes-core/udev/udev-aragoconf_1.bb     | 32 +++++++++++++++++++
>>   17 files changed, 33 insertions(+), 95 deletions(-)
>>   delete mode 100755 meta-arago-distro/recipes-core/systemd/systemd/usb1=
-rules.sh
>>   delete mode 100755 meta-arago-distro/recipes-core/systemd/systemd/usb2=
-rules.sh
>>   delete mode 100644 meta-arago-distro/recipes-core/udev/eudev-arago.inc
>>   delete mode 100644 meta-arago-distro/recipes-core/udev/eudev/dra7xx/ud=
ev-cache.default
>>   delete mode 100644 meta-arago-distro/recipes-core/udev/eudev/keystone/=
udev-cache.default
>>   delete mode 100644 meta-arago-distro/recipes-core/udev/eudev/local.rul=
es
>>   delete mode 100644 meta-arago-distro/recipes-core/udev/eudev_%.bbappen=
d
>>   rename meta-arago-distro/recipes-core/{systemd/systemd =3D> udev/udev-=
aragoconf}/37-can-am62.rules (100%)
>>   rename meta-arago-distro/recipes-core/{systemd/systemd =3D> udev/udev-=
aragoconf}/37-can-dra7.rules (100%)
>>   rename meta-arago-distro/recipes-core/{systemd/systemd =3D> udev/udev-=
aragoconf}/37-can-j7.rules (100%)
>>   rename meta-arago-distro/recipes-core/{systemd/systemd =3D> udev/udev-=
aragoconf}/37-can-ti33x.rules (100%)
>>   rename meta-arago-distro/recipes-core/{systemd/systemd/local.rules =3D=
> udev/udev-aragoconf/50-arago.rules} (100%)
>>   rename meta-arago-distro/recipes-core/udev/{eudev =3D> udev-aragoconf}=
/usb1-rules.sh (100%)
>>   rename meta-arago-distro/recipes-core/udev/{eudev =3D> udev-aragoconf}=
/usb2-rules.sh (100%)
>>   create mode 100644 meta-arago-distro/recipes-core/udev/udev-aragoconf_=
1.bb
>>=20
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-base.bb
>> index 5cb4e30c..e27a9ca2 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ba=
se.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ba=
se.bb
>> @@ -22,6 +22,7 @@ ARAGO_BASE =3D "\
>>       bash \
>>       opkg-bash-completion \
>>       udev-extraconf \
>> +    udev-aragoconf \
>>       libgpiod \
>>       libgpiod-tools \
>>   "
>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd-arago.inc b/=
meta-arago-distro/recipes-core/systemd/systemd-arago.inc
>> index 44889345..0aac3c7b 100644
>> --- a/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
>> +++ b/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
>> @@ -3,28 +3,14 @@ PR:append =3D ".arago7"
>>   FILESEXTRAPATHS:prepend :=3D "${THISDIR}/systemd:"
>>  =20
>>   SRC_URI:append =3D " \
>> -    file://local.rules \
>> -    file://usb1-rules.sh \
>> -    file://usb2-rules.sh \
>>       file://10-eth.network \
>>       file://15-eth.network \
>>       file://30-wlan.network \
>>       file://60-usb.network \
>>       file://timesyncd.conf \
>> -    file://37-can-j7.rules \
>> -    file://37-can-am62.rules \
>> -    file://37-can-dra7.rules \
>> -    file://37-can-ti33x.rules \
>>   "
>>  =20
>>   do_install:append() {
>> -    install -d ${D}${sysconfdir}/udev/rules.d/
>> -    install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules=
.d/
>> -
>> -    install -d ${D}${sysconfdir}/udev/scripts/
>> -    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${sysconfdir}/udev/scr=
ipts/
>> -    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${sysconfdir}/udev/scr=
ipts/
>> -
>>       install -d ${D}${sysconfdir}/systemd/network/
>>       install -m 0644 ${WORKDIR}/10-eth.network ${D}${sysconfdir}/system=
d/network/
>>       install -m 0644 ${WORKDIR}/15-eth.network ${D}${sysconfdir}/system=
d/network/
>> @@ -41,17 +27,4 @@ do_install:append() {
>>  =20
>>       install -d ${D}${sysconfdir}/systemd/
>>       install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/system=
d/
>> -
>> -    install -d ${D}${libdir}/udev/rules.d
>> -    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules=
.d/
>> -    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rul=
es.d/
>> -    install -m 0644 ${WORKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rul=
es.d/
>> -    install -m 0644 ${WORKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/ru=
les.d/
>>   }
>> -
>> -FILES:udev +=3D " \
>> -    ${libdir}/udev/rules.d/37-can-j7.rules \
>> -    ${libdir}/udev/rules.d/37-can-am62.rules \
>> -    ${libdir}/udev/rules.d/37-can-dra7.rules \
>> -    ${libdir}/udev/rules.d/37-can-ti33x.rules \
>> -"
>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.s=
h b/meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh
>> deleted file mode 100755
>> index 68e83511..00000000
>> --- a/meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh
>> +++ /dev/null
>> @@ -1,3 +0,0 @@
>> -#!/bin/sh
>> -/sbin/modprobe g_ncm -r
>> -/sbin/modprobe g_ncm
>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.s=
h b/meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh
>> deleted file mode 100755
>> index 97071264..00000000
>> --- a/meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh
>> +++ /dev/null
>> @@ -1,3 +0,0 @@
>> -#!/bin/sh
>> -/sbin/modprobe g_zero -r
>> -/sbin/modprobe g_zero
>> diff --git a/meta-arago-distro/recipes-core/udev/eudev-arago.inc b/meta-=
arago-distro/recipes-core/udev/eudev-arago.inc
>> deleted file mode 100644
>> index b0c44b17..00000000
>> --- a/meta-arago-distro/recipes-core/udev/eudev-arago.inc
>> +++ /dev/null
>> @@ -1,22 +0,0 @@
>> -# This fixes an issue with touchscreens not being detected with the def=
ault
>> -# local.rules.  This can be removed when this change is picked up and
>> -# meta-arago switches to Dora
>> -
>> -# look for files in this layer first
>> -FILESEXTRAPATHS:prepend :=3D "${THISDIR}/eudev:"
>> -
>> -PR:append =3D ".arago5"
>> -
>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> -
>> -SRC_URI:append =3D " \
>> -                  file://usb1-rules.sh \
>> -                  file://usb2-rules.sh"
>> -
>> -do_install:append() {
>> -    install -d ${D}/${bindir}
>> -
>> -    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${bindir}/usb1-rules.s=
h
>> -    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${bindir}/usb2-rules.s=
h
>> -    ln -sf libudev.so.1 ${D}${base_libdir}/libudev.so.0
>> -}
>> diff --git a/meta-arago-distro/recipes-core/udev/eudev/dra7xx/udev-cache=
.default b/meta-arago-distro/recipes-core/udev/eudev/dra7xx/udev-cache.defa=
ult
>> deleted file mode 100644
>> index b1aa63f8..00000000
>> --- a/meta-arago-distro/recipes-core/udev/eudev/dra7xx/udev-cache.defaul=
t
>> +++ /dev/null
>> @@ -1,5 +0,0 @@
>> -# Default for /etc/init.d/udev
>> -
>> -# Comment this out to disable device cache
>> -#DEVCACHE=3D"/etc/dev.tar"
>> -PROBE_PLATFORM_BUS=3D"yes"
>> diff --git a/meta-arago-distro/recipes-core/udev/eudev/keystone/udev-cac=
he.default b/meta-arago-distro/recipes-core/udev/eudev/keystone/udev-cache.=
default
>> deleted file mode 100644
>> index b1aa63f8..00000000
>> --- a/meta-arago-distro/recipes-core/udev/eudev/keystone/udev-cache.defa=
ult
>> +++ /dev/null
>> @@ -1,5 +0,0 @@
>> -# Default for /etc/init.d/udev
>> -
>> -# Comment this out to disable device cache
>> -#DEVCACHE=3D"/etc/dev.tar"
>> -PROBE_PLATFORM_BUS=3D"yes"
>> diff --git a/meta-arago-distro/recipes-core/udev/eudev/local.rules b/met=
a-arago-distro/recipes-core/udev/eudev/local.rules
>> deleted file mode 100644
>> index f14352d5..00000000
>> --- a/meta-arago-distro/recipes-core/udev/eudev/local.rules
>> +++ /dev/null
>> @@ -1,26 +0,0 @@
>> -# There are a number of modifiers that are allowed to be used in some
>> -# of the different fields. They provide the following subsitutions:
>> -#
>> -# %n the "kernel number" of the device.
>> -#    For example, 'sda3' has a "kernel number" of '3'
>> -# %e the smallest number for that name which does not matches an existi=
ng node
>> -# %k the kernel name for the device
>> -# %M the kernel major number for the device
>> -# %m the kernel minor number for the device
>> -# %b the bus id for the device
>> -# %c the string returned by the PROGRAM
>> -# %s{filename} the content of a sysfs attribute
>> -# %% the '%' char itself
>> -#
>> -
>> -# Try and modprobe for drivers for new hardware
>> -ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/*", ENV{MODALIAS}=3D=3D"?*", =
RUN{builtin}+=3D"kmod load $env{MODALIAS}"
>> -
>> -# Create a symlink to any touchscreen input device
>> -SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ENV{ID_INPUT_TOUCHSC=
REEN}=3D=3D"1", SYMLINK+=3D"input/touchscreen0"
>> -
>> -# Auto-mount any SD cards
>> -ACTION=3D=3D"add", KERNEL=3D=3D"mmcblk[0-9]p[0-9]", SUBSYSTEM=3D=3D"blo=
ck", RUN+=3D"/etc/udev/scripts/mount.sh"
>> -ACTION=3D=3D"remove", KERNEL=3D=3D"mmcblk[0-9]p[0-9]", SUBSYSTEM=3D=3D"=
block", RUN+=3D"/etc/udev/scripts/mount.sh"
>> -ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/44000000\.ocp/48880000\.omap_=
dwc3_1/48890000\.usb/udc*", RUN+=3D"/usr/bin/usb1-rules.sh"
>> -ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/44000000\.ocp/488c0000\.omap_=
dwc3_2/488d0000\.usb/udc*", RUN+=3D"/usr/bin/usb2-rules.sh"
>> diff --git a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend b/meta=
-arago-distro/recipes-core/udev/eudev_%.bbappend
>> deleted file mode 100644
>> index 51afb053..00000000
>> --- a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
>> +++ /dev/null
>> @@ -1,4 +0,0 @@
>> -EUDEV_ARAGO =3D ""
>> -EUDEV_ARAGO:arago =3D "eudev-arago.inc"
>> -
>> -require ${EUDEV_ARAGO}
>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.=
rules b/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-am62.rule=
s
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.r=
ules
>> rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-am62=
.rules
>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.=
rules b/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-dra7.rule=
s
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.r=
ules
>> rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-dra7=
.rules
>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.ru=
les b/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-j7.rules
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rul=
es
>> rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-j7.r=
ules
>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x=
.rules b/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-ti33x.ru=
les
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.=
rules
>> rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-ti33=
x.rules
>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/local.rules =
b/meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.rules
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/systemd/systemd/local.rules
>> rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.ru=
les
>> diff --git a/meta-arago-distro/recipes-core/udev/eudev/usb1-rules.sh b/m=
eta-arago-distro/recipes-core/udev/udev-aragoconf/usb1-rules.sh
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/udev/eudev/usb1-rules.sh
>> rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/usb1-rules.=
sh
>> diff --git a/meta-arago-distro/recipes-core/udev/eudev/usb2-rules.sh b/m=
eta-arago-distro/recipes-core/udev/udev-aragoconf/usb2-rules.sh
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/udev/eudev/usb2-rules.sh
>> rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/usb2-rules.=
sh
>> diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb b/m=
eta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb
>> new file mode 100644
>> index 00000000..c1ffa663
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb
>> @@ -0,0 +1,32 @@
>> +SUMMARY =3D "Udev rules for assorted TI SoCs"
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfb=
cb788c80a0384361b4de20420"
>> +
>> +inherit bin_package
>> +
>> +SRC_URI =3D " \
>> +    file://usb1-rules.sh \
>> +    file://usb2-rules.sh \
>> +    file://50-arago.rules \
>> +    file://37-can-j7.rules \
>> +    file://37-can-am62.rules \
>> +    file://37-can-dra7.rules \
>> +    file://37-can-ti33x.rules \
>> +"
>> +
>> +S =3D "${WORKDIR}"
>> +
>> +do_install() {
>> +    install -d ${D}${sysconfdir}/udev/scripts
>> +    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${sysconfdir}/udev/scr=
ipts/usb1-rules.sh
>> +    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${sysconfdir}/udev/scr=
ipts/usb2-rules.sh
>> +
>> +    install -d ${D}${libdir}/udev/rules.d
>> +    install -m 0644 ${WORKDIR}/50-arago.rules ${D}${libdir}/udev/rules.=
d/
>> +    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules=
.d/
>> +    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rul=
es.d/
>> +    install -m 0644 ${WORKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rul=
es.d/
>> +    install -m 0644 ${WORKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/ru=
les.d/
>> +}
>> +
>> +RDEPENDS:${PN} =3D "udev udev-extraconf"


Yeah, have it ready. Was waiting for comments. If there are none I'll go ah=
ead
and submit it.

