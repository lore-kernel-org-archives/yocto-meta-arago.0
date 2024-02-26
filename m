Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA737C54E41
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 15:12:40 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web11.22089.1708959437200199066
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Feb 2024 06:57:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ideasonboard.com header.s=mail header.b=Z9DdRYJi;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: tomi.valkeinen@ideasonboard.com)
Received: from [192.168.88.20] (91-154-35-128.elisa-laajakaista.fi [91.154.35.128])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B738CD1;
	Mon, 26 Feb 2024 15:57:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708959423;
	bh=3j+apPjMdFklFY6/ZVip2ZC+TLCKvcilAnM9B2G06Dw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z9DdRYJiQbbbPxefCjqPnx0uECRsi3qr79McTLm8L27uNpGPg0/Zp1qIlZY3fndEB
	 fg1i98d7b+i8Dui+kv6wxmQpX6FrTMZPW9yma+0eV+0Onfxb/yB0fR5WPm/6DKOj1e
	 f2++y7OIc20PJ91L9rT9B1e08CvBHKG63MlF6QKI=
Message-ID: <0bc23918-8c54-4fcf-9671-78e3363d891f@ideasonboard.com>
Date: Mon, 26 Feb 2024 16:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone][PATCH] graphics: kms++: Enable OmapCard support in pykms library
To: Devarsh Thakkar <devarsht@ti.com>, Andrew Davis <afd@ti.com>,
 Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Cc: "Kumar, Udit" <u-kumar1@ti.com>, meta-arago@lists.yoctoproject.org,
 reatmon@ti.com, Denys Dmytriyenko <denis@denix.org>,
 Sinthu Raja <sinthu.raja@ti.com>
References: <20240212163122.20728-1-sinthu.raja@ti.com>
 <0bf9ab21-a7dd-478f-b406-888115e9c727@ti.com>
 <CAEd-yTR7K3cDcuVQsV-hoebfF-sHumyXf3mnkK+FWHu1tg=pZQ@mail.gmail.com>
 <528407e1-99a9-eae2-e195-927afce038f3@ti.com>
 <d4f5ddee-8e59-48d9-83fb-120f63dbd84f@ideasonboard.com>
 <CAEd-yTTdV5U+xwE=qOSsFtSpPT-f_kYtihx=vzY5nGxZQbqLhQ@mail.gmail.com>
 <8e6d3da2-5547-4a5b-ad30-3a3278ff07f3@ti.com>
 <c3b9f21b-cf7e-2ddd-f58c-f33623367aac@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <c3b9f21b-cf7e-2ddd-f58c-f33623367aac@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Feb 2024 15:12:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15210

