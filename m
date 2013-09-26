Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 5EB4552A65
	for <meta-arago@arago-project.org>;
	Thu, 26 Sep 2013 23:20:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8QNKfiB021383
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2013 18:20:41 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QNKf8r029012
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2013 18:20:41 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 26 Sep 2013 18:20:40 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image: Rename base
	file	system image
Thread-Index: AQHOs99tTHafF954906JGDI6H9a4fpnKWBrwgAUDzgD//61HsIAAYCaA//+wLGCAAF9XAIAD+B3QgABf+ACAAdpHAP//rPoAAGOKWyAAC2t2gAAKUBFA//+T6ys=
Date: Thu, 26 Sep 2013 23:20:40 +0000
Message-ID: <49D92C3F-466C-45AF-BE97-1A913DC996E0@ti.com>
References: <20130920193051.GB30673@edge>
	<8F29D6B095ED194EA1980491A5E029710C55817B@DFLE08.ent.ti.com>
	<20130920201855.GD30673@edge>
	<8F29D6B095ED194EA1980491A5E029710C558370@DFLE08.ent.ti.com>
	<20130920211425.GF30673@edge>
	<8F29D6B095ED194EA1980491A5E029710C55A51B@DFLE08.ent.ti.com>
	<20130923153444.GD3456@edge> <20130924195214.GD5945@edge>
	<8F29D6B095ED194EA1980491A5E029710C55CEE7@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED10159753705@DLEE11.ent.ti.com>
	<20130926195213.GA16006@edge>,
	<7D46E86EC0A8354091174257B2FED10159753994@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159753994@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] tisdk-rootfs-base-image: Rename base file	system image
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Sep 2013 23:20:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On Sep 26, 2013, at 2:57 PM, "Maupin, Chase" <chase.maupin@ti.com> wrote:

