Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 8EDAC52A54
	for <meta-arago@arago-project.org>;
	Mon, 20 Aug 2018 18:27:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7KIRD1X028060;
	Mon, 20 Aug 2018 13:27:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534789633;
	bh=y8sANqHQNYkFLHmc74P0G+/HUGywf3xFSYNtIAt9Rsw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MifL/w+NFSdVNfCbJJSueYHqJRjxauVsPmM/94utOY215isZQbl+P3tqLk3/1MQdm
	udo7mSzUR7RxvCocJWCNX/Ax1fNj/NTg06unwE+46DysG9QUGHwDrpZ7w0CQzZQbUk
	HUrf6E9RCQbsNWHiAFElpXRDebr9w12HOtl53FAQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7KIRDB2003426;
	Mon, 20 Aug 2018 13:27:13 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 20 Aug 2018 13:27:12 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 20 Aug 2018 13:27:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7KIRCFl009348;
	Mon, 20 Aug 2018 13:27:12 -0500
Date: Mon, 20 Aug 2018 14:26:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20180820182615.GC29422@beryl>
References: <1534756947-24631-1-git-send-email-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1534756947-24631-1-git-send-email-ankur.tyagi85@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko/sumo/master/][PATCH] meta-toolchain-arago-qte: fix TOOLCHAIN_TARGET_TASK
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
X-List-Received-Date: Mon, 20 Aug 2018 18:27:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK - this is incorrect.


On Mon, Aug 20, 2018 at 09:22:27PM +1200, Ankur Tyagi wrote:
> Resolves following error when building meta-toolchain-arago-qte
> ERROR: Nothing RPROVIDES 'packagegroup-arago-qt5-toolchain-target'

When and how are you getting this error?


> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> index fdca2c3..0e0e057 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> @@ -1,6 +1,6 @@
>  # Qt Embedded toolchain
>  TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-arago-qte-toolchain-host"
> -TOOLCHAIN_TARGET_TASK ?= "${@base_conditional('QT_PROVIDER', 'qt5', 'packagegroup-arago-qt5-toolchain-target', 'packagegroup-arago-qte-toolchain-target', d)}"
> +TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-qte-toolchain-target"
>  TOOLCHAIN_SUFFIX ?= "-qte-sdk"
>  
>  require meta-toolchain-arago.bb
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

