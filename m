Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 318A952960
	for <meta-arago@arago-project.org>;
	Fri, 22 Feb 2019 20:19:12 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1MKJ9Ag055914
	for <meta-arago@arago-project.org>; Fri, 22 Feb 2019 14:19:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550866749;
	bh=Tmb5WbTNaeg0NnEhkauyox38Ux2+S6pKcTSRlDrENGI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vizzDLLXg2ReLn9rurCBHAI7xzASMQPd7/PczG3kqwiGDDXyPUBCmmZ/+4kKT7blp
	AjJ1t54CI1Vy23lBR1r+WoA42nVtmeLv/Qz5luiWZzztguNaSbl9YW/bdHm6/dWvjr
	SDqS26xK43fYLFJRrCI826AxHWXARAGaMPPhaIjA=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1MKJ96l077916
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 22 Feb 2019 14:19:09 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 22 Feb 2019 14:19:08 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 22 Feb 2019 14:19:09 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1MKJ8Cv004527;
	Fri, 22 Feb 2019 14:19:08 -0600
Date: Fri, 22 Feb 2019 15:19:08 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Qin Su <qsu@ti.com>
Message-ID: <20190222201908.GC19654@beryl>
References: <1550862122-8951-1-git-send-email-qsu@ti.com>
MIME-Version: 1.0
In-Reply-To: <1550862122-8951-1-git-send-email-qsu@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] arm-compute-library: bump SRCREV
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
X-List-Received-Date: Fri, 22 Feb 2019 20:19:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Is this required for rocko?

On Fri, Feb 22, 2019 at 02:02:02PM -0500, Qin Su wrote:
> Upgraded to Linaro version 19.02.
> 
> Signed-off-by: Qin Su <qsu@ti.com>
> ---
>  .../arm-compute-library/arm-compute-library_git.bb                | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> index 865f7f8..a93ff6c 100644
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=762a7ba8d2ddc3b38d88742fbaf0b62d"
>  COMPATIBLE_MACHINE = "armv7a|aarch64"
>  
>  SRC_URI = " \
> -    git://github.com/ARM-software/ComputeLibrary.git;branch=${BRANCH} \
> +    git://review.mlplatform.org/ml/ComputeLibrary;protocol=https;branch=${BRANCH} \
>      file://0001-add-ti-benchmark-test-group.patch \
>      file://0002-add-ti-benchmark-test-group.patch \
>      file://0003-add-ti-benchmark-test-group.patch \
> @@ -19,12 +19,12 @@ SRC_URI = " \
>      file://0010-add-ti-benchmark-test-group.patch \
>      file://0011-add-ti-benchmark-test-group.patch \
>  "
> -
> -PV  = "18.08"
> +PR = "r0"
> +PV  = "19.02"
>  PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
>  
>  BRANCH = "master"
> -SRCREV = "52ba29e936b8e711e8acdfe819e36f884d4f3fe1"
> +SRCREV = "d9f9318cffba4051c4ca0ec2028819962bdc2b1c"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

