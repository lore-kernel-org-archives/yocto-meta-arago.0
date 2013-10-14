Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 95A955299B
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 19:28:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EJSapj017352
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:28:36 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EJSZD2004544
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:28:35 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 14 Oct 2013 14:28:35 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/3] ti-tisdk-makefile: Add AM437x support
Thread-Index: AQHOyRCbMo11/JOoAkun/EUld4tuW5n0kZ8wgAACUxA=
Date: Mon, 14 Oct 2013 19:28:35 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597AE702@DLEE11.ent.ti.com>
References: <1381780588-15865-1-git-send-email-Chase.Maupin@ti.com>
	<1381780588-15865-2-git-send-email-Chase.Maupin@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C575FB9@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C575FB9@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] ti-tisdk-makefile: Add AM437x support
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
X-List-Received-Date: Mon, 14 Oct 2013 19:28:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Cooper Jr., Franklin
>Sent: Monday, October 14, 2013 2:20 PM
>To: Maupin, Chase; meta-arago@arago-project.org
>Subject: RE: [meta-arago] [PATCH 2/3] ti-tisdk-makefile: Add
>AM437x support
>
>Ti-crypto-examples are the C based Openssl demos. You should pull
>that in also for am437x.

Good point.  I'll update.

>
>Packagegroup-arago-tisdk-crypto and packagegroup-arago-tisdk-
>crypto-sdk-host would also need to be updated but that can be a
>separate patch set.
>
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Maupin, Chase
>> Sent: Monday, October 14, 2013 2:56 PM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] [PATCH 2/3] ti-tisdk-makefile: Add AM437x
>support
>>
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>>  .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    5 ++++-
>>  1 files changed, 4 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
>makefile/ti-tisdk-
>> makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-
>makefile/ti-tisdk-
>> makefile_1.0.bb
>> index e0aea9a..17154c2 100644
>> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile_1.0.bb
>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefil
>> +++ e_1.0.bb
>> @@ -33,7 +33,7 @@ SRC_URI =3D "\
>>      file://Makefile_oprofile-example \
>>  "
>>
>> -PR =3D "r13"
>> +PR =3D "r14"
>>
>>  MAKEFILES_COMMON =3D "linux \
>>                      matrix-gui \
>> @@ -66,6 +66,9 @@ MAKEFILES_append_ti33x =3D " u-boot-spl \
>>                             wireless \
>>                             ti-crypto-examples \  "
>> +MAKEFILES_append_ti43x =3D " u-boot-spl \
>> +                           ${QUICK_PLAYGROUND} \ "
>>  MAKEFILES_append_omap-a15 =3D " u-boot-spl \
>>                                ${QUICK_PLAYGROUND} \
>>                                omapconf \
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

