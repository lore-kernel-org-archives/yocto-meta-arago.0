Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id DA52E52A90
	for <meta-arago@arago-project.org>;
	Thu, 22 Jun 2017 18:37:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5MIbaU4006534
	for <meta-arago@arago-project.org>; Thu, 22 Jun 2017 13:37:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498156656;
	bh=RTvBxz9DhQBguUf7VcjL5RlsC8j3xljXOj+Le9gGpu4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=S9w1lJh+o3RIvMp/POpHjvTPQ5pQWT4OWeKueE9jqasgPQ7xaMGozaLgn8yHvOAjA
	Dgk8RDq0hPyfO+19Vfv7VrDkfMWmK4L9dzeE6CJlnYMq4tnqOvbzf0lujliu55ffjf
	HLTWDP6DlmHQM8M9k/krEOF2iTYJ5AmHeFwQZdac=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5MIbV1I009680
	for <meta-arago@arago-project.org>; Thu, 22 Jun 2017 13:37:31 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Jun 2017 13:37:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5MIbVrp011801;
	Thu, 22 Jun 2017 13:37:31 -0500
Date: Thu, 22 Jun 2017 14:37:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20170622183729.GV14665@edge>
References: <1497983504-4369-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1497983504-4369-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH v2 1/2] big-data-ipc-demo: Add ipc examples for big data buffer exchange
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
X-List-Received-Date: Thu, 22 Jun 2017 18:37:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jun 20, 2017 at 02:31:43PM -0400, Sam Nelson wrote:
> Adds example with host running linux
> Demonstrates transfer of Big data buffers between A15 host and DSP core
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Change from previous version of patch
> Expand to am57xx-evm to omap-a15
> ---
> ---
>  .../big-data-ipc-demo-linux_git.bb                 | 41 ++++++++++++++++++++++
>  .../big-data-ipc-demo/big-data-ipc-demo.inc        | 41 ++++++++++++++++++++++
>  2 files changed, 82 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb
>  create mode 100644 meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
> 
> diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb
> new file mode 100644
> index 0000000..0734177
> --- /dev/null
> +++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "TI Big data IPC: Host linux examples"
> +
> +require recipes-ti/includes/ti-paths.inc
> +require big-data-ipc-demo.inc
> +
> +DEPENDS = "ti-ipc \
> +           ti-xdctools \
> +           ti-sysbios \
> +           ti-ipc-rtos \
> +           cmem \
> +"
> +
> +EXTRA_OEMAKE = "\
> +    PLATFORM=${PLATFORM} \
> +    XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
> +    BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
> +    IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
> +    LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
> +    ${IPC_TARGETS} \
> +    JOBS="${PARALLEL_MAKE}" \
> +"
> +
> +do_create_srcipk_prepend() {
> +  rm -rf host_bios
> +}
> +
> +do_compile() {
> +  if [  "${PLATFORM}" != "UNKNOWN" ]; then
> +      oe_runmake host_linux
> +  fi
> +}
> +
> +do_install() {
> +  if [  "${PLATFORM}" != "UNKNOWN" ]; then
> +    oe_runmake EXEC_DIR="${D}${bindir}" install_linux_bin
> +  fi
> +}
> +
> +PACKAGES =+ "${PN}-firmware"
> +FILES_${PN}-firmware += "${bindir}/simple_buffer_example/release/server_dsp.xe66"
> +INSANE_SKIP_${PN}-firmware += "arch"
> diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
> new file mode 100644
> index 0000000..4635932
> --- /dev/null
> +++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
> @@ -0,0 +1,41 @@
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://makefile;beginline=1;endline=31;md5=2f2ea348b98d5cc7807ece7adcc2c43a"
> +
> +COMPATIBLE_MACHINE = "omap-a15|keystone"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +BIG_DATA_IPC_GIT_URI = "git://git.ti.com/processor-sdk/big-data-ipc-examples.git"
> +BIG_DATA_IPC_GIT_PROTOCOL = "git"
> +BIG_DATA_IPC_GIT_BRANCH = "master"
> +
> +# Below commit ID corresponds to "DEV.BIG_DATA_IPC.01.01.00.00"
> +BIG_DATA_IPC_SRCREV = "5907bff5a29fe2ba8719ae8c3c5d62b20b7b6bc9"
> +
> +BRANCH = "${BIG_DATA_IPC_GIT_BRANCH}"
> +SRC_URI = "${BIG_DATA_IPC_GIT_URI};protocol=${BIG_DATA_IPC_GIT_PROTOCOL};branch=${BRANCH}"
> +
> +SRCREV = "${BIG_DATA_IPC_SRCREV}"
> +PV = "01.01.00.00"
> +
> +require recipes-ti/includes/ti-staging.inc

^^^ Please don't include this file.


> +S = "${WORKDIR}/git"
> +
> +PLATFORM = "UNKNOWN"
> +PLATFORM_omap-a15 = "DRA7XX"
> +PLATFORM_k2hk-evm = "TCI6636"
> +PLATFORM_k2l-evm = "TCI6630"
> +PLATFORM_k2e = "66AK2E"
> +PLATFORM_k2g = "66AK2G"
> +
> +IPC_TARGETS = ""
> +IPC_TARGETS_omap-a15 = "\
> +    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
> +    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
> +    ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
> +"
> +
> +IPC_TARGETS_keystone = " \
> +    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
> +    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
> +"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

