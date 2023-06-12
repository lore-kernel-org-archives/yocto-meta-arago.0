Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BE2C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 16:30:54 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.64672.1686587447957482762
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 09:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=cu6ipG52;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35CGUit6014469;
	Mon, 12 Jun 2023 11:30:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686587444;
	bh=MYuWEMBO+n7s77wjQKVbX76HU7+OVGQorNDDKIGit20=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cu6ipG52W5gRrwA23+JJUNrYtQhVOfn25Kl5ku6KwF6TwMT312MCImqDyMMHloK/T
	 nu7mNTuhjWbUFaiRX8DMISfMOz2z4d5h5n19cVIo1eR2Ixe1Qu9gcjdbeUSMxwDHPt
	 NFz/GYYo2ZZzmfLaYH5YDqwX1BdsQv9TtlVtixoE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35CGUhSP079229
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Jun 2023 11:30:43 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Jun 2023 11:30:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Jun 2023 11:30:43 -0500
Received: from [10.250.37.94] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35CGUhZG023301;
	Mon, 12 Jun 2023 11:30:43 -0500
Message-ID: <6aafce19-4c4b-339f-1c4b-86fb5b2e1790@ti.com>
Date: Mon, 12 Jun 2023 11:30:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] arago.conf: make things
 more readable and fix the virtuals
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <rs@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230606191019.702649-1-rs@ti.com>
 <20230606221554.GT9226@denix.org>
 <176634F5169028F6.23186@lists.yoctoproject.org>
 <9d92d007-57d1-d2fd-69ed-8aa260ef4590@ti.com>
 <d6359877-7adc-5151-1c4e-eab5229496f1@ti.com>
 <3ab22630-8dcc-29c1-1b32-1293de27d162@ti.com>
 <20230609203938.GJ9226@denix.org>
 <33c9da40-bafe-3f70-fa44-d4ba7b9be309@ti.com>
 <20230612161612.GM9226@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230612161612.GM9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 35CGUit6014469
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Jun 2023 16:30:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14595

On 6/12/23 11:16 AM, Denys Dmytriyenko wrote:
> On Mon, Jun 12, 2023 at 10:24:27AM -0500, Andrew Davis via lists.yoctop=
roject.org wrote:
>> On 6/9/23 3:39 PM, Denys Dmytriyenko wrote:
>>> On Fri, Jun 09, 2023 at 02:13:23PM -0500, Randolph Sapp via lists.yoc=
toproject.org wrote:
>>>> On 6/9/23 13:32, Ryan Eatmon wrote:
>>>>>
>>>>>
>>>>> On 6/6/2023 6:18 PM, Randolph Sapp via lists.yoctoproject.org wrote=
:
>>>>>> On 6/6/23 18:15, Randolph Sapp via lists.yoctoproject.org wrote:
>>>>>>> On 6/6/23 17:15, Denys Dmytriyenko wrote:
>>>>>>>> On Tue, Jun 06, 2023 at 02:10:19PM -0500, rs@ti.com wrote:
>>>>>>>>> From: Randolph Sapp <rs@ti.com>
>>>>>>>>>
>>>>>>>>> Make things more readable and reliable by useing the built in b=
oolean
>>>>>>>>> check instead of python's type casting. Drop the array
>>>>>>>>> indexing in favor
>>>>>>>>> of a more direct if else statememnt.
>>>>>>>>
>>>>>>>> Heh, it's just a matter of personal preference :) Array
>>>>>>>> indexing conditionals
>>>>>>>> is how OE used to do things from the early days and I'm well
>>>>>>>> used to that. But
>>>>>>>> these days using Python if/else directly gained lots of
>>>>>>>> traction, so why not?
>>>>>>>>
>>>>>>>>
>>>>>>>>> Also fix the virtual provider for login manager. There
>>>>>>>>> should only be 1
>>>>>>>>> login provider and it should be shadow-base for systemd
>>>>>>>>> *or* busybox for
>>>>>>>>> sysVinit systemd.
>>>>>>>>>
>>>>>>>>> Also explicitly remove the sysvinit distro feature if ARAGO_SYS=
VINIT
>>>>>>>>> isn't set, because whatever arago inherits expects sysvinit for=
 some
