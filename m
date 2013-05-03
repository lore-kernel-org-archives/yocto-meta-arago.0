Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 65FD552981
	for <meta-arago@arago-project.org>;
	Fri,  3 May 2013 17:16:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r43HGZYT025847
	for <meta-arago@arago-project.org>; Fri, 3 May 2013 12:16:35 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r43HGZ6H023830
	for <meta-arago@arago-project.org>; Fri, 3 May 2013 12:16:35 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 3 May 2013 12:16:35 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r43HGZYu010803;
	Fri, 3 May 2013 12:16:35 -0500
Date: Fri, 3 May 2013 13:16:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130503171634.GH9213@edge>
References: <1367519782-30902-1-git-send-email-zhoujt@ti.com>
	<7D46E86EC0A8354091174257B2FED1015952FED9@DLEE11.ent.ti.com>
	<3C08AEEB3C731745938BC83D029FE5E3944B9A@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015953286B@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015953286B@DLEE11.ent.ti.com>
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
X-List-Received-Date: Fri, 03 May 2013 17:16:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 03, 2013 at 11:54:47AM +0000, Maupin, Chase wrote:
> > -----Original Message-----
> > From: Zhou, Jingting
> > Sent: Thursday, May 02, 2013 4:34 PM
> > To: Maupin, Chase; meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [PATCH] added mounting debugfs recipe
> > 
> > Don't want to create another email thread using git send-email.
> > So I just copy-pasted the subsequent patch here. I can resend it
> > using git send-email if you want.
> > 
> > Had a quick look at update-rc.d.bbclass. But I didn't figure out
> > how to use it.
> 
> Check out meta-arago/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> 
> > diff --git a/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/initscript-debugfs.bb b/meta-arago-extras/recipes-
> > bsp/initscript-debugfs/initscript-debugfs.bb
> > index c9cb7d0..eaf316a 100755
> > --- a/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/initscript-debugfs.bb
> > +++ b/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/initscript-debugfs.bb
> > @@ -1,11 +1,12 @@
> >  DESCRIPTION = "Initscripts for debugfs"
> >  LICENSE = "BSD"
> > 
> > -LIC_FILES_CHKSUM =
> > "file://debugfs.sh;md5=ecbae24c97c0fa80c5977bf22eec1f32"
> > +LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=3c1998754d846b48ba935ea0b7ada19a"
> 
> You should either add the license in the .sh text file or point to the one 
> that already exists in OE-Core.  No need to make your own copy.

Again, check initscript-telnetd for both - how to use update-rc.d and also how 
to handle license info at the top of your shell script.

If you would rather want to use one of the standard license files, point to it 
like this:

LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

In this case it's using standard GPLv2 license text, but it's probably better 
to have own instance of COPYING as required by GPL...

-- 
Denys

