Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B25365299D
	for <meta-arago@arago-project.org>;
	Wed,  4 Dec 2013 07:15:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB47FgA9001334;
	Wed, 4 Dec 2013 01:15:42 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB47Fg8P025390;
	Wed, 4 Dec 2013 01:15:42 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 4 Dec 2013 01:15:42 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB47FgoJ001921;
	Wed, 4 Dec 2013 01:15:42 -0600
Date: Wed, 4 Dec 2013 02:15:41 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Eyal Reizer <eyalreizer@gmail.com>
Message-ID: <20131204071541.GW690@edge>
References: <1385901947-10316-1-git-send-email-eyalr@ti.com>
MIME-Version: 1.0
In-Reply-To: <1385901947-10316-1-git-send-email-eyalr@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Wed, 04 Dec 2013 07:15:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks!

The same comment as to Yaniv - please combine the 2 patches into 1.

Also - will there be compat-bluetooth?

As of the kernel version - is 3.12 the exact cutting line where the change to 
the drivers was introduced? This wasn't in 3.8, right, as I see you set 
COMPATIBLE_MACHINE to omap-a15. I guess that is to make GLSDK work, as it 
still uses 3.8 kernel. Unfortunately, it won't be enough, as CoreSDK also 
builds omap-a15 machines, but with 3.12 kernel...

Can you please run git-format-patch with -M and --find-copies-harder so it 
presents as a change against the previous version of the recipe?


On Sun, Dec 01, 2013 at 02:45:45PM +0200, Eyal Reizer wrote:
> Add a new recipe fetching the Wilink8 drivers from TI-Openlink
> based on release ol_r8.a8.08.
> This recipe is used for building with kernels older then the
> 3.12 kernel where the drivers are now in-tree.
> For 3.12 and newer, this recipe is not needed.
> 
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  .../ti-compat-wireless-wl18xx_r8.a8.08.bb          |   71 ++++++++++++++++++++
>  1 files changed, 71 insertions(+), 0 deletions(-)
>  create mode 100755 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb
> 
> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb
> new file mode 100755
> index 0000000..9baf628
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb
> @@ -0,0 +1,71 @@
> +# This is a TI specific version of the compat-wireless recipe using a
> +# compat-wireless package created from the TI Systems Tested mac80211 releases.
> +
> +DESCRIPTION = "ti compat-wireless drivers for wl18xx"
> +HOMEPAGE = "https://gforge.ti.com/gf/project/ecs_nlcp/"
> +SECTION = "kernel/modules"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> +
> +RDEPENDS_${PN} = "wireless-tools"
> +
> +PROVIDES += "ti-compat-wireless-wl12xx"
> +RPROVIDES_${PN} += "ti-compat-wireless-wl12xx"
> +RREPLACES_${PN} += "ti-compat-wireless-wl12xx"
> +RCONFLICTS_${PN} += "ti-compat-wireless-wl12xx"
> +
> +COMPATIBLE_MACHINE = "(omap-a15)"
> +
> +PV = "r8.a8.08"
> +inherit module
> +
> +PR = "${MACHINE_KERNEL_PR}"
> +PR_append = "a"
> +
> +# Tags: ol_r8.a8.08
> +SRCREV_wl18xx = "eaa1820c02dc076e6ad9254e9cb7a3bb0c17471b"
> +SRCREV_compat = "5d80865281795f962e1400a95202bbd07dd763c0"
> +SRCREV_compat-wireless = "23a0d62ea1a57327709a77f08d6265ec807a909f"
> +
> +SRCREV_FORMAT = "compat-wireless"
> +
> +S = "${WORKDIR}/compat-wireless"
> +
> +SRC_URI = "git://github.com/TI-OpenLink/compat-wireless.git;destsuffix=compat-wireless;name=compat-wireless \
> +           git://github.com/TI-OpenLink/compat.git;destsuffix=compat;name=compat \
> +           git://github.com/TI-OpenLink/wl18xx.git;destsuffix=wl18xx;name=wl18xx \
> +"
> +
> +EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
> +
> +# Prevent sourceipk clear_git function from running.
> +# This preserves the git repo until driver-select is ran.
> +
> +clear_git() {
> +    :
> +}
> +
> +do_configure() {
> +    cd ${S}
> +    GIT_TREE="${WORKDIR}/wl18xx" GIT_COMPAT_TREE="${WORKDIR}/compat" ./scripts/admin-refresh.sh network
> +    ./scripts/driver-select wl18xx
> +
> +    # Delete the .git repository since it should no longer be needed.
> +    #rm -rf ${S}/.git ${S}/.gitignore
> +
> +    # Now generate the sourceipk with the properly configured sources
> +    sourceipk_do_create_srcipk
> +}
> +
> +do_configure_append() {
> +    sed -i "s#@./scripts/update-initramfs## " Makefile
> +}
> +
> +do_install() {
> +    # Remove hardcoded references to host depmod
> +    sed -i "s#@/sbin/depmod -a## " Makefile
> +    sed -i "s#@/sbin/depmod -ae## " Makefile
> +
> +    # Install modules
> +    oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
> +}
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

