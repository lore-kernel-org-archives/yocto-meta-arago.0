Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC33C7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 18:32:45 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.2269.1686335561228248310
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 11:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=GRFZW48C;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359IWeeH058726
	for <meta-arago@lists.yoctoproject.org>; Fri, 9 Jun 2023 13:32:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686335560;
	bh=QExDGk16PZeMKZd7x0NUYqeEQ+GNGV2779YoxPWNvCQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=GRFZW48CTdnzuYGSty72GJ4L4ofiMnpkCYW/uxibf5PcfNEEUeXNBgeYskuUq/j+v
	 BJ1AU0zIXKERF0Ybrq3QH/JPSWLFs2bt1MaEZpsUJ7rByMfhMYkOZ5EbXfAir+PzmE
	 fgueyfGwETDejlHIOspQldbC5tcvOk/QzWUKWWbc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359IWe3V031858
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 9 Jun 2023 13:32:40 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 13:32:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 13:32:40 -0500
Received: from [10.249.33.79] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359IWe4b029486;
	Fri, 9 Jun 2023 13:32:40 -0500
Message-ID: <d6359877-7adc-5151-1c4e-eab5229496f1@ti.com>
Date: Fri, 9 Jun 2023 13:32:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] arago.conf: make things
 more readable and fix the virtuals
Content-Language: en-US
To: <rs@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20230606191019.702649-1-rs@ti.com>
 <20230606221554.GT9226@denix.org>
 <176634F5169028F6.23186@lists.yoctoproject.org>
 <9d92d007-57d1-d2fd-69ed-8aa260ef4590@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <9d92d007-57d1-d2fd-69ed-8aa260ef4590@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 359IWeeH058726
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 18:32:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14578



On 6/6/2023 6:18 PM, Randolph Sapp via lists.yoctoproject.org wrote:
> On 6/6/23 18:15, Randolph Sapp via lists.yoctoproject.org wrote:
>> On 6/6/23 17:15, Denys Dmytriyenko wrote:
>>> On Tue, Jun 06, 2023 at 02:10:19PM -0500, rs@ti.com wrote:
>>>> From: Randolph Sapp <rs@ti.com>
>>>>
>>>> Make things more readable and reliable by useing the built in boolea=
n
>>>> check instead of python's type casting. Drop the array indexing in=20
>>>> favor
>>>> of a more direct if else statememnt.
>>>
>>> Heh, it's just a matter of personal preference :) Array indexing=20
>>> conditionals
>>> is how OE used to do things from the early days and I'm well used to=20
>>> that. But
>>> these days using Python if/else directly gained lots of traction, so=20
>>> why not?
>>>
>>>
>>>> Also fix the virtual provider for login manager. There should only b=
e 1
>>>> login provider and it should be shadow-base for systemd *or* busybox=
=20
>>>> for
>>>> sysVinit systemd.
>>>>
>>>> Also explicitly remove the sysvinit distro feature if ARAGO_SYSVINIT
>>>> isn't set, because whatever arago inherits expects sysvinit for some
>>>> reason. This should fix the duplicate init.d and systemd service fil=
es
>>>> we've been seeing.
>>>
>>> How much testing have you done with this change?
>>>
>>> The reason it was done this way is because many packages only provide=
d
>>> sysvinit rc scripts and not systemd unit files and we were relying on
>>> systemd-sysv-generator to handle those, which has dependency on=20
>>> "sysvinit"
>>> PACKAGECONFIG and DISTRO_FEATURES. There were fixes to handle=20
>>> duplications
>>> when both sysvinit rc script and systemd unit file are provided by a=20
>>> package
>>> and install only one of them. It was better than not having any=20
>>> startup script
>>> for a package at all.
>>>
>>
>> Everything in the layers below us provides both from everything I've=20
>> seen. The only incompliant layers are meta-arago and maybe something=20
>> in meta-ti still expecting sysVinit scripts.
>>
>> If you set both sysVinit and systemd as a distro feature it actually=20
>> *confuses* core packages and they end up shipping both, which clash.=20
>> Systemd typically just resolves this by forcing everything with a=20
>> sysvinit script into the sysvinit compatibility stage leading to=20
>> increased boot time because that's all still serialized.
>>
>=20
> If there are any packages still not compliant that you can find, tell m=
e=20
> and I will fix them myself. Seeing mix-matched sysVinit and systemd=20
> scripts in the same target makes me irrationally angry.

