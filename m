Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BF5C021B3
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 23:18:39 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.11257.1740093514951619857
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 15:18:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ZM6MB5T/;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51KNIVGF149222
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Feb 2025 17:18:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740093511;
	bh=bCwhU9QvDmGo783BZA5hXh/vTVA/MqHAICo69vB4ZVA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZM6MB5T/y6LGm8MPD9APuG1ggZluSxHFK9JXQrYmXyARTqsANcJjDbOmBIBy3FeMc
	 3aDDuPtzvQhubWcJrtVB2mHNspX+l6G3K0MwPvv20X2YRFh+sk6TzpmQwYo3T1T537
	 v+10RDPtkLR/AM54YMSqlyqr8yiq0tGzONROooVs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51KNIVA5022173
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Feb 2025 17:18:31 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Feb 2025 17:18:31 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Feb 2025 17:18:31 -0600
Received: from [10.249.33.110] ([10.249.33.110])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51KNIVdl073993;
	Thu, 20 Feb 2025 17:18:31 -0600
Message-ID: <e101d0f5-dbbf-4f43-a1bd-6c047288fe12@ti.com>
Date: Thu, 20 Feb 2025 17:18:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][oe-layersetup][master][PATCH] processor-sdk: Add new
 configs for Sitara SDK 10.1 Release
To: Jon Cormier <jcormier@criticallink.com>
CC: <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Denys
	<denis@denix.org>
References: <20241219163417.4155600-1-c-shilwant@ti.com>
 <CADL8D3b7x9ou1uBcVqwYLUwM2sA-ucLx80NPRMG_tBf3cepGvA@mail.gmail.com>
 <0863605c-9b7f-4c50-9b64-04f9eef0b44c@ti.com>
 <CADL8D3ah7Mk3O_TmpQ7MHK7x-tizpLpdz-CQ0Ctncie5AK1hVw@mail.gmail.com>
 <18260D5491C37A5D.25123@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <18260D5491C37A5D.25123@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 51KNIVGF149222
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 23:18:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15884


Jon,

If you want to test the change, you can use the wip branch to run a=20
build and make sure that everything is back to the way it was.



On 2/20/2025 5:09 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 2/20/2025 1:19 PM, Jon Cormier wrote:
>> On Thu, Feb 20, 2025 at 12:59=E2=80=AFPM Ryan Eatmon <reatmon@ti.com> =
wrote:
>>>
>>>
>>> Having refreshed my memory from that time...
>>>
>>> I auto converted OEBASE to TOPDIR because OEBASE is not a defined
>>> variable.=C2=A0 I'm not sure what the history of that variable was, b=
ut it is
>>> not being set by any tool in the bitbake universe that I could find.=C2=
=A0 So
>>> before the conversion that was just getting expanded to "".
>> So it looks like OEBASE is setup by the oe-layersetup script and gets
>> inserted into the build/conf/setenv file:
>=20
> Doh.=C2=A0 All of my searches for OEBASE did not include the setup scri=
pt=20
> itself...=C2=A0 That's on me.=C2=A0 But I do think that moving to value=
s relative=20
> to TOPDIR instead of OEBASE will be better in the long run.
>=20
>=20
>> setenv:
>> # Set OEBASE to where the build and source directories reside
>> # NOTE: Do NOT place a trailing / on the end of OEBASE.
>> export OEBASE=3D"/work"
>> ...
>>
>> This presumably wouldn't work for the other config systems (kas,
>> bitbake-setup, etc) since they don't run oe-layersetup...
>>
>>>
>>> Where as TOPDIR is a defined variable in bitbake that points to the d=
ir
>>> where the build was launched from.
>>>
>>> I didn't even think of it being a side effect, I was just fixing
>>> something that seemed broken.=C2=A0 Our build scripts are explicitly =
setting
>>> DL_DIR and SSTATE_DIR because the scripts need to upload the files in
>>> those dirs to our NAS for better reuse, so we were not impacted by th=
is
>>> change.
>> Hmm thats a interesting, unrelated: I currently network share our
>> SSTATE_DIR but don't do it for DL_DIR, I just rsync it at the end of
>> the build.=C2=A0 Do you host your own BB_HASHSERVE and PRSERV?
>=20
> We rsync both the downloads and sstate to a NAS that all of our build=20
> servers can access.=C2=A0 Yes, we run our own BB_HASHSERVE and PRSERV s=
o that=20
> all of the build jobs are aligned on what the values for the PR should =
be.
>=20
>>>
>>> I can change it back if people want it, but OEBASE is not even really=
 a
