Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id E4CF852A54
	for <meta-arago@arago-project.org>;
	Mon, 20 Aug 2018 18:25:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7KIPboS027700
	for <meta-arago@arago-project.org>; Mon, 20 Aug 2018 13:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534789537;
	bh=R+epQXBRSEI0MWABqsLIeMuNTYd/iUvQy9eOg670M1A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=j4zWabVIOZDGrri3Nv0xHNm4moEFms5wrLAPZp360hEkmxkrIwBTGF9GVjW1OSnzH
	MR2m2KRaAw8YKARfmRe1setsxN4UB3MnNX50+NeZxJxccFEf2JjIe4wNopko07s3O3
	FKh4xwQTixyeGrxHWJDMICcSzKF+G1PcIW4jAFrY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7KIPbAn020109
	for <meta-arago@arago-project.org>; Mon, 20 Aug 2018 13:25:37 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 20 Aug 2018 13:25:37 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 20 Aug 2018 13:25:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7KIPbDX023200;
	Mon, 20 Aug 2018 13:25:37 -0500
Date: Mon, 20 Aug 2018 14:24:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180820182439.GB29422@beryl>
References: <1534788584-7301-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1534788584-7301-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] arago-core-tisdk-image: k3: add sysfw.bin to prebuilt images
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
X-List-Received-Date: Mon, 20 Aug 2018 18:25:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Aug 20, 2018 at 02:09:44PM -0400, Jacob Stiffler wrote:
> * The sysfw.bin is required for building U-Boot for the R5
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
> index 147f126..1f0ef1c 100644
> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
> @@ -8,7 +8,7 @@ DEPLOY_SPL_NAME_k2e = ""
>  DEPLOY_SPL_NAME_k2g-hs-evm = ""
>  DEPLOY_SPL_NAME_k3 = "tispl.bin tiboot3.bin"
>  
> -DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin"
> +DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin sysfw.bin"

So, prebuilt ATF, OPTEE and signed SYSFW will be re-used for building U-boot 
from SDK top-level Makefile, right?


>  ARAGO_TISDK_IMAGE ?= "arago-core-tisdk-image"
>  export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

