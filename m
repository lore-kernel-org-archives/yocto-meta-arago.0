Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0B5A652981
	for <meta-arago@arago-project.org>;
	Fri,  3 May 2013 17:26:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r43HQNsR005317
	for <meta-arago@arago-project.org>; Fri, 3 May 2013 12:26:23 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r43HQMaZ002503
	for <meta-arago@arago-project.org>; Fri, 3 May 2013 12:26:22 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 3 May 2013 12:26:22 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r43HQM2c013524;
	Fri, 3 May 2013 12:26:22 -0500
Date: Fri, 3 May 2013 13:26:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130503172621.GI9213@edge>
References: <1367519782-30902-1-git-send-email-zhoujt@ti.com>
	<7D46E86EC0A8354091174257B2FED1015952FED9@DLEE11.ent.ti.com>
	<3C08AEEB3C731745938BC83D029FE5E3944B9A@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015953286B@DLEE11.ent.ti.com>
	<3C08AEEB3C731745938BC83D029FE5E3944C4C@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101595346E5@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED101595346E5@DLEE11.ent.ti.com>
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
X-List-Received-Date: Fri, 03 May 2013 17:26:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 03, 2013 at 04:22:59PM +0000, Maupin, Chase wrote:
> > Hey Chase, thanks for the comments. Here's the patch.
> > 
> > From a1684ac257292855c03e58f3fee60232ed039b81 Mon Sep 17 00:00:00
> > 2001
> > From: Jingting Zhou <a0221004@ares-ubuntu>

^^^^


> > Date: Fri, 3 May 2013 11:56:05 -0400
> > Subject: [PATCH] using inherit update-rc.d in the initscript-
> > debugfs recipe
> 
> 
> You need to use a proper commit message here.  See 
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Correct. Also make sure your From line is valid. Please configure your git 
properly - git-config.


> This should probably be squashed with the commit that adds the recipe

Heh, and this time it's a patch over patch on top of a patch... :) Don't do 
this, send a version 3 of the original patch.


> > diff --git a/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/initscript-debugfs.bb b/meta-arago-extras/recipes-
> > bsp/initscript-debugfs/initscript-debugfs.bb
> > index eaf316a..0137214 100755
> > --- a/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/initscript-debugfs.bb
> > +++ b/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/initscript-debugfs.bb
> > @@ -1,18 +1,20 @@
> >  DESCRIPTION = "Initscripts for debugfs"
> >  LICENSE = "BSD"
> > 
> > -LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=3c1998754d846b48ba935ea0b7ada19a"
> > +LIC_FILES_CHKSUM =
> > "file://debugfs.sh;md5=a530203f3f8bf332686f4abf1e434e21"
> 
> Do your checksum of only the license lines.  This prevents a script change 
> from changing your license checksum.  Like 
> meta-ti/recipes-connectivity/uim/uim_git.bb.  Notice the startline and end 
> line fields.

I'd suggest initscript-telnetd here again :)


> >  PR ="r0"
> > 
> > -SRC_URI = "file://debugfs.sh \
> > -		   file://LICENSE"
> > +SRC_URI = "file://debugfs.sh"
> > +
> > +INITSCRIPT_NAME = "debugfs.sh"
> > +INITSCRIPT_PARAMS = "defaults 10"
> > +
> > +inherit update-rc.d
> > 
> >  S = "${WORKDIR}"
> > 
> >  do_install () {
> > -	install -d ${D}${sysconfdir}/init.d/
> > -	install -d ${D}${sysconfdir}/rcS.d/
> > -	install -c -m 755 ${WORKDIR}/debugfs.sh
> > ${D}${sysconfdir}/init.d/debugfs.sh
> > -	ln -sf ../init.d/debugfs.sh
> > ${D}${sysconfdir}/rcS.d/S09debugfs
> > +	install -d ${D}${sysconfdir}/init.d/
> > +	install -c -m 755 ${WORKDIR}/debugfs.sh
> > ${D}${sysconfdir}/init.d/debugfs.sh
> 
> Just a nitpick but there is no need to specify debugfs.sh in the destination 
> path.  Also, most init scripts don't bother with the .sh extension.  BTW, 
> using "defaults" for update-rc.d will put this script in run levels 2345.  
> If you want it in rcS then you need to change your INITSCRIPT_PARAMS 
> setting.  Do a man of update-rc.d to find out how that utility works.

Learning on update-rc.d in general is beneficial for you and your future 
recipes, so you may want to allocate some "training" time for that.

And for now the quickest approach would be to just copy the usage from 
initscript-telnetd - it is after all a very similar initscript...

-- 
Denys

