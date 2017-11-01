Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 175325299D
	for <meta-arago@arago-project.org>;
	Wed,  1 Nov 2017 22:15:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vA1MFl9F001159
	for <meta-arago@arago-project.org>; Wed, 1 Nov 2017 17:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509574547;
	bh=Q3oWfOK2GI85xz3rvBZO11J1VFxkTa8LLDOOyJFeMP8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=hPrjRQGJ8AMXjg74J073QqAqaPHGlbV2mLbY5Coyy5srCrmn4IE21f9aw0SLbdNFs
	ea2Gh9YKgyH9J9PCvSWK3UpgNXGzUCvqM7O19ohLTazwRf5lQwDSYp/+9NfMCjHrEP
	fSVjUWkpJ+z56vvRT8JPCR8/vxuNGL0BQx4zshy8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA1MFlR2005678
	for <meta-arago@arago-project.org>; Wed, 1 Nov 2017 17:15:47 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 1 Nov 2017 17:15:47 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 1 Nov 2017 17:15:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA1MFlT0017470;
	Wed, 1 Nov 2017 17:15:47 -0500
Date: Wed, 1 Nov 2017 18:15:31 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20171101221530.GJ12918@edge>
References: <1509559196-26703-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1509559196-26703-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup][PATCH] processor-sdk-morty-config: add meta-ros layer
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
X-List-Received-Date: Wed, 01 Nov 2017 22:15:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I have a million questions... What's in meta-ros, why only processor-sdk, 
etc., etc.

On Wed, Nov 01, 2017 at 01:59:56PM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  configs/processor-sdk/processor-sdk-morty-config.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/processor-sdk/processor-sdk-morty-config.txt b/configs/processor-sdk/processor-sdk-morty-config.txt
> index 49d4957..ad5e815 100644
> --- a/configs/processor-sdk/processor-sdk-morty-config.txt
> +++ b/configs/processor-sdk/processor-sdk-morty-config.txt
> @@ -4,6 +4,7 @@
>  bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
>  meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,HEAD,layers=
>  meta-arago,git://arago-project.org/git/meta-arago.git,morty,HEAD,layers=meta-arago-distro:meta-arago-extras
> +meta-ros,https://github.com/bmwcarit/meta-ros.git,master,HEAD,layers=
>  meta-browser,git://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
>  meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
>  meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

