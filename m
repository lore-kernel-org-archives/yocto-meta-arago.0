Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id E3C48529BD
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 01:43:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t251hgYE030354;
	Wed, 4 Mar 2015 19:43:42 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t251hf8g005834;
	Wed, 4 Mar 2015 19:43:41 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 19:43:40 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t251heEg022809;
	Wed, 4 Mar 2015 19:43:40 -0600
Date: Wed, 4 Mar 2015 20:43:39 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20150305014339.GM6052@edge>
References: <1425488420-16525-1-git-send-email-denis@denix.org>
	<4B26FB5A64EBA14C87266869E037F958141042CF@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F958141042CF@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] packagegroup-*-connectivity: enable wlan/bt on dra7xx soc unconditionally
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
X-List-Received-Date: Thu, 05 Mar 2015 01:43:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Yes, indeed. Unfortunately, ECS team is not very forthcoming with updating 
their components...

I enabled bt-firmware for all dra7xx platforms for now, assuming the firmware 
binaries provide the necessary support. We'll need confirmation from ECS, but 
we can always disable it later.

-- 
Denys


On Wed, Mar 04, 2015 at 11:43:21PM +0000, Stiffler, Jacob wrote:
> This is breaking am57xx-evm builds. From " meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb ":
> 
> COMPATIBLE_MACHINE = "ti33x|ti43x|dra7xx-evm"
> 
> - Jake
> 
> 
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Wednesday, March 04, 2015 12:00 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] packagegroup-*-connectivity: enable wlan/bt on dra7xx soc unconditionally
> 
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-connectivity.bb          | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index 08d2a4a..f157676 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install wireless packages into the target FS"
>  LICENSE = "MIT"
> -PR = "r31"
> +PR = "r32"
>  
>  inherit packagegroup
>  
> @@ -64,10 +64,10 @@ CONNECTIVITY_RDEPENDS_ti43x = "\
>      ${FIRMWARE_AND_DRIVERS} \
>  "
>  
> -CONNECTIVITY_RDEPENDS_dra7xx-evm = "\
> +CONNECTIVITY_RDEPENDS_dra7xx = "\
>      ${WLAN_COMMON} \
>      ${BLUETOOTH_STACK} \
> -    ${@base_contains('ARAGO_BRAND','glsdk','${FIRMWARE_AND_DRIVERS}','',d)} \
> +    ${FIRMWARE_AND_DRIVERS} \
>      bt-firmware \
>  "
>  
> -- 
> 2.2.0
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

