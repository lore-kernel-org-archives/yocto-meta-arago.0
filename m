Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id CDBF352099
	for <meta-arago@arago-project.org>;
	Tue, 20 Aug 2013 16:54:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7KGsBTU026839
	for <meta-arago@arago-project.org>; Tue, 20 Aug 2013 11:54:11 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7KGsBfW011062
	for <meta-arago@arago-project.org>; Tue, 20 Aug 2013 11:54:11 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 20 Aug 2013 11:54:11 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [master & danny][PATCH 1/7] linux-libc-headers:
	Add linux-libc-headers version 2.6.33
Thread-Index: AQHOjksTMZ6NklZMBUWHD07FPNQsDpmdf3yA///+XL+AATykgP//sy2g
Date: Tue, 20 Aug 2013 16:54:11 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5264FB@DFLE08.ent.ti.com>
References: <1375317112-1690-1-git-send-email-fcooper@ti.com>
	<20130819213613.GF32524@denix.org>
	<FC0CCC2B-AE0D-4AA7-B553-3379ED7A62F0@ti.com>
	<20130820162339.GB8481@edge>
In-Reply-To: <20130820162339.GB8481@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [master & danny][PATCH 1/7] linux-libc-headers: Add linux-libc-headers version 2.6.33
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
X-List-Received-Date: Tue, 20 Aug 2013 16:54:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, August 20, 2013 11:24 AM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [master & danny][PATCH 1/7] linux-libc-headers:=
 Add
> linux-libc-headers version 2.6.33
>=20
> On Mon, Aug 19, 2013 at 10:30:20PM -0400, Cooper Jr., Franklin wrote:
> >
> >
> > On Aug 19, 2013, at 4:36 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
> >
> > > On Wed, Jul 31, 2013 at 07:31:46PM -0500, Franklin S. Cooper Jr wrote=
:
> > >> * This is the version that was originally being using in
> > >> arago/oe-classic based  SDK.
> > >
> > > Why do we need 2.6.33? All our old kernels are at least 2.6.37 now
> > > and there is corresponding linux-libc-headers available...
>=20
> > It's been awhile but I believe am18x still didn't like the 2.6.37
> > headers for some crazy reason.
>=20
> Do you have any more details? I'm testing it right now and it seems to be
> building fine so far against 2.6.37.2...
[Franklin] I believe it's a runtime issue with tslib. The am18 kernel confl=
icted with the 2.6.33 version of linux-libc-headers that was used to build =
tslib.=20
>=20
> --
> Denys
>=20
>=20
> > >> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > >> ---
> > >> .../linux-libc-headers_2.6.33.bb                   |   10 ++++++++++
> > >> 1 files changed, 10 insertions(+), 0 deletions(-)
> > >> create mode 100644 meta-arago-extras/recipes-kernel/linux-libc-
> headers/linux-libc-headers_2.6.33.bb
> > >>
> > >> diff --git a/meta-arago-extras/recipes-kernel/linux-libc-headers/lin=
ux-libc-
> headers_2.6.33.bb b/meta-arago-extras/recipes-kernel/linux-libc-
> headers/linux-libc-headers_2.6.33.bb
> > >> new file mode 100644
> > >> index 0000000..eb8cb19
> > >> --- /dev/null
> > >> +++ b/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc=
-
> headers_2.6.33.bb
> > >> @@ -0,0 +1,10 @@
> > >> +require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> > >> +
> > >> +FILESEXTRAPATHS_append :=3D
> "${THISDIR}/${PN}:${COREBASE}/meta/recipes-kernel/linux-libc-
> headers/${PN}"
> > >> +
> > >> +PR =3D "r0"
> > >> +
> > >> +SRC_URI +=3D " file://connector-msg-size-fix.patch"
> > >> +SRC_URI[md5sum] =3D "c3883760b18d50e8d78819c54d579b00"
> > >> +SRC_URI[sha256sum] =3D
> "63e237de3b3c4c46a21833b9ce7e20574548d52dabbd1a8bf376041e4455d5
> c6"
> > >> +
> > >> --
> > >> 1.7.0.4
> > >>
> > >> _______________________________________________
> > >> meta-arago mailing list
> > >> meta-arago@arago-project.org
> > >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >>

