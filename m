Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4DAC252A49
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 18:08:43 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r0SI8gDf013224;
	Mon, 28 Jan 2013 12:08:42 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r0SI8dBS025959;
	Mon, 28 Jan 2013 12:08:40 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 28 Jan 2013 12:08:17 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r0SI8HMB020478;
	Mon, 28 Jan 2013 12:08:17 -0600
Date: Mon, 28 Jan 2013 13:08:17 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130128180817.GE29130@edge>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
	<1359393932-31361-31-git-send-email-fcooper@ti.com>
	<20130128173520.GA8971@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C37E0C6@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C37E0C6@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 31/32] meta-toolchain-arago: Remove remaining .la files
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
X-List-Received-Date: Mon, 28 Jan 2013 18:08:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 28, 2013 at 12:42:39PM -0500, Cooper Jr., Franklin wrote:
> I didn't see any issue. I just remember from our discussion you mention that 
> there isn't any need for .la files since they cause more trouble than it's 
> worth. I saw the extra la files remaining so I created this patch. I am fine 
> with ignoring this patch if you don't think those la files would cause an 
> issue.

I'm Ok pushing this patch for consistency - was just wandering if there was a 
real problem with those files, as I was only aware of problems with .la files 
in the target directory...


> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Monday, January 28, 2013 11:35 AM
> > To: fcooperjr27@gmail.com
> > Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> > Subject: Re: [meta-arago] [PATCH 31/32] meta-toolchain-arago: Remove
> > remaining .la files
> > 
> > On Mon, Jan 28, 2013 at 11:25:31AM -0600, fcooperjr27@gmail.com wrote:
> > > From: Franklin S. Cooper Jr <fcooper@ti.com>
> > >
> > > * The following .la files were not deleted from the toolchain sdk:
> > >     libgfortranbegin.la
> > >     /arago-2012.12/lib/gcc/arm-arago-linux-gnueabi/4.5.3
> > >
> > >     libbfd.la
> > >     /arago-2012.12/i686-linux/arm-arago-linux-gnueabi/lib
> > >
> > >     libopcodes.la
> > >     /arago-2012.12/i686-linux/arm-arago-linux-gnueabi/lib
> > >
> > > * Updating the path that find is using to insure all .la files are deleted
> > >   from the toolchain sdk.
> > 
> > What was the problem with those .la files? They are part of host-side binutils
> > and gcc, so weren't supposed to be used for any SDK cross-compiling...
> > 
> > 
> > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > ---
> > >  .../recipes-core/meta/meta-toolchain-arago.bb      |    4 ++--
> > >  1 files changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > > index 332fe48..7428001 100644
> > > --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > > +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > > @@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-
> > ${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
> > >
> > >  require recipes-core/meta/meta-toolchain.bb
> > >
> > > -PR = "r14"
> > > +PR = "r15"
> > >
> > >  SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
> > >
> > > @@ -84,7 +84,7 @@ populate_sdk_ipk_append () {
> > >  	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-
> > arm', 'external-arago-sdk-toolchain', '', 'create_shell_stub
> > ${TARGET_PREFIX}gdb yes', d)}
> > >
> > >  	# Remove broken .la files
> > > -	for i in `find ${SDK_OUTPUT}/${SDKTARGETSYSROOT} -name \*.la`; do
> > > +	for i in `find ${SDK_OUTPUT}/${SDKPATH} -name \*.la`; do
> > >  		rm -f $i
> > >  	done
> > >  	rm -f ${SDK_OUTPUT}/${SDKPATH}/lib/*.la
> > > --
> > > 1.7.0.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >

