Return-Path: <aravindbr@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2A3B8529CE
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2014 21:17:21 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1BLHIoh015080
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2014 15:17:19 -0600
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1BLHFTT009186
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 02:47:17 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Wed, 12 Feb 2014 05:17:14 +0800
From: Aravind Batni <aravindbr@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v2] ti-csl: new recipe providing CSL for
	TI-KeyStone2 devices
Thread-Index: AQHPIp4othOU4bJCTEqcYBpSUXMu05qmjHqAgAoJpJA=
Date: Tue, 11 Feb 2014 21:17:13 +0000
Message-ID: <941289A393E94C478C153EF5E432FDBB3EA69E68@DBDE04.ent.ti.com>
References: <1391624082-26580-1-git-send-email-aravindbr@ti.com>
	<20140205195317.GW18784@edge>
In-Reply-To: <20140205195317.GW18784@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] ti-csl: new recipe providing CSL for TI-KeyStone2 devices
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
X-List-Received-Date: Tue, 11 Feb 2014 21:17:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please see response in-lined.

-Best Regards,
Aravind


> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, February 05, 2014 2:53 PM
> To: Aravind Batni
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH v2] ti-csl: new recipe providing CSL for=
 TI-
> KeyStone2 devices
>=20
> On Wed, Feb 05, 2014 at 01:14:42PM -0500, Aravind Batni wrote:
> > -This package provides chip support library interface files
> >
> > Signed-off-by: Aravind Batni <aravindbr@ti.com>
> > ---
> > * grouped SRC_URI and SRCREV together
> > * Modified do_install to copy the needed files only instead of copy
> everything
> >   delete unwanted files.
> > ---
> > ---
> >  meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb |   22
> ++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100644 meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
> >
> > diff --git a/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
> > b/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
> > new file mode 100644
> > index 0000000..37f7937
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
> > @@ -0,0 +1,22 @@
> > +DESCRIPTION =3D "TI CSL"
> > +LICENSE =3D "TI BSD"
> > +LIC_FILES_CHKSUM =3D
> "file://COPYING.txt;md5=3D5857833e20836213677fac33f9aded21"
> > +
> > +COMPATIBLE_MACHINE =3D "keystone-evm"
>=20
> Do you want to relax it to entire "keystone" family, not just EVM?
>=20
[Aravind Batni]  Yes, we can change it to "keystone"
>=20
> > +ALLOW_EMPTY_${PN} =3D "1"
> > +
> > +PR =3D "r0"
> > +BRANCH=3D"master"
> > +SRC_URI =3D "git://git.ti.com/keystone-rtos/common-csl-
> ip.git;protocol=3Dgit;branch=3D${BRANCH}"
> > +# commit ID corresponds to DEV.CSL_KEYSTONE2.02.00.00.17 SRCREV =3D
> > +"f6f90144c14e1ee783c4b893b52e54830be8166e"
> > +S =3D "${WORKDIR}/git"
> > +
> > +do_install () {
> > +    cd ${S}
>=20
[Aravind Batni] Yes, this can be removed and would be part of next patch su=
bmit.
> do_install already operates from within ${S}. If you need to control it f=
urther,
> you can pass it to find commands below, instead of "."
>=20
> Either way it's rather nit-picking, along with SRCREV order...
>=20
>=20
[Aravind Batni] "find " needs the relative path from ${S} for CSL while ins=
talling to /usr/include. If we provide ${S} instead of ".", find will resul=
t in absolute path which will result in in correct installation of CSL file=
s. We will send an updated patch with the updates as mentioned.
> > +    install -d ${D}${includedir}/ti/csl
> > +    find . -name "*.h" -type f | xargs -I {} cp --parents {}
> ${D}${includedir}/ti/csl
> > +    find ./src/ip/serdes_sb/V0 -name "*.c" -type f | xargs -I {} cp
> > +--parents {} ${D}${includedir}/ti/csl/src/ip/serdes_sb/V0
> > +}
> > +
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

