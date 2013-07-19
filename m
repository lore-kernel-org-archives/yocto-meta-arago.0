Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D825B52AB1
	for <meta-arago@arago-project.org>;
	Fri, 19 Jul 2013 11:54:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6JBsHaW025341
	for <meta-arago@arago-project.org>; Fri, 19 Jul 2013 06:54:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6JBsH1K024942
	for <meta-arago@arago-project.org>; Fri, 19 Jul 2013 06:54:17 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 19 Jul 2013 06:54:17 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [PATCHv2] abefw: Firmware for OMAP5 ABE
Thread-Index: AQHOhEVdbnkjRuQedE2yn46OxHhX/5lr5IjA
Date: Fri, 19 Jul 2013 11:54:16 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596635FC@DLEE11.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D543FB18@DBDE04.ent.ti.com>
	<CF956B779D819D41BBC043B7082161D54406F7@DBDE04.ent.ti.com>
In-Reply-To: <CF956B779D819D41BBC043B7082161D54406F7@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCHv2] abefw: Firmware for OMAP5 ABE
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
X-List-Received-Date: Fri, 19 Jul 2013 11:54:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Mryinmayee,

Franklin Cooper already gave you comments on the v2 earlier this week about=
 the LICENSE value amongst othre things.  You should address that feedback.

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Hingolikar, Mrinmayee
>Sent: Friday, July 19, 2013 1:01 AM
>To: Hingolikar, Mrinmayee; meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCHv2] abefw: Firmware for OMAP5 ABE
>
>Any comments on the v2?
>
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Hingolikar, Mrinmayee
>> Sent: Friday, July 12, 2013 12:13 PM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] [PATCHv2] abefw: Firmware for OMAP5 ABE
>>
>>
>> * The OMAP5 Audio Backend requires a 'firmware' to enable
>>   sound. This recipe installs a prebuilt firmware. This
>>   part is a hack, as in the current form, the firmware
>>   cannot be cross-compiled. There is a plan to fix this
>>   and hopefully, this recipe is short-lived. Once the code
>>   is fixed, we should have new recipes that build the firmware
>>   and clean up this recipe.
>>
>> v2:
>> * Merged contents from abefw.inc and removed abefw.inc based
>>   on review.
>>
>> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>> ---
>>  recipes-bsp/abefw/abefw_1.0.14.bb |   20 ++++++++++++++++++++
>>  1 files changed, 20 insertions(+), 0 deletions(-)  create mode
>100644
>> recipes-bsp/abefw/abefw_1.0.14.bb
>>
>> diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-
>> bsp/abefw/abefw_1.0.14.bb
>> new file mode 100644
>> index 0000000..8db71e4
>> --- /dev/null
>> +++ b/recipes-bsp/abefw/abefw_1.0.14.bb
>> @@ -0,0 +1,20 @@
>> +SUMMARY =3D "Firmware for OMAP5 ABE"
>> +HOMEPAGE =3D "http://git.ti.com"
>> +LICENSE =3D "BSD/GPLv2"
>> +LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3D923db086ed9463ab3215b24d87e05ec5"
>> +
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +COMPATIBLE_MACHINE =3D "omap5-evm"
>> +
>> +SRC_URI =3D "git://git.ti.com/glsdk/abefw-
>omap4plus.git;protocol=3Dgit"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +SRCREV =3D "ceccc0332264e39bdc51e54f80ea7256a3886c58"
>> +
>> +do_install() {
>> +        mkdir -p ${D}/lib/firmware
>> +        cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/ }
>> +
>> +FILES_${PN} +=3D "/lib/firmware/omap4_abe_new"
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

