Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 114B5529E1
	for <meta-arago@arago-project.org>;
	Sat,  8 Sep 2012 17:39:32 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q88HdVlq027046;
	Sat, 8 Sep 2012 12:39:31 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q88HdV6b027139;
	Sat, 8 Sep 2012 12:39:31 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Sat, 8 Sep 2012 12:39:31 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-arago-distro][PATCH 2/2 v2] thttpd: Port
	arago	changes
Thread-Index: AQHNjU8Tazr1U0nGrku1mFFaO9pLGZeAhPsAgACDdID//66FMA==
Date: Sat, 8 Sep 2012 17:39:29 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101591DDD8F@DLEE12.ent.ti.com>
References: <1347060985-22177-1-git-send-email-fcooper27jr@gmail.com>
	<1347060985-22177-2-git-send-email-fcooper27jr@gmail.com>
	<7D46E86EC0A8354091174257B2FED101591DD84B@DLEE12.ent.ti.com>
	<20120908173019.GC23896@denix.org>
In-Reply-To: <20120908173019.GC23896@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Franklin S.
	Cooper Jr" <fcooper27jr@gmail.com>
Subject: Re: [meta-arago-distro][PATCH 2/2 v2] thttpd: Port arago	changes
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
X-List-Received-Date: Sat, 08 Sep 2012 17:39:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Not a critical change.  Think of this as guidance for future submissions.  =
The idea is the break the change up into the elemental units.  That way if =
any element goes wrong it is easier to back out the change.

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
> From: Dmytriyenko, Denys
> Sent: Saturday, September 08, 2012 12:30 PM
> To: Maupin, Chase
> Cc: Franklin S. Cooper Jr; meta-arago@arago-project.org; Franklin
> S. Cooper Jr
> Subject: Re: [meta-arago] [meta-arago-distro][PATCH 2/2 v2]
> thttpd: Port arago changes
>=20
> On Sat, Sep 08, 2012 at 02:41:32PM +0000, Maupin, Chase wrote:
> > You should split this into two patches.
> >
> > 1. The bbappend and init file
> > 2. The addition to task-arago-console.
>=20
> Well, this is not so critical. It's much better than v1 was. I
> would take it
> in this form, unless you really want it to be changed...
>=20
> Denys
>=20
>=20
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-
> arago-
> > > bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> > > Sent: Friday, September 07, 2012 6:36 PM
> > > To: meta-arago@arago-project.org
> > > Cc: Franklin S. Cooper Jr
> > > Subject: [meta-arago] [meta-arago-distro][PATCH 2/2 v2]
> thttpd:
> > > Port arago changes
> > >
> > > * Port changes from arago.
> > > * Set the port used to 8080
> > >
> > > Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
> > > ---
> > >  .../recipes-core/tasks/task-arago-console.bb       |    5 +-
> > >  .../recipes-extended/thttpd/thttpd/init            |   47
> > > ++++++++++++++++++++
> > >  .../recipes-extended/thttpd/thttpd_2.25b.bbappend  |    4 ++
> > >  3 files changed, 53 insertions(+), 3 deletions(-)
> > >  create mode 100644 meta-arago-distro/recipes-
> > > extended/thttpd/thttpd/init
> > >  create mode 100644 meta-arago-distro/recipes-
> > > extended/thttpd/thttpd_2.25b.bbappend
> > >
> > > diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> > > console.bb b/meta-arago-distro/recipes-core/tasks/task-arago-
> > > console.bb
> > > index db424c1..ecae770 100644
> > > --- a/meta-arago-distro/recipes-core/tasks/task-arago-
> console.bb
> > > +++ b/meta-arago-distro/recipes-core/tasks/task-arago-
> console.bb
> > > @@ -1,7 +1,7 @@
> > >  DESCRIPTION =3D "Extended task to get more basic and console
> apps"
> > >  LICENSE =3D "MIT"
> > >  LIC_FILES_CHKSUM =3D
> > >
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> > > 4de20420"
> > > -PR =3D "r0"
> > > +PR =3D "r1"
> > >
> > >  inherit task
> > >
> > > @@ -57,8 +57,7 @@ ARAGO_SDK_PREREQ =3D "\
> > >      jpeg \
> > >      jpeg-tools \
> > >      freetype \
> > > -    lighttpd \
> > > -    lighttpd-module-cgi \
> > > +    thttpd \
> > >      "
> > >
> > >  ARAGO_CONSOLE =3D "\
> > > diff --git a/meta-arago-distro/recipes-
> > > extended/thttpd/thttpd/init b/meta-arago-distro/recipes-
> > > extended/thttpd/thttpd/init
> > > new file mode 100644
> > > index 0000000..1cfaa65
> > > --- /dev/null
> > > +++ b/meta-arago-distro/recipes-extended/thttpd/thttpd/init
> > > @@ -0,0 +1,47 @@
> > > +#! /bin/sh
> > > +#
> > > +# This is an init script for openembedded
> > > +# Copy it to /etc/init.d/thttpd and type
> > > +# > update-rc.d thttpd defaults 60
> > > +#
> > > +
> > > +
> > > +thttpd=3D/usr/sbin/thttpd
> > > +test -x "$thttpd" || exit 0
> > > +
> > > +
> > > +case "$1" in
> > > +  start)
> > > +    echo -n "Starting thttpd"
> > > +    start-stop-daemon --start --quiet --exec $thttpd -- -d
> > > @@SRVDIR -p 8080
> > > +    echo "."
> > > +    ;;
> > > +  stop)
> > > +    echo -n "Stopping thttpd"
> > > +    start-stop-daemon --stop --quiet --exec $thttpd
> > > +    echo "."
> > > +    ;;
> > > +  reload|force-reload)
> > > +    start-stop-daemon --stop --quiet --signal 1 --exec
> $thttpd
> > > +    ;;
> > > +  restart)
> > > +    echo -n "Stopping thttpd"
> > > +    start-stop-daemon --stop --quiet --exec $thttpd -- -d
> > > @@SRVDIR -p 8080
> > > +    echo "."
> > > +    echo -n "Waiting for thttpd to die off"
> > > +    for i in 1 2 3 ;
> > > +    do
> > > +        sleep 1
> > > +        echo -n "."
> > > +    done
> > > +    echo ""
> > > +    echo -n "Starting thttpd"
> > > +    start-stop-daemon --start --quiet --exec $thttpd -- -d
> > > @@SRVDIR -p 8080
> > > +    echo "."
> > > +    ;;
> > > +  *)
> > > +    echo "Usage: /etc/init.d/thttpd
> > > {start|stop|reload|restart|force-reload}"
> > > +    exit 1
> > > +esac
> > > +
> > > +exit 0
> > > diff --git a/meta-arago-distro/recipes-
> > > extended/thttpd/thttpd_2.25b.bbappend b/meta-arago-
> > > distro/recipes-extended/thttpd/thttpd_2.25b.bbappend
> > > new file mode 100644
> > > index 0000000..c0ab069
> > > --- /dev/null
> > > +++ b/meta-arago-distro/recipes-
> > > extended/thttpd/thttpd_2.25b.bbappend
> > > @@ -0,0 +1,4 @@
> > > +# look for files in this layer first
> > > +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> > > +
> > > +PR_append =3D "-arago0"
> > > --
> > > 1.7.0.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >

