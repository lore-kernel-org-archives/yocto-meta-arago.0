Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 539FB52A56
	for <meta-arago@arago-project.org>;
	Mon, 26 Jun 2017 19:05:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5QJ5BBv032136
	for <meta-arago@arago-project.org>; Mon, 26 Jun 2017 14:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498503911;
	bh=/sd8KIR+L5ezGfpg59qmsfTgw7pRuNmuZTHTC1GXzB0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=KulAjya210iARevOyoC7f4V1Q8sT52YLkxiw4+KijH1t2LuPckZBAGdGgr1qWpn+4
	IFwwYkqy6ivRGmkUI9bVqzhnlk3H7R3MjotkMfwQpaM/kU6+miTO67C6zLryFMOvDz
	u8OwEb5EtexMt9Mqws9HfnaUewARL1YuQYm4gaoM=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5QJ5BvT011063
	for <meta-arago@arago-project.org>; Mon, 26 Jun 2017 14:05:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 26 Jun 2017 14:05:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5QJ5ArB010338;
	Mon, 26 Jun 2017 14:05:11 -0500
Date: Mon, 26 Jun 2017 15:05:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20170626190508.GG14665@edge>
References: <1498498997-30316-1-git-send-email-sam.nelson@ti.com>
	<20170626184636.GC14665@edge>
	<4F9216F96E5DF9428610502835A9F49058643C32@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F49058643C32@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/master][PATCH v3 1/2] big-data-ipc-demo: Add ipc examples for big data buffer exchange
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
X-List-Received-Date: Mon, 26 Jun 2017 19:05:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jun 26, 2017 at 02:59:58PM -0400, Nelson, Sam wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Monday, June 26, 2017 2:47 PM
> > To: Nelson, Sam
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [morty/master][PATCH v3 1/2] big-data-ipc-demo:
> > Add ipc examples for big data buffer exchange
> > 
> > Thanks, Sam, looks reasonable.
> > 
> > Few non-critical comments - let me know if you want to fix them and re-
> > submit, or I can merge as is and if needed, address them later as a follow up.
> > 
> > 
> > On Mon, Jun 26, 2017 at 01:43:16PM -0400, Sam Nelson wrote:
> > > Adds example with host running linux
> > > Demonstrates transfer of Big data buffers between A15 host and DSP core
> > >
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > >
> > > ---
> > > Change from previous version of patch
> > > - Expand to am57xx-evm to omap-a15
> > > - Remove ti-staging.inc
> > > ---
> > > ---
> > >  .../big-data-ipc-demo-linux_git.bb                 | 41
> > ++++++++++++++++++++++
> > >  .../big-data-ipc-demo/big-data-ipc-demo.inc        | 39
> > ++++++++++++++++++++
> > >  2 files changed, 80 insertions(+)
> > >  create mode 100644 meta-arago-extras/recipes-apps/big-data-ipc-
> > demo/big-data-ipc-demo-linux_git.bb
> > >  create mode 100644 meta-arago-extras/recipes-apps/big-data-ipc-
> > demo/big-data-ipc-demo.inc
> > >
> > > diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-
> > demo-linux_git.bb b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-
> > data-ipc-demo-linux_git.bb
> > > new file mode 100644
> > > index 0000000..0734177
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-
> > demo-linux_git.bb
> > > @@ -0,0 +1,41 @@
> > > +SUMMARY = "TI Big data IPC: Host linux examples"
> > > +
> > > +require recipes-ti/includes/ti-paths.inc
> > > +require big-data-ipc-demo.inc
> > > +
> > > +DEPENDS = "ti-ipc \
> > > +           ti-xdctools \
> > > +           ti-sysbios \
> > > +           ti-ipc-rtos \
> > > +           cmem \
> > > +"
> > > +
> > > +EXTRA_OEMAKE = "\
> > > +    PLATFORM=${PLATFORM} \
> > > +    XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
> > > +    BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
> > > +    IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
> > > +    LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
> > > +    ${IPC_TARGETS} \
> > > +    JOBS="${PARALLEL_MAKE}" \
> > > +"
> > > +
> > > +do_create_srcipk_prepend() {
> > > +  rm -rf host_bios
> > > +}
> > > +
> > > +do_compile() {
> > > +  if [  "${PLATFORM}" != "UNKNOWN" ]; then
> > > +      oe_runmake host_linux
> > > +  fi
> > > +}
> > 
> > I don't think checking PLATFORM above and below is necessary - you set strict
> > COMPATIBLE_MACHINE filter and set all possible variants of PLATFORM var
> > below.
> > Even if something is not defined, let if fail with UNKNOWN setting, instead of
> > succeeding and not building anything...
> >
> 
> Ok. I can remote PLATFORM check and handle using COMPATIBLE MACHINE.
> I will send updated patch.

