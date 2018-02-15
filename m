Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id EE64D52993
	for <meta-arago@arago-project.org>;
	Thu, 15 Feb 2018 18:10:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1FI9iKu000726
	for <meta-arago@arago-project.org>; Thu, 15 Feb 2018 12:09:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518718184;
	bh=ifYeeM75A23iTSl0YT4kJXcILsvzYQ2B65JopWvlQxg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=f/MF/00Wd/yNdrDjFHEz0VzGwqNrKImmMFafWvkQ+Qrls3/D49U398MVOARR+ncPa
	N3JRMorDZAsWj8hNYisdIzV8owK1uiWx6D8Zg6i0YvQ3OHkD8iECtjOhgOA9/C30Zr
	hnj4OSqnc0VvkYqkgO9p3BwZgKtIFIthMcd5SWak=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1FI9ic9029702
	for <meta-arago@arago-project.org>; Thu, 15 Feb 2018 12:09:44 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 15 Feb 2018 12:09:44 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 15 Feb 2018 12:09:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1FI9ic8004405;
	Thu, 15 Feb 2018 12:09:44 -0600
Date: Thu, 15 Feb 2018 13:09:43 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180215180943.GT31854@edge>
References: <1518716270-17171-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1518716270-17171-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] arago.conf: add TI_MIRROR to mirrors
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
X-List-Received-Date: Thu, 15 Feb 2018 18:10:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks!


On Thu, Feb 15, 2018 at 12:37:50PM -0500, Jacob Stiffler wrote:
> * Add the TI_MIRROR as a fallback to any upstream fetch issues.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 00db445..bc7c18c 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -7,9 +7,21 @@ FEEDURIPREFIX ?= "packages/${DISTRO}-morty/${BUILD_VARIANT}/"
>  
>  OPKG_ARGS_remove = "--prefer-arch-to-version"
>  
> +TI_MIRROR = "http://software-dl.ti.com/processor-sdk-mirror/sources/"
>  MIRRORS += " \
>  ftp://.*/.*       http://arago-project.org/files/sources/ \n \
>  https?$://.*/.*   http://arago-project.org/files/sources/ \n \
> +bzr://.*/.*      ${TI_MIRROR} \n \
> +cvs://.*/.*      ${TI_MIRROR} \n \
> +git://.*/.*      ${TI_MIRROR} \n \
> +gitsm://.*/.*    ${TI_MIRROR} \n \
> +hg://.*/.*       ${TI_MIRROR} \n \
> +osc://.*/.*      ${TI_MIRROR} \n \
> +p4://.*/.*       ${TI_MIRROR} \n \
> +npm://.*/.*      ${TI_MIRROR} \n \
> +ftp://.*/.*      ${TI_MIRROR} \n \
> +https?$://.*/.*  ${TI_MIRROR} \n \
> +svn://.*/.*      ${TI_MIRROR} \n \
>  "
>  
>  # SDK paths and names
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

