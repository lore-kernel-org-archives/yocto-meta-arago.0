Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 890C7529A9
	for <meta-arago@arago-project.org>;
	Tue,  3 Mar 2015 06:30:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t236U23J026019
	for <meta-arago@arago-project.org>; Tue, 3 Mar 2015 00:30:02 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t236U06Q021712
	for <meta-arago@arago-project.org>; Tue, 3 Mar 2015 00:30:01 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Mar 2015 00:30:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t236U0qu019595;
	Tue, 3 Mar 2015 00:30:00 -0600
Date: Tue, 3 Mar 2015 01:30:00 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150303062959.GR6052@edge>
References: <1425311167-690-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1425311167-690-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/2] packagegroup-arago-tisdk-connectivity-sdk-host: Add ti-compat-wireless-wl18xx-src.
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
X-List-Received-Date: Tue, 03 Mar 2015 06:30:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

The patch is fine, but have we found out what is the deal with in-tree and 
compat mopules?


On Mon, Mar 02, 2015 at 10:46:06AM -0500, Jacob Stiffler wrote:
> From: Jake Stiffler <j-stiffler@ti.com>
> 
> * Add out of tree wl18xx driver sources to the SDK.
> 
> Signed-off-by: Jake Stiffler <j-stiffler@ti.com>
> ---
>  ...ckagegroup-arago-tisdk-connectivity-sdk-host.bb |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
> index e367c28..3862816 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install wlan and bluetooth sources into the SDK"
>  LICENSE = "MIT"
> -PR = "r9"
> +PR = "r10"
>  
>  inherit packagegroup
>  
> @@ -8,6 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  FIRMWARE_AND_DRIVERS_SRC = "\
>      wl18xx-firmware-src \
> +    ti-compat-wireless-wl18xx-src \
>  "
>  
>  CONNECTIVITY_RDEPENDS = ""
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

