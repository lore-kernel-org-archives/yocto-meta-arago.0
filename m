Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A17065298D
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2013 16:09:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61G9D4R003268
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 11:09:13 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61G9D7n010931
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 11:09:13 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 11:09:13 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r61G9D8b007579;
	Mon, 1 Jul 2013 11:09:13 -0500
Date: Mon, 1 Jul 2013 12:09:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Siddharth Heroor <heroor@ti.com>
Message-ID: <20130701160912.GF4588@edge>
References: <20130701154756.GA1772@ti.com>
MIME-Version: 1.0
In-Reply-To: <20130701154756.GA1772@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/2] packagegroups: Add new packagegroup for glsdk console
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
X-List-Received-Date: Mon, 01 Jul 2013 16:09:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 01, 2013 at 09:17:57PM +0530, Siddharth Heroor wrote:
> * GLSDK supports a virtual console using KMS and GBM. This
>   packagegroup builds on top of the arago-console packagegroup.
> * For OMAP5, we append ABE firmware.
> * KMSCube is used as demonstration application

So, what machines do you have in GLSDK? I thought those were all omap-a15 ones 
(omap5-evm and dra7xx-evm).

Can we just make those as machine-overrides in original packagegroup and image 
recipes instead of creating new ones? Is there a use-case to have both 
versions of console packagegroup/image - one with KMS/GBM and one w/o?


> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
>  .../packagegroup-arago-glsdk-console.bb            |   35 ++++++++++++++++++++
>  1 files changed, 35 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-glsdk-console.bb
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-glsdk-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-glsdk-console.bb
> new file mode 100644
> index 0000000..da16db7
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-glsdk-console.bb
> @@ -0,0 +1,35 @@
> +DESCRIPTION = "Extended task to get more basic and console apps in GLSDK"
> +LICENSE = "MIT"
> +PR = "r1"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit packagegroup
> +
> +ARAGO_GLSDK_CONSOLE = "\
> +    libdrm \
> +    libdrm-kms \
> +    libgbm-glsdk \
> +    cairo \
> +    pixman \
> +    expat \
> +    omap5-sgx-ddk-um-linux \
> +    omapdrm-pvr \
> +    "
> +
> +ARAGO_GLSDK_CONSOLE_append_omap5-evm = "\
> +    abefw \
> +    "
> +
> +ARAGO_GLSDK_CONSOLE_DEMOS = "\
> +    kmscube \
> +    "
> +
> +RDEPENDS_${PN} = "\
> +    ${ARAGO_GLSDK_CONSOLE} \
> +    ${ARAGO_GLSDK_CONSOLE_DEMOS} \
> +    "
> +
> +RRECOMMENDS_${PN} = "\
> +    kernel-modules \
> +    "
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

