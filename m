Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 529335296D
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 23:49:22 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id qACNnLwd032401;
	Mon, 12 Nov 2012 17:49:21 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qACNnLiL010733;
	Mon, 12 Nov 2012 17:49:21 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 12 Nov 2012 17:49:21 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qACNnLTx023180;
	Mon, 12 Nov 2012 17:49:21 -0600
Date: Mon, 12 Nov 2012 18:49:21 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20121112234920.GF11458@edge>
References: <1352759598-5183-1-git-send-email-fcooper@ti.com>
	<20121112232029.GB8900@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C31EA02@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C31EA02@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] meta-toolchain-arago: de-bashify
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
X-List-Received-Date: Mon, 12 Nov 2012 23:49:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Nov 12, 2012 at 11:40:09PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org] 
> Sent: Monday, November 12, 2012 5:20 PM
> To: Franklin S. Cooper Jr
> Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago: de-bashify
> 
> On Mon, Nov 12, 2012 at 04:33:18PM -0600, Franklin S. Cooper Jr wrote:
> > * Replacing "echo -e" with "printf".
> > * This mimics a previous de-bashify patch applied to this same recipe.
> > 
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> 
> How is it different from this:
> http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=7f47dbad47a44c8d16c12139260a00b80d603e71
> 
> I'd suggest you update your tree to the latest code base...
> 
> Franklin:
> I see what happened. 
> http://arago-project.org/pipermail/meta-arago/2012-November/000483.html you 
> made a comment about pulling in this environment variables into 
> meta-toolchain-arago and I made that change. You ended up doing the same 
> thing that my patch 
> http://arago-project.org/pipermail/meta-arago/2012-November/000520.html also 
> did. Which this patch builds on top of.

I see, yes, I merged those vars into the base recipe and replaced echo with 
printf. Wondering why it didn't give you a conflict, since you had to rebase 
your work...

> > ---
> >  .../recipes-core/meta/meta-toolchain-arago.bb      |   20 ++++++++++----------
> >  1 files changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > index 09996d6..3d3fb0d 100644
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
> > @@ -54,15 +54,15 @@ toolchain_create_sdk_env_script () {
> >  	echo 'export OECORE_ACLOCAL_OPTS="-I $SDK_PATH/usr/share/aclocal"' >> $script
> >  	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
> >  	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
> > -    echo -e 'export CPP="\x24{TARGET_PREFIX}gcc -E"' >> $script
> > -    echo -e 'export NM=\x24{TARGET_PREFIX}nm' >> $script
> > -    echo -e 'export RANLIB=\x24{TARGET_PREFIX}ranlib' >> $script
> > -    echo -e 'export OBJCOPY=\x24{TARGET_PREFIX}objcopy' >> $script
> > -    echo -e 'export STRIP=\x24{TARGET_PREFIX}strip' >> $script
> > -    echo -e 'export AS=\x24{TARGET_PREFIX}as' >> $script
> > -    echo -e 'export AR=\x24{TARGET_PREFIX}ar' >> $script
> > -    echo -e 'export OBJDUMP=\x24{TARGET_PREFIX}objdump' >> $script
> > -    echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1' >> $script
> > +	printf 'export CPP="\x24{TARGET_PREFIX}gcc -E"\n' >> $script
> > +	printf 'export NM=\x24{TARGET_PREFIX}nm\n' >> $script
> > +	printf 'export RANLIB=\x24{TARGET_PREFIX}ranlib\n' >> $script
> > +	printf 'export OBJCOPY=\x24{TARGET_PREFIX}objcopy\n' >> $script
> > +	printf 'export STRIP=\x24{TARGET_PREFIX}strip\n' >> $script
> > +	printf 'export AS=\x24{TARGET_PREFIX}as\n' >> $script
> > +	printf 'export AR=\x24{TARGET_PREFIX}ar\n' >> $script
> > +	printf 'export OBJDUMP=\x24{TARGET_PREFIX}objdump\n' >> $script
> > +	echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1' >> $script
> >  }
> >  
> >  populate_sdk_ipk_append () {
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

