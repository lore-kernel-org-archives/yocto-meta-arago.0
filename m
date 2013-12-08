Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1AE9952A4C
	for <meta-arago@arago-project.org>;
	Sun,  8 Dec 2013 06:57:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB86vKPQ021101;
	Sun, 8 Dec 2013 00:57:20 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB86vKMi020447;
	Sun, 8 Dec 2013 00:57:20 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 8 Dec 2013 00:57:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB86vJmr026989;
	Sun, 8 Dec 2013 00:57:20 -0600
Date: Sun, 8 Dec 2013 01:57:19 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Reizer, Eyal" <eyalr@ti.com>
Message-ID: <20131208065719.GC21500@edge>
References: <1385901947-10316-1-git-send-email-eyalr@ti.com>
	<20131204071541.GW690@edge>
	<8665E2433BC68541A24DFFCA87B70F5B211CFE55@DNCE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8665E2433BC68541A24DFFCA87B70F5B211CFE55@DNCE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] ti-compat-wireless-wl18xx: build from ol_r8.a8.08
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
X-List-Received-Date: Sun, 08 Dec 2013 06:57:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Dec 04, 2013 at 02:44:38AM -0500, Reizer, Eyal wrote:
> Hi Denis,
> > 
> > The same comment as to Yaniv - please combine the 2 patches into 1.
> 
> OK, actually separated it into two patches just as it was suggested by Chase 
> to Yaniv last week.

Well, I was not part of the private screening, although I got copied at the 
end of discussion...

Anyway, the general rule is to have one patch per recipe. Plus, when you copy 
and change the code from some other place, it is best to do the exact copy in 
one patch and modifications in another. But, when you update the recipe from 
one version to another, it is recommended to do it in a single patch, provided 
that git recognizes the rename with -M and maybe --find-copies-harder options. 
That way it's cleaner, plus you don't lose the history of changes between the 
versions!


> > Also - will there be compat-bluetooth?
> > 
> There is no compat-bluetooth for some time now. Since Linux 3.2 we use the 
> Bluetooth modules in the kernel. In fact, we do not keep maintaining bluez 
> in ECS, so the latest version supported before (4.98) will not change.
> 
> > As of the kernel version - is 3.12 the exact cutting line where the
> > change to
> > the drivers was introduced? This wasn't in 3.8, right, as I see you set
> > COMPATIBLE_MACHINE to omap-a15. I guess that is to make GLSDK work, as
> > it
> > still uses 3.8 kernel. Unfortunately, it won't be enough, as CoreSDK
> > also
> > builds omap-a15 machines, but with 3.12 kernel...
> 
> Yes, 3.12 is the exact cutting. A couple of weeks ago the wl18xx mac80211 
> drivers were merged into the ti-linux-kernel.
> I guess this patch would be usefull only for glsdk that use the 3.8 kernel. 
> You do not need it for CoreSDK where we do not need compat-wireless any 
> longer.
> So currently glsdk are the are the only ones that need to pick it up for 
> their forked release.

Unfortunately, it needs to go to mainline and CoreSDK, as GLSDK kernel 3.8 
should be able to build out of CoreSDK as well. Remember the common code base 
I mentioned in another thread?

There needs to be some sort of conditional in a packagegroup that pulls in 
ti-compat-wireless, that checks for the kernel version. Or simply checks for 
the branding variable and pulls it only for GLSDK...