Uh oh...  This patch causes tisdk-tiny-image.bb and=20
tisdk-bootstrap-image.bb to fail:

ERROR: Nothing RPROVIDES 'packagegroup-arago-sysvinit-boot'

I think, if I remember correctly, sysvinit was chosen because of a=20
requirement on the size of the image.  systemd made the rootfs too big=20
to fit within the constraints.

Nishanth might have more details if you want to debate it.  But there is=20
an internal Confluence page that lists all of the Ease of Use=20
requirement JIRAs.

No one is opposed to moving away from sysvinit, but we need to make sure=20
that we are meeting that requirement.


>>>
>>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>>> ---
>>>> =C2=A0 meta-arago-distro/conf/distro/arago.conf | 15 ++++++++-------
>>>> =C2=A0 1 file changed, 8 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/meta-arago-distro/conf/distro/arago.conf=20
>>>> b/meta-arago-distro/conf/distro/arago.conf
>>>> index 9164657c..6390a916 100644
>>>> --- a/meta-arago-distro/conf/distro/arago.conf
>>>> +++ b/meta-arago-distro/conf/distro/arago.conf
>>>> @@ -59,13 +59,14 @@ DISTRO_FEATURES_FILTER_NATIVESDK:append =3D "=20
>>>> opencl opencv openmp"
>>>> =C2=A0 # Set global runtime providers for major components
>>>> =C2=A0 ARAGO_SYSVINIT ?=3D "0"
>>>> -VIRTUAL-RUNTIME_dev_manager =3D "${@["udev",=20
>>>> "systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
>>>> -VIRTUAL-RUNTIME_init_manager =3D "${@["sysvinit",=20
>>>> "systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
>>>> -VIRTUAL-RUNTIME_initscripts =3D "${@["initscripts",=20
>>>> "systemd-compat-units"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
>>>> -VIRTUAL-RUNTIME_initramfs =3D "${@["sysvinit-initramfs",=20
>>>> "systemd-initramfs"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
>>>> -VIRTUAL-RUNTIME_login_manager =3D "busybox shadow"
>>>> -
>>>> -DISTRO_FEATURES:append =3D "${@["","=20
>>>> systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
>>>> +VIRTUAL-RUNTIME_dev_manager =3D "${@ 'udev' if=20
>>>> oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
>>>> +VIRTUAL-RUNTIME_init_manager =3D "${@ 'sysvinit' if=20
>>>> oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
>>>> +VIRTUAL-RUNTIME_initscripts =3D "${@ 'initscripts' if=20
>>>> oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else=20
>>>> 'systemd-compat-units'}"
>>>> +VIRTUAL-RUNTIME_initramfs =3D "${@ 'sysvinit-initramfs' if=20
>>>> oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-initramfs=
'}"
>>>> +VIRTUAL-RUNTIME_login_manager =3D "${@ 'busybox' if=20
>>>> oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'shadow-base'}"
>>>> +
>>>> +DISTRO_FEATURES:append =3D "${@ '' if=20
>>>> oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' systemd'}"
>>>> +DISTRO_FEATURES:remove =3D "${@ '' if=20
>>>> oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' sysvinit'}"
>>>> =C2=A0 # Distro-specific package configuration
>>>> =C2=A0 PACKAGECONFIG:append:pn-systemd =3D " coredump"
>>>> --=20
>>>> 2.40.1
>>
>>
>>
>>
>>
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14511):=20
> https://lists.yoctoproject.org/g/meta-arago/message/14511
> Mute This Topic: https://lists.yoctoproject.org/mt/99370291/6551054
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub=20
> [reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

