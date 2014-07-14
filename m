Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id EB4E952A31
	for <meta-arago@arago-project.org>;
	Mon, 14 Jul 2014 19:39:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6EJdrf1025649
	for <meta-arago@arago-project.org>; Mon, 14 Jul 2014 14:39:53 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6EJdrHY028678
	for <meta-arago@arago-project.org>; Mon, 14 Jul 2014 14:39:53 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 14 Jul 2014 14:39:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6EJdr6C026676;
	Mon, 14 Jul 2014 14:39:53 -0500
Date: Mon, 14 Jul 2014 15:39:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Yaniv Machani <yanivma@ti.com>
Message-ID: <20140714193952.GS15788@edge>
References: <1405350249-15037-1-git-send-email-yanivma@ti.com>
	<1405350249-15037-6-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
In-Reply-To: <1405350249-15037-6-git-send-email-yanivma@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 5/5] wl18xx-target-scripts : Add new WiFi related scripts
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
X-List-Received-Date: Mon, 14 Jul 2014 19:39:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 14, 2014 at 06:04:09PM +0300, Yaniv Machani wrote:
> New scripts to ease the use of wifi modes-
>  Start/Stop - Station, AP, P2P and Multi Role.
>  Station connection scripts.
>  Driver load/unload.
> 
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../packagegroup-arago-tisdk-connectivity.bb       |    1 +
>  .../wl18xx-target-scripts_r8.a9.14.bb              |   24 ++++++++++++++++++++
>  2 files changed, 25 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
>  create mode 100755 meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> old mode 100644
> new mode 100755
> index 7b3480c..4b8fb00
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> @@ -24,6 +24,7 @@ WLAN_COMMON = "\
>      crda \
>      hostap-daemon-wl18xx \
>      ti-wifi-utils-wl18xx \
> +    wl18xx-target-scripts \
>  "
>  
>  # netperf has non-standard license, needs verifying
> diff --git a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
> new file mode 100755
> index 0000000..404b7f6
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "Scripts and configuration files for TI wireless drivers"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c0d175d1f4a705"
> +
> +PR ="r1"
> +PR_append = "+gitr${SRCPV}"

Can be a single assignment of PR variable instead of 2.


> +
> +# Tag: ol_r8.a9.14
> +SRCREV = "4d9f47235501fb2c665b6336a54e0ba152e8e941"
> +BRANCH = "sitara-mbss"
> +SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +
> +do_install() {
> +	install -d ${D}/usr/share/wl18xx/
> +
> +    scripts=`find ./ -type f -name "*\.sh"`
> +    for s in $scripts
> +    do
> +        install -m 0755 $s ${D}/usr/share/wl18xx/
> +    done

Looks like there's some indentation problem in do_install function - the first 
line is indented differently. Make sure to use consistent indentation - either 
tabs or spaces for shell functions and only spaces for python functions.

Also, please use ${datadir} instead ofhardcoding /usr/share


> +}
> -- 
> 1.7.9
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

