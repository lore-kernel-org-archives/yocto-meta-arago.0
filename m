Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id B0CE65209D
	for <meta-arago@arago-project.org>;
	Thu, 25 Oct 2012 02:18:44 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MCF001ZPFQP2VC0@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 24 Oct 2012 21:18:26 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8B13420120; Wed,
	24 Oct 2012 22:18:25 -0400 (EDT)
Date: Wed, 24 Oct 2012 22:18:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20121025021825.GF3465@denix.org>
References: <1351129767-19986-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1351129767-19986-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH v2] ti-tisdk-setup: Port ti-tisdk-setup from arago
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
X-List-Received-Date: Thu, 25 Oct 2012 02:18:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 24, 2012 at 08:49:27PM -0500, Franklin S. Cooper Jr wrote:
> * Port ti-tisdk-setup from arago to meta-arago.
> * This recipe brings in various scripts used to setup the SDK on
>   a user's development machine.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>

Ack, will push tomorrow.

> ---
> Version 2 changes:
> Move setup scripts into their own git repository
> 
>  .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb |   36 ++++++++++++++++++++
>  1 files changed, 36 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> new file mode 100644
> index 0000000..d9b5da3
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> @@ -0,0 +1,36 @@
> +DESCRIPTION = "Package containing scripts to setup the development host and target board"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
> +
> +COMPATIBLE_MACHINE = "am37x-evm|am3517-evm|beagleboard|ti33x|am180x-evm"
> +
> +PR = "r0"
> +
> +BRANCH ?= "master"
> +SRCREV = "5bbfa583671b87bc8c17316bb3a9787fbc884ec6"
> +SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git/"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +UBOOT_ENV_am37x-evm = "setup-uboot-env-am37x.sh"
> +UBOOT_ENV_beagleboard = "setup-uboot-env-beagleboard.sh"
> +UBOOT_ENV_am3517-evm = "setup-uboot-env-am3517.sh"
> +UBOOT_ENV_am180x-evm = "setup-uboot-env-am18x.sh"
> +UBOOT_ENV_ti33x = "setup-uboot-env-am335x.sh"
> +
> +do_install () {
> +    install -m 0755 ${S}/setup.sh ${D}/
> +    install -d ${D}/bin
> +    install -m 0755 ${S}/common.sh ${D}/bin
> +    install -m 0755 ${S}/setup-host-check.sh ${D}/bin
> +    install -m 0755 ${S}/setup-minicom.sh ${D}/bin
> +    install -m 0755 ${S}/setup-package-install.sh ${D}/bin
> +    install -m 0755 ${S}/setup-targetfs-nfs.sh ${D}/bin
> +    install -m 0755 ${S}/setup-tftp.sh ${D}/bin
> +    install -m 0755 ${S}/create-sdcard.sh ${D}/bin
> +    install -m 0755 ${S}/${UBOOT_ENV} ${D}/bin/setup-uboot-env.sh
> +}
> +
> +FILES_${PN} += "setup.sh"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

