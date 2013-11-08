Return-Path: <rtivy@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D3B0D52A3E
	for <meta-arago@arago-project.org>;
	Fri,  8 Nov 2013 02:00:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA820A4I019924
	for <meta-arago@arago-project.org>; Thu, 7 Nov 2013 20:00:10 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA820Awb022790
	for <meta-arago@arago-project.org>; Thu, 7 Nov 2013 20:00:10 -0600
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Thu, 7 Nov 2013 20:00:10 -0600
From: "Tivy, Robert" <rtivy@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Nelson, Sam" <sam.nelson@ti.com>
Thread-Topic: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
Thread-Index: AQHO23a8hPYNfzr1mEOnMtA2IqI7ZZoZxXcA///eZzCAAVRpgP//nI/g
Date: Fri, 8 Nov 2013 02:00:08 +0000
Message-ID: <13514BD7FAEBA745BBD7D8A672905C14573A6C45@DFLE12.ent.ti.com>
References: <1383800614-31915-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED101597FEDD2@DLEE11.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F49054988C24@DLEE11.ent.ti.com>
	<20131108015325.GV4510@edge>
In-Reply-To: <20131108015325.GV4510@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Ring,
	Chris" <cring@ti.com>
Subject: Re: [PATCH v2] cmem: Adding New recipe for cmem
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
X-List-Received-Date: Fri, 08 Nov 2013 02:00:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please see one response below...

Regards,

- Rob

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, November 07, 2013 5:53 PM
> To: Nelson, Sam
> Cc: Maupin, Chase; meta-arago@arago-project.org; Ring, Chris; Tivy,
> Robert
> Subject: Re: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
>=20
>=20
> > > >+}
> > > >diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> > > >new file mode 100644
> > > >index 0000000..5d17d8e
> > > >--- /dev/null
> > > >+++ b/recipes-bsp/cmem/cmem.inc
> > > >@@ -0,0 +1,12 @@
> > > >+HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:CMEM"
> > > >+
> > > >+LICENSE =3D "GPLv2"
> > > >+LIC_FILES_CHKSUM =3D
> > > >"file://include/ti/cmem.h;beginline=3D1;endline=3D30;md5=3Db86138d40=
28fb
> > > >8310b3b983024edc620"
> > > >+
> > > >+COMPATIBLE_MACHINE =3D "keystone-evm"
> > >
> > > As Sidd pointed out is there any reason not to add the other
> devices like
> > > omap-a15 as compatible machines?
> >
> > [Sam] I am fine with remove the compatible machine. Although this is
> not
> > tested with other machines.
>=20
> So, Chris and Rob should comment on which platforms this version of
> cmem is
> supposed to be compatible with, even if it's not tested yet.
>=20

CMEM is completely architecture-independent.  The only HW it touches is mem=
ory, and the memory it touches is specified by the user/system integrator.



