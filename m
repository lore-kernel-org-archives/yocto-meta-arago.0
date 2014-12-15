Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7E540529D9
	for <meta-arago@arago-project.org>;
	Mon, 15 Dec 2014 20:35:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBFKZPEt008307
	for <meta-arago@arago-project.org>; Mon, 15 Dec 2014 14:35:25 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBFKZPb9007029
	for <meta-arago@arago-project.org>; Mon, 15 Dec 2014 14:35:25 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 15 Dec 2014 14:35:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBFKZP1p027878;
	Mon, 15 Dec 2014 14:35:25 -0600
Date: Mon, 15 Dec 2014 15:35:25 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20141215203524.GF28600@edge>
References: <1416833465-19027-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1416833465-19027-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [for master, v2 1/3] tisdk-connectivity: Add support for dra7xx-evm
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
X-List-Received-Date: Mon, 15 Dec 2014 20:35:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Karthik,

It would really help and speed review process up, if you provide a short 
change log of patch revisions. I was postponing reviewing this set until I had 
enough time to go back and compare it with previous revisions and see what has 
changed and if all the previous comments were addressed...

-- 
Denys


On Mon, Nov 24, 2014 at 06:21:03PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../packagegroup-arago-tisdk-connectivity.bb       |    9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index f6c8660..f469fdd 100644
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
> +CONNECTIVITY_RDEPENDS_dra7xx-evm = "\
> +    ${WLAN_COMMON} \
> +    ${BLUETOOTH_STACK} \
> +    ${@base_contains('ARAGO_BRAND','glsdk','${FIRMWARE_AND_DRIVERS}','',d)} \
> +    bt-firmware \
> +"
> +
>  RDEPENDS_${PN} = "\
>      ${CONNECTIVITY_RDEPENDS} \
>  "
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

