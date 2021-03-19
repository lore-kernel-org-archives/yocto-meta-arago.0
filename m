Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 34A8E529EC
	for <meta-arago@arago-project.org>;
	Fri, 19 Mar 2021 18:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 424F840BA9;
	Fri, 19 Mar 2021 18:32:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gPWNxtiuXIi7; Fri, 19 Mar 2021 18:32:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1802040BA7;
	Fri, 19 Mar 2021 18:32:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D4A5B174553; Fri, 19 Mar 2021 14:32:20 -0400 (EDT)
Date: Fri, 19 Mar 2021 14:32:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Nagalla, Hari" <hnagalla@ti.com>
Message-ID: <20210319183220.GY18041@denix.org>
References: <20210319181257.10173-1-praneeth@ti.com>
	<49cedfbc80134bdd91b5e35707f82046@ti.com>
MIME-Version: 1.0
In-Reply-To: <49cedfbc80134bdd91b5e35707f82046@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"denys@konsulko.com" <denys@konsulko.com>
Subject: Re: [dunfell/master PATCH] packagegroups: tisdk-connectivity: Include BT_TI package for all platforms
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
X-List-Received-Date: Fri, 19 Mar 2021 18:32:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Yes, looks good to me too. Thanks for addressing the comments.

On Fri, Mar 19, 2021 at 06:19:27PM +0000, Nagalla, Hari wrote:
> Thanks Praneeth,
> 
> It seems good to me..
> 
> Thanks
> Hari
> 
> -----Original Message-----
> From: Bajjuri, Praneeth 
> Sent: Friday, March 19, 2021 1:13 PM
> To: Bajjuri, Praneeth <praneeth@ti.com>; Nagalla, Hari <hnagalla@ti.com>
> Cc: meta-arago@arago-project.org; denys@konsulko.com
> Subject: [dunfell/master PATCH] packagegroups: tisdk-connectivity: Include BT_TI package for all platforms
> 
> From: Hari Nagalla <hnagalla@ti.com>
> 
> Move BT_TI package (That consists bt_enable,bt_fw) to CONNECTIVITY_RDEPENDS.
> This enables the package across all TI platforms.
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> [praneeth@ti.com: addressed review comments from v1]
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-connectivity.bb | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index 8a8189fe..1eb0e072 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> @@ -64,22 +64,17 @@ CONNECTIVITY_RDEPENDS = " \
>      ${WLAN_COMMON} \
>      ${WLAN_TI} \
>      ${BT_COMMON} \
> +    ${BT_TI} \
>  "
>  
>  CONNECTIVITY_RDEPENDS_append_ti33x = "\
> -    ${BT_TI} \
>      ${DEMO_APPS} \
>  "
>  
>  CONNECTIVITY_RDEPENDS_append_ti43x = "\
> -    ${BT_TI} \
>      ${DEMO_APPS} \
>  "
>  
> -CONNECTIVITY_RDEPENDS_append_dra7xx = "\
> -    ${BT_TI} \
> -"
> -
>  RDEPENDS_${PN} = "\
>      ${CONNECTIVITY_RDEPENDS} \
>  "
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

