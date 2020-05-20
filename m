Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 83D27529FF
	for <meta-arago@arago-project.org>;
	Wed, 20 May 2020 21:59:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04KLv1Jo119038
	for <meta-arago@arago-project.org>; Wed, 20 May 2020 16:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1590011821;
	bh=rnKTb7e+5XUfQ2nQxHX7g42Kh3qTcKbc8OubA6GEu+Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=woeQp3EyacmLi+yroRIZ6FVpSx+rmiX5oUM/6ZiyLJ9Qi3qfpZ5Ft0vM5AVlxiWou
	quTrTcMflSNuibi82SfZMT3YXimdhinHmZxYt+exgd1NtuMflkyKwB2aBjhyamyFkS
	chI7wsf8MIGqCEkrQdW99vCgUhO3CesrcLHyK6Vw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04KLv1Lg114100
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 20 May 2020 16:57:01 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 20 May 2020 16:57:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 20 May 2020 16:57:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KLv1vu060376;
	Wed, 20 May 2020 16:57:01 -0500
Date: Wed, 20 May 2020 17:57:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20200520215700.GG13240@beryl>
References: <1590011560-17361-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1590011560-17361-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell][PATCH] tisdk-core-bundle: add both sr1 and sr2 sysfw.itb
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
X-List-Received-Date: Wed, 20 May 2020 21:59:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, May 20, 2020 at 05:52:40PM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> index 64ee906..7f5371e 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> @@ -9,6 +9,7 @@ DEPLOY_SPL_NAME_k2g-hs-evm = ""
>  DEPLOY_SPL_NAME_k3 = "tispl.bin tiboot3.bin"
>  
>  DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin sysfw.itb"
> +DEPLOY_IMAGES_NAME_append_am65xx = " sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"

That will break for am65x HS which doesn't have SR2.


>  DEPLOY_IMAGES_NAME_append_am65xx-evm = " ti-sci-firmware-am65x-gp.bin"
>  DEPLOY_IMAGES_NAME_append_j7-evm = " ti-sci-firmware-j721e-gp.bin"
>  
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

