Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 5E541529AF
	for <meta-arago@arago-project.org>;
	Fri, 27 Feb 2015 01:30:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1R1UB1D002412
	for <meta-arago@arago-project.org>; Thu, 26 Feb 2015 19:30:11 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1R1UALr000314
	for <meta-arago@arago-project.org>; Thu, 26 Feb 2015 19:30:10 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Feb 2015 19:30:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1R1UAvC008630;
	Thu, 26 Feb 2015 19:30:10 -0600
Date: Thu, 26 Feb 2015 20:30:10 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150227013009.GJ6052@edge>
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
X-List-Received-Date: Fri, 27 Feb 2015 01:30:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

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

I'm not sure about gdb - we've had legal issues packaging it in the rootfs in 
the past. I'll need to check with OSRB...

Also, does strongswan require separate TSU exemption?


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