>>> variable as far as I can tell.
>>>
>>> Or I could change it to:
>>>
>>> DL_DIR =3D "${TOPDIR}/../downloads"
>>> SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
>>>
>>> Does that match the previous behavior?
>> It does look like TOPDIR points to the build directory instead of one
>> directory up like before.=C2=A0 sstate-cache is currently being put in
>> build/build/sstate-cache
>>
>> jcormier@jcormier-MS-7A93:/export/space/jcormier/yocto/yocto_scarthgap=
/oe-layersetup$
>> ls build/
>> arago-tmp-default-baremetal-k3r5=C2=A0 build=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 conf
>> arago-tmp-default-glibc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 buildhistory=C2=A0 deploy-ti
>> bitbake-cookerdaemon.log=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 cache=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 downloads
>> jcormier@jcormier-MS-7A93:/export/space/jcormier/yocto/yocto_scarthgap=
/oe-layersetup$
>> ls build/build
>> sstate-cache
>>>
>>> Any preferences?
>> I assume keeping OEBASE isn't an option since it won't exist for these
>> other setup systems.=C2=A0 So I guess your second option.
>=20
> Ok.=C2=A0 I'll post a patch and make this change.
>=20
>=20
>>>
>>> On 2/20/2025 10:58 AM, Jon Cormier wrote:
>>>> After build processor-sdk-scarthgap-chromium-10.01.10.04-config, I
>>>> noticed the downloads directory has moved to the build/downloads=20
>>>> folder,
>>>> instead of being at the top of the build directory.=C2=A0 Was this
>>>> intentional?=C2=A0 I suspect it probably happened when everything wa=
s
>>>> converted to xml configs. But the commit doesn't mention that as a=20
>>>> known
>>>> side effect.
>>>>
>>>> commit aea8e0f53cb05e2d80056b3568f3376741c90853
>>>> Author: Ryan Eatmon <reatmon@ti.com <mailto:reatmon@ti.com>>
>>>> Date:=C2=A0=C2=A0 Thu Oct 10 11:43:57 2024 -0500
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Initial conversion of new XML configs
>>>> ...
>>>> -DL_DIR =3D "${OEBASE}/downloads"
>>>> +DL_DIR =3D "${TOPDIR}/downloads"
>>>> ...
>>>> -SSTATE_DIR =3D "${OEBASE}/build/sstate-cache"
>>>> +SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
>>>>
>>>> SSTATE_DIR was also updated and it still looks to be put in the same
>>>> place as ever...
>>>>
>>>> On Thu, Dec 19, 2024 at 11:34=E2=80=AFAM Chirag Shilwant via
>>>> lists.yoctoproject.org <http://lists.yoctoproject.org>
>>>> <c-shilwant=3Dti.com@lists.yoctoproject.org
>>>> <mailto:ti.com@lists.yoctoproject.org>> wrote:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 - Add processor-sdk-scarthgap-10.01.10.04-c=
onfig used for
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 building AM62SIP & AM64x.
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 - Add processor-sdk-scarthgap-chromium-10.0=
1.10.04-config
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 used for building AM62P, AM62x, AM62LP & Be=
agleplay.
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Chirag Shilwant <c-shilwant@=
ti.com
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 <mailto:c-shilwant@ti.com>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 ---
>>> ...
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> --=20
>>>> Jonathan Cormier
>>>> Senior Software Engineer
>>>>
>>>> Voice: 315.425.4045 x222
>>>>
>>>> http://www.CriticalLink.com <http://www.criticallink.com/>
>>>> 6712 Brooklawn Parkway, Syracuse, NY 13211
>>>> <https://twitter.com/Critical_Link>
>>>
>>> --=20
>>> Ryan Eatmon=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reatmon@ti.com
>>> -----------------------------------------
>>> Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS
>>
>>
>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

