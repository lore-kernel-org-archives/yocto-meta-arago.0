Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id EA77F52A49
	for <meta-arago@arago-project.org>;
	Mon, 29 Jun 2020 22:46:29 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05TMhqau117316;
	Mon, 29 Jun 2020 17:43:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593470632;
	bh=vNDF2VIujrkRRm+lZzXwFIRiSCWR2sgnLg7kWzL/dy8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=pJFkSQJovP0pmFF4gdkQE3m2r9qq5comIIFD9Alh4ayrKzwX8wAhsIt6X3TEl3dPM
	Tioe1bLuvA/Gi5z6QFaOGhm/Wj/Zue8hIkwquCGL0L61qghoPiN8ieFelX4hknhx3c
	Fd0GpMCs4mOr3eNlV4YOCennyLe9ZhV07DZlVzmk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05TMhqlR004088;
	Mon, 29 Jun 2020 17:43:52 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 29 Jun 2020 17:43:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 29 Jun 2020 17:43:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05TMhpbu010805;
	Mon, 29 Jun 2020 17:43:51 -0500
Date: Mon, 29 Jun 2020 18:43:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Barker <pbarker@konsulko.com>
Message-ID: <20200629224351.GD6525@beryl>
References: <20200621204349.363584-1-pbarker@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20200621204349.363584-1-pbarker@konsulko.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell][PATCH] linux: copy-defconfig: Move do_create_srcipk only if defined
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
X-List-Received-Date: Mon, 29 Jun 2020 22:46:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, will merge it shortly.

On Sun, Jun 21, 2020 at 09:43:49PM +0100, Paul Barker wrote:
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  .../recipes-kernel/linux/copy-defconfig.inc              | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
> index 10ecf8ea..65b615cb 100644
> --- a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
> +++ b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
> @@ -17,6 +17,9 @@ do_configure_append() {
>      fi
>  }
>  
> -# Move create_srcipk task so that the release defconfig is included.
> -deltask do_create_srcipk
> -addtask create_srcipk after do_configure before do_compile
> +python __anonymous() {
> +    # Move create_srcipk task so that the release defconfig is included.
> +    if d.getVarFlag('do_create_srcipk', "task"):
> +        bb.build.deltask('do_create_srcipk', d)
> +        bb.build.addtask('do_create_srcipk', 'do_configure', 'do_compile', d)
> +}
> -- 
> 2.27.0
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

