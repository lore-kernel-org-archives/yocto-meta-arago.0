Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5EF2A52ABC
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 20:06:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AK6h2e010570
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 14:06:43 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AK6gRM026735
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 14:06:42 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Feb 2015 14:06:42 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AK6goH003179;
	Tue, 10 Feb 2015 14:06:42 -0600
Date: Tue, 10 Feb 2015 15:06:42 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150210200641.GK13231@edge>
References: <1423598632-4802-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1423598632-4802-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] packagegroup-arago-tisdk-addons: Keep switch-config only for ti33x, ti43x & omap-a15
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
X-List-Received-Date: Tue, 10 Feb 2015 20:06:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Tue, Feb 10, 2015 at 03:03:52PM -0500, Sam Nelson wrote:
> - with kernel version 3.10.10 switch-config doesnot compile
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Changes from previous version of patch
> - Modified to avoid use of _remove
> ---
> ---
>  .../packagegroup-arago-tisdk-addons.bb             |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index a8d3efb..6d98ba6 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -18,7 +18,6 @@ UTILS = " \
>      openssh-sftp-server \
>      ptpd \
>      libdrm-kms \
> -    switch-config \
>      ${@base_contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
>  "
>  
> @@ -39,6 +38,10 @@ UTILS_append_ti43x = " canutils"
>  UTILS_append_dra7xx = " canutils"
>  UTILS_append_omap-a15 = " parted"
>  
> +UTILS_append_ti33x = " switch-config"
> +UTILS_append_ti43x = " switch-config"
> +UTILS_append_omap-a15 = " switch-config"
> +
>  RDEPENDS_${PN} = "\
>      ${UTILS} \
>      ${UTILS_UBOOT_FW} \
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