On 26/02/2024 16:51, Devarsh Thakkar wrote:
> Hi Andrew, Sinthu,
>=20
> On 13/02/24 21:35, Andrew Davis wrote:
>> On 2/13/24 3:27 AM, Sinthu Raja M wrote:
>>> On Tue, Feb 13, 2024 at 2:17=E2=80=AFPM Tomi Valkeinen
>>> <tomi.valkeinen@ideasonboard.com> wrote:
>>>>
>>>> On 13/02/2024 10:28, Devarsh Thakkar wrote:
>>>>> +Tomi.
>>>>>
>>>>> Hi Sinthu, Andrew,
>>>>>
>>>>> On 13/02/24 12:11, Sinthu Raja M wrote:
>>>>>> On Mon, Feb 12, 2024 at 10:36=E2=80=AFPM Andrew Davis via
>>>>>> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctopro=
ject.org&c=3DE,1,2DS7l4Ll0Z71XJHz-8l2SWUjg27KV1rvg3XF0AMYsnwQk1_ugC9LSBcJkD=
KPbky1ukBO3cDGKWYMyz4aGetIoLWygeMbGXIVsFLmFXec-9wrwA,,&typo=3D1 <afd=3Dti.c=
om@lists.yoctoproject.org> wrote:
>>>>>>>
>>>>>>> On 2/12/24 10:31 AM, Sinthu Raja M via
>>>>>>> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctopr=
oject.org&c=3DE,1,kscN3qPdyfL8tn7Fw-OJJ9CSmKtK9jbcAAMJp2zK3KmVWYUG53IuOFVHa=
m_hakwWdc6Wz-dhlHPCRsgWyFh-wNcu5rYmRVFvsvOAzklEyTdmmp7vwy5aHK4QNX0,&typo=3D=
1 wrote:
>>>>>>>> From: Sinthu Raja <sinthu.raja@ti.com>
>>>>>>>>
>>>>>>>> AM57x platform supports OMAP DRM. By default the pykms library
>>>>>>>> disabled the OmapCard support. Enable the same by defining the
>>>>>>>> HAS_LIBDRM_OMAP as a compiler flags
>>>>>>>
>>>>>>> What project uses this feature? I didn't think there were any
>>>>>>> remaining users of the libdrm OMAP specific framebuffers.
>>>>>>>
>>>>>> I am not sure about the users of the libdrm, As mentioned AM57x SDK
>>>>>> uses OMAP DRM and all the DSS test cases from LTP that use the PYKMS
>>>>>> library are failing due to the OmapCard property being unavailable.
>>>>>> Devarsh/Udit,
>>>>>> Please help in understanding the project that uses this feature.
>>>>
>>>> The only reason to use OmapCard and OmapFramebuffer is to use the TILE=
R.
>>>> If none of the users need TILER, there's no reason to enable the OMAP
>>>> support. But no harm either.
>>>>
>>>> That said, kms++ automatically builds in the omap support if the
>>>> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flibdrm_omap.so&c=
=3DE,1,F-fI2ZgbaQwMkyR6160HbqwP2KIOJTL1ocsF1DbtMr1q-ikrrR7qt-6RBMAiodzw_sRQ=
MFEoBWSLDqy1FRCACt9HWnTxKqq0f8ylrjtF-_o-kw,,&typo=3D1 is found, and it also=
 enables the OMAP support for the
>>>> python bindings. So it should "just work". However, the kms++ meson
>>>> files had a bug and the OMAP support for py bindings was not enabled
>>>> correctly. This has been fixed quite a while ago in upstream kms++.
>>>>
>>>> Looking at the patch, if I read it right, it doesn't look correct as i=
t
>>>> unconditionally enables HAS_LIBDRM_OMAP. HAS_LIBDRM_OMAP should only b=
e
>>>> set if the libdrm_omap is available.
>>>>
>>>>  =C2=A0=C2=A0 Tomi
>>>
>>> Thanks, Tomi.
>>>
>>> Denys/Andrew,
>>> As Tomi mentioned the fix is available in the below commit of=C2=A0 [1]=
.
>>> 2236a8ccacdfed5ff5f6873ed6618eccf570193d. Please suggest in that case
>>> if is it fine to change the SRCREV of this recipe or just backport the
>>> patch.
>>
>> If there is a fix upstream then bump the SRCREV to the latest.
>>
>>>
>>> [1]:=C2=A0 https://github.com/tomba/kmsxx
>>>
>>> Sinthu Raja.
>>>>
>>>>>>> Andrew
>>>>>
>>>>> I am not sure I got the question but to elaborate libdrm is a basic c=
omponent
>>>>> required and enabled for all TI platforms involving display as it pro=
vides
>>>>> test utilities and drm/kms helper libs.
>>
>> I was asking specifically about the OmapCard feature, not libdrm itself.
>> Do any of our demos or tests still use that, if so we should fix that,
>> OmapCard/OmapFramebuffer should be deprecated out.
>>
>=20
> I discussed with Tomi regarding this and he said that omap card feature i=
s
> only enabled if libdrm_omap is present which can be used by applications =
to do
> rotation and stuff.
>=20
> If libdrm_omap is not present then pykms (kms++ library) automatically
> disables omapcard.
>=20
> So we don't think it needs to be deprecated explicitly at pykms level whe=
n
> driver and middleware are already supporting it and pykms automatically
> disables omapcard when libdrm_omap is not present.
>=20
> Tomi, please add if I missed any of the points we discussed.

Depends what "deprecated" means. If none of the tests need the OMAP=20
specific features, I do think it's better if the tests just use the=20
normal Card and DumbFramebuffer classes from kms++, as then they're (at=20
least mostly) generic to all platforms.

  Tomi


