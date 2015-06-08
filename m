Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 33173529AC
	for <meta-arago@arago-project.org>;
	Mon,  8 Jun 2015 22:30:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t58MUoIC027430
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 17:30:50 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t58MUoEv024183
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 17:30:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 8 Jun 2015 17:30:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t58MUoTh010936;
	Mon, 8 Jun 2015 17:30:50 -0500
Date: Mon, 8 Jun 2015 18:30:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150608223049.GE4019@edge>
References: <1424993717-21323-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1424993717-21323-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [RFC PATCH] packagegroup-arago-test-addons: Add keystone specific test packages and other test packages
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
X-List-Received-Date: Mon, 08 Jun 2015 22:30:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Looks good, but since you are making TEST_ADDONS_TI variable machine-specific, 
then this packagegroup should also become machine specific with PACKAGE_ARCH = 
MACHINE_ARCH

-- 
Denys


On Thu, Feb 26, 2015 at 06:35:17PM -0500, Sam Nelson wrote:
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../packagegroup-arago-test-addons.bb              |   34 ++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
> index 925f157..f577c76 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
> @@ -7,9 +7,43 @@ inherit packagegroup
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
> +    "
> +
> +TEST_ADDONS_TI_append_k2hk-evm = " \
> +    srio-lld-test \
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

