Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 348B152A54
	for <meta-arago@arago-project.org>;
	Fri,  8 Nov 2013 02:04:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA824QH6027535
	for <meta-arago@arago-project.org>; Thu, 7 Nov 2013 20:04:26 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA824QrM029770
	for <meta-arago@arago-project.org>; Thu, 7 Nov 2013 20:04:26 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 7 Nov 2013 20:04:26 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Tivy, Robert" <rtivy@ti.com>
Thread-Topic: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
Thread-Index: AQHO23a8hPYNfzr1mEOnMtA2IqI7ZZoZxXcA///eZzCAAVRpgP//nI/ggABmQgD//5uPkA==
Date: Fri, 8 Nov 2013 02:04:25 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905498962B@DLEE11.ent.ti.com>
References: <1383800614-31915-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED101597FEDD2@DLEE11.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F49054988C24@DLEE11.ent.ti.com>
	<20131108015325.GV4510@edge>
	<13514BD7FAEBA745BBD7D8A672905C14573A6C45@DFLE12.ent.ti.com>
	<20131108020330.GX4510@edge>
In-Reply-To: <20131108020330.GX4510@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Fri, 08 Nov 2013 02:04:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, November 07, 2013 9:04 PM
> To: Tivy, Robert
> Cc: Nelson, Sam; Maupin, Chase; meta-arago@arago-project.org; Ring, Chris
> Subject: Re: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
>=20
> On Thu, Nov 07, 2013 at 09:00:08PM -0500, Tivy, Robert wrote:
> > Please see one response below...
> >
> > Regards,
> >
> > - Rob
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Thursday, November 07, 2013 5:53 PM
> > > To: Nelson, Sam
> > > Cc: Maupin, Chase; meta-arago@arago-project.org; Ring, Chris; Tivy,
> > > Robert
> > > Subject: Re: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
> > >
> > >
> > > > > >+}
> > > > > >diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-
> bsp/cmem/cmem.inc
> > > > > >new file mode 100644
> > > > > >index 0000000..5d17d8e
> > > > > >--- /dev/null
> > > > > >+++ b/recipes-bsp/cmem/cmem.inc
> > > > > >@@ -0,0 +1,12 @@
> > > > >
> >+HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:CMEM"
> > > > > >+
> > > > > >+LICENSE =3D "GPLv2"
> > > > > >+LIC_FILES_CHKSUM =3D
> > > > >
> >"file://include/ti/cmem.h;beginline=3D1;endline=3D30;md5=3Db86138d4028fb
> > > > > >8310b3b983024edc620"
> > > > > >+
> > > > > >+COMPATIBLE_MACHINE =3D "keystone-evm"
> > > > >
> > > > > As Sidd pointed out is there any reason not to add the other
> > > devices like
> > > > > omap-a15 as compatible machines?
> > > >
> > > > [Sam] I am fine with remove the compatible machine. Although this i=
s
> > > not
> > > > tested with other machines.
> > >
> > > So, Chris and Rob should comment on which platforms this version of
> > > cmem is
> > > supposed to be compatible with, even if it's not tested yet.
> > >
> >
> > CMEM is completely architecture-independent.  The only HW it touches is
> > memory, and the memory it touches is specified by the user/system
> > integrator.
>=20
> Thanks. Then it doesn't make sense to artificially limit it to Keystone o=
nly.
[Sam] Agreed. I will remove COMPATIBLE_MACHINE =3D "keystone-evm"
>=20
> --
> Denys

