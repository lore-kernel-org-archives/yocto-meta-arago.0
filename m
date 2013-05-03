Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6A0A552A71
	for <meta-arago@arago-project.org>;
	Fri,  3 May 2013 16:43:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r43GhLBn022786
	for <meta-arago@arago-project.org>; Fri, 3 May 2013 11:43:21 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r43GhLrE013825
	for <meta-arago@arago-project.org>; Fri, 3 May 2013 11:43:21 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 3 May 2013 11:43:21 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r43GhLk6029982;
	Fri, 3 May 2013 11:43:21 -0500
Date: Fri, 3 May 2013 12:43:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130503164320.GF9213@edge>
References: <1367519782-30902-1-git-send-email-zhoujt@ti.com>
	<7D46E86EC0A8354091174257B2FED1015952FED9@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015952FED9@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Zhou,
	Jingting" <zhoujt@ti.com>
Subject: Re: [PATCH] added mounting debugfs recipe
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
X-List-Received-Date: Fri, 03 May 2013 16:43:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jingting,

I know there's already a thread going on, I just wanted to follow up on some 
of the previous comments from Chase to explain and/or correct, since it's 
still new to you and you may need some more details. Please see inline.


On Thu, May 02, 2013 at 07:54:40PM +0000, Maupin, Chase wrote:
> > diff --git a/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> > b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-base-tisdk-server-extra.bb
> > index 46db7c2..ba618b2 100755
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-base-tisdk-server-extra.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-base-tisdk-server-extra.bb
> > @@ -66,7 +66,7 @@ RDEPENDS_${PN} = "\
> >      ptpd \
> >      vsftpd \
> >      syslog-ng \
> > -	syslog-ng-plugins \
> > +    syslog-ng-plugins \
> 
> This looks like a mistake.  Either in the other patch or this one.

In other words - this fix should be rolled into the previous patch (that 
is still under review), and not piggy-backing on the new patch, that has 
nothing to do with syslog.


> >      dtc \
> >      strongswan \
> >      strongswan-plugins \
> > @@ -95,4 +95,5 @@ RDEPENDS_${PN} = "\
> >      ti-netapi \
> >      ti-ipc \
> >      ebtables \
> > +    initscript-debugfs \
> 
> Usually this should be split into apatch that adds the recipe and one that 
> adds it to the packagegroup.

While this one is not really so critical, it's still better to have the first 
patch adding new functionality and the second patch to enable that 
functionality in the system - #1 adds initscript-debugfs.bb and #2 enables it 
in the packagegroup.


> > diff --git a/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/initscript-debugfs.bb b/meta-arago-extras/recipes-
> > bsp/initscript-debugfs/initscript-debugfs.bb
> > new file mode 100755
> > index 0000000..c9cb7d0
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/initscript-debugfs.bb
> > @@ -0,0 +1,17 @@
> > +DESCRIPTION = "Initscripts for debugfs"
> > +LICENSE = "BSD"
> > +
> > +LIC_FILES_CHKSUM =
> > "file://debugfs.sh;md5=ecbae24c97c0fa80c5977bf22eec1f32"
> 
> This file does not have a real license header in it.  If you are going to 
> point here you should put the license header in it or use the license file 
> from the core layer.  And I wouldn't do the whole script because then you 
> have to update this for every script change.

IF and only if you have a license info at the top of your source file (.sh or 
.c or .h), then you would point to that file AND also specify beginline=# and 
endline=# in there to limit the checksum to those lines only. Like Chase said, 
that way you don't need to update checksum with every fix you make to the 
code.


> > +
> > +PR ="r1"
> 
> Why not start at r0?

I personally don't have preference here. If you put r0, then another person 
would start argue that you don't need to set it to r0, as that's the default 
and you can drop the line altogether. I prefer to have it from the beginning, 
so you won't forget to update it on the next change.


> > +
> > +SRC_URI = "file://debugfs.sh"
> > +
> > +S = "${WORKDIR}"
> > +
> > +do_install () {
> > +	install -d ${D}${sysconfdir}/init.d/
> > +	install -d ${D}${sysconfdir}/rcS.d/
> > +	install -c -m 755 ${WORKDIR}/debugfs.sh
> > ${D}${sysconfdir}/init.d/debugfs.sh
> > +	ln -sf ../init.d/debugfs.sh
> > ${D}${sysconfdir}/rcS.d/S09debugfs
> > +}
> 
> Use the update-rc.d class instead.  Life will be better this way.

Indeed.

-- 
Denys

