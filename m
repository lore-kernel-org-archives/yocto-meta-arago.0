Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A8A4E52974
	for <meta-arago@arago-project.org>;
	Fri, 20 Sep 2019 19:15:57 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KJEnuI037970
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 14:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569006889;
	bh=7MvTBdb2KTTD2PJt0GyKoB+W29y6kK5Q0xh5ym5QrzI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=SjkYYFh2hzuW0j0o31LSxxuVhq6KpxE76oq2IZ4pf5muHppLtBNBQ+hnPWmq/V26I
	s8vgqNmO9ujXp9XvfaFVnx/tsHLWxlejjJHwOEv6UPOR52zMkjmQoh46iEfHxZ7Fr4
	WBGr/kaWGtj6kb0hqcp5/h4t6Jl9iNTOISP5r10g=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KJEniB011478
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 14:14:49 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 20 Sep 2019 14:14:44 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1713.004; Fri, 20 Sep 2019 14:14:44 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [master/thud/ti2019.03][PATCH]
	meta-toolchain-arago-qte: add quotes to vars
Thread-Index: AQHVb7gRYKOiufwmTk6ZPTBXw8LVwac1M9WA//+7ioA=
Date: Fri, 20 Sep 2019 19:14:44 +0000
Message-ID: <949f3a6c0a8f461f8265218331d91ef4@ti.com>
References: <1568985365-31665-1-git-send-email-j-stiffler@ti.com>
	<20190920181757.GI5351@beryl>
In-Reply-To: <20190920181757.GI5351@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [master/thud/ti2019.03][PATCH] meta-toolchain-arago-qte: add quotes to vars
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
X-List-Received-Date: Fri, 20 Sep 2019 19:15:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am not sure what is require for qmake, but this was the effect with bash.=
 If dash is the shell, then there is an error exporting the variable becaus=
e of the whitespace.

In summary, this causes no change in behavior if bash is the shell.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, September 20, 2019 2:18 PM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [master/thud/ti2019.03][PATCH] meta-toolchain-
> arago-qte: add quotes to vars
>=20
> BTW, do we also need to pass --sysroot parameter for qmake CC vars, like =
is
> done for main CC vars here:
> http://arago-project.org/git/?p=3Dmeta-
> arago.git;a=3Dcommitdiff;h=3D4e87564c39e214a61cbf0088ecf1a3f5a3f01bd5
>=20
>=20
> On Fri, Sep 20, 2019 at 09:16:05AM -0400, Jacob Stiffler wrote:
> > * Add quotes around values which may contain spaces
> >
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  .../recipes-core/meta/meta-toolchain-arago-qte.bb              | 10 ++=
+++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-
> qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-
> qte.bb
> > index b03b639..d313939 100644
> > --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> > +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> > @@ -5,7 +5,7 @@ TOOLCHAIN_SUFFIX ?=3D "-qte-sdk"
> >
> >  require meta-toolchain-arago.bb
> >
> > -PR =3D "r19"
> > +PR =3D "r20"
> >
> >  # There could be qt5, qt4e and qt4x11 providers, but we don't support
> qt4x11 for now
> >  QT_DIR_NAME =3D "${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', 'qt=
opia',
> d)}"
> > @@ -19,10 +19,10 @@ toolchain_create_sdk_env_script_append() {
> >  	echo 'export OE_QMAKE_CFLAGS=3D"$CFLAGS"' >> $script
> >  	echo 'export OE_QMAKE_CXXFLAGS=3D"$CXXFLAGS"' >> $script
> >  	echo 'export OE_QMAKE_LDFLAGS=3D"$LDFLAGS"' >> $script
> > -	echo 'export OE_QMAKE_CC=3D$CC' >> $script
> > -	echo 'export OE_QMAKE_CXX=3D$CXX' >> $script
> > -	echo 'export OE_QMAKE_LINK=3D$CXX' >> $script
> > -	echo 'export OE_QMAKE_AR=3D$AR' >> $script
> > +	echo 'export OE_QMAKE_CC=3D"$CC"' >> $script
> > +	echo 'export OE_QMAKE_CXX=3D"$CXX"' >> $script
> > +	echo 'export OE_QMAKE_LINK=3D"$CXX"' >> $script
> > +	echo 'export OE_QMAKE_AR=3D"$AR"' >> $script
> >  	echo 'export OE_QMAKE_PREFIX_QT=3D${prefix}' >> $script
> >  	echo 'export OE_QMAKE_LIBDIR_QT=3D${libdir}' >> $script
> >  	echo 'export
> OE_QMAKE_INCDIR_QT=3D${includedir}/${QT_DIR_NAME}' >> $script
> > --
> > 2.7.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

