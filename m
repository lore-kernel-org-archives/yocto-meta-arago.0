Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7B411529AC
	for <meta-arago@arago-project.org>;
	Mon,  8 Jun 2015 22:27:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t58MR9k0028640
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 17:27:09 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t58MR9Js021027
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 17:27:09 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 8 Jun 2015 17:27:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t58MR99L008493;
	Mon, 8 Jun 2015 17:27:09 -0500
Date: Mon, 8 Jun 2015 18:27:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150608222708.GD4019@edge>
References: <1424897759-23944-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1424897759-23944-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/2] packagegroup-arago-mcsdk-toolchain-target: Add package group for mcsdk toolchain
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
X-List-Received-Date: Mon, 08 Jun 2015 22:27:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

2 comments here as well:

1. This belongs to meta-arago-distro as well, as extras is reserved for more 
generic stuff.

2. This packagegroup requires PACKAGE_ARCH = MACHINE_ARCH

-- 
Denys


On Wed, Feb 25, 2015 at 03:55:58PM -0500, Sam Nelson wrote:
> - Adds ti dev packages, platform specific packages and other additional packages
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../packagegroup-arago-mcsdk-toolchain-target.bb   |   94 ++++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-mcsdk-toolchain-target.bb
> 
> diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-mcsdk-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-mcsdk-toolchain-target.bb
> new file mode 100644
> index 0000000..9265a8c
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-mcsdk-toolchain-target.bb
> @@ -0,0 +1,94 @@
> +DESCRIPTION = "Target dev packages for MCSDK SDK"
> +LICENSE = "BSD-3-Clause"
> +
> +PR = "r0"
> +
> +inherit packagegroup
> +
> +TI_PKGS_DEV = "\
> +	cmem-dev \
> +	cmem-staticdev \
> +	"
> +TI_SECURE_STORAGE_DEV = "\
> +	ti-softhsmv2-dev \
> +	libp11-dev \
> +	libp11-staticdev \
> +	"
> +
> +TI_PKGS_DEV_append_keystone = "\
> +	${TI_SECURE_STORAGE_DEV} \
> +	udma-dev \
> +	udma-staticdev \
> +	traceframework-dev \
> +	traceframework-staticdev \
> +	cuia-dev \
> +	cuia-staticdev \
> +	common-csl-ip-dev \
> +	cppi-lld-dev \
> +	cppi-lld-staticdev \
> +	qmss-lld-dev \
> +	qmss-lld-staticdev \
> +	pa-lld-dev \
> +	pa-lld-staticdev \
> +	rm-lld-dev \
> +	rm-lld-staticdev \
> +	hyplnk-lld-dev \
> +	hyplnk-lld-staticdev \
> +	sa-lld-dev \
> +	sa-lld-staticdev \
> +	hplib-dev \
> +	hplib-staticdev \
> +	nwal-lld-dev \
> +	nwal-lld-staticdev \
> +	pktlib-dev \
> +	pktlib-staticdev \
> +	mmap-lld \
> +	mmap-lld-staticdev \
> +	netapi-dev \
> +	netapi-staticdev \
> +	ipsecmgr-dev \
> +	ipsecmgr-staticdev \
> +	libnl-xfrm-dev \
> +	libnl-xfrm-staticdev \
> +	libnl-dev \
> +	libnl-staticdev \
> +	ti-ipc-dev \
> +	ti-ipc-staticdev \
> +	multiprocmgr-dev \
> +	multiprocmgr-staticdev \
> +	mpm-transport-dev \
> +	mpm-transport-staticdev \
> +	edma3-lld-dev \
> +	edma3-lld-staticdev \
> +	lksctp-tools-dev \
> +	lksctp-tools-staticdev \
> +	"
> +
> +TI_PKGS_DEV_append_k2l-evm = "\
> +	dfe-lld-dev \
> +	dfe-lld-staticdev \
> +	iqn2-lld-dev \
> +	iqn2-lld-staticdev \
> +	"
> +
> +TI_PKGS_DEV_append_k2hk-evm = "\
> +	srio-lld-dev \
> +	srio-lld-staticdev \
> +	"
> +
> +RDEPENDS_${PN} += " \
> +	packagegroup-arago-standalone-sdk-target \
> +	kernel-dev \
> +	${TI_PKGS_DEV} \
> +	libdnet-dev \
> +	libdnet-staticdev \
> +	binutils-dev \
> +	binutils-staticdev \
> +	elfutils-dev \
> +	elfutils-staticdev \
> +	libbz2-dev \
> +	libbz2-staticdev \
> +	libgl-mesa-dev \
> +	boost-dev \
> +	libsdl-dev \
> +	"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

