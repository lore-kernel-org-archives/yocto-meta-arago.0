Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 085FF52972
	for <meta-arago@arago-project.org>;
	Mon, 22 Jul 2013 12:12:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6MCCN3E025272
	for <meta-arago@arago-project.org>; Mon, 22 Jul 2013 07:12:23 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6MCCN4K026058
	for <meta-arago@arago-project.org>; Mon, 22 Jul 2013 07:12:23 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 22 Jul 2013 07:12:23 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE74.ent.ti.com ([2002:9daa:aa08::9daa:aa08]) with mapi id
	14.02.0342.003; Mon, 22 Jul 2013 07:12:23 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Heroor, Siddharth" <heroor@ti.com>
Thread-Topic: [meta-arago] [PATCHv2] abefw: Firmware for OMAP5 ABE
Thread-Index: AQHOfwFiaP7u+2Ixp0qsdH11vsDmGZlweXsAgAAx8zM=
Date: Mon, 22 Jul 2013 12:12:23 +0000
Message-ID: <CA454FEB-4832-45BC-B0CF-982F31CB4F78@ti.com>
References: <CF956B779D819D41BBC043B7082161D543FB18@DBDE04.ent.ti.com>
	<F4FA69BF-19EF-4E05-BF7E-27D51BBD6B38@ti.com>,<51ECB170.300@ti.com>
In-Reply-To: <51ECB170.300@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Mon, 22 Jul 2013 12:12:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On Jul 21, 2013, at 11:13 PM, "Heroor, Siddharth" <heroor@ti.com> wrote:

> On 7/12/2013 6:41 PM, Cooper Jr., Franklin wrote:
>>=20
>>=20
>> On Jul 12, 2013, at 1:43 AM, "Hingolikar, Mrinmayee" <mrinmayee@ti.com> =
wrote:
>>=20
>>>=20
>>> * The OMAP5 Audio Backend requires a 'firmware' to enable
>>> sound. This recipe installs a prebuilt firmware. This
>>> part is a hack, as in the current form, the firmware
>>> cannot be cross-compiled. There is a plan to fix this
>>> and hopefully, this recipe is short-lived. Once the code
>>> is fixed, we should have new recipes that build the firmware
>>> and clean up this recipe.
>>>=20
>>> v2:
>>> * Merged contents from abefw.inc and removed abefw.inc based
>>> on review.
>>>=20
>>> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>>> ---
>>> recipes-bsp/abefw/abefw_1.0.14.bb |   20 ++++++++++++++++++++
>>> 1 files changed, 20 insertions(+), 0 deletions(-)  create mode 100644 r=
ecipes-bsp/abefw/abefw_1.0.14.bb
>>>=20
>>> diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/abefw/abef=
w_1.0.14.bb
>>> new file mode 100644
>>> index 0000000..8db71e4
>>> --- /dev/null
>>> +++ b/recipes-bsp/abefw/abefw_1.0.14.bb
>>> @@ -0,0 +1,20 @@
>>> +SUMMARY =3D "Firmware for OMAP5 ABE"
>>> +HOMEPAGE =3D "http://git.ti.com"
>>> +LICENSE =3D "BSD/GPLv2"
>> I'm assuming this means BSD or GPLv2.
>>=20
>> The proper syntax is
>> LICENSE =3D "BSD | GPLv2"
>>=20
>>=20
>>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D923db086ed9463ab3215b24d87e=
05ec5"
>>> +
>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> I don't see any machine based overrides or appends in this recipe. This =
isn't needed.=20
>>=20
>>> +COMPATIBLE_MACHINE =3D "omap5-evm"
>> I'm just curious if the dra7xx or any other possible future boards will =
be using this firmware/recipe. If so any harm in making this generic and sp=
ecifying omap-a15?
>=20
> This is an IP *specific* to OMAP4/5. On OMAP5, the ABE (Audio Backend)
> is present to allow for low power audio playback. Refer TRM
> (http://www.ti.com/lit/ug/swpu249w/swpu249w.pdf) section 13. - Audio
> Subsystem.
>=20
> On DRA7xx ABE isn't present. Instead we have multiple McASPs (upto 8)
> for which no firmware is required. McASP has its own sound driver (which
> should be common to other devices).
>=20
> By setting COMPATIBILITY and PACKAGE_ARCH to be limited to omap5, we
> make it obvious that the IP is OMAP5 specific and not generic for all
> omap-a15 devices.
For COMPATIBILITY that's fine since it will prevent any other board from bu=
ilding the recipe but PACKAGE_ARCH still isn't needed so it should be remov=
ed.=20

>=20
>>> +
>>> +SRC_URI =3D "git://git.ti.com/glsdk/abefw-omap4plus.git;protocol=3Dgit=
"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +SRCREV =3D "ceccc0332264e39bdc51e54f80ea7256a3886c58"
>>> +
>>> +do_install() {
>>> +        mkdir -p ${D}/lib/firmware
>>> +        cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/ }
>>> +
>>> +FILES_${PN} +=3D "/lib/firmware/omap4_abe_new"
>>> --
>>> 1.7.0.4
>>>=20
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20

