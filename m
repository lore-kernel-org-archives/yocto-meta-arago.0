Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id C8185529C9
	for <meta-arago@arago-project.org>;
	Tue,  3 Nov 2020 16:45:37 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A3GgTbf048591
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2020 10:42:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604421749;
	bh=uQmLv0e37YV6Omqi3Pq9aCZB6K0tDCm0VLr1PoLLpd4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=cwtMNFSRHR8FS2++Gl2YDLKH0q5UiVY7R3NlzD6gCKhweEEe6f1Z60bSfjzlHJW/0
	VrTGPyQbOcD+HsehZtNcveIeyIsikAnAiAgn1UKaep8Pwbj9gkefMOTL8CnZggQhCf
	kuAd+L6k+9V8WuACt8hUsObOe2K0FVR3B3Qh4ua8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A3GgTXR130328
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2020 10:42:29 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 3 Nov 2020 10:42:29 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 3 Nov 2020 10:42:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A3GgRAe128558;
	Tue, 3 Nov 2020 10:42:28 -0600
Date: Tue, 3 Nov 2020 22:12:27 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <denys@ti.com>, <dmurphy@ti.com>, <aparnab@ti.com>
Message-ID: <20201103164227.5st3eaqx2f36mmoh@NiksLab>
References: <20201102143757.12208-1-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201102143757.12208-1-nikhil.nd@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell PATCH] packagegroup: arago-tisdk-addons: Include statcol for k3 devices
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
X-List-Received-Date: Tue, 03 Nov 2020 16:45:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 20:07-20201102, Nikhil Devshatwar wrote:
> statcol is an application which collects the statistical data from
> various sources and allows to visualize it on the host machine using
> web sockets.
> Include this in the filesystem via arago-tisdk-addons packagegroup.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>

Hi Dan, This is required for 7.1 release.
Please include this before tagging.

Regards,
Nikhil D

> ---
>  .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index adfd45f2..c4260c5a 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -74,6 +74,7 @@ UTILS_append_k3 = " mmc-utils \
>                      jailhouse \
>                      ti-rpmsg-char \
>                      ti-rpmsg-char-examples \
> +                    statcol \
>  "
>  
>  UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
> -- 
> 2.17.1
> 

