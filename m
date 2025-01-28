Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB916C02192
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 20:48:39 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.7721.1738097313375299858
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 12:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=X4Hujwj5;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: detheridge@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50SKmU9L1246727
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jan 2025 14:48:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738097310;
	bh=9weohF2bNzT5bXsood2QXUwu7fMXjX9/y4ZjoMEzRC0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=X4Hujwj5o7PhUIiqFJKsOaLyomeoluFCfjj8tolNHjqVuzHE4jy/dpbf1k7GA23bA
	 MCAWbo0p5DL94r8yaS53+AOw4IqZm2bM42o/PoLw/rsiMONOY35Lk5nNwdUbboFNmy
	 RvOiQdhzXpWlYjy5ZLgJYqOECTj6sYm6sBhueHIg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50SKmUAf039703
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 Jan 2025 14:48:30 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 28
 Jan 2025 14:48:30 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 28 Jan 2025 14:48:30 -0600
Received: from [128.247.81.130] (lt5cg1254qm7.dhcp.ti.com [128.247.81.130] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50SKmUH6010005;
	Tue, 28 Jan 2025 14:48:30 -0600
Message-ID: <edeb3c25-216c-42b3-8804-f78d23de538f@ti.com>
Date: Tue, 28 Jan 2025 14:48:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][oe-layersetup][PATCH] configs: scarthgap update
 meta-browser layer sha
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <rs@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250123201215.2812931-1-detheridge@ti.com>
 <20250123212031.GZ21836@denix.org>
 <681ab15c-d59b-4d9d-9443-ab81dd521090@ti.com>
 <20250128203023.GH21836@denix.org>
 <b5d8f183-3222-44b6-a91d-12f5cb006689@ti.com>
Content-Language: en-US
From: "Etheridge, Darren" <detheridge@ti.com>
In-Reply-To: <b5d8f183-3222-44b6-a91d-12f5cb006689@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 50SKmU9L1246727
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Jan 2025 20:48:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15770



On 1/28/2025 2:43 PM, Ryan Eatmon wrote:
>=20
>=20
> On 1/28/2025 2:30 PM, Denys Dmytriyenko wrote:
>> On Fri, Jan 24, 2025 at 01:58:08PM -0600, Etheridge, Darren wrote:
>>> On 1/23/2025 3:20 PM, Denys Dmytriyenko wrote:
>>>> A more generic question:
>>>>
>>>> There are now multiple configs with meta-browser and meta-selinux=20
>>>> listed:
>>>>
>>>> * arago-scarthgap: both meta-browser and meta-selinux are disabled
>>>> * arago-scarthgap-chromium: meta-browser is enabled, meta-selinux is=
=20
>>>> disabled
>>>> * arago-scarthgap-selinux: meta-browser is disabled, meta-selinux is=
=20
>>>> enabled
>>>>
>>>> Since there are now separate configs, should they be cleaned up and=20
>>>> layers
>>>> that are disabled or unused removed from them? That way when you=20
>>>> need to bump
>>>> say meta-browser, you just need to update one config, not all 3.
>>>>
>>>
>>> This whole thing was a compromise because we didn't want to take the
>>> hit of building Chromium for every config.=C2=A0 But we did want to g=
ive
>>> the ability to enable Chromium easily in every config.=C2=A0 So we ju=
st
>>> comment it out and leave it up to the end user to uncomment it if
>>> they want Chromium to get built and burn several hours.=C2=A0 Maybe t=
here
>>> is a nicer way to do it, but at the time this is what we came up
>>> with that worked for everybody involved.
>>
>> Yes, back in Dunfell days this was exactly the case - there was a=20
>> single main
>> config file with meta-browser being commented out (as it also depended=
 on
>> deprecated Python2). Before that I kept it at an old commit that still=
=20
>> allowed
>> Chromium to be built with gcc and didn't require clang (and very long=20
>> builds).
>>
>> Anyway, with Kirkstone and Scarthgap, you now have separate configs=20
>> for builds
>> with meta-browser/Chromium enabled, as well as meta-selinux enabled.=20
>> My point
>> being, since there are separate configus for such builds, why still ke=
ep
>> commented out references in the main config?
>>
>> I.e. people can use arago-scarthgap-chromium config directly to get a=20
>> build
>> with Chromium enabled, instead of manually modifying the main=20
>> arago-scarthgap
>> config in order to enable Chromium...
>=20
> I think part of the issue is if you use our "locked down" configs with=20
> the SHAs for each of the layers that each snapshot build produces, then=
=20
> you can just uncomment the line and move on.=C2=A0 If it is a separate=20
> config, then you need to add the chromium line to the locked down=20
> config.=C2=A0 Does that make sense?
>=20

This is exactly what our Jenkins job does to test RC's with Chromium=20
enabled.

It also sort of implicitly keeps the version of Chromium that is tested=20
with any release easily accessible from any of the configs. Although I=20
agree this can be achieved through other means.
>=20
>=20
>>
>>>> Moreover, why only scarthgap is being updated? Are there any changes=
=20
>>>> to the
>>>> master configs?
>>>
>>> Master points to HEAD of the meta-browser layer,=C2=A0 as such the
>>> recipes don't make any sense for master, as they really attempt to
>>> enable GPU support on a specific version of Chromium.=C2=A0=C2=A0 If =
you build
>>> master you get whatever the latest Chromium is on the meta-browser
>>> layer without any of these tweaks applied.
>>
>> Ah, yeah, missed the fact that master configs also have meta-browser=20
>> pointing
>> to the HEAD. Thanks for clarifying this.
>>
>=20

