Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 7647352A20
	for <meta-arago@arago-project.org>;
	Thu, 29 Nov 2018 22:58:51 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wATMwe10022724
	for <meta-arago@arago-project.org>; Thu, 29 Nov 2018 16:58:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543532320;
	bh=nkBj1x3EDJ18TGSB2x4BjG7wExDPPVZdheJDlScyRtQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=pGsy6Z6GBU3LtLLQZIgHRrsRLSogmrNFaEZHAESg9H0EfJv0GKUKUBjvVJaAsR5Jx
	RiQGgc7xuZYq8WzUwSB+ZCU+vMsmBQjxWC/uPUdmxwbVtROopWhO2hjnAdXMa//yoH
	jOKiL7gVZJuipmRvBaXDLMcRzF2iHR+kD4dLTriU=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wATMweps079869
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 29 Nov 2018 16:58:40 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 29 Nov 2018 16:58:40 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 29 Nov 2018 16:58:40 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wATMweSt013093;
	Thu, 29 Nov 2018 16:58:40 -0600
Date: Thu, 29 Nov 2018 17:58:40 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Yuan Zhao <yuanzhao@ti.com>
Message-ID: <20181129225839.GT29204@beryl>
References: <20181129225332.90123-1-yuanzhao@ti.com>
MIME-Version: 1.0
In-Reply-To: <20181129225332.90123-1-yuanzhao@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] ocl: update version to 01.01.17.01
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
X-List-Received-Date: Thu, 29 Nov 2018 22:58:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks!

On Thu, Nov 29, 2018 at 04:53:32PM -0600, Yuan Zhao wrote:
> - minor fixes for OpenCL-RTOS compiling issues
> - runtime support and improvement for TIDL API execution
>   with multiple contexts
> 
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>  meta-arago-extras/recipes-ti/ocl/ocl.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> index c49d544b..3450a400 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -1,5 +1,5 @@
>  # patch version at the end needs to be in double digits
> -PV = "1.1.16.01"
> +PV = "1.1.17.01"
>  INC_PR = "r0"
>  
>  LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
> @@ -10,7 +10,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
>  OCL_GIT_PROTOCOL = "git"
>  OCL_GIT_BRANCH = "master"
>  
> -OCL_SRCREV = "22e0412ac7fdcb4af1e494ce3b2ba68829e79c32"
> +OCL_SRCREV = "61d9dbae3ee40f8023ec624601c2a0cc9e80220f"
>  
>  BRANCH = "${OCL_GIT_BRANCH}"
>  SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
> -- 
> 2.14.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

