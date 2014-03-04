Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 385BE5208C
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 16:39:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s24Gd6HI002083
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 10:39:06 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s24Gd6XB015199
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 10:39:06 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 4 Mar 2014 10:39:06 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] initscripts: Add mkdir debugfs and mount
Thread-Index: AQHPNyJ8lmpUbFJ1J0i9goRnwProeJrQnjEA//+coqA=
Date: Tue, 4 Mar 2014 16:39:05 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49057F4922B@DLEE11.ent.ti.com>
References: <1393879945-11703-1-git-send-email-sam.nelson@ti.com>
	<20140304024628.GX22125@edge>
In-Reply-To: <20140304024628.GX22125@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] initscripts: Add mkdir debugfs and mount
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
X-List-Received-Date: Tue, 04 Mar 2014 16:39:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, March 03, 2014 9:46 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] initscripts: Add mkdir debugfs and moun=
t
>=20
> On Mon, Mar 03, 2014 at 03:52:25PM -0500, Sam Nelson wrote:
> > - Add script to create /debug directory and mount debugfs
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  .../recipes-core/initscripts/files/debugfs.sh      |    8 ++++++++
> >  .../initscripts/initscripts_1.0.bbappend           |    8 ++++++++
> >  2 files changed, 16 insertions(+)
> >  create mode 100755 meta-arago-distro/recipes-
> core/initscripts/files/debugfs.sh
> >  create mode 100644 meta-arago-distro/recipes-
> core/initscripts/initscripts_1.0.bbappend
> >
> > diff --git a/meta-arago-distro/recipes-core/initscripts/files/debugfs.s=
h
> b/meta-arago-distro/recipes-core/initscripts/files/debugfs.sh
> > new file mode 100755
> > index 0000000..17e2474
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/initscripts/files/debugfs.sh
> > @@ -0,0 +1,8 @@
> > +#!/bin/sh
> > +
> > +if ! [ -e /debug ] ; then
> > +  mkdir -p /debug
> > +fi
> > +mount -t debugfs debugfs /debug
>=20
> Why /debug? The convention is to use /sys/kernel/debug as a mount point
> for
> debugfs...
>=20
[Sam] Ok.   Actually the mount to  /sys/kernel/debug should suffice. I thin=
k we don't need this.=20
No need for this commit.
>=20
> > +
> > +exit 0
> > diff --git a/meta-arago-distro/recipes-
> core/initscripts/initscripts_1.0.bbappend b/meta-arago-distro/recipes-
> core/initscripts/initscripts_1.0.bbappend
> > new file mode 100644
> > index 0000000..1d78ab3
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/initscripts/initscripts_1.0.bbappe=
nd
> > @@ -0,0 +1,8 @@
> > +FILESEXTRAPATHS_append :=3D "${THISDIR}/files"
> > +
> > +SRC_URI +=3D "file://debugfs.sh"
> > +
> > +do_install_append () {
> > +	install -c -m 755 ${WORKDIR}/debugfs.sh
> ${D}${sysconfdir}/init.d/debugfs.sh
> > +	update-rc.d -r ${D} devpts.sh start 09 S .
>=20
> ^^^^ copy/paste error - it still says devpts.sh here instead of debugfs.s=
h :)
>=20
>=20
> Anyway, can you just add it to /etc/fstab? And if you use the default
> /sys/kernel/debug mount point, you won't need to pre-create it. But you
> may need to make sure /sys is mounted... Anyway, take a look at our
> base-files.bbappend in meta-arago-distro. Thanks.
>=20
> --
> Denys