>> -----Original Message-----
>> From: Dmytriyenko, Denys
>> Sent: Thursday, September 26, 2013 2:52 PM
>> To: Maupin, Chase
>> Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
>> Subject: Re: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image:
>> Rename base file system image
>>=20
>> On Thu, Sep 26, 2013 at 03:28:43PM -0400, Maupin, Chase wrote:
>>>> -----Original Message-----
>>>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>>>> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>>>> Sent: Tuesday, September 24, 2013 3:10 PM
>>>> To: Dmytriyenko, Denys
>>>> Cc: meta-arago@arago-project.org
>>>> Subject: Re: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image:
>>>> Rename base file system image
>>>>=20
>>>>=20
>>>>=20
>>>>> -----Original Message-----
>>>>> From: Dmytriyenko, Denys
>>>>> Sent: Tuesday, September 24, 2013 2:52 PM
>>>>> To: Cooper Jr., Franklin
>>>>> Cc: meta-arago@arago-project.org
>>>>> Subject: Re: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-
>> image:
>>>> Rename base
>>>>> file system image
>>>>>=20
>>>>> On Mon, Sep 23, 2013 at 11:34:44AM -0400, Denys Dmytriyenko
>>>> wrote:
>>>>>> On Mon, Sep 23, 2013 at 10:53:54AM -0400, Cooper Jr.,
>> Franklin
>>>> wrote:
>>>>>>>>>>>>>> What was the initial reason to start naming
>>>> rootfs
>>>>>>>>>>>>>> images with
>>>>>>>>>>>>>> tisdk-rootfs- prefix? I remember it was
>>>> something
>>>>>>>>>>>>>> forced by the SDK
>>>>>>>>>> setup...
>>>>>>>>>>>>> [Franklin]
>>>>>>>>>>>>> This was before my time so I am not sure what
>>>> the
>>>>>>>>>>>>> original reasoning
>>>>>>>> was.
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> I do assume there might be instances where
>> some
>>>> script
>>>>>>>>>>>>> somewhere will need to be updated if it
>> refers
>>>> to the
>>>>>>>>>>>>> full image as
>>>>>>>> "tisdk-rootfs*"
>>>>>>>>>>>>=20
>>>>>>>>>>>> So, I located the change I was talking about:
>>>>>>>>>>>> http://arago-project.org/git/?p=3Dmeta-
>> arago.git;a=3Dcommitdiff;h=3D91f2be34e301deebbc75c54bbad6a5a27e25bf2
>>>>>>>>>>>> c
>>>>>>>>>>>>=20
>>>>>>>>>>>> The "tisdk-image class had issues" is a rather
>>>> vague
>>>>>>>>>>>> description, so I'm not sure or don't remember
>>>> what was
>>>>>>>>>>>> the problem that you had to rename the original
>>>>>>>>>>>> arago-tisdk-image into
>>>>>>>> tisdk-rootfs-image...
>>>>>>>>>>=20
>>>>>>>>>>> [Franklin] Ah I remember. The TARGET_IMAGES
>> variable
>>>> is used
>>>>>>>>>>> in two ways in that class. 1 to add a build
>>>> dependency and 2
>>>>>>>>>>> to reference the image tarball. So the assumption
>>>> was that
>>>>>>>>>>> the recipe/package name was the same as the
>>>> IMAGE_BASENAME.
>>>>>>>>>>> So the recipe and IMAGE_BASENAME
>>>>>>>>>> must
>>>>>>>>>>> match. Otherwise the image would be built but the
>>>> class
>>>>>>>>>>> wouldn't know what tarball to look for.
>>>>>>>>>>=20
>>>>>>>>>> Ah, OK, this is not exactly what I was looking for.
>>>> Tracing
>>>>>>>>>> even further back shows that you added the recipe
>> to
>>>> have
>>>>>>>>>> IMAGE_BASENAME =3D
>>>>>>>> "tisdk-rootfs":
>>>>>>>>>>=20
>>>>>>>>>> http://arago-project.org/git/?p=3Dmeta-
>>>> arago.git;a=3Dcommitdiff;h=3Df27b1f34aee2c2cbee25a0fb5b21cdb04f16e
>>>>>>>>>> c4a
>>>>>>>>>>=20
>>>>>>>>>> Do you remember the reason for that? This image
>> recipe
>>>> was in
>>>>>>>>>> Classic arago, but there it had the basename
>> matching
>>>> the
>>>>>>>>>> recipe name. Wondering why the change?
>>>>>>>>=20
>>>>>>>>> [Franklin] I think I was simply trying to match the
>>>> filesystem
>>>>>>>>> tarball with the name used in previous sdks. I am
>>>> assuming that
>>>>>>>>> the SDK backend script that built the sdk renamed
>> those
>>>> filesystem files.
>>>>>>>>> Looking at Sitara AMSDK
>>>>>>>>> 05.05.01 (last oe-classic based sdk) the two
>> filesystem
>>>> tarballs
>>>>>>>>> were named base-rootfs-am335x-evm.tar.gz and
>>>>>>>>> tisdk-rootfs-am335x-evm.tar.gz. During that time I
>> was
>>>> focused
>>>>>>>>> on just getting the filesystem working and wanted it
>> to
>>>> look
>>>>>>>>> like the output from previous sdks. I don't think I
>> had
>>>> any other reason.
>>>>>>>>=20
>>>>>>>> Thanks! Just wanted to check if there was some sort of
>>>> requirement
>>>>>>>> for that name change. If there is not, then we can look
>>>> for a
>>>>>>>> better names for full image as well as base image.
>>>>>>>>=20
>>>>>>>> Should we look into unifying the names for other image
>>>> recipes? Is
>>>>>>>> tisdk-rootfs- the best base we can think of?
>>>>>>=20
>>>>>>> [Franklin] I think it's important to separate the "arago"
>>>> images
>>>>>>> from the "sdk" images. I am currently ok with the naming
>>>> convention
>>>>>>> we use for our current images minus the one I created
>> this
>>>> patch for
>>>>>>> :). But I'm open to suggestions.
>>>>>>=20
>>>>>> I'm not really sure what do you mean by separating arago
>> from
>>>> sdk.
>>>>>> Arago distro is becoming the SDK, the Core TISDK one, to be
>>>> exact.
>>>>>> Other SDK products can build on top with slight variations.
>>>>>>=20
>>>>>> We can place more generic packagegroups and images into
>>>>>> meta-arago-extras and keep TISDK specific ones in meta-
>> arago-
>>>> distro.
>>>>>>=20
>>>>>> As of the naming convention - I'm not exactly married to
>> the
>>>> arago-
>>>>>> prefix for the image recipes, it was just a historic
>> tradition
>>>> -
>>>>>> arago-base-image, arago-console-image, etc. I'm Ok with
>> tisdk-
>>>> prefix,
>>>>>> but "rootfs" part always felt slightly artificial to me, as
>> it
>>>> was
>>>>>> forced from outside and in OE images are images and there's
>> no
>>>> need to call
>>>>> them rootfs.
>>>>>>=20
>>>>>> Anyway, what I'm trying to say is that now is the perfect
>> time
>>>> to
>>>>>> align on the naming convention for our images and we don't
>>>> need to
>>>>>> stick to any of the existing names...
>>>>>=20
>>>>> Franklin,
>>>>>=20
>>>>> Can you think of a unified naming for all the images,
>> including
>>>> base and full
>>>>> tisdk, as well as less common console and test images, that
>> is
>>>> scalable enough. As
>>>>> I'm thinking going back to arago-base-image and arago-tisdk-
>>>> image vs.
>>>>> simplifying it to tisdk-base-image and tisdk-full-image. Plus
>> it
>>>> has to work with
>>>>> your other packagegroup restructure proposal... :)
>>>> [Franklin]
>>>>=20
>>>> How about the following:
>>>>=20
>>>> tisdk-rootfs-base-image -> arago-full-image ( me new proposed
>>>> image)
>>>=20
>>> What will this image contain?
This contained everything that the below image contains minus SDK example a=
pplications, scripts and Matrix.
>>>=20
>>>>=20
>>>> tisdk-rootfs-image -> arago-full-sdk-image
>>>=20
>>> I want to differentiate between rootfs vs. sdk images.  So maybe
>> this one is
>>> arago-sdk-full-rootfs-image
>>=20
>> Heh, I was the one who asked Franklin specifically to drop
>> "rootfs" part... :)
>> Please read the above explanation. For the most part, images are
>> rootfs. But I
>> see what you are saying - we now have these hybrid SDK images that
>> contain
>> other rootfs images, kernel/bootloader images and devkit(s). So,
>> how about we
>> clearly mark those instead of everything else with "rootfs"?
>=20
> That works too
Overall I'm ok with this and Denys addressed the only comment I had.
>=20
>>=20
>>=20
>>>> arago-base-tisdk-image -> arago-base-sdk-image
>>>=20
>>> arago-sdk-base-rootfs-image
>>>=20
>>>> arago-core-tisdk-image -> arago-core-sdk-image
>>>=20
>>> Keep the same
>>>=20
>>>> Tisdk-server-rootfs-image -> arago-server-sdk-image
>>>=20
>>> arago-sdk-server-rootfs-image
>>>=20
>>> What do you think?
>>>=20
>>>>=20
>>>> Since our images are in meta-arago-distro which is dependent on
>>>> meta-ti I think we could drop the "ti" from the image name to
>> make
>>>> it simpler.
>>>> Based on the above logic I would probably change our
>> packagegroups
>>>> from using tisdk and simply call it sdk.
>>>> But if anyone has an issue I am ok with keeping tisdk in the
>>>> packagegroups and images name.
>>>>=20
>>>>>=20
>>>>> --
>>>>> Denys
>>>> _______________________________________________
>>>> meta-arago mailing list
>>>> meta-arago@arago-project.org
>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

