Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id 0939E52987
	for <meta-arago@arago-project.org>;
	Wed, 14 Nov 2012 19:10:06 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MDH004BSRWFI4J0@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 14 Nov 2012 13:09:53 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 98F0F20182; Wed,
	14 Nov 2012 14:09:51 -0500 (EST)
Date: Wed, 14 Nov 2012 14:09:51 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20121114190950.GA31599@denix.org>
References: <1352865012-11447-1-git-send-email-denys@ti.com>
	<20121114035851.GE13096@edge>
	<05B212D4-8433-4995-88CF-34CF07576A0D@ti.com>
MIME-version: 1.0
In-reply-to: <05B212D4-8433-4995-88CF-34CF07576A0D@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] meta-toolchain-arago: special case for gdb to be built as part of canadian-cross-sdk
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
X-List-Received-Date: Wed, 14 Nov 2012 19:10:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Any updates yet?


On Wed, Nov 14, 2012 at 04:08:32AM +0000, Maupin, Chase wrote:
> Thank you denys.  We will check for compatibility.  Thanks for the quick response on this.
> 
> Sent from my cell phone
> 
> ----- Reply message -----
> From: "Dmytriyenko, Denys" <denys@ti.com>
> Date: Tue, Nov 13, 2012 9:59 pm
> Subject: [meta-arago] [PATCH] meta-toolchain-arago: special case for gdb to be built as part of canadian-cross-sdk
> To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
> 
> This provides the bare minimum to get the Python-enabled gdb-7.4 into the
> devkit and set it up properly. We would need to test it with gdbserver-7.2 and
> run it through OSRB...
> 
> --
> Denys
> 
> 
> On Tue, Nov 13, 2012 at 10:50:12PM -0500, Denys Dmytriyenko wrote:
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-arago-extras/conf/distro/include/tcmode-external-arago.inc | 4 ++++
> >  meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb     | 9 ++++++++-
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc b/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc
> > index 2ed3df2..3bc0fed 100644
> > --- a/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc
> > +++ b/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc
> > @@ -30,6 +30,10 @@ PREFERRED_PROVIDER_glibc-thread-db = "external-arago-toolchain"
> >  PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arago-sdk-toolchain"
> >  PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arago-sdk-toolchain"
> >
> > +# Special case for gdb to be built as part of canadian-cross-sdk
> > +bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${exec_prefix}/bin"
> > +PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> > +
> >  GCCVERSION ?= "4.5%"
> >  SDKGCCVERSION ?= "4.5%"
> >  BINUVERSION ?= "2.20%"
> > diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > index 1683c1f..f780385 100644
> > --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > @@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
> >
> >  require recipes-core/meta/meta-toolchain.bb
> >
> > -PR = "r7"
> > +PR = "r8"
> >
> >  SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
> >
> > @@ -54,6 +54,8 @@ toolchain_create_sdk_env_script () {
> >        echo 'export OECORE_ACLOCAL_OPTS="-I $SDK_PATH/usr/share/aclocal"' >> $script
> >        echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
> >        echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
> > +     echo 'export PYTHONHOME=$SDK_PATH' >> $script
> > +     echo 'export PYTHONPATH=lib/python2.7' >> $script
> >  }
> >
> >  populate_sdk_ipk_append () {
> > @@ -64,4 +66,9 @@ populate_sdk_ipk_append () {
> >                printf "#!/bin/sh\nLD_LIBRARY_PATH=\x24SDK_PATH/lib:\x24LD_LIBRARY_PATH \x24SDK_PATH/lib/ld-linux.so.2 \x24SDK_PATH/bin/$i.real \x24\x2a\n" > $i
> >                chmod +x $i
> >        done
> > +
> > +     # Special case for gdb, which is built as part of canadian-cross-sdk
> > +     mv ${ARAGO_TARGET_SYS}-gdb ${ARAGO_TARGET_SYS}-gdb.real
> > +     printf "#!/bin/sh\nLD_LIBRARY_PATH=\x24SDK_PATH/lib:\x24LD_LIBRARY_PATH \x24SDK_PATH/lib/ld-linux.so.2 \x24SDK_PATH/bin/${ARAGO_TARGET_SYS}-gdb.real \x24\x2a\n" > ${ARAGO_TARGET_SYS}-gdb
> > +     chmod +x ${ARAGO_TARGET_SYS}-gdb
> >  }
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


