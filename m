Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 4B55D520EA
	for <meta-arago@arago-project.org>;
	Tue, 25 Jun 2019 20:23:55 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5PKNCdQ086103
	for <meta-arago@arago-project.org>; Tue, 25 Jun 2019 15:23:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561494192;
	bh=gGg/++P7MfW1VkHcsCP6akK+J5pSkP6YMlI1TUUORZ4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JLdUhgA5DfSSEF9r96BO/9De67qphQ3BqfyhCMw5CFfGIIUauZrW281bi1Qfgy4D3
	xUCNF/JWZUTysaV7BPxboHesi/i2HCu5dHsv6Mc8fIli4Y1E56bDKspnjyJtLdCF82
	YzVgjbj9AptBf68s6YSDXZSd3z7tzn1gVqmR/L7c=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5PKNCZO113914
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 25 Jun 2019 15:23:12 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 25 Jun 2019 15:23:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 25 Jun 2019 15:23:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5PKNBdL093813;
	Tue, 25 Jun 2019 15:23:11 -0500
Date: Tue, 25 Jun 2019 16:23:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Djordje Senicic <x0157990@ti.com>
Message-ID: <20190625202311.GK4849@beryl>
References: <20190624194634.9959-1-x0157990@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190624194634.9959-1-x0157990@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master][PATCH 1/2] arm-compute-library: Upgrade to 19.05 version
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
X-List-Received-Date: Tue, 25 Jun 2019 20:24:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jun 24, 2019 at 03:46:33PM -0400, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  .../arm-compute-library/arm-compute-library_git.bb       | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> index a2e19fd4..a33a2bc1 100644
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "The ARM Computer Vision and Machine Learning library"
>  DESCRIPTION = "The ARM Computer Vision and Machine Learning library is a set of functions optimised for both ARM CPUs and GPUs."
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=762a7ba8d2ddc3b38d88742fbaf0b62d"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8948bc85114b3b716576ef8d732f034f"


License checksum change needs to be explained in the commit log.


>  COMPATIBLE_MACHINE = "armv7a|aarch64"
>  
> @@ -20,11 +20,12 @@ SRC_URI = " \
>      file://0011-add-ti-benchmark-test-group.patch \
>  "
>  PR = "r0"
> -PV  = "19.02"
> +PV  = "19.05"
>  PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
>  
> -BRANCH = "master"
> -SRCREV = "d9f9318cffba4051c4ca0ec2028819962bdc2b1c"
> +BRANCH = "branches/arm_compute_19_05"
> +SRCREV = "bd17a169153ee181100f3b31984968b66618ef3c"
> +
>  

Extra newline being added.

>  S = "${WORKDIR}/git"
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