>>>>>>>>> reason. This should fix the duplicate init.d and systemd servic=
e files
>>>>>>>>> we've been seeing.
>>>>>>>>
>>>>>>>> How much testing have you done with this change?
>>>>>>>>
>>>>>>>> The reason it was done this way is because many packages only pr=
ovided
>>>>>>>> sysvinit rc scripts and not systemd unit files and we were relyi=
ng on
>>>>>>>> systemd-sysv-generator to handle those, which has dependency
>>>>>>>> on "sysvinit"
>>>>>>>> PACKAGECONFIG and DISTRO_FEATURES. There were fixes to
>>>>>>>> handle duplications
>>>>>>>> when both sysvinit rc script and systemd unit file are
>>>>>>>> provided by a package
>>>>>>>> and install only one of them. It was better than not having
>>>>>>>> any startup script
>>>>>>>> for a package at all.
>>>>>>>>
>>>>>>>
>>>>>>> Everything in the layers below us provides both from
>>>>>>> everything I've seen. The only incompliant layers are
>>>>>>> meta-arago and maybe something in meta-ti still expecting
>>>>>>> sysVinit scripts.
>>>>>>>
>>>>>>> If you set both sysVinit and systemd as a distro feature it
>>>>>>> actually *confuses* core packages and they end up shipping
>>>>>>> both, which clash. Systemd typically just resolves this by
>>>>>>> forcing everything with a sysvinit script into the sysvinit
>>>>>>> compatibility stage leading to increased boot time because
>>>>>>> that's all still serialized.
>>>>>>>
>>>>>>
>>>>>> If there are any packages still not compliant that you can find,
>>>>>> tell me and I will fix them myself. Seeing mix-matched sysVinit
>>>>>> and systemd scripts in the same target makes me irrationally
>>>>>> angry.
>>>>>
>>>>> Uh oh...=C2=A0 This patch causes tisdk-tiny-image.bb and
>>>>> tisdk-bootstrap-image.bb to fail:
>>>>>
>>>>> ERROR: Nothing RPROVIDES 'packagegroup-arago-sysvinit-boot'
>>>>>
>>>>> I think, if I remember correctly, sysvinit was chosen because of a
>>>>> requirement on the size of the image.=C2=A0 systemd made the rootfs=
 too
>>>>> big to fit within the constraints.
>>>
>>> Ah, indeed, that was another reason systemd and sysvinit had to be bo=
th
>>> enabled in the DISTRO_FEATURES...
>>>
>>>
>>>>> Nishanth might have more details if you want to debate it.=C2=A0 Bu=
t
>>>>> there is an internal Confluence page that lists all of the Ease of
>>>>> Use requirement JIRAs.
>>>>>
>>>>> No one is opposed to moving away from sysvinit, but we need to
>>>>> make sure that we are meeting that requirement.
>>>>>
>>>>
>>>> That's fair. I assumed our sysvinit build images were setting the
>>>> ARAGO_SYSVINIT variable as part of their base config (or at least
>>>> something similar).
>>>
>>> ARAGO_SYSVINIT flag controls init selection for the main images (defa=
ult,
>>> base, thinlinux...), but tiny and bootstrap images ignore it and dire=
ctly
>>> pull in SysVinit regardless of the selection.
>>>
>>
>> Default, base, thinlinux, etc.. are rather large images, not sure what
>> is gained from SysVinit.
>=20
> What is gained is flexibility. When switching to systemd, some customer=
s still
> wanted to be able to use SysVinit. Not sure if that's still the case th=
ough.
>=20

If they want to use sysvinit, then they can modify the distro configs.

>=20
>> And for the super small bring-up images like
>> bootstrap, we use very little from meta-arago. Would it make more sens=
e
>> to move those bring-up images out of Arago? Maybe have a small bring-u=
p-
>> distro layer. Having a distro be both systemd and sysvinit is odd..
>=20
> That would require to build those images separately from the rest of th=
e
> images and from bundling everything into a single TI SDK tarball. I.e. =
a
> multi-step process - build one set of images with one distro, then the
> rest with a different distro, plus package a bundle tarball. And that w=
ill
> result in a very poor package re-use between the images and 2 flows, si=
nce
> distro-level config changes pretty much invalidate most of shared state=
...
>=20

Then lets not ship those bring-up images with the SDK tarball then. Those
are development images, so we should assume folks using them know how to
build OE.

I feel like I've suggested this before, I cant figure out what half
our images are for as is, maybe we try to cut down the number. We could
also name them to match Ubuntu as the 3 we need have similar uses:

  * tisdk-default   -> Desktop
  * tisdk-base      -> Server
  * tisdk-thinlinux -> IoT

Andrew

