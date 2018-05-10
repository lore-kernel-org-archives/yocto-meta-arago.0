Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 298C752978
	for <meta-arago@arago-project.org>;
	Thu, 10 May 2018 15:47:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4AFlZ16030347
	for <meta-arago@arago-project.org>; Thu, 10 May 2018 10:47:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1525967255;
	bh=YFlDaDy0nx3e5wW91HdoZmtF1qx+Vv3mXBA6vIHN2MM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fOXDlmUIMCTxCHoML24j/CG+pXXLf7qG2W6I4kT7DAJ+ayo4UzYB5eN+6+3t8lEHY
	95QKcWmPQO5evuCYeoDN4Ck3PwK4hUmuLNRU7E0womSzxgYN2Rg2ItC5yW4tnDPFUS
	y+aTnY8l+yPnkrFXCBS9PCKD5GlIIWxuuNDCx/fM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4AFlZ51008429
	for <meta-arago@arago-project.org>; Thu, 10 May 2018 10:47:35 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 10 May 2018 10:47:35 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 10 May 2018 10:47:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4AFlZLB004063;
	Thu, 10 May 2018 10:47:35 -0500
Date: Thu, 10 May 2018 11:47:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180510154734.GI31698@edge>
References: <1525962988-28642-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1525962988-28642-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts][PATCH] bitbake-test-sdk-image: preserve bitbake-cookerdaemon.log
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
X-List-Received-Date: Thu, 10 May 2018 15:47:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, May 10, 2018 at 10:36:28AM -0400, Jacob Stiffler wrote:
> * When stdout/stderr is piped, if there is an error during parsing,
>   all that will be printed is "Unable to start bitbake server"
> * The bitbake-cookerdaemon.log will contain the error message, so
>   preserve it in the LOG_DIR.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  lib/oesdk/bitbake-test-sdk-image | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
> index f17b594..de081cf 100644
> --- a/lib/oesdk/bitbake-test-sdk-image
> +++ b/lib/oesdk/bitbake-test-sdk-image
> @@ -465,6 +465,9 @@ bitbake_sdk_images(){
>              fi
>          done
>  
> +        # Move the bitbake-cooker.log as some errors may get hidden in there.
> +        mv $build_dir/bitbake-cookerdaemon.log $LOG_DIR/$m-bitbake-cookerdaemon.log

What happens if the file doesn't exist?


>          # Only run the build testing if the status of the above builds
>          # was "pass"
>          if [ "$build_status" == "pass" ]
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

