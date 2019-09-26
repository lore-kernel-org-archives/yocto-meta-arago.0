Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id DC8CA52960
	for <meta-arago@arago-project.org>;
	Thu, 26 Sep 2019 17:58:56 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QHvkrh124954
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2019 12:57:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569520666;
	bh=GAFO5Sfh7R1Zc6Xq32T8LVRn8cvonjBjjLVj5E84mAc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=pUW8dyDOahMJ3l3936SrtbcFPsXGztaGilmAQciHVMkdsZLpNuasUKD1NQNbfeAts
	JhBk20KDfEVQPk/jigiRFrmKEW33R08mkTnf55GRBx8NtK1cH6/KFC2NUgeCxDLSIb
	R3H7fM5nsZixiEp9X27eskQkA6Gxmw1kFsiLB/Ps=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8QHvkDw001975
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2019 12:57:46 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 26 Sep 2019 12:57:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 26 Sep 2019 12:57:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QHvkNx029977;
	Thu, 26 Sep 2019 12:57:46 -0500
Date: Thu, 26 Sep 2019 13:57:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Santosh Jha <sjha@ti.com>
Message-ID: <20190926175746.GC5566@beryl>
References: <20190923181500.15715-1-sjha@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190923181500.15715-1-sjha@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master][PATCH] packagegroup-arago-tisdk-addons: replacing ipc-lld-fw
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
X-List-Received-Date: Thu, 26 Sep 2019 17:58:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This no longer applies - can you please rebase? Thanks.

On Mon, Sep 23, 2019 at 01:15:00PM -0500, Santosh Jha wrote:
> Replacing ipc-lld-fw with ipc-lld-examples-rtos to
> build from source.
> 
> Signed-off-by: Santosh Jha <sjha@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-addons.bb          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 21aa7244..ef617793 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -75,8 +75,8 @@ UTILS_append_k3 = " mmc-utils \
>                      irqbalance \
>  "
>  
> -UTILS_append_am65xx = " ti-ipc-rtos-fw pru-icss"
> -UTILS_append_j7-evm = " ipc-lld-fw ti-display-sharing-fw jailhouse"
> +UTILS_append_am65xx = " ti-ipc-rtos-fw pru-icss ipc-lld-examples-rtos"
> +UTILS_append_j7-evm = " ipc-lld-examples-rtos ti-display-sharing-fw jailhouse"
>  
>  UTILS_append_omapl138 = " ti-ipc-rtos-fw"
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

