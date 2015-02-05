Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 693CA52A5F
	for <meta-arago@arago-project.org>;
	Thu,  5 Feb 2015 15:13:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15FDt53022831
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 09:13:55 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15FDs0d000812
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 09:13:54 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Feb 2015 09:13:54 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15FDstH024035;
	Thu, 5 Feb 2015 09:13:54 -0600
Date: Thu, 5 Feb 2015 10:13:53 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Carlos Hernandez <ceh@ti.com>
Message-ID: <20150205151353.GC9943@edge>
References: <1423148553-1225-1-git-send-email-ceh@ti.com>
MIME-Version: 1.0
In-Reply-To: <1423148553-1225-1-git-send-email-ceh@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] busybox/defconfig: Enable options required by LAVA
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
X-List-Received-Date: Thu, 05 Feb 2015 15:13:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 05, 2015 at 10:02:33AM -0500, Carlos Hernandez wrote:
> Linaro's Test Framework (LAVA) requires httpd and other options
> enabled in busybox. Enable them so LAVA tests can be run on Arago
> images.

Looks good. The only concern I have is below.


> Signed-off-by: Carlos Hernandez <ceh@ti.com>
> ---
>  meta-arago-distro/recipes-core/busybox/busybox/defconfig | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> index 2d54b83..e0d6540 100644
> --- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> +++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> @@ -135,8 +135,8 @@ CONFIG_CPIO=y
>  # CONFIG_FEATURE_CPIO_O is not set
>  # CONFIG_FEATURE_CPIO_P is not set
>  # CONFIG_DPKG is not set
> -# CONFIG_DPKG_DEB is not set
> -# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
> +CONFIG_DPKG_DEB=y
> +CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY=y
>  CONFIG_GUNZIP=y
>  CONFIG_GZIP=y
>  # CONFIG_FEATURE_GZIP_LONG_OPTIONS is not set
> @@ -154,7 +154,7 @@ CONFIG_FEATURE_TAR_GNU_EXTENSIONS=y
>  # CONFIG_FEATURE_TAR_LONG_OPTIONS is not set
>  # CONFIG_FEATURE_TAR_TO_COMMAND is not set
>  # CONFIG_FEATURE_TAR_UNAME_GNAME is not set
> -# CONFIG_FEATURE_TAR_NOPRESERVE_TIME is not set
> +CONFIG_FEATURE_TAR_NOPRESERVE_TIME=y
>  # CONFIG_FEATURE_TAR_SELINUX is not set
>  # CONFIG_UNCOMPRESS is not set
>  # CONFIG_UNLZMA is not set
> @@ -700,7 +700,7 @@ CONFIG_MICROCOM=y
>  # CONFIG_RFKILL is not set
>  # CONFIG_RUNLEVEL is not set
>  # CONFIG_RX is not set
> -# CONFIG_SETSID is not set
> +CONFIG_SETSID=y
>  CONFIG_STRINGS=y
>  # CONFIG_TASKSET is not set
>  # CONFIG_FEATURE_TASKSET_FANCY is not set
> @@ -744,7 +744,7 @@ CONFIG_FEATURE_BRCTL_SHOW=y
>  # CONFIG_FTPPUT is not set
>  # CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
>  CONFIG_HOSTNAME=y
> -# CONFIG_HTTPD is not set
> +CONFIG_HTTPD=y
>  # CONFIG_FEATURE_HTTPD_RANGES is not set
>  # CONFIG_FEATURE_HTTPD_USE_SENDFILE is not set
>  # CONFIG_FEATURE_HTTPD_SETUID is not set
> @@ -845,7 +845,7 @@ CONFIG_UDHCP_DEBUG=0
>  # CONFIG_FEATURE_UDHCP_8021Q is not set
>  CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
>  CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
> -CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
> +CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -b"

This supposedly changes udhcp behavior to go into background when waiting for 
an IP address, if not received right away, instead of exiting with an error.
I personally don't have an issue with this, but will it affect SDK OOB 
experience in any way? Guys?

-- 
Denys


>  CONFIG_UDPSVD=y
>  CONFIG_VCONFIG=y
>  CONFIG_WGET=y
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

