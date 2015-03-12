Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1041C52A59
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 02:57:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2C2v8JU015368
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 21:57:08 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C2v6wP020305
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 21:57:07 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Wed, 11 Mar 2015 21:57:06 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [RFC v2 1/4] arago-prefs: Add WAYLAND_SUPPORT flag.
Thread-Index: AQHQV3KoBp+aCgQuHkyIU9owPZH0oJ0YdhmA//+7c8c=
Date: Thu, 12 Mar 2015 02:57:05 +0000
Message-ID: <131AB128-3D66-4FD9-A2BE-94D1EABE7F6B@ti.com>
References: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>
	<1425580304-19919-2-git-send-email-j-stiffler@ti.com>,
	<20150312020227.GG23587@edge>
In-Reply-To: <20150312020227.GG23587@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [RFC v2 1/4] arago-prefs: Add WAYLAND_SUPPORT flag.
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
X-List-Received-Date: Thu, 12 Mar 2015 02:57:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Not including Wayland should only occur for 335x and 437x. AM57x should sti=
ll include Wayland.

If it is possible to filter things out based on machines/socs then I guess =
using that approach is fine. However distro features seem like it should be=
 generic and not alter based on the soc.

But since X11 is set via distro features then it would make sense for Wayla=
nd/Weston do the same. The soc specific changes makes it a bit messy...


> On Mar 11, 2015, at 9:02 PM, Dmytriyenko, Denys <denys@ti.com> wrote:
>=20
>> On Thu, Mar 05, 2015 at 01:31:40PM -0500, Jacob Stiffler wrote:
>> * Default to "1" if QT_PROVIDER is not "qt4e".
>>=20
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>> .../conf/distro/include/arago-prefs.inc            |    2 ++
>> 1 file changed, 2 insertions(+)
>>=20
>> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/met=
a-arago-distro/conf/distro/include/arago-prefs.inc
>> index e689f8b..a566437 100644
>> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> @@ -28,6 +28,8 @@ PREFERRED_PROVIDER_virtual/gettext =3D "gettext"
>> ARAGO_QT_PROVIDER =3D "${@base_conditional('QT_PROVIDER','qt5','',base_c=
ontains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d),d)}"
>> PREFERRED_PROVIDER_qt4-embedded =3D "${ARAGO_QT_PROVIDER}"
>>=20
>> +WAYLAND_SUPPORT ?=3D "${@base_conditional('QT_PROVIDER', 'qt4e', '0', '=
1', d)}"
>=20
> So, as I mentioned on the call today, we should use "wayland"=20
> in DISTRO_FEATURES instead:
>=20
> ${@base_contains('DISTRO_FEATURES', 'wayland', 'deps-for-wayland', 'deps-=
for-eglfs', d)}
>=20
>=20
>> PREFERRED_VERSION_qt4-embedded =3D "4.8.5"
>> PREFERRED_VERSION_qt4-native =3D "4.8.5"
>> PREFERRED_VERSION_nativesdk-qt4-tools =3D "4.8.5"
>> --=20
>> 1.7.9.5
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

