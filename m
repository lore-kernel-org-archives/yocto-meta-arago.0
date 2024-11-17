Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F71BD10F21
	for <webhook@archiver.kernel.org>; Sun, 17 Nov 2024 16:41:51 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.21372.1731861701614819178
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 17 Nov 2024 08:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=KT0Bl0sh;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AHGfewC100101
	for <meta-arago@lists.yoctoproject.org>; Sun, 17 Nov 2024 10:41:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731861700;
	bh=SOM0C3zRgTZaiVfhQxsx6g0OPEoGWYYZEfgJz8nsqs0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KT0Bl0shisV9K/MUwrxBM2v+f+6+/oik8OEXo0A5G2QgCiZw/PjjJ4DcjArqaR8a4
	 i0Yfd2knIeJBfaqNFa5q4tvfmEfPM290ElgYxkDmJhBrLshasakpct+AOcBiFcSn0H
	 cVgbg0Y1Oo3wPctO+JAeUoPTrYiCSDWt556Q7Ldc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AHGfeHK011975
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Sun, 17 Nov 2024 10:41:40 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 17
 Nov 2024 10:41:40 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 17 Nov 2024 10:41:40 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AHGfc4O037042;
	Sun, 17 Nov 2024 10:41:38 -0600
Message-ID: <bcd1d194-3cdd-4713-8286-7adb1132b8af@ti.com>
Date: Sun, 17 Nov 2024 22:11:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-layersetup][master][PATCH v1 1/1] oe-layersetup: Bringing
 meta-selinux into Yocto builds
To: Ryan Eatmon <reatmon@ti.com>, Aashvij Shenai <a-shenai@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <kamlesh@ti.com>
References: <20241114054100.2945239-1-a-shenai@ti.com>
 <20241114054100.2945239-2-a-shenai@ti.com>
 <f2e4c2dc-1425-400c-b809-039f3110cbaa@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <f2e4c2dc-1425-400c-b809-039f3110cbaa@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 4AHGfewC100101
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 17 Nov 2024 16:41:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15614

Hi,
On 15/11/24 02:17, Ryan Eatmon wrote:
>
> NAK.
>
> There is a new system for maintaining the configs in oe-layersetup.=C2=A0=
=20
> You can view the README for more info.
>
> Basically, you need to modify the XML source files, then run make to=20
> generate all of the various configs.=C2=A0 We do not edit the configs=20
> directly anymore.
>
> Also, if you are going to add something like then, then you need to=20
> make sure you are including ALL of the configs that we do, otherwise I=20
> have go through and copy these changes to the other configs as well.
>
> You are missing:
> arago-scarthgap-chromium-config


Before adding it in chromium configs we need to ensure
that meta-browser:meta-chromium & meta-selinux go well together

I believe Aashvij's entire selinux bringup on Arago distribution
was with scarthgap config which has meta-browser disabled by default


--
Chirag


>
> and the master configs:
> arago-master-chromium-config
> arago-master-config
> arago-master-next-config
> arago-master-wip-config
>
>
> On 11/13/2024 11:41 PM, Aashvij Shenai wrote:
>> This patch downloads the meta-selinux layer for the scarthgap branch
>>
>> Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
>> ---
>> =C2=A0 configs/arago-scarthgap-config.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 1 +
>> =C2=A0 configs/arago-scarthgap-next-config.txt | 1 +
>> =C2=A0 configs/arago-scarthgap-wip-config.txt=C2=A0 | 1 +
>> =C2=A0 3 files changed, 3 insertions(+)
>>
>> diff --git a/configs/arago-scarthgap-config.txt=20
>> b/configs/arago-scarthgap-config.txt
>> index f95056d..1fd092b 100644
>> --- a/configs/arago-scarthgap-config.txt
>> +++ b/configs/arago-scarthgap-config.txt
>> @@ -2,6 +2,7 @@
>> =C2=A0 # repo name,repo uri,repo branch,repo=20
>> commit[,layers=3Dlayer1:layer2...:layern]
>> =C2=A0 =C2=A0 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
>> +meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,3aff=
015697fa056b4af83b1c9ba44eca346a8a37=20
>>
>> meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
>> #meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed=
2254d72a4c25879014c98be287a7e3e22904c,layers=3Dmeta-chromium
>> meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layer=
s=3D
>> diff --git a/configs/arago-scarthgap-next-config.txt=20
>> b/configs/arago-scarthgap-next-config.txt
>> index cd69c01..dbdec3a 100644
>> --- a/configs/arago-scarthgap-next-config.txt
>> +++ b/configs/arago-scarthgap-next-config.txt
>> @@ -10,6 +10,7 @@ MOTD: NOTE: to point the recipe to the appropriate=20
>> cicd/next branch for that rec
>> =C2=A0 MOTD: NOTE:
>> =C2=A0 =C2=A0 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
>> +meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,3aff=
015697fa056b4af83b1c9ba44eca346a8a37=20
>>
>> meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD=
,layers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago=
-test
>> #meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed=
2254d72a4c25879014c98be287a7e3e22904c,layers=3Dmeta-chromium
>> meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layer=
s=3D
>> diff --git a/configs/arago-scarthgap-wip-config.txt=20
>> b/configs/arago-scarthgap-wip-config.txt
>> index 2dd8209..b93f76f 100644
>> --- a/configs/arago-scarthgap-wip-config.txt
>> +++ b/configs/arago-scarthgap-wip-config.txt
>> @@ -2,6 +2,7 @@
>> =C2=A0 # repo name,repo uri,repo branch,repo=20
>> commit[,layers=3Dlayer1:layer2...:layern]
>> =C2=A0 =C2=A0 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
>> +meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,3aff=
015697fa056b4af83b1c9ba44eca346a8a37=20
>>
>> meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-wip,HEAD,=
layers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-=
test
>> #meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed=
2254d72a4c25879014c98be287a7e3e22904c,layers=3Dmeta-chromium
>> meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layer=
s=3D
>

