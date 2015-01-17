Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8D4ED52A19
	for <meta-arago@arago-project.org>;
	Sat, 17 Jan 2015 03:43:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0H3hIag029202
	for <meta-arago@arago-project.org>; Fri, 16 Jan 2015 21:43:18 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0H3hIbi028066
	for <meta-arago@arago-project.org>; Fri, 16 Jan 2015 21:43:18 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 Jan 2015 21:43:17 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0H3hHPc015668;
	Fri, 16 Jan 2015 21:43:17 -0600
Date: Fri, 16 Jan 2015 22:43:17 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150117034316.GE4759@edge>
References: <1421380969-17405-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1421380969-17405-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v3] parse-ip: Add support for keystone platforms
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
X-List-Received-Date: Sat, 17 Jan 2015 03:43:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This looks good now! I take it that you've tested it yourself :)

-- 
Denys


On Thu, Jan 15, 2015 at 11:02:49PM -0500, Sam Nelson wrote:
> - Added separate script for keystone platforms
> - Script parses ip and sends to uart, picked up by BMC and display on LCD screen
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Changes from previous patch
> - Removed keystene/init from SRC URI
> ---
> ---
>  .../recipes-tisdk/parse-ip/parse-ip.bb             |    4 ++--
>  .../parse-ip/parse-ip/{ => keystone}/init          |   16 ++++++++--------
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  copy meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/{ => keystone}/init (87%)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
> index f20db31..2cfc675 100644
> --- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
> +++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
> @@ -2,12 +2,12 @@ DESCRIPTION = "Script to parse ip address during boot and make it available to t
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://init;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
>  
> -COMPATIBLE_MACHINE = "ti33x|ti43x"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|keystone"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  SRC_URI = "file://init"
>  
> -PR = "r2"
> +PR = "r3"
>  
>  S = "${WORKDIR}"
>  
> diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
> similarity index 87%
> copy from meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
> copy to meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
> index 4050efb..7f260fb 100644
> --- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
> +++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
> @@ -32,15 +32,15 @@
>  
>  case "$1" in
>      start )
> -        if [ -e /run/media/mmcblk0p1 ]
> -        then
> -            echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'` > /run/media/mmcblk0p1/.ipaddr
> -            sync
> -	    sync
> -	fi
> +        echo '#>>>>> LCD 12' > ipaddr
> +        echo 'IP Address:' >> ipaddr
> +        cat ipaddr
> +
> +        echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'` > ipaddr
> +        cat ipaddr
> +
> +        sleep 1
>      ;;
>      stop )
>          exit 0;;
>  esac
> -
> -exit 0
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

