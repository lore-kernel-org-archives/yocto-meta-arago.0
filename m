Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6F97552A77
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 11:41:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CBf3nC017465
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 06:41:03 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CBf2OJ016115
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 06:41:02 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Thu, 12 Mar 2015 06:41:02 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Cooper Jr., Franklin"
	<fcooper@ti.com>
Thread-Topic: [meta-arago] [RFC v2 1/4] arago-prefs: Add WAYLAND_SUPPORT flag.
Thread-Index: AQHQV3Kje9BUUhMEl0qN8excN0fg8p0YdhmAgAAPRICAAAhcAIAAMyFw
Date: Thu, 12 Mar 2015 11:41:02 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814107CDF@DFLE09.ent.ti.com>
References: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>
	<1425580304-19919-2-git-send-email-j-stiffler@ti.com>
	<20150312020227.GG23587@edge>
	<131AB128-3D66-4FD9-A2BE-94D1EABE7F6B@ti.com>
	<20150312032700.GH23587@edge>
In-Reply-To: <20150312032700.GH23587@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Thu, 12 Mar 2015 11:41:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I do not see any examples of adding machine-specific distro features. I ass=
ume this would be the same as any other variable:

 DISTRO_FEATURES_append_some-machine =3D  "some_feature" ?


Now if wayland is a default feature for the core arago distribution. How ca=
n this be removed from the processor-sdk brand for only the ti33x and ti43x=
 soc families? Should arago.conf add "wayland" as a feature, and then can b=
randing-processor-sdk.conf  'DISTRO_FEATURES_remove_ti33x =3D "wayland"'? O=
r should this wayland feature be isolated to the branding files?

Thanks,
Jake


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, March 11, 2015 11:27 PM
To: Cooper Jr., Franklin
Cc: Stiffler, Jacob; meta-arago@arago-project.org
Subject: Re: [meta-arago] [RFC v2 1/4] arago-prefs: Add WAYLAND_SUPPORT fla=
g.

Yeah, we are going to do distro feature per macghine/soc anyway for things =
like java/x11, so it's not a big issue...


On Wed, Mar 11, 2015 at 10:57:05PM -0400, Cooper Jr., Franklin wrote:
> Not including Wayland should only occur for 335x and 437x. AM57x should=20
> still include Wayland.
>=20
> If it is possible to filter things out based on machines/socs then I gues=
s=20
> using that approach is fine. However distro features seem like it should =
be=20
> generic and not alter based on the soc.
>=20
> But since X11 is set via distro features then it would make sense for=20
> Wayland/Weston do the same. The soc specific changes makes it a bit messy=
...
>=20
>=20
> > On Mar 11, 2015, at 9:02 PM, Dmytriyenko, Denys <denys@ti.com> wrote:
> >=20
> >> On Thu, Mar 05, 2015 at 01:31:40PM -0500, Jacob Stiffler wrote:
> >> * Default to "1" if QT_PROVIDER is not "qt4e".
> >>=20
> >> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >> ---
> >> .../conf/distro/include/arago-prefs.inc            |    2 ++
> >> 1 file changed, 2 insertions(+)
> >>=20
> >> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/m=
eta-arago-distro/conf/distro/include/arago-prefs.inc
> >> index e689f8b..a566437 100644
> >> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >> @@ -28,6 +28,8 @@ PREFERRED_PROVIDER_virtual/gettext =3D "gettext"
> >> ARAGO_QT_PROVIDER =3D "${@base_conditional('QT_PROVIDER','qt5','',base=
_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d),d)=
}"
> >> PREFERRED_PROVIDER_qt4-embedded =3D "${ARAGO_QT_PROVIDER}"
> >>=20
> >> +WAYLAND_SUPPORT ?=3D "${@base_conditional('QT_PROVIDER', 'qt4e', '0',=
 '1', d)}"
> >=20
> > So, as I mentioned on the call today, we should use "wayland"=20
> > in DISTRO_FEATURES instead:
> >=20
> > ${@base_contains('DISTRO_FEATURES', 'wayland', 'deps-for-wayland', 'dep=
s-for-eglfs', d)}
> >=20
> >=20
> >> PREFERRED_VERSION_qt4-embedded =3D "4.8.5"
> >> PREFERRED_VERSION_qt4-native =3D "4.8.5"
> >> PREFERRED_VERSION_nativesdk-qt4-tools =3D "4.8.5"
> >> --=20
> >> 1.7.9.5
> >>=20
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

