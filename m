Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C165352A81
	for <meta-arago@arago-project.org>;
	Thu, 11 Sep 2014 22:29:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8BMTqYW003066
	for <meta-arago@arago-project.org>; Thu, 11 Sep 2014 17:29:52 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8BMTqav009370
	for <meta-arago@arago-project.org>; Thu, 11 Sep 2014 17:29:52 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 11 Sep 2014 17:29:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8BMTqSA013361;
	Thu, 11 Sep 2014 17:29:52 -0500
Date: Thu, 11 Sep 2014 18:29:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20140911222951.GL18620@edge>
References: <1409844854-17247-1-git-send-email-a0393906@ti.com>
	<1409844854-17247-2-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1409844854-17247-2-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [for master] [PATCH 1/3] tisdk-connectivity: Add support for omap-a15 based targets
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
X-List-Received-Date: Thu, 11 Sep 2014 22:29:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 04, 2014 at 09:04:12PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-connectivity.bb       | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index f6c8660..7c5c565 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install wireless packages into the target FS"
>  LICENSE = "MIT"
> -PR = "r29"
> +PR = "r30"
>  
>  inherit packagegroup
>  
> @@ -63,6 +63,13 @@ CONNECTIVITY_RDEPENDS_ti43x = "\
>      ${FIRMWARE_AND_DRIVERS} \
>  "
>  
> +CONNECTIVITY_RDEPENDS_omap-a15 = "\
> +    ${WLAN_COMMON} \
> +    ${BLUETOOTH_STACK} \
> +    ${@base_contains('ARAGO_BRAND','glsdk','${FIRMWARE_AND_DRIVERS}','',d)} \
> +    bt-firmware \

So, I see that wlan and by components are added to omap-a15 SOC, while 
firmware and drivers are only enabled when built for GLSDK. I'm wondering if 
that will affect negatively other platforms based on the same SOC, including 
am57x... And wasn't BT support completely dropped by Sitara? Is it still the 
case?

-- 
Denys


> +"
> +
>  RDEPENDS_${PN} = "\
>      ${CONNECTIVITY_RDEPENDS} \
>  "
> -- 
> 2.0.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

