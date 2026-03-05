Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56329EEF30E
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 06:51:50 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38800.1772693506750411710
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 22:51:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=szKI/h8R;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.29, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuUMLEujKcrIYoga7FOb2ocOwwUSWlpDP/XL2oU7N/qEgTOUpqhwGW+094IxjxzHLkRFd9kgNrUUP7ujZrnoz6xqgGVUGNLwCAJS4IvmJq4nTZn02nyNzQJP5QH8yTGB+ipT6oBVIoYEOiPXylGN7vIT58kFpnJv8/T8/6jj3GVvVJayYRjOzOnsBo7f9chipVwwm2okJ7Savm2xlqkPqU0DUC5KlbMIaPlYwhjDSD1Eo2+9VzscAYS0OL1lPe9DeW15P6Lyvy/sWjtzahc/oR18rHtGySR8LlV+wcYRnlH0BXf7h50D4CiKZ5oE+JYykjJKdwRG3NJHdDjvwCRkWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=de6xYacDoZu4YbMkD6r+ZNk3uzKz9oNVTdtPhwjbyAk=;
 b=MoHFizsrebfNEn3N8VrNPwpedNGtqpio/NMazNnvZK8wIoLTPsSl5SBwxELl3yskb82Ntoj7AtpewCcio+FrN1oBmr0Y7agwyBtp94QvNlPeRsVZ+xzZ0TOIx3dLCXN30vQX5UBfyZUBwhTZj6W1ix8hmN8JUSUCnUU5X7RTV/q8OGnvyTXfI2kjzTCsIp+wfALzO6xSDSEmyOZo1WQApt2f9/VzUKsuVIg+B0oNEOUcRBmLlbwxZGnEBZyQExUNJXvh9nOXnznK7oF5XL92yDcIvuqdCvAm7g+VwRisRYAToqI6WTpIpIZDtNZ3MA0aihHl7VVbYdw/vdvox1sFlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=de6xYacDoZu4YbMkD6r+ZNk3uzKz9oNVTdtPhwjbyAk=;
 b=szKI/h8RGQYWQwXDjUsYs6Ut6FYHhd9L9jZzyDtYsISCo/6WIa/mPFqBsBplzjo5Ew2zxedJsQQCJyrUurheyZuXPGVuknq3qPmDQgxDlSTjJf9hrGc0OFz+SGUiLjhJkY9X2sRlnUwcB0YhaOsWeaR50pJw98yi7zhwyB+Spfw=
Received: from BL1PR13CA0316.namprd13.prod.outlook.com (2603:10b6:208:2c1::21)
 by BN0PR10MB4919.namprd10.prod.outlook.com (2603:10b6:408:129::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 06:51:44 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:2c1:cafe::93) by BL1PR13CA0316.outlook.office365.com
 (2603:10b6:208:2c1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 06:51:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 06:51:44 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 00:51:27 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 00:51:27 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 00:51:27 -0600
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6256pOFJ1368600;
	Thu, 5 Mar 2026 00:51:25 -0600
Message-ID: <c6a06889-7318-4c2e-a626-01651273a798@ti.com>
Date: Thu, 5 Mar 2026 12:21:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [PATCH] tisdk-uenv: Add instructions to load
 initramfs while booting linux
To: Ryan Eatmon <reatmon@ti.com>, Andrew Davis <afd@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: <a-limaye@ti.com>, <gehariprasath@ti.com>, <praneeth@ti.com>,
	<denys@konsulko.com>, <vigneshr@ti.com>
References: <20260303104930.889956-1-m-shah@ti.com>
 <d27ccb3c-4f70-486b-baf7-2dfc0943e240@ti.com>
 <565f34b6-b312-4dd1-a822-58cdc1bc7187@ti.com>
 <b919fb23-6b17-405c-8883-64610218e604@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <b919fb23-6b17-405c-8883-64610218e604@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|BN0PR10MB4919:EE_
X-MS-Office365-Filtering-Correlation-Id: 77e010f0-be2a-4815-e77f-08de7a83aa12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700016|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	LENbL4nBqmgAKGmhFwRHqYXM4Bcu3AelPZ/IqlH7ND4qi8rhcPsqiEHuYn/Tukf0wGpqDYZalHSj6dpwepwrQvwJRtHW+5hAaYT6zHzkKVPQzLAvcaawPs/pjXDsBQiaoDxSGk4AzRwX9RMit74eUaFlxeXHQ6BNNaVkIu9WA2KSw6TVIb29WFkNx9fkvNN+I1lYn1T89blMjERcJE9CF9n1nyoo8uikCH3NBzWsrbm05KZtkGjyesJ+EOzzIkmqo/+s00pFPG+wJVpwlnI/d5W0Nl4h+H/iZnzltFC5bpumNHl1Es4YNkBu3Xn5izQeJqvCoyzm279hmipEURtGwe2HZQzaLME09rHLuoWD12OfDo7xyLkDBkpHUkNIhMSZXrFZVZm8QHoc18Nt+eRpdTJGAtu2a7+IWHBD4iPkknljLxAkSJdX1dlrUBYGn/0ndthOSndrTh+Y3LCB8WiTY0yBYEwSqASFDOISqizQZRnxRQkZFs9Lpd9OoLz8rGS1IiWgUGvkJm/qJHL+bAycAfUx+VCfldEYqA546hToRSEM4NSUtmmBJnF6XjFNi727r3QkMcuDmu5aRyBn3bIAaVl8RejLCxeJIUk+SWIq9719hK+PGN3ai6pAND+zhmWPYyOHu3jSQEM3HRnQlp0Ugw3MhYjMYhVmG5WZSsiOKean/MYmS4iAednSeXVgjjBOwtB3S8maFbL7mUwg78G0pmJVUzug+/s1c5javwWzSTE=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700016)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	67zZrXqbpmcDyY+kbxm/JvBTbitaBjHzsNMF1mLZN3ym8RmbBVt5Oa8SwYq7+Cem8sxQ/q/PSZaveb1eVKt/JCY9wQiiPxcDhMWGlR2msbCiEFX02LnVqrRUhgt2dV2pHlWIlOgjpjOgJ5H1p7SKWRHUj64n497R8dPf3Xg3HWDclumSzqoOwlZT2ztoHVAe1NSVoVDxJrmMiucThH3fUVAGc2H/VT2m7L06R9Xm0izpQvWfNSoSa9NWD37w4Y5lGt63P2UlTnUpiDcLRjXOtgSluNwxm6L+I57/YmSWa+WKptuKslWEHLfPDZqhHzCZuNRkVpP7yCScN5IURnYfSussMmXh+m8oMQ1/7Uvn+Dj8FWCoUiS37vzc+EtW7D7QaPbIXgvNyCS79awSCAkz6nbn0SemVZXz+LorpxYk2sUoMcoCjUzXz8i0r3/2aBOn
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 06:51:44.4644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e010f0-be2a-4815-e77f-08de7a83aa12
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4919
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 06:51:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17225


