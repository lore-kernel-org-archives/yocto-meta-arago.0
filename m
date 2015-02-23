Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 385AC52A5A
	for <meta-arago@arago-project.org>;
	Mon, 23 Feb 2015 21:25:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1NLPmqM011343
	for <meta-arago@arago-project.org>; Mon, 23 Feb 2015 15:25:48 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1NLPlro017393
	for <meta-arago@arago-project.org>; Mon, 23 Feb 2015 15:25:47 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Mon, 23 Feb 2015 15:25:47 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/4] packagegroup-arago-tisdk-*: Add back
	dual camera demo that supports Qt and 3.14
Thread-Index: AQHQTWB90ixlFrkjSUKd9lN/txIqDZz/JhcA//+du5g=
Date: Mon, 23 Feb 2015 21:25:47 +0000
Message-ID: <B64B75BC-B319-4E9C-B1CA-C9F3E4560F37@ti.com>
References: <1424472995-22977-1-git-send-email-fcooper@ti.com>
	<1424472995-22977-2-git-send-email-fcooper@ti.com>,
	<20150223211729.GM31287@edge>
In-Reply-To: <20150223211729.GM31287@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/4] packagegroup-arago-tisdk-*: Add back dual camera demo that supports Qt and 3.14
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
X-List-Received-Date: Mon, 23 Feb 2015 21:25:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Devices like am57 should include those packages even though they aren't sup=
ported by  the dual camera demo.

And for am437 it's just to insure those libraries r included incase the dem=
o is unused for what ever reason in the future.=20


> On Feb 23, 2015, at 3:17 PM, Dmytriyenko, Denys <denys@ti.com> wrote:
>=20
>> On Fri, Feb 20, 2015 at 04:56:33PM -0600, Franklin S. Cooper Jr wrote:
>> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
>>=20
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>> .../packagegroup-arago-tisdk-addons.bb             |    6 +++---
>> ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |    7 +++++--
>> .../packagegroup-arago-tisdk-multimedia.bb         |    6 +++---
>> 3 files changed, 11 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/package=
group-arago-tisdk-addons.bb
>> index 6d98ba6..c6b07a9 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-addons.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-addons.bb
>> @@ -1,6 +1,6 @@
>> DESCRIPTION =3D "Task to install additional utilities/demos for SDKs"
>> LICENSE =3D "MIT"
>> -PR =3D "r19"
>> +PR =3D "r20"
>>=20
>> inherit packagegroup
>>=20
>> @@ -39,8 +39,8 @@ UTILS_append_dra7xx =3D " canutils"
>> UTILS_append_omap-a15 =3D " parted"
>>=20
>> UTILS_append_ti33x =3D " switch-config"
>> -UTILS_append_ti43x =3D " switch-config"
>> -UTILS_append_omap-a15 =3D " switch-config"
>> +UTILS_append_ti43x =3D " switch-config libdrm-omap"
>> +UTILS_append_omap-a15 =3D " switch-config libdrm-omap"
>=20
> Any particular reason to add libdrm dependency in this packagegroup? It s=
hould=20
> be taken care of by DEPENDS and RDEPENDS of the actual package - i.e. dua=
l-cam
>=20
>=20
>> RDEPENDS_${PN} =3D "\
>>     ${UTILS} \
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packageg=
roups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
>> index 94fd786..8f7c4fe 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-multimedia-sdk-host.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-multimedia-sdk-host.bb
>> @@ -1,6 +1,6 @@
>> DESCRIPTION =3D "Task to add multimedia related sources into the SDK"
>> LICENSE =3D "MIT"
>> -PR =3D "r6"
>> +PR =3D "r7"
>>=20
>> inherit packagegroup
>>=20
>> @@ -16,7 +16,10 @@ MULTIMEDIA_append_am3517-evm =3D " \
>>     av-examples-src \
>> "
>>=20
>> -MULTIMEDIA_append_ti43x =3D ""
>> +MULTIMEDIA_append_ti43x =3D " \
>> +    dual-camera-demo-src \
>> +    image-gallery-src \
>> +"
>>=20
>> #Demo doesn't work on 3.14
>> # ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo-src im=
age-gallery-src', d)}
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/pac=
kagegroup-arago-tisdk-multimedia.bb
>> index 81d5ee1..dd495f8 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-multimedia.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-multimedia.bb
>> @@ -1,6 +1,6 @@
>> DESCRIPTION =3D "Task to add multimedia related packages"
>> LICENSE =3D "MIT"
>> -PR =3D "r10"
>> +PR =3D "r11"
>>=20
>> inherit packagegroup
>>=20
>> @@ -17,10 +17,10 @@ MULTIMEDIA_append_ti33x =3D " \
>> "
>>=20
>> MULTIMEDIA_append_ti43x =3D " \
>> +    dual-camera-demo \
>> +    image-gallery \
>>     amsdk-av-files \
>> "
>> -# demo doesn't work on 3.14
>> -# ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo image=
-gallery', d)}
>>=20
>> MULTIMEDIA_append_omap-a15 =3D " \
>>     amsdk-av-files \
>> --=20
>> 1.7.9.5
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

