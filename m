Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 4EEE95299C
	for <meta-arago@arago-project.org>;
	Wed, 17 Mar 2021 17:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D562A40C2C;
	Wed, 17 Mar 2021 17:01:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2_Iu8i7tkh1K; Wed, 17 Mar 2021 17:01:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B95AD40A47;
	Wed, 17 Mar 2021 17:01:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7B87D17454F; Wed, 17 Mar 2021 13:01:22 -0400 (EDT)
Date: Wed, 17 Mar 2021 13:01:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Hari Nagalla <hnagalla@gmail.com>
Message-ID: <20210317170122.GS18041@denix.org>
References: <20210317095201.7528-1-hnagalla@gmail.com>
	<20210317095201.7528-2-hnagalla@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210317095201.7528-2-hnagalla@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [ 1/1] Move BT_TI (BT FW etc) to CONNECTIVITY_RDEPENDS, as it is needed across all platforms
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
X-List-Received-Date: Wed, 17 Mar 2021 17:01:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hari,

Please follow the OpenEmbedded patch guidelines for commit log and the 
subject:

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks.


On Wed, Mar 17, 2021 at 04:52:01AM -0500, Hari Nagalla wrote:
> Signed-off-by: Hari Nagalla <hnagalla@gmail.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-connectivity.bb    | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index 8a8189fe..5552096d 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> @@ -64,20 +64,18 @@ CONNECTIVITY_RDEPENDS = " \
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
>  CONNECTIVITY_RDEPENDS_append_dra7xx = "\
> -    ${BT_TI} \
>  "

This append_dra7xx override now becomes empty and can be dropped.


>  
>  RDEPENDS_${PN} = "\
> -- 
> 2.17.1

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

