Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9DD2F529A7
	for <meta-arago@arago-project.org>;
	Thu,  5 Feb 2015 17:05:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15H5GJV013057
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 11:05:17 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15H5FJU029646
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 11:05:15 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Feb 2015 11:05:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15H5Ffv027523;
	Thu, 5 Feb 2015 11:05:15 -0600
Date: Thu, 5 Feb 2015 12:05:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150205170515.GK9943@edge>
References: <1423152936-3396-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1423152936-3396-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] sysvinit: Changing default setting to add HWCLOCKACCESS=no
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
X-List-Received-Date: Thu, 05 Feb 2015 17:05:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 05, 2015 at 11:15:36AM -0500, Sam Nelson wrote:
> - realtime clock is not commonly present and hence adding
>   HWCLOCKACCESS=no
> - Avoids error message if rc device not present

Why not set it in /etc/default/hwclock? That way we can machine-specific 
versions of the file, when we want to enable hwclock?


> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../recipes-core/sysvinit/files/hwclock.rcS        |    2 ++
>  .../sysvinit/sysvinit_2.88dsf.bbappend             |    9 +++++++++
>  2 files changed, 11 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-core/sysvinit/files/hwclock.rcS
>  create mode 100644 meta-arago-distro/recipes-core/sysvinit/sysvinit_2.88dsf.bbappend
> 
> diff --git a/meta-arago-distro/recipes-core/sysvinit/files/hwclock.rcS b/meta-arago-distro/recipes-core/sysvinit/files/hwclock.rcS
> new file mode 100644
> index 0000000..3e26c20
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/sysvinit/files/hwclock.rcS
> @@ -0,0 +1,2 @@
> +# This is to indicate hwclock is not supported
> +HWCLOCKACCESS=no
> diff --git a/meta-arago-distro/recipes-core/sysvinit/sysvinit_2.88dsf.bbappend b/meta-arago-distro/recipes-core/sysvinit/sysvinit_2.88dsf.bbappend
> new file mode 100644
> index 0000000..6e08c83
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/sysvinit/sysvinit_2.88dsf.bbappend
> @@ -0,0 +1,9 @@
> +PR_append = "-arago0"
> +
> +# look for files in this layer first
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> +SRC_URI += "file://hwclock.rcS"
> +do_install_append () {
> +# Add hwclock configuration
> +	cat ${WORKDIR}/hwclock.rcS >> ${D}${sysconfdir}/default/rcS
> +}
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

