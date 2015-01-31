Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8F298529DD
	for <meta-arago@arago-project.org>;
	Sat, 31 Jan 2015 03:50:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0V3oL4G031625
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 21:50:21 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0V3oK62019639
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 21:50:20 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Fri, 30 Jan 2015 21:50:20 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/2] libnl: Add append recipe to expose
	private files
Thread-Index: AQHQPOM2nZ3OdhGNGEmGCxWxKSqqdZzZ7TSA//+q3JA=
Date: Sat, 31 Jan 2015 03:50:20 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905810D6E7@DLEE11.ent.ti.com>
References: <1422659974-29180-1-git-send-email-sam.nelson@ti.com>
	<20150131025415.GB2883@edge>
In-Reply-To: <20150131025415.GB2883@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] libnl: Add append recipe to expose private files
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
X-List-Received-Date: Sat, 31 Jan 2015 03:50:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, January 30, 2015 9:54 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/2] libnl: Add append recipe to expose
> private files
>=20
> On Fri, Jan 30, 2015 at 06:19:33PM -0500, Sam Nelson wrote:
> > - Private files installed are needed to allow xfrm extension of libnl
> > - Version 3.2.24 already have this patch
>=20
> Why do you need this, if you have 3.2.24 already?
>=20
[Sam] This is needed temporarily to patch 3.2.22 as the arago preferred ver=
sion is currently
 3.2.22
>=20
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >
> > ---
> > This is needed temporarily to patch 3.2.22 as the arago preferred versi=
on is
> 3.2.22
> > ---
> > ---
> >  .../recipes-support/libnl/libnl_3.2.22.bbappend    |    8 ++++++++
> >  1 file changed, 8 insertions(+)
> >  create mode 100644 meta-arago-extras/recipes-
> support/libnl/libnl_3.2.22.bbappend
> >
> > diff --git a/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bbapp=
end
> b/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bbappend
> > new file mode 100644
> > index 0000000..4885c7d
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bbappend
> > @@ -0,0 +1,8 @@
> > +PR_append =3D "-arago0"
> > +
> > +do_install_append() {
> > +#   Install private files to allow libnl extensions
> > +    install -d ${D}${includedir}/netlink-private
> > +    cp -r ${S}/include/netlink-private/cache-api.h ${D}${includedir}/n=
etlink-
> private/
> > +    cp -r ${S}/include/netlink-private/object-api.h ${D}${includedir}/=
netlink-
> private/
> > +}
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

