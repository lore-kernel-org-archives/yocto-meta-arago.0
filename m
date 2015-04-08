Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 09B36529E0
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2015 18:57:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t38Iv65P012414
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 13:57:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t38Iv53G019575
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 13:57:05 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Wed, 8 Apr 2015 13:57:04 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [PATCH] packagegroup-arago-tisdk-amsdk-sdk-host:
	Include tisdk-uenv.
Thread-Index: AQHQcenGSPnQPaU0WEirT4XWALNnIJ1DBBBBgABUtgD//60O0oAAwkIA//+uD6A=
Date: Wed, 8 Apr 2015 18:57:03 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C8690EC@DFLE08.ent.ti.com>
References: <1428490195-31174-1-git-send-email-j-stiffler@ti.com>
	<C8CE0126-1DF0-4B76-ADA7-F331BCF02018@ti.com>,
	<4B26FB5A64EBA14C87266869E037F9581411D78A@DFLE09.ent.ti.com>
	<12827348-3C3B-467C-9168-3498595006DE@ti.com>
	<4B26FB5A64EBA14C87266869E037F9581411D990@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F9581411D990@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Wed, 08 Apr 2015 18:57:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Well that is fine and there is documentation for that rare instances that p=
eople need it they can use. uEnv.txt isn't something most people will need =
to use now and its confusing for users since it isn't something that is ref=
lected when viewing U-Boot environment variables. The amount of time we get=
 customers complaining about their board failing to boot or some reason U-b=
oot never "respects" their environment variable changes which generally is =
due to uEnv.txt

Its not used by default, it should be documented if needed, vast majority o=
f users do not needed and it just causes headaches. So it shouldn't be incl=
uded.

> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Wednesday, April 08, 2015 1:45 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] packagegroup-arago-tisdk-amsdk-sdk-
> host: Include tisdk-uenv.
>=20
> I've used it before to set bootargs when I did not have the serial connec=
tion.
>=20
> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Wednesday, April 08, 2015 8:09 AM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] packagegroup-arago-tisdk-amsdk-sdk-
> host: Include tisdk-uenv.
>=20
> No uEnv.txt is something we should never be using. There is literally no =
need
> for it since saveenv works for every single evm.
>=20
>  In the past that wasn't the case but even then packaging a blank uEnv.tx=
t is
> pointless and it something that should be documented.
>=20
>=20
> > On Apr 8, 2015, at 7:06 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
> >
> > Nothing is being set in it, but there is a nice description of what it =
can be
> used for, so it seems like it could be helpful for users.
> >
> > Maybe this uEnv.txt could be updated to have some sample configurations
> (e.g. setting some bootargs) which would be commented out?
> >
> > - Jake
> >
> > -----Original Message-----
> > From: Cooper Jr., Franklin
> > Sent: Wednesday, April 08, 2015 8:03 AM
> > To: Stiffler, Jacob
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] packagegroup-arago-tisdk-amsdk-sdk-
> host: Include tisdk-uenv.
> >
> > Why do you need uEnv.txt especially since it's blank from what I
> remember?
> >
> >
> >> On Apr 8, 2015, at 5:50 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
> >>
> >> * If tisdk-readme is packaged, then the uEnv.txt should also be
> >> packaged.
> >> * Package both if not amsdk.
> >>
> >> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >> ---
> >> .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    4 ++--
> >> 1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git
> >> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tis
> >> d
> >> k-amsdk-sdk-host.bb
> >> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tis
> >> d
> >> k-amsdk-sdk-host.bb
> >> index 61886ff..c6994ee 100644
> >> ---
> >> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tis
> >> d
> >> k-amsdk-sdk-host.bb
> >> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago
> >> +++ -
> >> +++ tisdk-amsdk-sdk-host.bb
> >> @@ -23,8 +23,8 @@ TOOLS_append_am3517-evm =3D " flash-utility"
> >>
> >> EXTRA_FILES =3D ""
> >> EXTRA_FILES_omap-a15 =3D "tisdk-readme tisdk-uenv"
> >> -EXTRA_FILES_ti33x =3D
> "${@base_conditional('ARAGO_BRAND','amsdk','','tisdk-readme',d)}"
> >> -EXTRA_FILES_ti43x =3D
> "${@base_conditional('ARAGO_BRAND','amsdk','','tisdk-readme',d)}"
> >> +EXTRA_FILES_ti33x =3D
> "${@base_conditional('ARAGO_BRAND','amsdk','','tisdk-readme tisdk-
> uenv',d)}"
> >> +EXTRA_FILES_ti43x =3D
> "${@base_conditional('ARAGO_BRAND','amsdk','','tisdk-readme tisdk-
> uenv',d)}"
> >>
> >> RDEPENDS_${PN} =3D "\
> >>    ${TOOLS} \
> >> --
> >> 1.7.9.5
> >>
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

