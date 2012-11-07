Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 501C6529EF
	for <meta-arago@arago-project.org>;
	Wed,  7 Nov 2012 20:44:26 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA7KiPeg001568
	for <meta-arago@arago-project.org>; Wed, 7 Nov 2012 14:44:25 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA7KiPEV020720
	for <meta-arago@arago-project.org>; Wed, 7 Nov 2012 14:44:25 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 7 Nov 2012 14:44:25 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qA7KiP96002569;
	Wed, 7 Nov 2012 14:44:25 -0600
Date: Wed, 7 Nov 2012 15:44:25 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20121107204424.GE11967@edge>
References: <1352269511-5899-1-git-send-email-denys@ti.com>
	<20121107063118.GB29763@denix.org>
	<7D46E86EC0A8354091174257B2FED1015929B566@DLEE12.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C31A9FC@DFLE09.ent.ti.com>
	<20121107185847.GA11967@edge> <20121107200914.GD11967@edge>
	<7D46E86EC0A8354091174257B2FED1015929C0A7@DLEE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015929C0A7@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] meta-toolchain-arago: make SDK/devkit relocatable
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
X-List-Received-Date: Wed, 07 Nov 2012 20:44:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Good luck with that - been there, done that, didn't work for me :)
I have something that works, will be sending a v2 patch shortly.

Denys


On Wed, Nov 07, 2012 at 03:17:58PM -0500, Maupin, Chase wrote:
> Yeah, I've been playing with this myself with no luck.
> 
> I did see some people say that if you had functions exported and did export -f <function> it might work.  I'm going to try this.
> 
> Sincerely,
> Chase Maupin
> Software Applications
> ARM MPU
> e-mail: chase.maupin@ti.com
> phone: (214) 567-2950
> 
> For support:
> Forums - http://community.ti.com/forums/
> Wiki - http://wiki.davincidsp.com/ 
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> > Sent: Wednesday, November 07, 2012 2:09 PM
> > To: Cooper Jr., Franklin
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago: make
> > SDK/devkit relocatable
> > 
> > Nope, aliases are not accessible from Makefiles, need to switch
> > gears...
> > 
> > 
> > On Wed, Nov 07, 2012 at 01:58:47PM -0500, Denys Dmytriyenko
> > wrote:
> > > The only worry I have is whether aliases are going to work in a
> > Makefile
> > >
> > >
> > > On Wed, Nov 07, 2012 at 01:53:57PM -0500, Cooper Jr., Franklin
> > wrote:
> > > > Looks great
> > > >
> > > > -----Original Message-----
> > > > From: meta-arago-bounces@arago-project.org [mailto:meta-
> > arago-bounces@arago-project.org] On Behalf Of Maupin, Chase
> > > > Sent: Wednesday, November 07, 2012 9:16 AM
> > > > To: Denys Dmytriyenko; Dmytriyenko, Denys
> > > > Cc: meta-arago@arago-project.org
> > > > Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago: make
> > SDK/devkit relocatable
> > > >
> > > > Your script-fu is strong :)
> > > >
> > > > Sincerely,
> > > > Chase Maupin
> > > > Software Applications
> > > > ARM MPU
> > > > e-mail: chase.maupin@ti.com
> > > > phone: (214) 567-2950
> > > >
> > > > For support:
> > > > Forums - http://community.ti.com/forums/ Wiki -
> > http://wiki.davincidsp.com/
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: meta-arago-bounces@arago-project.org [mailto:meta-
> > arago-
> > > > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > > > Sent: Wednesday, November 07, 2012 12:31 AM
> > > > > To: Dmytriyenko, Denys
> > > > > Cc: meta-arago@arago-project.org
> > > > > Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago:
> > make
> > > > > SDK/devkit relocatable
> > > > >
> > > > > On Wed, Nov 07, 2012 at 01:25:11AM -0500, Denys Dmytriyenko
> > > > > wrote:
> > > > > > Implement poor man's relocation technique for self-
> > contained
> > > > > crosssdk binaries
> > > > > >
> > > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > > ---
> > > > > >  meta-arago-extras/recipes-core/meta/meta-toolchain-
> > arago.bb |
> > > > > 4 +++-
> > > > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/meta-arago-extras/recipes-core/meta/meta-
> > > > > toolchain-arago.bb b/meta-arago-extras/recipes-
> > core/meta/meta-
> > > > > toolchain-arago.bb
> > > > > > index d2fe982..27782f7 100644
> > > > > > --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-
> > > > > arago.bb
> > > > > > +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-
> > > > > arago.bb
> > > > > > @@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-
> > > > > ${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
> > > > > >
> > > > > >  require recipes-core/meta/meta-toolchain.bb
> > > > > >
> > > > > > -PR = "r5"
> > > > > > +PR = "r6"
> > > > > >
> > > > > >  SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
> > > > > >
> > > > > > @@ -28,6 +28,7 @@ toolchain_create_sdk_env_script () {
> > > > > >  	echo 'export TARGET_SYS=${ARAGO_TARGET_SYS}' >>
> > $script
> > > > > >  	echo 'export TARGET_PREFIX=$TARGET_SYS-' >> $script
> > > > > >  	echo 'export PATH=$SDK_PATH/bin:$PATH' >> $script
> > > > > > +	echo 'export
> > > > > LD_LIBRARY_PATH=$SDK_PATH/lib:$LD_LIBRARY_PATH' >> $script
> > > > > >  	echo 'export
> > > > > CPATH=$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' >> $script
> > > > > >  	echo 'export
> > PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$TARGET_SYS'
> > > > > >> $script
> > > > > >  	echo 'export
> > > > > PKG_CONFIG_PATH=$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig'
> > >> $script
> > > > > > @@ -54,4 +55,5 @@ toolchain_create_sdk_env_script () {
> > > > > >  	echo 'export OECORE_ACLOCAL_OPTS="-I
> > > > > $SDK_PATH/usr/share/aclocal"' >> $script
> > > > > >  	echo 'export
> > OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >>
> > > > > $script
> > > > > >  	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >>
> > > > > $script
> > > > > > +	echo 'for i in `cd $SDK_PATH/bin; find -L ! -name
> > > > > "$TARGET_SYS-*" -type f -perm +111 -exec file {} \;|grep -v
> > > > > ":.*ASCII.*text"|cut -d":" -f1|cut -c3-`; do alias
> > > > > $i="$SDK_PATH/lib/ld-linux.so.2 $SDK_PATH/bin/$i"; done' >>
> > $script
> > > > >
> > > > > ^^^^^^^^^^^^^^^^^^^^
> > > > > Yep, that's pretty much it - several days of debugging,
> > reseach and
> > > > > testing and the result is a one-liner script-fu...
> > > > >
> > > > > --
> > > > > Denys
> > > > > _______________________________________________
> > > > > meta-arago mailing list
> > > > > meta-arago@arago-project.org
> > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-
> > arago
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

