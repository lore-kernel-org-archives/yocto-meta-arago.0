Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id D215F529EF
	for <meta-arago@arago-project.org>;
	Thu,  8 Nov 2012 01:20:25 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MD5009STADB3O20@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 07 Nov 2012 19:20:15 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D111920120; Wed,
	07 Nov 2012 20:19:58 -0500 (EST)
Date: Wed, 07 Nov 2012 20:19:58 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20121108011958.GA1740@denix.org>
References: <1352322180-17306-1-git-send-email-denys@ti.com>
	<20121107210542.GG11967@edge>
	<8F29D6B095ED194EA1980491A5E029710C31AD06@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C31AD06@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv2] meta-toolchain-arago: make SDK/devkit relocatable
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
X-List-Received-Date: Thu, 08 Nov 2012 01:20:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Nov 07, 2012 at 11:11:05PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Wednesday, November 07, 2012 3:06 PM
> To: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCHv2] meta-toolchain-arago: make SDK/devkit relocatable
> 
> On Wed, Nov 07, 2012 at 04:03:00PM -0500, Denys Dmytriyenko wrote:
> > Implement poor man's relocation technique for self-contained crosssdk 
> > binaries
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > In v2 use stub shell scripts instead of aliases, to work in Makefiles
> 
> Ok, this seems to work fine in shell and in Makefiles too. And it also works 
> when environment-setup is sources before calling make, but not inside the 
> Makefile.
> 
> Franklin:
> export LD_LIBRARY_PATH=$SDK_PATH/lib:$LD_LIBRARY_PATH is causing issues. 
> Once I source that file I get a Segmentation fault when calling qmake, 
> make,arm-arago-linux-gnueabi-gcc,ls , etc....
> Removing that line from environment-setup gets rid of the Segmentation fault 
> issue but of course qmake and the other executables don't work. I get a 
> "error while loading shared libraries: libstdc++.so.6: cannot open shared 
> object file: No such file or directory".

Yeah, that explains the segfault Chase was seeing. I didn't see the segfault 
on regular system apps, like make, ls etc. But it did segfault on Arago 
toolchain binaries, like arm-arago-linux-gnueabi-gcc etc. It's better to set 
LD_LIBRARY_PATH variable only for select SDK tools that we have shell stubs 
for, instead of globally. The fix is now in.


> Since you got this working is there anything the host machine needs to 
> configure to get this to work?

I guess it's rather host system specific...


> >  meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 13 
> > ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git 
> > a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb 
> > b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > index d2fe982..81bdeed 100644
> > --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > @@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
> >  
> >  require recipes-core/meta/meta-toolchain.bb
> >  
> > -PR = "r5"
> > +PR = "r6"
> >  
> >  SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
> >  
> > @@ -28,6 +28,7 @@ toolchain_create_sdk_env_script () {
> >  	echo 'export TARGET_SYS=${ARAGO_TARGET_SYS}' >> $script
> >  	echo 'export TARGET_PREFIX=$TARGET_SYS-' >> $script
> >  	echo 'export PATH=$SDK_PATH/bin:$PATH' >> $script
> > +	echo 'export LD_LIBRARY_PATH=$SDK_PATH/lib:$LD_LIBRARY_PATH' >> 
> > +$script
> >  	echo 'export CPATH=$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' >> $script
> >  	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$TARGET_SYS' >> $script
> >  	echo 'export 
> > PKG_CONFIG_PATH=$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig' >> $script @@ -55,3 +56,13 @@ toolchain_create_sdk_env_script () {
> >  	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
> >  	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script  }
> > +
> > +populate_sdk_ipk_append () {
> > +	cd ${SDK_OUTPUT}/${SDKPATH}/bin
> > +	binfiles=`find ! -name "${ARAGO_TARGET_SYS}-*" -type f -perm +111 -exec file {} \;|grep -v ":.*ASCII.*text"|cut -d":" -f1|cut -c3-`
> > +	for i in $binfiles; do
> > +		mv $i $i.real
> > +		printf "#!/bin/sh\n\x24SDK_PATH/lib/ld-linux.so.2 \x24SDK_PATH/bin/$i.real \x24\x2a\n" > $i
> > +		chmod +x $i
> > +	done
> > +}
> > --
> > 1.8.0
> > 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

