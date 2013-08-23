Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2572F52A19
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 20:23:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NKNONr017903
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2013 15:23:24 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NKNO5t017741
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2013 15:23:24 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Fri, 23 Aug 2013 15:23:24 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/4] arago-prefs: set default preferences
	for am437x-evm
Thread-Index: AQHOoD3a2OhOPU9B/kWuSqnRnHAPfJmjPLiA
Date: Fri, 23 Aug 2013 20:23:24 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596DF231@DLEE11.ent.ti.com>
References: <1377289002-20230-1-git-send-email-denis@denix.org>
	<20130823201743.GC27308@edge>
In-Reply-To: <20130823201743.GC27308@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] arago-prefs: set default preferences	for am437x-evm
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
X-List-Received-Date: Fri, 23 Aug 2013 20:23:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
>Sent: Friday, August 23, 2013 3:18 PM
>To: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 1/4] arago-prefs: set default
>preferences for am437x-evm
>
>On Fri, Aug 23, 2013 at 04:16:39PM -0400, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ---
>>  meta-arago-distro/conf/distro/include/arago-prefs.inc | 7
>+++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/meta-arago-distro/conf/distro/include/arago-
>prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> index b125957..49268c4 100644
>> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> @@ -9,6 +9,7 @@ PREFERRED_PROVIDER_qt4-embedded =3D
>"${ARAGO_QT_PROVIDER}"
>>  PREFERRED_VERSION_qt4-embedded =3D "4.8.4"
>>  PREFERRED_VERSION_qt4-native =3D "4.8.4"
>>  PREFERRED_VERSION_nativesdk-qt4-tools =3D "4.8.4"
>> +PREFERRED_VERSION_linux-libc-headers =3D "3.8"
>>
>>  # Use v4.09.00.01 of the Graphics SDK
>>  PREFERRED_VERSION_omap3-sgx-modules =3D "4.09.00.01"
>> @@ -23,6 +24,12 @@ PREFERRED_PROVIDER_virtual/kernel_am335x-evm
>=3D "linux-ti-staging"
>>  PREFERRED_PROVIDER_virtual/bootloader_am335x-evm =3D "u-boot-ti-
>staging"
>>  PREFERRED_PROVIDER_u-boot_am335x-evm =3D "u-boot-ti-staging"
>>
>> +PREFERRED_VERSION_linux-libc-headers_am437x-evm =3D "3.8"
>> +PREFERRED_PROVIDER_virtual/kernel_am437x-evm =3D "linux-ti-
>staging"
>> +PREFERRED_PROVIDER_virtual/bootloader_am437x-evm =3D "u-boot-ti-
>staging"
>> +PREFERRED_PROVIDER_u-boot_am437x-evm =3D "u-boot-ti-staging"
>> +PREFERRED_VERSION_u-boot-ti-staging_am437x-evm =3D
>"2013.09+2013.10-rc1"
>
>Yeah, this version would need to change for v2 in meta-ti...
>
>
>>  PREFERRED_VERSION_linux-libc-headers_am180x-evm =3D "2.6.37.2"
>>  PREFERRED_PROVIDER_virtual/kernel_am180x-evm =3D "linux-omapl138-
>psp"
>>  PREFERRED_VERSION_linux-omapl138-psp =3D "2.6.37"
>> --
>> 1.8.3.2
>>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

