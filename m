Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id ABE0F52A0B
	for <meta-arago@arago-project.org>;
	Sat,  8 Sep 2012 17:24:18 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q88HOHKq017025;
	Sat, 8 Sep 2012 12:24:17 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q88HOHGm012205;
	Sat, 8 Sep 2012 12:24:17 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Sat, 8 Sep 2012 12:24:17 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] [meta-arago-distro][PATCH 1/2 v2] pinmux-utility:
	Add	pinmux utility
Thread-Index: AQHNjSnzPno0MtdSoUKhtRF/1SQAFpeAmQ/QgAAHSHmAABLEQA==
Date: Sat, 8 Sep 2012 17:24:17 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101591DDC4A@DLEE12.ent.ti.com>
References: <1347044999-25201-1-git-send-email-fcooper27jr@gmail.com>,
	<7D46E86EC0A8354091174257B2FED101591DD99D@DLEE12.ent.ti.com>
	<03486037-E0B7-4025-898E-93D2E2517F58@ti.com>
In-Reply-To: <03486037-E0B7-4025-898E-93D2E2517F58@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Franklin S.
	Cooper Jr" <fcooper27jr@gmail.com>
Subject: Re: [meta-arago-distro][PATCH 1/2 v2] pinmux-utility: Add	pinmux utility
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
X-List-Received-Date: Sat, 08 Sep 2012 17:24:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I meant a new version of your patch.

When you send a v2 or v3 it is a good idea to make a list of what you chang=
ed between versions.

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Saturday, September 08, 2012 11:17 AM
> To: Maupin, Chase
> Cc: Franklin S. Cooper Jr; meta-arago@arago-project.org; Franklin
> S. Cooper Jr
> Subject: Re: [meta-arago] [meta-arago-distro][PATCH 1/2 v2]
> pinmux-utility: Add pinmux utility
>=20
> I'm unsure about this. I would think that is the point of an app
> or library's release notes.
>=20
> On Sep 8, 2012, at 10:52 AM, "Maupin, Chase"
> <chase.maupin@ti.com> wrote:
>=20
> > Please start adding
> >
> > ---
> > Update in version x
> >    * item 1
> >    * item 2
> >
> >
> > That way we know why there is a new version.
> >
> > Sincerely,
> > Chase Maupin
> > Software Applications
> > ARM MPU
> > e-mail: chase.maupin@ti.com
> > phone: (214) 567-2950
> >
> > For support:
> > Forums - http://community.ti.com/forums/
> > Wiki - http://wiki.davincidsp.com/
> >
> >
> >> -----Original Message-----
> >> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> >> Sent: Friday, September 07, 2012 2:10 PM
> >> To: meta-arago@arago-project.org
> >> Cc: Franklin S. Cooper Jr
> >> Subject: [meta-arago] [meta-arago-distro][PATCH 1/2 v2]
> pinmux-
> >> utility: Add pinmux utility
> >>
> >> * Add Windows base pinmux utility
> >> * Port pinmux-utility recipe from arago.
> >> * The current recipe pulls in a zip file that doesn't contain
> >>  license information. License information will be added in an
> >>  updated recipe.
> >>
> >> Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
> >> ---
> >> .../pinmux-utility/pinmux-utility.inc              |   19
> >> +++++++++++++++
> >> .../pinmux-utility/pinmux-utility_2.3.1.0.bb       |   25
> >> ++++++++++++++++++++
> >> 2 files changed, 44 insertions(+), 0 deletions(-)
> >> create mode 100644 meta-arago-distro/recipes-arago/pinmux-
> >> utility/pinmux-utility.inc
> >> create mode 100644 meta-arago-distro/recipes-arago/pinmux-
> >> utility/pinmux-utility_2.3.1.0.bb
> >>
> >> diff --git a/meta-arago-distro/recipes-arago/pinmux-
> >> utility/pinmux-utility.inc b/meta-arago-distro/recipes-
> >> arago/pinmux-utility/pinmux-utility.inc
> >> new file mode 100644
> >> index 0000000..46d409d
> >> --- /dev/null
> >> +++ b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-
> >> utility.inc
> >> @@ -0,0 +1,19 @@
> >> +DESCRIPTION =3D "Texas Instruments Pinmux Utility"
> >> +LICENSE =3D "BSD"
> >> +
> >> +PR =3D "r0"
> >> +
> >> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >> +
> >> +S =3D "${WORKDIR}/${P}"
> >> +
> >> +installdir =3D "host-tools/pinmux_utils/windows"
> >> +
> >> +do_install() {
> >> +    install -d ${D}/${installdir}
> >> +    install ${S}/Pin_Mux_Utility.msi ${D}/${installdir}
> >> +    install ${S}/setup.exe ${D}/${installdir}
> >> +    install ${S}/Release_Notes.txt ${D}/${installdir}
> >> +}
> >> +
> >> +FILES_${PN} +=3D "${installdir}/*"
> >> diff --git a/meta-arago-distro/recipes-arago/pinmux-
> >> utility/pinmux-utility_2.3.1.0.bb b/meta-arago-distro/recipes-
> >> arago/pinmux-utility/pinmux-utility_2.3.1.0.bb
> >> new file mode 100644
> >> index 0000000..e966f3a
> >> --- /dev/null
> >> +++ b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-
> >> utility_2.3.1.0.bb
> >> @@ -0,0 +1,25 @@
> >> +require pinmux-utility.inc
> >> +
> >> +PR_append =3D "-arago0"
> >> +
> >> +SRC_URI =3D "\
> >> +
> >>
> https://gforge.ti.com/gf/download/frsrelease/815/5471/PinMuxUtili
> >> ty_v2_03_01_00.zip;name=3Dbase;subdir=3D${P} \
> >> +"
> >> +SRC_URI[base.md5sum] =3D "31f28b06f72c042e5400fc53b4a29c0e"
> >> +SRC_URI[base.sha256sum] =3D
> >>
> "2b0de3592c5f4b803a207d092dba227d10e1af65e0d4f06e1d8d23f317a452f9
> >> "
> >> +
> >> +# Currently for omapl138 devices we are using a different
> pinmux
> >> utility
> >> +# program.  This requires a separate SRC_URI as well as a
> >> different
> >> +# do_install.
> >> +SRC_URI_omapl138 =3D "\
> >> +
> >>
> https://gforge.ti.com/gf/download/frsrelease/461/4210/Pin_Setup_A
> >> M18xx_01_00_1076_03.zip;name=3Domapl138;subdir=3D${P} \
> >> +"
> >> +
> >> +do_install_omapl138() {
> >> +    install -d ${D}/${installdir}
> >> +    cp -rf ${S}/bin ${D}/${installdir}/
> >> +    cp -rf ${S}/configurations ${D}/${installdir}/
> >> +}
> >> +
> >> +SRC_URI[omapl138.md5sum] =3D "5a4eb834bde44c662aaf669882adbfe6"
> >> +SRC_URI[omapl138.sha256sum] =3D
> >>
> "6701ca0e91761b9eb80b0097fbb2e2ce2cd8e0bcdc0bd18c34cd0221d9d450d0
> >> "
> >> --
> >> 1.7.0.4
> >>
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

