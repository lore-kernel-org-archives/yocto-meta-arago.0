Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 7E8B352A0B
	for <meta-arago@arago-project.org>;
	Sat,  8 Sep 2012 17:30:33 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MA1001H1KMMY1G0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Sat, 08 Sep 2012 12:30:33 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 31ABA201B8; Sat,
	08 Sep 2012 13:30:19 -0400 (EDT)
Date: Sat, 08 Sep 2012 13:30:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20120908173019.GC23896@denix.org>
References: <1347060985-22177-1-git-send-email-fcooper27jr@gmail.com>
	<1347060985-22177-2-git-send-email-fcooper27jr@gmail.com>
	<7D46E86EC0A8354091174257B2FED101591DD84B@DLEE12.ent.ti.com>
MIME-version: 1.0
In-reply-to: <7D46E86EC0A8354091174257B2FED101591DD84B@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
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
X-List-Received-Date: Sat, 08 Sep 2012 17:30:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Sep 08, 2012 at 02:41:32PM +0000, Maupin, Chase wrote:
> You should split this into two patches.
> 
> 1. The bbappend and init file
> 2. The addition to task-arago-console.

Well, this is not so critical. It's much better than v1 was. I would take it 
in this form, unless you really want it to be changed...

Denys


> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> > Sent: Friday, September 07, 2012 6:36 PM
> > To: meta-arago@arago-project.org
> > Cc: Franklin S. Cooper Jr
> > Subject: [meta-arago] [meta-arago-distro][PATCH 2/2 v2] thttpd:
> > Port arago changes
> > 
> > * Port changes from arago.
> > * Set the port used to 8080
> > 
> > Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
> > ---
> >  .../recipes-core/tasks/task-arago-console.bb       |    5 +-
> >  .../recipes-extended/thttpd/thttpd/init            |   47
> > ++++++++++++++++++++
> >  .../recipes-extended/thttpd/thttpd_2.25b.bbappend  |    4 ++
> >  3 files changed, 53 insertions(+), 3 deletions(-)
> >  create mode 100644 meta-arago-distro/recipes-
> > extended/thttpd/thttpd/init
> >  create mode 100644 meta-arago-distro/recipes-
> > extended/thttpd/thttpd_2.25b.bbappend
> > 
> > diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> > console.bb b/meta-arago-distro/recipes-core/tasks/task-arago-
> > console.bb
> > index db424c1..ecae770 100644
> > --- a/meta-arago-distro/recipes-core/tasks/task-arago-console.bb
> > +++ b/meta-arago-distro/recipes-core/tasks/task-arago-console.bb
> > @@ -1,7 +1,7 @@
> >  DESCRIPTION = "Extended task to get more basic and console apps"
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM =
> > "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b
> > 4de20420"
> > -PR = "r0"
> > +PR = "r1"
> > 
> >  inherit task
> > 
> > @@ -57,8 +57,7 @@ ARAGO_SDK_PREREQ = "\
> >      jpeg \
> >      jpeg-tools \
> >      freetype \
> > -    lighttpd \
> > -    lighttpd-module-cgi \
> > +    thttpd \
> >      "
> > 
> >  ARAGO_CONSOLE = "\
> > diff --git a/meta-arago-distro/recipes-
> > extended/thttpd/thttpd/init b/meta-arago-distro/recipes-
> > extended/thttpd/thttpd/init
> > new file mode 100644
> > index 0000000..1cfaa65
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-extended/thttpd/thttpd/init
> > @@ -0,0 +1,47 @@
> > +#! /bin/sh
> > +#
> > +# This is an init script for openembedded
> > +# Copy it to /etc/init.d/thttpd and type
> > +# > update-rc.d thttpd defaults 60
> > +#
> > +
> > +
> > +thttpd=/usr/sbin/thttpd
> > +test -x "$thttpd" || exit 0
> > +
> > +
> > +case "$1" in
> > +  start)
> > +    echo -n "Starting thttpd"
> > +    start-stop-daemon --start --quiet --exec $thttpd -- -d
> > @@SRVDIR -p 8080
> > +    echo "."
> > +    ;;
> > +  stop)
> > +    echo -n "Stopping thttpd"
> > +    start-stop-daemon --stop --quiet --exec $thttpd
> > +    echo "."
> > +    ;;
> > +  reload|force-reload)
> > +    start-stop-daemon --stop --quiet --signal 1 --exec $thttpd
> > +    ;;
> > +  restart)
> > +    echo -n "Stopping thttpd"
> > +    start-stop-daemon --stop --quiet --exec $thttpd -- -d
> > @@SRVDIR -p 8080
> > +    echo "."
> > +    echo -n "Waiting for thttpd to die off"
> > +    for i in 1 2 3 ;
> > +    do
> > +        sleep 1
> > +        echo -n "."
> > +    done
> > +    echo ""
> > +    echo -n "Starting thttpd"
> > +    start-stop-daemon --start --quiet --exec $thttpd -- -d
> > @@SRVDIR -p 8080
> > +    echo "."
> > +    ;;
> > +  *)
> > +    echo "Usage: /etc/init.d/thttpd
> > {start|stop|reload|restart|force-reload}"
> > +    exit 1
> > +esac
> > +
> > +exit 0
> > diff --git a/meta-arago-distro/recipes-
> > extended/thttpd/thttpd_2.25b.bbappend b/meta-arago-
> > distro/recipes-extended/thttpd/thttpd_2.25b.bbappend
> > new file mode 100644
> > index 0000000..c0ab069
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-
> > extended/thttpd/thttpd_2.25b.bbappend
> > @@ -0,0 +1,4 @@
> > +# look for files in this layer first
> > +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > +
> > +PR_append = "-arago0"
> > --
> > 1.7.0.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

