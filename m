Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id A14BB52A28
	for <meta-arago@arago-project.org>;
	Mon, 15 Jan 2018 23:25:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0FNP6Oi011406
	for <meta-arago@arago-project.org>; Mon, 15 Jan 2018 17:25:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516058706;
	bh=ldopThJX7xg6ImOmaH94PIJlQUSyb8W31DpxkK2dXTc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Kv6Zm48ycOxUQINSRBonsmX+Zwomj56h+2/GtUga9nXc8iRhyLJWrcXVp1slN9l/S
	J0mVweRVwm7Ho15pMa0o2MGG9YCHV7nHdK8rLfzMTetdFtFJ1/O4a3PjFilwup/Msk
	bO2XSbVzKRP3z5ZtO18x/b/kb/ih0VUC7MHmRF5I=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0FNP6LI007785
	for <meta-arago@arago-project.org>; Mon, 15 Jan 2018 17:25:06 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 15 Jan 2018 17:25:05 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 15 Jan 2018 17:25:05 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0FNP5qg017314;
	Mon, 15 Jan 2018 17:25:05 -0600
Date: Mon, 15 Jan 2018 18:25:05 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <a0271529@ti.com>
Message-ID: <20180115232504.GB31682@edge>
References: <1516058569-7239-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
In-Reply-To: <1516058569-7239-1-git-send-email-a0271529@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [meta-processor-sdk] branding-processor-sdk: bump max_leb_cnt for k2hk
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
X-List-Received-Date: Mon, 15 Jan 2018 23:25:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 15, 2018 at 06:22:49PM -0500, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  conf/distro/include/branding-processor-sdk.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/distro/include/branding-processor-sdk.inc b/conf/distro/include/branding-processor-sdk.inc
> index 955606f..2fbcb04 100644
> --- a/conf/distro/include/branding-processor-sdk.inc
> +++ b/conf/distro/include/branding-processor-sdk.inc
> @@ -43,7 +43,7 @@ MKUBIFS_ARGS_am57xx-evm     = "-F -m 2048 -e 126976 -c 15000"
>  MKUBIFS_ARGS_am57xx-hs-evm  = "-F -m 2048 -e 126976 -c 15000"
>  MKUBIFS_ARGS_dra7xx-evm     = "-F -m 2048 -e 126976 -c 15000"
>  MKUBIFS_ARGS_dra7xx-hs-evm  = "-F -m 2048 -e 126976 -c 15000"
> -MKUBIFS_ARGS_k2hk           = "-F -m 2048 -e 126976 -c 4100"
> +MKUBIFS_ARGS_k2hk           = "-F -m 2048 -e 126976 -c 4200"

Would it fit into flash?


>  # By default, do not include OPTEE for any HS platform
>  # Comment the OPTEEMACHINE and OPTEEFLAVOR line for a
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