Thanks, Sam. I'm currently queueing up patches for morty-next I'm about to 
start, so since this is the only minor thing needing change, I'll merge it as 
is and you can update do_compile() and do_install() here later, when you 
follow up with bios/keystone updates.


> > > +do_install() {
> > > +  if [  "${PLATFORM}" != "UNKNOWN" ]; then
> > > +    oe_runmake EXEC_DIR="${D}${bindir}" install_linux_bin
> > > +  fi
> > > +}
> > > +
> > > +PACKAGES =+ "${PN}-firmware"
> > > +FILES_${PN}-firmware +=
> > "${bindir}/simple_buffer_example/release/server_dsp.xe66"
> > > +INSANE_SKIP_${PN}-firmware += "arch"
> > > diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-
> > demo.inc b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-
> > demo.inc
> > > new file mode 100644
> > > index 0000000..c3f8f38
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-
> > demo.inc
> > > @@ -0,0 +1,39 @@
> > > +LICENSE = "BSD-3-Clause"
> > > +LIC_FILES_CHKSUM =
> > "file://makefile;beginline=1;endline=31;md5=2f2ea348b98d5cc7807ece7ad
> > cc2c43a"
> > > +
> > > +COMPATIBLE_MACHINE = "omap-a15|keystone"
> > > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > +
> > > +BIG_DATA_IPC_GIT_URI = "git://git.ti.com/processor-sdk/big-data-ipc-
> > examples.git"
> > > +BIG_DATA_IPC_GIT_PROTOCOL = "git"
> > > +BIG_DATA_IPC_GIT_BRANCH = "master"
> > > +
> > > +# Below commit ID corresponds to "DEV.BIG_DATA_IPC.01.01.00.00"
> > > +BIG_DATA_IPC_SRCREV =
> > "5907bff5a29fe2ba8719ae8c3c5d62b20b7b6bc9"
> > > +
> > > +BRANCH = "${BIG_DATA_IPC_GIT_BRANCH}"
> > > +SRC_URI =
> > "${BIG_DATA_IPC_GIT_URI};protocol=${BIG_DATA_IPC_GIT_PROTOCOL};bran
> > ch=${BRANCH}"
> > > +
> > > +SRCREV = "${BIG_DATA_IPC_SRCREV}"
> > > +PV = "01.01.00.00"
> > 
> > Kind of strange split - usually common pieces are in .inc and version-specific
> > are in .bb file. Here you set SRCREV and PV in .inc file... Any reason?
> 
> This is in anticipation of a  big-data-ipc-demo-bios package from same git repo coming up soon.
> (Waiting for some dependencies to be upstream first)
> 
> > 
> > 
> > > +S = "${WORKDIR}/git"
> > > +
> > > +PLATFORM = "UNKNOWN"
> > > +PLATFORM_omap-a15 = "DRA7XX"
> > > +PLATFORM_k2hk-evm = "TCI6636"
> > > +PLATFORM_k2l-evm = "TCI6630"
> > > +PLATFORM_k2e = "66AK2E"
> > > +PLATFORM_k2g = "66AK2G"
> > > +
> > > +IPC_TARGETS = ""
> > > +IPC_TARGETS_omap-a15 = "\
> > > +    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
> > > +    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
> > > +    ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
> > > +"
> > > +
> > > +IPC_TARGETS_keystone = " \
> > > +    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
> > > +    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
> > > +"
> > > --
> > > 1.9.1
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

