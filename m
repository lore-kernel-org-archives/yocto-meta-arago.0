Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C41A9529C6
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2015 12:09:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t38C9FBE022514
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 07:09:15 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t38C9DOm022669
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 07:09:14 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Wed, 8 Apr 2015 07:09:13 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [PATCH] packagegroup-arago-tisdk-amsdk-sdk-host:
	Include tisdk-uenv.
Thread-Index: AQHQcenGSPnQPaU0WEirT4XWALNnIJ1DBBBBgABUtgD//60O0g==
Date: Wed, 8 Apr 2015 12:09:13 +0000
Message-ID: <12827348-3C3B-467C-9168-3498595006DE@ti.com>
References: <1428490195-31174-1-git-send-email-j-stiffler@ti.com>
	<C8CE0126-1DF0-4B76-ADA7-F331BCF02018@ti.com>,
	<4B26FB5A64EBA14C87266869E037F9581411D78A@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F9581411D78A@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] packagegroup-arago-tisdk-amsdk-sdk-host:	Include tisdk-uenv.
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
X-List-Received-Date: Wed, 08 Apr 2015 12:09:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

No uEnv.txt is something we should never be using. There is literally no ne=
ed for it since saveenv works for every single evm.

 In the past that wasn't the case but even then packaging a blank uEnv.txt =
is pointless and it something that should be documented.


> On Apr 8, 2015, at 7:06 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>=20
> Nothing is being set in it, but there is a nice description of what it ca=
n be used for, so it seems like it could be helpful for users.
>=20
> Maybe this uEnv.txt could be updated to have some sample configurations (=
e.g. setting some bootargs) which would be commented out?
>=20
> - Jake
>=20
> -----Original Message-----
> From: Cooper Jr., Franklin=20
> Sent: Wednesday, April 08, 2015 8:03 AM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] packagegroup-arago-tisdk-amsdk-sdk-host=
: Include tisdk-uenv.
>=20
> Why do you need uEnv.txt especially since it's blank from what I remember=
?
>=20
>=20
>> On Apr 8, 2015, at 5:50 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>>=20
>> * If tisdk-readme is packaged, then the uEnv.txt should also be =20
>> packaged.
>> * Package both if not amsdk.
>>=20
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>> .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git=20
>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
>> k-amsdk-sdk-host.bb=20
>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
>> k-amsdk-sdk-host.bb
>> index 61886ff..c6994ee 100644
>> ---=20
>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
>> k-amsdk-sdk-host.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>> +++ tisdk-amsdk-sdk-host.bb
>> @@ -23,8 +23,8 @@ TOOLS_append_am3517-evm =3D " flash-utility"
>>=20
>> EXTRA_FILES =3D ""
>> EXTRA_FILES_omap-a15 =3D "tisdk-readme tisdk-uenv"
>> -EXTRA_FILES_ti33x =3D "${@base_conditional('ARAGO_BRAND','amsdk','','ti=
sdk-readme',d)}"
>> -EXTRA_FILES_ti43x =3D "${@base_conditional('ARAGO_BRAND','amsdk','','ti=
sdk-readme',d)}"
>> +EXTRA_FILES_ti33x =3D "${@base_conditional('ARAGO_BRAND','amsdk','','ti=
sdk-readme tisdk-uenv',d)}"
>> +EXTRA_FILES_ti43x =3D "${@base_conditional('ARAGO_BRAND','amsdk','','ti=
sdk-readme tisdk-uenv',d)}"
>>=20
>> RDEPENDS_${PN} =3D "\
>>    ${TOOLS} \
>> --
>> 1.7.9.5
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