On 04/03/26 20:08, Ryan Eatmon wrote:
>
>
> On 3/4/2026 12:32 AM, Moteen Shah wrote:
>>
>> On 03/03/26 22:49, Andrew Davis wrote:
>>> On 3/3/26 4:49 AM, Moteen Shah via lists.yoctoproject.org wrote:
>>>> Add instructions to load initramfs image and update the boot command
>>>> to use the image to boot the linux kernel.
>>>>
>>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>>>> ---
>>>> =C2=A0 .../recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt=C2=A0 | 15=20
>>>> +++++++++++++++
>>>> =C2=A0 1 file changed, 15 insertions(+)
>>>>
>>>> diff --git=20
>>>> a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt=20
>>>> b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
>>>> index 0af0eef3..5ac61b34 100644
>>>> --- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
>>>> +++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
>>>> @@ -7,3 +7,18 @@
>>>> =C2=A0 #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default on all newer U-Bo=
ot images.=C2=A0 This also means that=20
>>>> some
>>>> =C2=A0 #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 variables such as bootdel=
ay cannot be changed by this=20
>>>> file since
>>>> =C2=A0 #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it is not evaluated until=
 the bootcmd is run.
>>>> +
>>>> +# Initramfs configuration
>>>> +# Name of the initramfs file in the boot partition
>>>> +name_initramfs=3Dti-core-initramfs.cpio.xz
>>>> +
>>>> +# Command to load initramfs from boot partition (mmc=20
>>>> device:partition)
>>>> +# Adjust the device number (0 or 1) based on your setup
>>>> +# mmcdev is set to 1 by default, partition 1 is the boot partition
>>>> +get_initramfs_mmc=3Dfatload mmc ${mmcdev}:1 ${rdaddr} ${name_initramf=
s}
>>>> +
>>>
>>> This belongs in u-boot default env, it is basically the same as=20
>>> `get_fdt_mmc`
>>> and other helpers already there.
>>>
>>>> +# Load initramfs and set up variables
>>>> +load_initramfs=3Dif run get_initramfs_mmc; then setenv _initramfs=20
>>>> ${rdaddr}:${filesize}; setenv rd_spec ${_initramfs}; echo Initramfs=20
>>>> loaded at ${rdaddr}, size ${filesize}; else echo WARNING: Initramfs=20
>>>> not found, continuing without initramfs; setenv rd_spec -; fi
>>>> +
>>>
>>> This should be part of `mmcloados` in u-boot also.
>>
>>
>> mmcloados is only used by 'mmcboot' which is a differnt boot command=20
>> other than bootcmd_ti_mmc?
>> We can consider adding the load_initramfs to 'get_kern_mmc' and we=20
>> wont need to override the init_mmc with the change.
>>
>>>
>>>> +# Custom boot command that loads initramfs before kernel
>>>> +init_mmc=3Drun args_all args_mmc load_initramfs
>>>
>>> With the above added, you don't need to override `init_mmc` so
>>> this line goes away too.
>>>
>>> That leaves one line left, `name_initramfs`. How about just
>>> setting a sane default name in u-boot. We got away with something
>>> like this for K2 plats:
>>
>> We don't expect the name of the cpio to be variable, as the name of=20
>> the cpio stays the same for all K3 platforms which is=20
>> "ti-core-initramfs.cpio.xz", I can remove the variable altogether=20
>> maybe and directly use the image name to load. Thoughts?
>
> That is a very Yocto centric take.=C2=A0 But we also support armbian and=
=20
> other distros.=C2=A0 They may not want to name the file the same way we=20
> chose in meta-ti.=C2=A0 The question is, should we paint ourselves into a=
=20
> corner from the beginning or allow for some flexibility?
>
> Plus, even in Yocto, a user could choose to not use ti-core-initramfs=20
> and instead make their own with their own name. Making this more=20
> flexible feels more friendly in the long run.
>

I see. So we want to move the structure to something which tries to load=20
any .cpio.xz present?
Other question, how do we tell other users to include the TPS6594=20
module(to put it in a better way include the packagegroup for intramfs)=20
while building their own initramfs(specifically for AM62a), is linux=20
release doc the right place to do so?

Regards,
Moteen

> Just my two cents.
>
>
>> Regards,
>> Moteen
>>
>>>
>>> https://github.com/u-boot/u-boot/blob/master/board/ti/ks2_evm/k2e_evm.e=
nv#L12=20
>>>
>>>
>>> although I'd recommend a more generic filename.
>>>
>>> Andrew
>>>
>>>> \ No newline at end of file
>>>
>

