Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 68B4C52090
	for <meta-arago@arago-project.org>;
	Fri, 28 Apr 2017 18:46:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3SIkit3021429
	for <meta-arago@arago-project.org>; Fri, 28 Apr 2017 13:46:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493405204;
	bh=E75No1XGV1a5BO45k2nyTKe77ZaQx2b1xy3abhRHfJ0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=j8Ph5wNRRz6D43a5paFXOB7QB5jS9V3fRHgtme+s8Uky+ZtTmr+1rFffXQZzDF5mg
	RXOMkZt2a4vrfValWKX+ZA39J1sqA9GvurZjSMf/Z1WRrUx73gQHfTbsfp+APLFE2a
	JPe/CMqQSgpSIMkE7We9wd53cznZ3+mIphDERvBU=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SIkiBh013885
	for <meta-arago@arago-project.org>; Fri, 28 Apr 2017 13:46:44 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 28 Apr 2017 13:46:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SIkh9c005024;
	Fri, 28 Apr 2017 13:46:44 -0500
Date: Fri, 28 Apr 2017 14:46:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20170428184642.GQ31608@edge>
References: <1493402320-11537-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1493402320-11537-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH v2 1/2] arago-tisdk-addons: Add ti-ipc-rtos-fw for omapl138
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
X-List-Received-Date: Fri, 28 Apr 2017 18:46:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Apr 28, 2017 at 01:58:39PM -0400, Sam Nelson wrote:
> Adds ipc rtos test binaries
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Change from previous patch
> - Include only content for omapl138
> - Seperated the ti-ipc-examples-linux into seperate patch
> ---
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb      | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 5ad6655..f527fbc 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -57,6 +57,9 @@ UTILS_append_omap-a15 = " mmc-utils \
>                            uio-module-drv-test \
>  "
>  
> +UTILS_append_omapl138 = " ti-ipc-rtos-fw"
> +"
> +

^^^^^^^^^^^ too many closing quotes. Please test your patches first.


>  UTILS_append_dra7xx = " canutils \
>                          dsptop \
>                          gdbc6x \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

