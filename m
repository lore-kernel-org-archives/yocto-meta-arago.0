Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 07E0B52A4B
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 21:51:39 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M9600LQRFDHF775@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 22 Aug 2012 16:51:22 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 17E6C2007F; Wed,
	22 Aug 2012 17:51:16 -0400 (EDT)
Date: Wed, 22 Aug 2012 17:51:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20120822215116.GA8846@denix.org>
References: <1345478683-6539-1-git-send-email-fcooper@ti.com>
	<20120821181530.GA3173@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C2A7DE4@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C2A7DE4@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-arago-distro][PATCH] php: Add libiconv as a dependency. (Temporary)
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
X-List-Received-Date: Wed, 22 Aug 2012 21:51:39 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 22, 2012 at 01:40:22AM +0000, Cooper Jr., Franklin wrote:
> I agree with your suggestion did you want me to send the patch or tweak it 
> like you did for my other patch?

No, can you please check if you still have this issue when building php for 
the target:

| cannot find -liconv collect2: ld returned 1 exit status

-- 
Denys

> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Tuesday, August 21, 2012 1:16 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [meta-arago-distro][PATCH] php: Add libiconv as a dependency. (Temporary)
> 
> On Mon, Aug 20, 2012 at 11:04:43AM -0500, Franklin S Cooper Jr wrote:
> > * Adding libiconv as a dependency since external-linaro-toolchain.bb who
> >   PROVIDES virtual/libiconv isn't providing the needed files for PHP.
> > * Configuring PHP fails with
> >   /home/<user>/toolchain/gcc-linaro-arm-linux-gnueabi-2012.03-20120326_linux/bin/../
> >   lib/gcc/arm-linux-gnueabi/4.6.3/../../../../arm-linux-gnueabi/bin/ld:
> >   cannot find -liconv collect2: ld returned 1 exit status
> > * This should be a temporary fix until a proper fix is made in the toolchain.
> 
> When the first php patch is only applied to -native, this issue never happens, 
> as it's masked by configure script satisfying the check with the host iconv 
> library. It's not correct, but it's only a check and the host library is not 
> actually being linked during the build...
> 
> -- 
> Denys
> 
> 
> > Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> > ---
> >  .../recipes-devtools/php/php_5.3.6.bbappend        |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> > 
> > diff --git a/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend b/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
> > index 0d16ebe..e30664d 100644
> > --- a/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
> > +++ b/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
> > @@ -4,3 +4,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >  PR_append = "-arago0"
> >  
> >  SRC_URI += "file://0001-php-native-Fix-host-contamination-issue.patch"
> > +
> > +DEPENDS += "libiconv"
> > -- 
> > 1.7.0.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

