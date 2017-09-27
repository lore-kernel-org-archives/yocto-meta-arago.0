Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id E279A529F8
	for <meta-arago@arago-project.org>;
	Wed, 27 Sep 2017 16:52:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8RGqm14022196
	for <meta-arago@arago-project.org>; Wed, 27 Sep 2017 11:52:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506531168;
	bh=e9nbX3awXVFADjJYKNu5eXsM/6Fx62PiJtuhipjemfE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=p4ls9YrNw5biE/y9E9TWsvreUwkr/TShzEb/BFrF41149RwgkSSjAMn4nYU1ee2yb
	vtQC9vbVhn4Oqrm46d99c+ZfYdO7azHq50JAl9K3O/X5QdJPtKquwbHZsZ4FRIXht3
	r+IQa9idJv7Cz0TulyEGKn50TV2ugYyVqvDTmrjQ=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8RGqhSc012561
	for <meta-arago@arago-project.org>; Wed, 27 Sep 2017 11:52:43 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Wed, 27 Sep 2017 11:52:43 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/2] ccief-basic: add CCLINK IEF Basic for
	Linux
Thread-Index: AQHTNu2oR7ew2kJeSUaaYz0OrApmeKLI9AZQ
Date: Wed, 27 Sep 2017 16:52:42 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926D8561D@DLEE08.ent.ti.com>
References: <1506366173-17907-1-git-send-email-a0271529@ti.com>
	<20170926173352.GA26843@edge>
In-Reply-To: <20170926173352.GA26843@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] ccief-basic: add CCLINK IEF Basic for Linux
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
X-List-Received-Date: Wed, 27 Sep 2017 16:52:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Denys. Submitted the v2 patch for the changes you mentioned below.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, September 26, 2017 1:34 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/2] ccief-basic: add CCLINK IEF Basic f=
or
> Linux
>=20
> On Mon, Sep 25, 2017 at 03:02:52PM -0400, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > ---
> >  .../recipes-support/cclink/ccief-basic_git.bb      | 44
> ++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644
> > meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
> >
> > diff --git
> > a/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
> > b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
> > new file mode 100644
> > index 0000000..41332fa
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
> > @@ -0,0 +1,44 @@
> > +DESCRIPTION =3D "CC-Link Industrial Ethernet Field Basic Master and Sl=
ave
> Implementation"
>=20
> ^^^^^^
> https://lists.yoctoproject.org/pipermail/meta-ti/2017-July/010261.html
>=20
>=20
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D "file://CCIEF-
> BASIC_Master/library/include/SLMP.h;beginline=3D1;endline=3D34;md5=3D9bcc=
a1b
> 46fb3c83966c242e5afa3c352"
> > +
> > +PV =3D "1.0"
> > +PR =3D "r0"
> > +
> > +CCIEF-BASIC_GIT_URI =3D "git://git.ti.com/processor-sdk/cclink.git"
> > +CCIEF-BASIC_GIT_PROTOCOL =3D "git"
> > +CCIEF-BASIC_GIT_BRANCH =3D "master"
> > +
> > +CCIEF-BASIC_SRCREV =3D "8b4f9aea6550ff563d21ff3979aa6e7cdc708998"
> > +
> > +BRANCH =3D "${CCIEF-BASIC_GIT_BRANCH}"
> > +SRC_URI =3D "${CCIEF-BASIC_GIT_URI};protocol=3D${CCIEF-
> BASIC_GIT_PROTOCOL};branch=3D${BRANCH}"
> > +
> > +SRCREV =3D "${CCIEF-BASIC_SRCREV}"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +do_compile() {
> > +# build Master sample application
> > +    cd ${S}/CCIEF-BASIC_Master/build/linux
> > +    oe_runmake
> > +# build Slave sample application
> > +    cd ${S}/CCIEF-BASIC_Slave/build/linux
> > +    oe_runmake
> > +}
> > +
> > +do_install() {
> > +# install CCIEF BASIC binaries
> > +    install -d ${D}${bindir}
> > +    install -m 755 ${S}/CCIEF-BASIC_Master/build/linux/Master_sample
> ${D}${bindir}
> > +    install -m 755 ${S}/CCIEF-BASIC_Slave/build/linux/Slave_sample
> > +${D}${bindir}
> > +
> > +# install CCIEF BASIC configuration files
> > +    install -d ${D}${datadir}/cclink
> > +    install -m 644 ${S}/CCIEF-BASIC_Master/sample/MasterParameter.csv
> ${D}${datadir}/cclink
> > +    install -m 644 ${S}/CCIEF-BASIC_Slave/sample/SlaveParameter.csv
> > +${D}${datadir}/cclink }
> > +
> > +FILES_${PN} +=3D "${datadir}/cclink"
> > +
> > +INSANE_SKIP_${PN} =3D "ldflags"
>=20
> If you need this, then LDFLAGS are not being passed properly to the build=
.
> Any chance to fix this?
>=20
>=20
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

