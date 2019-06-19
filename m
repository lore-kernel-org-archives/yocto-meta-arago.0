Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 448AD52998
	for <meta-arago@arago-project.org>;
	Wed, 19 Jun 2019 18:39:03 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JIcLsQ040394
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 13:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560969501;
	bh=0qARCb5tQU+ABb+Rs2OohpVOihnNzrqCd7PbVAGddeM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Ga/3viUpEUkbkhWlxAWQ1xaa12RPp10FObT9bUWxlQbYLoDDxm0tKN/q9Wh3P6lmd
	krdYwiYoitRXi4Z0atyOPIpQjRPJsVicx2SxpBhkuc6akuuAjgAJRMGFT59WyvEPhc
	fPFIXduXChrWh0i+0L86ofyppcIdZcRm9lngHeFg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JIcLLj105802
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 13:38:21 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 13:38:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 13:38:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JIcLYr125146;
	Wed, 19 Jun 2019 13:38:21 -0500
Date: Wed, 19 Jun 2019 14:38:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <20190619183821.GJ32001@beryl>
References: <1560958508-141402-1-git-send-email-anandb@ti.com>
	<1560958508-141402-2-git-send-email-anandb@ti.com>
MIME-Version: 1.0
In-Reply-To: <1560958508-141402-2-git-send-email-anandb@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [[thud] PATCH] glmark2: disable for J7
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
X-List-Received-Date: Wed, 19 Jun 2019 18:39:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK

On Wed, Jun 19, 2019 at 09:05:05PM +0530, Anand Balagopalakrishnan wrote:
> glmark2 has a dependency on libgbm which will come from Mesa. Disable this for
> now on J7.
> 
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>  meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb b/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
> index d7744ad..0b38596 100644
> --- a/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
> +++ b/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
> @@ -13,6 +13,7 @@ DEPENDS = "libpng jpeg"
>  PV = "2014.03+${SRCPV}"
>  
>  COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
>  
>  SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
>      file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