> > Can you please run git-format-patch with -M and --find-copies-harder so
> > it
> > presents as a change against the previous version of the recipe?
> > 
> 
> OK.
> 
> > 
> > On Sun, Dec 01, 2013 at 02:45:45PM +0200, Eyal Reizer wrote:
> > > Add a new recipe fetching the Wilink8 drivers from TI-Openlink
> > > based on release ol_r8.a8.08.
> > > This recipe is used for building with kernels older then the
> > > 3.12 kernel where the drivers are now in-tree.
> > > For 3.12 and newer, this recipe is not needed.
> > >
> > > Signed-off-by: Eyal Reizer <eyalr@ti.com>
> > > ---
> > >  .../ti-compat-wireless-wl18xx_r8.a8.08.bb          |   71
> > ++++++++++++++++++++
> > >  1 files changed, 71 insertions(+), 0 deletions(-)
> > >  create mode 100755 meta-arago-extras/recipes-bsp/ti-compat-
> > wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb
> > >
> > > diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
> > compat-wireless-wl18xx_r8.a8.08.bb b/meta-arago-extras/recipes-bsp/ti-
> > compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb
> > > new file mode 100755
> > > index 0000000..9baf628
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
> > wireless-wl18xx_r8.a8.08.bb
> > > @@ -0,0 +1,71 @@
> > > +# This is a TI specific version of the compat-wireless recipe using
> > a
> > > +# compat-wireless package created from the TI Systems Tested
> > mac80211 releases.
> > > +
> > > +DESCRIPTION = "ti compat-wireless drivers for wl18xx"
> > > +HOMEPAGE = "https://gforge.ti.com/gf/project/ecs_nlcp/"
> > > +SECTION = "kernel/modules"
> > > +LICENSE = "GPLv2"
> > > +LIC_FILES_CHKSUM =
> > "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> > > +
> > > +RDEPENDS_${PN} = "wireless-tools"
> > > +
> > > +PROVIDES += "ti-compat-wireless-wl12xx"
> > > +RPROVIDES_${PN} += "ti-compat-wireless-wl12xx"
> > > +RREPLACES_${PN} += "ti-compat-wireless-wl12xx"
> > > +RCONFLICTS_${PN} += "ti-compat-wireless-wl12xx"
> > > +
> > > +COMPATIBLE_MACHINE = "(omap-a15)"
> > > +
> > > +PV = "r8.a8.08"
> > > +inherit module
> > > +
> > > +PR = "${MACHINE_KERNEL_PR}"
> > > +PR_append = "a"
> > > +
> > > +# Tags: ol_r8.a8.08
> > > +SRCREV_wl18xx = "eaa1820c02dc076e6ad9254e9cb7a3bb0c17471b"
> > > +SRCREV_compat = "5d80865281795f962e1400a95202bbd07dd763c0"
> > > +SRCREV_compat-wireless = "23a0d62ea1a57327709a77f08d6265ec807a909f"
> > > +
> > > +SRCREV_FORMAT = "compat-wireless"
> > > +
> > > +S = "${WORKDIR}/compat-wireless"
> > > +
> > > +SRC_URI = "git://github.com/TI-OpenLink/compat-
> > wireless.git;destsuffix=compat-wireless;name=compat-wireless \
> > > +           git://github.com/TI-
> > OpenLink/compat.git;destsuffix=compat;name=compat \
> > > +           git://github.com/TI-
> > OpenLink/wl18xx.git;destsuffix=wl18xx;name=wl18xx \
> > > +"
> > > +
> > > +EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
> > > +
> > > +# Prevent sourceipk clear_git function from running.
> > > +# This preserves the git repo until driver-select is ran.
> > > +
> > > +clear_git() {
> > > +    :
> > > +}
> > > +
> > > +do_configure() {
> > > +    cd ${S}
> > > +    GIT_TREE="${WORKDIR}/wl18xx" GIT_COMPAT_TREE="${WORKDIR}/compat"
> > ./scripts/admin-refresh.sh network
> > > +    ./scripts/driver-select wl18xx
> > > +
> > > +    # Delete the .git repository since it should no longer be
> > needed.
> > > +    #rm -rf ${S}/.git ${S}/.gitignore
> > > +
> > > +    # Now generate the sourceipk with the properly configured
> > sources
> > > +    sourceipk_do_create_srcipk
> > > +}
> > > +
> > > +do_configure_append() {
> > > +    sed -i "s#@./scripts/update-initramfs## " Makefile
> > > +}
> > > +
> > > +do_install() {
> > > +    # Remove hardcoded references to host depmod
> > > +    sed -i "s#@/sbin/depmod -a## " Makefile
> > > +    sed -i "s#@/sbin/depmod -ae## " Makefile
> > > +
> > > +    # Install modules
> > > +    oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}"
> > LDFLAGS="" install-modules
> > > +}
> > > --
> > > 1.7.0.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

