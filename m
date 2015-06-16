Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5307952A0C
	for <meta-arago@arago-project.org>;
	Tue, 16 Jun 2015 21:36:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t5GLaMDI006965
	for <meta-arago@arago-project.org>; Tue, 16 Jun 2015 16:36:22 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5GLaMA4024989
	for <meta-arago@arago-project.org>; Tue, 16 Jun 2015 16:36:22 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 16 Jun 2015 16:36:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5GLaL1x026575;
	Tue, 16 Jun 2015 16:36:21 -0500
Date: Tue, 16 Jun 2015 17:36:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150616213621.GB16167@edge>
References: <1434486167-25017-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1434486167-25017-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] packagegroup-arago-test-addons: Add keystone specific test packages and other test packages
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
X-List-Received-Date: Tue, 16 Jun 2015 21:36:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack.


On Tue, Jun 16, 2015 at 04:22:47PM -0400, Sam Nelson wrote:
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../packagegroup-arago-test-addons.bb              |   42 +++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
> index 925f157..3e1fa8f 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
> @@ -1,15 +1,55 @@
>  DESCRIPTION = "Task to install additional utilities/demos for test image"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -PR = "r1"
> +PR = "r2"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  inherit packagegroup
>  
>  TEST_ADDONS = " \
>      bridge-utils \
> +    linuxptp \
> +    openntpd \
> +    strongswan \
> +    gdb \
>      "
>  
>  TEST_ADDONS_TI = " \
> +    cmem-test \
> +    "
> +TEST_ADDONS_TI_append_keystone = " \
> +    qmss-lld-test \
> +    pa-lld-test \
> +    cppi-lld-test \
> +    hyplnk-lld-test \
> +    edma3-lld-test \
> +    mmap-lld-test \
> +    rm-lld \
> +    rm-lld-test \
> +    sa-lld \
> +    sa-lld-test \
> +    traceframework-test \
> +    multiprocmgr-test \
> +    hplib-test \
> +    hyplnk-lld-test \
> +    nwal-lld \
> +    nwal-lld-test \
> +    udma-test \
> +    mpm-transport-test \
> +    ipc-transport-qmss-test \
> +    ipsecmgr \
> +    netapi-test \
> +    "
> +
> +TEST_ADDONS_TI_append_k2hk-evm = " \
> +    srio-lld-test \
> +    ipc-transport-srio-test \
> +    "
> +
> +TEST_ADDONS_TI_append_k2l-evm = " \
> +    dfe-lld-test \
> +    iqn2-lld-test \
>      "
>  
>  RDEPENDS_${PN} = "\
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

