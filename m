Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2001.1644254368425214767
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 07 Feb 2022 09:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 02B7A40C2A;
	Mon,  7 Feb 2022 17:19:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XOF3ttuwgxpB; Mon,  7 Feb 2022 17:19:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D5BD240429;
	Mon,  7 Feb 2022 17:19:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9AB21174737; Mon,  7 Feb 2022 12:19:24 -0500 (EST)
Date: Mon, 7 Feb 2022 12:19:24 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: meta-arago@lists.yoctoproject.org, khilman@baylibre.com
Subject: Re: [meta-arago] [EXTERNAL,dunfell PATCH v2] Use crypto_apps_script instead of crypto_apps_program
Message-ID: <20220207171924.GS26229@denix.org>
References: <20220207084331.4147148-1-clabbe@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20220207084331.4147148-1-clabbe@baylibre.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

It's recommended to indicate the recipe or general area of the change in the 
beginning of the shortlog/subject, e.g. "matrix-gui-crypto-demos: ..."

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines


On Mon, Feb 07, 2022 at 08:43:31AM +0000, Corentin Labbe wrote:
> From: Corentin Labbe <clabbe@baylibre.com>
> 
> crypto_apps_program depended on ti-crypto-examples which is disabled since 2 years now.
> So let's fallback to original crypto_apps_script
> 
> Signed-off-by: Corentin LABBE <clabbe@baylibre.com>
> ---

Also, the changes in PATCH v2 since v1 go in here.


>  .../recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb   | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
> index 7029df53..8afd79c7 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
> @@ -7,17 +7,8 @@ PR = "${INC_PR}.12"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  S = "${WORKDIR}/git/cryptos_apps_scripts"
> -S_ti33x = "${WORKDIR}/git/cryptos_apps_program"
> -S_ti43x = "${WORKDIR}/git/cryptos_apps_program"
> -S_dra7xx = "${WORKDIR}/git/cryptos_apps_program"
> -S_keystone = "${WORKDIR}/git/cryptos_apps_program"
>  
>  FILES_${PN} += "${MATRIX_BASE_DIR}/*"
>  
>  # Make sure crypto submenu and app images has been installed. Also make sure openssl is available
>  RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl matrix-gui-helper-scripts"
> -
> -#RDEPENDS_${PN}_append_ti33x = " ti-crypto-examples"
> -#RDEPENDS_${PN}_append_ti43x = " ti-crypto-examples"
> -#RDEPENDS_${PN}_append_dra7xx = " ti-crypto-examples"
> -#RDEPENDS_${PN}_append_keystone = " ti-crypto-examples"
> -- 
> 2.25.1
