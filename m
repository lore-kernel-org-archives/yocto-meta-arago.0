Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 0ED285299E
	for <meta-arago@arago-project.org>;
	Thu, 29 Nov 2018 18:18:58 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wATIIleu073717
	for <meta-arago@arago-project.org>; Thu, 29 Nov 2018 12:18:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543515527;
	bh=fdExIvch7KBpYXU7aX6S7fz5ATW9IpPOtoGgayjbdDg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vizt+dSziU04rkeaEKKs+dlMz34MhyUhu4Lq6EnWCrpEHbKI/I850ROczIu5qslYV
	ZRC8BoK9TgBDA5CQy45jFkMKlnjkZkKhcUjvT8AfAKc3dQAH84LxC57HueAYvk+0+T
	AuLtGa25Zgd5POzrgQRY+i0yyDw73rspu89mOx+8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wATIIlVD019151
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 29 Nov 2018 12:18:47 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 29 Nov 2018 12:18:46 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 29 Nov 2018 12:18:46 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wATIIkF2015215;
	Thu, 29 Nov 2018 12:18:46 -0600
Date: Thu, 29 Nov 2018 13:18:46 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20181129181846.GO29204@beryl>
References: <1543430318-24222-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1543430318-24222-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup][PATCH] processor-sdk-rocko-config: add meta-virtualization
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
X-List-Received-Date: Thu, 29 Nov 2018 18:18:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Any plans for upstreaming this?

On Wed, Nov 28, 2018 at 01:38:38PM -0500, Jacob Stiffler wrote:
> * And add dependent meta-filesystems from meta-openembedded.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  configs/processor-sdk/processor-sdk-rocko-config.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/processor-sdk/processor-sdk-rocko-config.txt b/configs/processor-sdk/processor-sdk-rocko-config.txt
> index c8b4427..6ea9a41 100644
> --- a/configs/processor-sdk/processor-sdk-rocko-config.txt
> +++ b/configs/processor-sdk/processor-sdk-rocko-config.txt
> @@ -7,7 +7,8 @@ meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a
>  meta-arago,http://arago-project.org/git/meta-arago.git,rocko,HEAD,layers=meta-arago-distro:meta-arago-extras
>  meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
>  meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,HEAD,layers=
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia
> +meta-virtualization,git://git.yoctoproject.org/meta-virtualization,rocko,HEAD,layers=
> +meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
>  meta-ti,git://git.yoctoproject.org/meta-ti,rocko,HEAD,layers=
>  meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,HEAD,layers=meta-linaro-toolchain:meta-optee
>  oe-core,git://git.openembedded.org/openembedded-core,rocko,HEAD,layers=meta
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

